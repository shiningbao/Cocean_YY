<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코션하우스</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
#chart {
	width: 100%;
	height: 43%;
	left: 33%;
	position: absolute;
	top: 22%;
}

#hTitle {
	width: 300px;
	height: 50px;
	left: 350px;
	position: absolute;
	top: 110px;
}

#hTitle p {
	font-size: 22px;
}

#tank_table {
	width: 72%;
	height: 20%;
	text-align: center;
	position: absolute;
	top: 70%;
	left: 22%;
}

#tank_table th{
	background-color: #86B0F3;
}
#tank_table td{
	background-color: #E9ECEF;
}
button {
	width: 100px;
}
.btnGroup{
	left: 80%;
	top: 95%;
	position: absolute;
}

</style>
</head>
<body>
	<c:import url="/side" />
	<div id="hTitle">
		<p>${map.tankName}</p>
		 <a> 배치구역: ${map.area}</a>
	</div>

	<div id="chart">
		<canvas id="myChart"></canvas>
	</div>
	
	<div id="tank_table">
		<table class="table">
				<tr>
					<th>담당자</th>
					<th>바닥재</th>
					<th>여과기</th>
					<th>기준 수온</th>
					<th>기준 수위</th>
					<th>기준 염도</th>
					
				</tr>
				<tr>
					<td>${emName}</td>
					<td>${map.flooring}</td>
					<td>${map.filter}</td>
					<td>${map.mercury}</td>
					<td>${map.waterLevel}</td>
					<td>${map.salinity}</td>
					
				</tr>
				<tr>
					<th>기준 ph</th>
					<th>기준 DO</th>
					<th>기준 질산염</th>
					<th>기준 아질산염</th>
					<th>기준 암모니아</th>
					<th>기준 인산염</th>
				</tr>
				<tr>
					<td>${map.pH}</td>
					<td>${map.dO}</td>
					<td>${map.nitrates}</td>
					<td>${map.nitrites}</td>
					<td>${map.ammonia}</td>
					<td>${map.phosphates}</td>
				</tr>
		</table>
	</div>
	<div class="btnGroup">
	<button type="button" class="btn btn-secondary" onclick="location.href='list.go'">이전</button>
	<button type="button" class="btn btn-primary" onclick="location.href='tankSet.go?tankID=${map.tankID}'">수정</button>	
	</div>

</body>
<script>

var tankID = ${map.tankID}
var tdy = new Date().toISOString().substring(0, 10).toString();

const ctx = $('#myChart');

	$(document).ready(function(){
		getChart(tankID,tdy);
	});



function getChart(tankID,tdy){
	console.log(tdy);
	console.log(tankID);
	
	let recordTime = [];
	let recordMercury = [];
	let recordWaterLevel = [];
	let recordSalinity = [];
	let recordPh = [];
	let recordDo = [];
	let recordNitrates = [];
	let recordNitrites = [];
	let recordAmmonia = [];
	let recordPhosphates = [];
	
	
	$.ajax({
		url: 'getChart',
		method: 'get',
		data: {'tankID':tankID, 'recordDate':tdy},
		dataType: 'JSON',
		success: function(data){
			console.log(data);
			for (var i = 0; i < data.length; i++) {
				recordTime.push(data[i].timeSet);
				recordMercury.push(data[i].recordMercury);
				recordWaterLevel.push(data[i].recordWaterLevel);
				recordSalinity.push(data[i].recordSalinity);
				recordPh.push(data[i].recordPh);
				recordDo.push(data[i].recordDo);
				recordNitrates.push(data[i].recordNitrates);
				recordNitrites.push(data[i].recordNitrites);
				recordAmmonia.push(data[i].recordAmmonia);
				recordPhosphates.push(data[i].recordPhosphates);
			}
			console.log(recordTime);
			console.log(recordSalinity);
			console.log(recordDo);
			console.log(recordNitrites);
			console.log(recordPhosphates);
			
			new Chart(ctx,
					{
						type : 'line',
						data : {
							labels : recordTime,
							datasets : [
									{
										label : '수온',
										data : recordMercury,
										borderWidth : 2
									},
									{
										label : '수위',
										data : recordWaterLevel,
										borderWidth : 2
									},
									{
										label : '염분',
										data : recordSalinity,
										borderWidth : 2
									},
									{
										label : 'ph',
										data : recordPh,
										borderWidth : 2
									},
									{
										label : 'DO',
										data : recordDo,
										borderWidth : 2
									},
									{
										label : '질산염',
										data : recordNitrates,
										borderWidth : 2
									},
									{
										label : '아질산염',
										data : recordNitrites,
										borderWidth : 2
									},
									{
										label : '암모니아',
										data : recordAmmonia,
										borderWidth : 2
									},
									{
										label : '인산염',
										data : recordPhosphates,
										borderWidth : 2
									} ]
						},
						options : {
							scales : {
								y : {
									beginAtZero : true
								}
							}
						}
					});
		},
		error: function(e){
			console.log(e);
		}
	})
}
</script>
</html>