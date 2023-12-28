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
	height: 410px;
	left: 530px;
	position: absolute;
	top: 160px;
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
	top: 600px;
	left: 400px;
}

#tank_table th{
	background-color: #86B0F3;
}
#tank_table td{
	background-color: #E9ECEF;
}

</style>
</head>
<body>
	<c:import url="/side" />
	<div id="hTitle">
		<p>${map.tankName}</p>
		<a>배치구역: ${map.area}</a>
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
	
	<button type="button" class="btn btn-secondary" onclick="location.href='list.go'">이전</button>
	<button type="button" class="btn btn-primary" onclick="location.href='#'">수정</button>
	<button type="button" class="btn btn-primary" onclick="location.href='#'">관리</button>


</body>
<script>
	const ctx = $('#myChart');

	var wc = [ 1, 2, 3, 4, 5, 6 ];

	new Chart(ctx,
			{
				type : 'line',
				data : {
					labels : [ '09', '11', '13', '15', '17', '19', '21', '23',
							'01', '03', '05', '07' ],
					datasets : [
							{
								label : '수온',
								data : wc,
								borderWidth : 2
							},
							{
								label : '수위',
								data : [ {
									x : '09',
									y : 20
								}, {
									x : '11',
									y : 25
								} ],
								borderWidth : 2
							},
							{
								label : '염분',
								data : [ 5, 6, 6.5, 6, 6.5, 6.4, 5, 6, 6.5, 6,
										6.5, 6.4 ],
								borderWidth : 2
							},
							{
								label : 'ph',
								data : [ 17, 20, 18, 19, 20, 19, 17, 20, 18,
										19, 20, 19 ],
								borderWidth : 2
							},
							{
								label : 'DO',
								data : [ 17, 20, 18, 19, 20, 19, 17, 20, 18,
										19, 20, 19 ],
								borderWidth : 2
							},
							{
								label : '질산염',
								data : [ 13, 14, 14, 14.5, 13, 14, 13, 14, 14,
										14.5, 13, 14 ],
								borderWidth : 2
							},
							{
								label : '아질산염',
								data : [ 13, 10, 12, 13, 12, 11, 13, 10, 12,
										13, 12, 11 ],
								borderWidth : 2
							},
							{
								label : '암모니아',
								data : [ 13, 14, 14, 16, 13, 14, 13, 14, 14,
										16, 13, 14 ],
								borderWidth : 2
							},
							{
								label : '인산염',
								data : [ 15, 16, 14, 16, 13.5, 14.5, 15, 16,
										14, 16, 13.5, 14.5 ],
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
</script>
</html>