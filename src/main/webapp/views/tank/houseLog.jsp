<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코션하우스</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.topBar {
	width: 100%;
	height: 60px;
	left: 130px;
	background-color: #86B0F3;
	display: flex;
	justify-content: space-evenly;
}

.topBar div {
	width: 100%;
	height: 100%;
	position: relative;
	text-align: center;
	font-size: 21px;
	padding-top: 14px;
	cursor: default;
}

.barItem:hover {
	cursor: pointer;
	background-color: #2F80ED;
	padding-top: 13px;
}
</style>
</head>
<body>
	<c:import url="/side" />
	<div class="container-fluid contentField">
		<div class="container">
		
			<div class="row">
				<div class="col-md">
					<div class="topBar">
						<div class="barItem" onclick="location.href='detail.go?tankID=${tankID}'">하우스정보</div>
						<div style="color: #ffffff;">하우스 기록</div>
						<div class="barItem" onclick="location.href='housePlan.go?tankID=${tankID}'">관리 계획</div>
					</div>
				</div>
			</div>
			
			<div class="row" style="margin-top: 3%; margin-left: 1px;">
			<input class="form-control" type="month" name="curDate" id="currentDate" value="" onchange="getRecord()" style="width:200px">
			</div>

			<div class="row" style="width: 100%; margin-left: 1px;">
			
				<div class="card shadow mb-4" style="width: 100%; margin-top: 3%;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold">월간 기록 [최대/최소/평균]</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center; table-layout: fixed;">
							<thead>
							<tr>							
							<th style="width: 8%;">날짜</th>
							<th style="width: 13%;">수온</th>
							<th style="width: 13%;">수위</th>
							<th style="width: 13%;">염도</th>
							<th style="width: 13%;">pH</th>
							<th style="width: 13%;">Do</th>
							<th style="width: 13%;">질산염</th>
							<th style="width: 13%;">아질산염</th>
							<th style="width: 13%;">암모니아</th>
							<th style="width: 13%;">인산염</th>
							</tr>
							</thead>
							<tbody id="recordTable">
<%-- 							<c:forEach items="${recordList}" var="list"> --%>
	
<%-- 							</c:forEach> --%>
							</tbody>
							
							</table>
							</div>
							</div>		
						</div>


					</div>






				</div>
				<c:import url="/footer" />
			</div></body>
<script>
	$('#currentDate').val(new Date().toISOString().slice(0, 7));
	// console.log(new Date().toISOString().slice(0, 7));
	// console.log(${tankID});
	
	
	let curDate = $('#currentDate').val();
	let tankID = ${tankID};
	getRecord(curDate,tankID);
	
	
	
	
	function getRecord(curDate,tankID){
		tankID = ${tankID};
		curDate = $('#currentDate').val();
		curDate += '-01';
		
		$.ajax({
			url: 'getRecord.ajax',
			method: 'GET',
			data: {'tankID':tankID, 'curDate':curDate},
			dataType: 'JSON',
			success: function(data){
				drawList(data);
			},
			error: function(e){
				console.log(e);
			}
		})
	}
	
	
	
	function drawList(data){
		var content = '';
		
		data.forEach(function(list){
			content += '<tr>';
			content += '<td>'+ list.recordDate.substring(8, 10) + '일' +'</td>';
			content += '<td>'+ list.maxMer +'/'+ list.minMer +'/'+ list.avgMer +'</td>';
			content += '<td>'+ list.maxWater +'/'+ list.minWater +'/'+ list.avgWater +'</td>';
			content += '<td>'+ list.maxSal +'/'+ list.minSal +'/'+ list.avgSal +'</td>';
			content += '<td>'+ list.maxPh +'/'+ list.minPh +'/'+ list.avgPh +'</td>';
			content += '<td>'+ list.maxDo +'/'+ list.minDo +'/'+ list.avgDo +'</td>';
			content += '<td>'+ list.maxNita +'/'+ list.minNita +'/'+ list.avgNita +'</td>';
			content += '<td>'+ list.maxNiti +'/'+ list.minNiti +'/'+ list.avgNiti +'</td>';
			content += '<td>'+ list.maxAm +'/'+ list.minAm +'/'+ list.avgAm +'</td>';
			content += '<td>'+ list.maxPhos +'/'+ list.minPhos +'/'+ list.avgPhos +'</td>';
			content += '</tr>';
		});
		$('#recordTable').empty();
		$('#recordTable').append(content);
		
	}
	
	
	

	
	
	
	
</script>
</html>