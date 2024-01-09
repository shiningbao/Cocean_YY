<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
</style>
</head>
<body>
    <c:import url="/side"/>
<div class="container-fluid contentField">
<div class="row">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">통계</h1>
    </div>
<div class="container" style="display: flex;flex-direction: column;align-content: space-around;flex-wrap: wrap; ">

<div>
  <label>지점 : </label>
  <select id="selectType">
  </select>
  <input type="button" id="branchChange"  value="확인">
<canvas id="coceanFriends"></canvas>
<canvas id="coceanHouse"></canvas>
</div>
</div>
</div>
<c:import url="/footer"/>
</div>

</body>
<script>
$(document).ready(function(){
	chart();
});

function chart() {
  $.ajax({
      type: 'get',
      url: 'chart.do',
      dataType: 'json',
      success: function (data) {
          console.log("통계 데이터 가져오기 성공");
          console.log(data);
          /* drawGraph(data.animal);
          drawGraph(data.tank);
          drawGraph(data.product);
          drawGraph(data.visitors); */
          
          // 지점 셀렉트 박스 추가
          var branchs = data.visitors.filter(function (branch) {
		        return branch.branchName;
		    });
          for (var i = 0; i < branchs.length; i++) {
				$('#selectType').append('<option value= "' +branchs[i].branchName +'">'+ branchs[i].branchName+'</option>');
			}
          
          // 차트 그려주기
       	  // 코션친구들, 코션하우스는 도넛 그래프
       	  
       	  // 코션친구들 차트 그리기
          console.log("코션친구들 그래프 그리기");
          console.log(data.animal);
			
          var doughnutChartCoceanFriends = document.querySelector('#coceanFriends').getContext('2d');
          const coceanFriends = new Chart(doughnutChartCoceanFriends, {
            type: 'doughnut',
            data: {
              labels: ['동물 개체수', '정상', '질병', '폐사'],
              datasets: [{
                data: [data.animal[0].totalNumber, data.animal[0].normalNumber, data.animal[0].illedNumber, data.animal[0].deadNumber],
              }]
            },
            options: {
              responsive: true,
              plugins: {
                legend: {
                  position: 'top',
                },
                title: {
                  display: true,
                  text: '코션친구들'
                }
              }
            }
          });

          // 코션하우스 차트 그리기
          console.log("코션하우스 그래프 그리기");
          console.log(data.animal);
			
          var doughnutChartCoceanHouse = document.querySelector('#coceanHouse').getContext('2d');
          const coceanHouse = new Chart(doughnutChartCoceanHouse, {
            type: 'doughnut',
            data: {
              labels: ['수조 수', '정상', '이상', '해수', '담수', '반수생', '육상'],
              datasets: [{
                data: [data.tank[0].totalNumber, data.tank[0].normalNumber, data.tank[0].abnormalNumber, 
                			data.tank[0].seaWaterTankNumber, data.tank[0].freshWaterTankNumber, data.tank[0].semiAquaticTankNumber, 
                			data.tank[0].landTankNumber],
              }]
            },
            options: {
              responsive: true,
              plugins: {
                legend: {
                  position: 'top',
                },
                title: {
                  display: true,
                  text: '코션하우스'
                }
              }
            }
          });
          
          // 지점 변경 버튼 클릭시
          $('#branchChange').click(function () {
            // 선택된 지점의 이름
            var selectedBranch = $('#selectType').val();
            console.log("클릭된 지점명: " + selectedBranch);

            // 선택된 지점에 해당하는 데이터를 찾아서 차트 다시 그리기
            var branchAnimalData = data.animal.find(function (animal) {
                return animal.branchName === selectedBranch;
            });
            console.log("선택된 지점 동물 데이터");
            console.log(branchAnimalData);
            if (branchAnimalData) {
                // 코션친구들 차트 데이터 업데이트
                coceanFriends.data.datasets[0].data = [branchAnimalData.totalNumber, branchAnimalData.normalNumber, branchAnimalData.illedNumber, branchAnimalData.deadNumber];
                coceanFriends.update();
            } else {
                console.log("선택된 지점 데이터를 찾을 수 없습니다.");
            }
            
         // 선택된 지점에 해당하는 데이터를 찾아서 차트 다시 그리기
            var branchTankData = data.tank.find(function (tank) {
                return tank.branchName === selectedBranch;
            });
            console.log("선택된 지점 수조 데이터");
            console.log(branchTankData);
            if (branchTankData) {
                // 코션친구들 차트 데이터 업데이트
                coceanHouse.data.datasets[0].data = [branchTankData.totalNumber, branchTankData.normalNumber, branchTankData.abnormalNumber, 
                										branchTankData.seaWaterTankNumber, branchTankData.freshWaterTankNumber, branchTankData.semiAquaticTankNumber,
                										branchTankData.landTankNumber];
                coceanHouse.update();
            } else {
                console.log("선택된 지점 데이터를 찾을 수 없습니다.");
            }
        });
      },
      error: function (e) {
          console.log(e);
      }
  });
}

  
  
  
/* var myChart = new Chart(ctx, {
  type: 'bar',
  data: {
      labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
      datasets: [{
          label: '# of Votes',
          data: [12, 19, 3, 5, 2, 3],
          backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)'
          ],
          borderColor: [
              'rgba(255, 99, 132, 1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
              'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
      }]
  },
  options: {
      animation: {
          duration: 0
      }, 
      scales: {
          yAxes: [{
              ticks: {
                  beginAtZero: true
              }
          }]
      }
  }
});
// label 변경
myChart.data.labels = ["R", "B", "Y", "G", "P", "O"];
// 그냥 마치, 딕셔너리 리스트의 자료구조인 것처럼 접근해서 값을 변경해줘도 문제없습니다. 
myChart.data.datasets[0].data = [1, 2, 3, 4, 5, 6];
myChart.update();
var frame_duration = 1000;
var i=0;
d3.interval(
  function(){
      if (i > 10) {
          this.stop();
      }
      else {
          myChart.data.datasets[0].data = [1 + i, 2 + i, 3 + i, 4 + i, 5 + i, 6 + i];
          myChart.update(); // 데이터를 바꾼 다음, 이렇게 업데이트를 해야 적용된다.
      }
      i=i+1;
  }, 
  frame_duration
); */

</script>
</html>