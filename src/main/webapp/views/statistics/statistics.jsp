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
  <label>지점: </label>
  <select id="selectType"></select>
  <select id="selectsalesYearMonth"></select>
  <input type="button" id="branchChange" value="확인">

  <div class="row">
    <div class="col">
      <canvas id="coceanFriends"></canvas>
    </div>
    <div class="col">
      <canvas id="coceanHouse"></canvas>
    </div>
  </div>

  <div class="row">
    <div class="col">
      <canvas id="sales"></canvas>
    </div>
    <div class="col">
      <canvas id="visitors"></canvas>
    </div>
  </div>
</div>

</div>
</div>
<c:import url="/footer"/>
</div>

</body>
<script>

// 현재 날짜 구하기(년월 까지)
var now = new Date();
var year = now.getFullYear();
var month = now.getMonth() + 1;
var nowsalesYearMonth = year + "-" + month;
console.log("현재 년월 : "+nowsalesYearMonth);


//6개월 이전 날짜 계산
var sixMonthsAgo = new Date();
sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() - 6);
var sixMonthsAgoYear = sixMonthsAgo.getFullYear();
var sixMonthsAgoMonth = sixMonthsAgo.getMonth() + 2;
var sixMonthsAgosalesYearMonth = sixMonthsAgoYear + "-" + sixMonthsAgoMonth;
console.log("6개월 이전 년월 : "+sixMonthsAgosalesYearMonth);


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
          
          // 지점 셀렉트 박스 추가
          var branchs = data.animal.filter(function (branch) {
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
          console.log(data.tank);
			
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
          
          // 매출, 관람객 차트는 막대그래프
       	  // 매출 차트 그리기
          console.log("매출 그래프 그리기");
		  
          let salesYearMonth = [];
          let monthlyTicketSales = [];
          let monthlyProductSales = [];
          
          var ticketSales = data.ticket.filter(function (ticket) {
		        return ticket.branchName === "가산점";
		    });
          console.log("티켓 매출");
          console.log(ticketSales);
          
          var productSales = data.product.filter(function (product) {
		        return product.branchName === "가산점";
		    });
          console.log("상품 매출");
          console.log(productSales);
		 for (var i = 0; i < 6; i++) {
				salesYearMonth.push(ticketSales[i].yearMonth);
				monthlyTicketSales.push(ticketSales[i].monthlyTotalSales);
			} 
		 for (var i = 0; i < 6; i++) {
				monthlyProductSales.push(productSales[i].monthlyTotalSales);
			} 
			
		// 6개월 이전까지의 데이터만 push
			/* for (var i = 0; i < ticketSales.length; i++) {
			  if (ticketSales[i].salesYearMonth >= sixMonthsAgosalesYearMonth && ticketSales[i].salesYearMonth <= nowsalesYearMonth) {
			    salesYearMonth.push(ticketSales[i].salesYearMonth);
			    monthlyTicketSales.push(ticketSales[i].monthlyTotalSales);
			  }
			}
			for (var i = 0; i < ticketSales.length; i++) {
			  if (productSales[i].salesYearMonth >= sixMonthsAgosalesYearMonth && productSales[i].salesYearMonth <= nowsalesYearMonth) {
			    salesYearMonth.push(productSales[i].salesYearMonth);
			    monthlyProductSales.push(productSales[i].monthlyTotalSales);
			  }
			} */
			
          var barChartSales = document.querySelector('#sales').getContext('2d');
          const sales = new Chart(barChartSales, {
            type: 'bar',
            data: {
              labels: salesYearMonth,
              datasets: [
              	{	
              		label : '상품 매출',
              		data : monthlyProductSales
              	},
              	{	
              		label : '티켓 매출',
              		data : monthlyTicketSales
              	}],
            },
            options: {
              responsive: true,
              plugins: {
                legend: {
                  position: 'top',
                },
                title: {
                  display: true,
                  text: '매출 그래프'
                }
              }
            }
          });
          
          
       	  // 관람객 차트 그리기
          console.log("관람객 그래프 그리기");
		  
          let visitorsYearMonth = [];
          let monthlyVisitorsNumber = [];
          
          var visitorsData = data.visitors.filter(function (visitors) {
		        return visitors.branchName === "가산점";
		    });
          console.log("관람객");
          console.log(visitorsData);
          
		 for (var i = 0; i < 6; i++) {
			 visitorsYearMonth.push(visitorsData[i].yearMonth);
			 monthlyVisitorsNumber.push(visitorsData[i].monthlyVisitorsNumber);
			} 
			
		// 6개월 이전까지의 데이터만 push
			/* for (var i = 0; i < ticketSales.length; i++) {
			  if (ticketSales[i].salesYearMonth >= sixMonthsAgosalesYearMonth && ticketSales[i].salesYearMonth <= nowsalesYearMonth) {
			    salesYearMonth.push(ticketSales[i].salesYearMonth);
			    monthlyTicketSales.push(ticketSales[i].monthlyTotalSales);
			  }
			}
			for (var i = 0; i < ticketSales.length; i++) {
			  if (productSales[i].salesYearMonth >= sixMonthsAgosalesYearMonth && productSales[i].salesYearMonth <= nowsalesYearMonth) {
			    salesYearMonth.push(productSales[i].salesYearMonth);
			    monthlyProductSales.push(productSales[i].monthlyTotalSales);
			  }
			} */
			
          var barChartVisitors = document.querySelector('#visitors').getContext('2d');
          const visitors = new Chart(barChartVisitors, {
            type: 'bar',
            data: {
              labels: visitorsYearMonth,
              datasets: [
              	{	
              		label : '관람객 수',
              		data : monthlyVisitorsNumber
              	}],
            },
            options: {
              responsive: true,
              plugins: {
                legend: {
                  position: 'top',
                },
                title: {
                  display: true,
                  text: '매출 그래프'
                }
              }
            }
          });
          // 지점 변경 버튼 클릭시
          $('#branchChange').click(function () {
            // 선택된 지점의 이름
            var selectedBranch = $('#selectType').val();
            console.log("클릭된 지점명: " + selectedBranch);

            // 선택된 지점 동물 데이터로 차트 업데이트
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
            
         // 선택된 지점 수조 데이터로 차트 업데이트
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
            
         // 선택된 지점 티켓 데이터로 차트 업데이트
            var branchTicketData = data.ticket.filter(function (ticket) {
                return ticket.branchName === selectedBranch;
            });
           console.log("선택된 지점 티켓 데이터");
           console.log(branchTicketData);
		   console.log(sales.data.datasets[1]);
            if (branchTicketData) {
                // 티켓 차트 데이터 업데이트
                for (var i = 0; i < 6; i++) {
                	sales.data.datasets[1].data[i] = branchTicketData[i].monthlyTotalSales;
			} 
                sales.update();
            } else {
                console.log("선택된 지점 데이터를 찾을 수 없습니다.");
            }
            
         // 선택된 지점 상품 데이터로 차트 업데이트
            var branchProductData = data.product.filter(function (product) {
                return product.branchName === selectedBranch;
            });
           console.log("선택된 지점 상품 데이터");
           console.log(branchProductData);
		   console.log(sales.data.datasets[0]);
            if (branchTicketData) {
                // 상품 차트 데이터 업데이트
                for (var i = 0; i < 6; i++) {
                	sales.data.datasets[0].data[i] = branchProductData[i].monthlyTotalSales;
			} 
                sales.update();
            } else {
                console.log("선택된 지점 데이터를 찾을 수 없습니다.");
            }
            
            
         // 선택된 지점 관람객 데이터로 차트 업데이트
            var branchVisitorsData = data.visitors.filter(function (visitors) {
                return visitors.branchName === selectedBranch;
            });
           console.log("선택된 지점 관람객 데이터");
           console.log(branchVisitorsData);
		   console.log(visitors.data.datasets[0]);
            if (branchVisitorsData) {
                // 관람객 차트 데이터 업데이트
                for (var i = 0; i < 6; i++) {
                	visitors.data.datasets[0].data[i] = branchVisitorsData[i].monthlyVisitorsNumber;
			} 
                visitors.update();
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

  
  
  

</script>
</html>