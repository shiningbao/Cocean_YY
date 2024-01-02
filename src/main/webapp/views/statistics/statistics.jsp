<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        .chartContainer {
            display: flex;
            flex-wrap: wrap;
        }

        .chartBox1, .chartBox2 {
            width: 350px;
            height: 300px;
            background-color : lightgray;
  			border-radius: 30px;
            margin: 5px;
        }
    </style>
</head>

<body>
    <jsp:include page="../side.jsp"></jsp:include>
    <c:forEach var="animal" items="${animal}">
    <tr>
        <td>${animal.animalID}</td>
        <td>${animal.branchID}</td>
        <td>${animal.branchName}</td>
        <td>${animal.classificationCode}</td>
    </tr>
</c:forEach>
    
    <div class="chartContainer">
        <div class="chartBox1">
        	<div class="chartContent">
        	<canvas id="animal"></canvas>
        	</div>
        </div>
       <%--  <div class="chartBox1">
        	<div class="chartContent">
        	<canvas id="tank"></canvas>
        	</div>
        </div>
        <div class="chartBox1">
        	<div class="chartContent">
        	<canvas id="product"></canvas>
        	</div>
        </div>
        <div class="chartBox1">
        	<div class="chartContent">
        	<canvas id="ticket"></canvas>
        	</div>
        </div>
        <div class="chartBox1">
        	<div class="chartContent">
        	<canvas id="visitors"></canvas>
        	</div>
        </div> --%>
    </div>
</body>
<script>
var animal = $('#animal');
var tank = $('#tank');
var product = $('#product');
var ticket = $('#ticket');
var visitors = $('#visitors');



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
          // drawChart(data);
      },
      error: function (e) {
          console.log(e);
      }
  });
}

 function drawChart(data) {
  var animalDataSets = [];
  var tankDataSets = [];
  var productDataSets = [];
  var ticketDataSets = [];
  var visitorsDataSets = [];
  
  console.log("차트 그리기");
  console.log(data);
  console.log(data.animal);
  entryDate
  // 동물 차트
  const animalData = {
  labels: labels,
  datasets: [
  	{
          label: '분류 코드', 
          data: data.animal.classificationCode 
          backgroundColor: 'rgba(75, 192, 192, 0.2)', // 차트 색상
          borderColor: 'rgba(75, 192, 192, 1)',       // 테두리 색상
          borderWidth: 1                              // 테두리 두께	
      },
      {
      	label: ' 코드', 
        data: data.animal.classificationCode 
        backgroundColor: 'rgba(75, 192, 192, 0.2)', // 차트 색상
        borderColor: 'rgba(75, 192, 192, 1)',       // 테두리 색상
        borderWidth: 1
      }

      animalDataSets.push(animalDataSets);
      }
 }

 /*  const config = {
      type: 'bar',
      data: {
          labels: 
          datasets: datasets
      },
      options: {
          responsive: true,
          plugins: {
              legend: {
                  position: 'top',
              },
              title: {
                  display: true,
                  text: 'Chart.js Bar Chart'
              }
          }
      },
  }; */

  /* var myChart = new Chart(엘리먼, config); */



</script>
</html>