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
          console.log(data.animal);
          drawBarGraph(data.animal);
          /* drawBarGraph(data.tank);
          drawBarGraph(data.product);
          drawBarGraph(data.ticket);
          drawBarGraph(data.visitors); */
      },
      error: function (e) {
          console.log(e);
      }
  });
}

function drawBarGraph(data) {
  var month = [];
  console.log("drawBarGraph");
  console.log(data);
  
  if(data[0].animalID != null){
  	var totalAnimal = [];
  	var normalAnimal = [];
  	var illedAnimal = [];
  	var deadAnimal = [];
  	console.log("코션친구들 막대그래프 그리기");
  	console.log(data);
  	
  	
  }else if(data == data.tank){
  	
  }else if(data == data.product){
  	
  }else if(data == data.ticket){
  	
  }else if(data == data.visitors){
  	
  } 
  
}
 
 



</script>
</html>