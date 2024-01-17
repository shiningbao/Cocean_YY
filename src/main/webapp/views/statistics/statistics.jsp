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
.title {
	text-align: center;
	font-size: 17px;
	color: #4E73DF;
}
.cocean{
	width: 290px;
}
.sales{
	width: 860px;
	margin-left: 29px;
}
.branchType span{
	font-size: 18px;
}
.branchType{
	margin-bottom: 5px;
}
.branchType input{
	margin-left: 2px;
}
</style>
</head>
<body>
    <c:import url="/side"/>
<div class="container-fluid contentField">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">통계</h1>
    </div>
<div class="container" style="display: flex;flex-direction: column;align-content: space-around;flex-wrap: wrap; ">

<div>
<div class="branchType">
  <label><span>지점 : </span></label>
  <select id="selectType"></select>
  <input type="button" class="btn btn-primary" id="branchChange" value="확인">
 </div>

<div class="card shadow mb-2 col-12 mx-auto">
<div class="title">코션친구들, 하우스 현황</div>
  <div class="row">
    <div class="col">
      <canvas class="cocean" id="coceanFriends"></canvas>
    </div>
    <div class="col">
      <canvas class="cocean" id="coceanHouse"></canvas>
    </div>
    <div class="col">
      <canvas class="cocean" id="coceanHouseType"></canvas>
    </div>
  </div>
 </div>
 
 <div class="card shadow mb-2 col-12 mx-auto">
 <div class="title">매출 추이</div>
      <canvas class="sales" id="salesVisitors"></canvas>
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
var day = now.getDay();
var nowYearMonth = year + "-" + month + "-" + day;
console.log("현재 년월 : "+nowYearMonth);


//6개월 이전 날짜 계산
var sixMonthsAgo = new Date();
sixMonthsAgo.setMonth(sixMonthsAgo.getMonth() - 6);
var sixMonthsAgoYear = sixMonthsAgo.getFullYear();
var sixMonthsAgoMonth = sixMonthsAgo.getMonth() + 2;
var sixMonthsAgoYearMonth = sixMonthsAgoYear + "-" + sixMonthsAgoMonth;
console.log("6개월 이전 년월 : "+sixMonthsAgoYearMonth);

$(document).ready(function(){
	chart();
});

// chart js 폰트 크기 조정
Chart.defaults.font.size = 13
// 총 수조 수 data.tank[0].totalNumber
// 총 동물 수 data.animal[0].totalNumber

function chart() {
  $.ajax({
      type: 'get',
      url: 'chart.do',
      dataType: 'json',
      success: function (data) {
          console.log("통계 데이터 가져오기 성공");
          console.log(data);
          
          // 지점 셀렉트 박스 추가
          var branchs = data.branchList.filter(function (branch) {
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
                  labels: ['정상', '격리', '질병'],
                  datasets: [{
                      data: [data.animal[0].normalNumber, data.animal[0].isolatedNumber, data.animal[0].illedNumber],
                  }]
              },
              options: { 
                  responsive: false,
                  plugins: {
                      legend: {
                          position: 'top',
                      },
                      title: {
                          display: true,
                          text: ["코션친구들", "총 개체 수 : " + data.animal[0].totalNumber],
                          font: {
                              size: 16
                          }
                      },
                  }
              }
          });



          // 코션하우스 차트 그리기
          console.log("코션하우스 그래프1 그리기");
          console.log(data.tank);
			
          var doughnutChartCoceanHouse = document.querySelector('#coceanHouse').getContext('2d');
          const coceanHouse = new Chart(doughnutChartCoceanHouse, {
            type: 'doughnut',
            data: {
              labels: ['정상', '이상'],
              datasets: [{
                data: [data.tank[0].normalNumber, data.tank[0].abnormalNumber],
              }]
            },
            options: {
              responsive: false,
              plugins: {
                legend: {
                  position: 'top',
                },
                title: {
                  display: true,
                  text: ["코션하우스 상태", "총 수조 수 : " + data.tank[0].totalNumber],
                  font: {
                      size: 16
                  }
              },
                
              }
            }
          });
          
          // 수조 종류 차트 그래프
          console.log("코션하우스 그래프2 그리기");
          console.log(data.tank);
          
          var doughnutChartCoceanHouseType = document.querySelector('#coceanHouseType').getContext('2d');
          const coceanHouseType = new Chart(doughnutChartCoceanHouseType, {
            type: 'doughnut',
            data: {
              labels: ['해수', '담수', '반수생', '육상'],
              datasets: [{
                data: [ data.tank[0].seaWaterTankNumber, data.tank[0].freshWaterTankNumber, 
                			data.tank[0].semiAquaticTankNumber, data.tank[0].landTankNumber],
              }]
            },
            options: {
              responsive: false,
              plugins: {
                legend: {
                  position: 'top',
                },
                title: {
                  display: true,
                  text: ["코션하우스 종류", "총 수조 수 : " + data.tank[0].totalNumber],
                  font: {
                      size: 16
                  }
              },
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
          
          // 매출/관람객
          console.log("관람객 그래프 그리기");

			let salesVisitorsYearMonth = [];
			let monthlySalesTicket = [];
			let monthlySalesProduct = [];
			let monthlySalesVisitorsNumber = [];
			
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
			    salesVisitorsYearMonth.push(ticketSales[i].yearMonth);
			    monthlySalesTicket.push(ticketSales[i].monthlyTotalSales);
			    monthlySalesProduct.push(productSales[i].monthlyTotalSales);
			}
			
			var visitorsData = data.visitors.filter(function (visitors) {
			    return visitors.branchName === "가산점";
			});
			console.log("관람객");
			console.log(visitorsData);
			
			for (var i = 0; i < 6; i++) {
			    monthlySalesVisitorsNumber.push(visitorsData[i].monthlyVisitorsNumber);
			}
			
			    var salesVisitorsBarLine = document.querySelector('#salesVisitors').getContext('2d');
			    const salesVisitors = new Chart(salesVisitorsBarLine, {
			    	type:'line',
		        data: {
		            labels: salesVisitorsYearMonth,
		            datasets: [
		                {
		                    label: '상품 매출',
		                    data: monthlySalesProduct,
		                    yAxisID: 'y',
		                    type: 'bar',
		                },
		                {
		                    label: '티켓 매출',
		                    data: monthlySalesTicket,
		                    yAxisID: 'y',
		                    type: 'bar',
		                },
		                {
		                    label: '관람객 수',
		                    data: monthlySalesVisitorsNumber,
		                    yAxisID: 'y2',
		                    stacked: true,
		                }
		            ],
		        },
		        options: {
		            responsive: false,
		            scales: {
		                y: {
		                    stack: 'combined',
		                    position: 'left',
		                    beginAtZero: true,
		                    ticks: {
		                        callback: function (value, index, values) {
		                            return value / 1000000 +'백만원';
		                        }
		                    }
		                },
		                y2: {
		                    stacked: true,
		                    position: 'right',
		                    ticks: {
		                      callback: function (value, index, values) {
		                          return value +'명';
		                      }
                  			},
		                    grid: {
		                        drawOnChartArea: false,
		                    }
		                }
		            },
		            plugins: {
		                legend: {
		                    position: 'top',
		                },
		                title: {
		                    display: true,
		                    text: ["매출/관람객", "최근 6개월 관람객 : " + data.totalVisitors[0].totalVisitors + "명"],
		                    font: {
		                        size: 17
		                    }
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
		    console.log(coceanFriends.data.datasets[0]);
		    if (branchAnimalData) {
		        // 코션친구들 차트 데이터 업데이트
		        coceanFriends.data.datasets[0].data = [branchAnimalData.normalNumber, branchAnimalData.isolatedNumber, branchAnimalData.illedNumber];
		        coceanFriends.options.plugins.title.text = ["코션친구들", "총 개체 수 : " + branchAnimalData.totalNumber];
		        coceanFriends.update();
		    } else {
		        console.log("선택된 지점 동물 데이터를 찾을 수 없습니다.");
		        swal({
		          title: "선택된 지점 동물 데이터를 찾을 수 없습니다.",
		          icon: "info",
		        });
		    }
		
		    // 선택된 지점 수조차트1 데이터로 차트 업데이트
		    var branchTankData1 = data.tank.find(function (tank) {
		        return tank.branchName === selectedBranch;
		    });
		    console.log("선택된 지점 수조 데이터1");
		    console.log(branchTankData1);
		    if (branchTankData1) {
		        // 코션하우스 차트 데이터 업데이트
		        coceanHouse.data.datasets[0].data = [branchTankData1.normalNumber, branchTankData1.abnormalNumber];
		        coceanHouse.options.plugins.title.text = ["코션하우스 상태", "총 수조 수 : " + branchTankData1.totalNumber];
		        coceanHouse.update();
		    } else {
		        console.log("선택된 지점 수조 데이터1를 찾을 수 없습니다.");
		    }
		
		    // 선택된 지점 수조차트2 데이터로 차트 업데이트
		    var branchTankData2 = data.tank.find(function (tank) {
		        return tank.branchName === selectedBranch;
		    });
		    console.log("선택된 지점 수조 데이터2");
		    console.log(branchTankData2);
		    if (branchTankData2) {
		        // 코션하우스 차트 데이터 업데이트
		        coceanHouseType.data.datasets[0].data = [branchTankData2.seaWaterTankNumber, branchTankData2.freshWaterTankNumber,
		            branchTankData2.semiAquaticTankNumber, branchTankData2.landTankNumber];
		        coceanHouseType.options.plugins.title.text = ["코션하우스 종류", "총 수조 수 : " + branchTankData2.totalNumber];
		        coceanHouseType.update();
		    } else {
		        console.log("선택된 지점 수조 데이터2를 찾을 수 없습니다.");
		    }
		
		    // 선택된 지점 상품 데이터로 차트 업데이트
		    var branchProductData = data.product.filter(function (product) {
		        return product.branchName === selectedBranch;
		    });
		    console.log("선택된 지점 상품 데이터");
		    console.log(branchProductData);
		    if (branchProductData) {
		        // 상품 차트 데이터 업데이트
		        for (var i = 0; i < 6; i++) {
		            salesVisitors.data.datasets[0].data[i] = branchProductData[i].monthlyTotalSales;
		        }
		        salesVisitors.update();
		    } else {
		        console.log("선택된 지점 상품 데이터를 찾을 수 없습니다.");
		    }
		
		    // 선택된 지점 티켓 데이터로 차트 업데이트
		    var branchTicketData = data.ticket.filter(function (ticket) {
		        return ticket.branchName === selectedBranch;
		    });
		    console.log("선택된 지점 티켓 데이터");
		    console.log(branchTicketData);
		    if (branchTicketData) {
		        // 티켓 차트 데이터 업데이트
		        for (var i = 0; i < 6; i++) {
		            salesVisitors.data.datasets[1].data[i] = branchTicketData[i].monthlyTotalSales;
		        }
		        salesVisitors.update();
		    } else {
		        console.log("선택된 지점 티켓 데이터를 찾을 수 없습니다.");
		    }
		
		    // 선택된 지점 관람객 데이터로 차트 업데이트
		    var branchVisitorsData = data.visitors.filter(function (visitors) {
		        return visitors.branchName === selectedBranch;
		    });
		    var branchTotalVisitorsData = data.totalVisitors.filter(function (totalVisitors) {
		        return totalVisitors.branchName === selectedBranch;
		    });
		    console.log("선택된 지점 관람객 데이터");
		    console.log(branchVisitorsData);
		    if (branchVisitorsData && branchTotalVisitorsData) {
		        // 관람객 차트 데이터 업데이트
		        salesVisitors.options.plugins.title.text = ["매출/관람객", "최근 6개월 관람객 : " + branchTotalVisitorsData[0].totalVisitors + "명"];
		        for (var i = 0; i < 6; i++) {
		            salesVisitors.data.datasets[2].data[i] = branchVisitorsData[i].monthlyVisitorsNumber;
		        }
		        salesVisitors.update();
		    } else {
		        console.log("선택된 지점 관람객 데이터를 찾을 수 없습니다.");
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