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
	width: 72%;
	height: 60px;
	left: 22%;
	position: absolute;
	background-color: #86B0F3;
 	display: flex; 
 	justify-content: space-evenly; 
}

.topBar div {
	width: 25%;
	height: 100%;
	text-align: center;
	font-size: 21px;
	padding-top: 14px;
	cursor: default;
}
</style>
</head>
<body>
	<c:import url="/side" />
	<div class="container-fluid contentField">

		<div class="topBar">
			<div class="barItem"
				onclick="location.href='detail.go?tankID=${map.tankID}'">하우스
				정보</div>
			<div>하우스 기록</div>
			<div class="barItem">관리 계획</div>
			<div class="barItem" data-toggle="modal" data-target="#animo">코션친구들</div>
		</div>
	
<c:import url="/footer"/>
	</div>
</body>
<script>
	$('#currentDate').val(new Date().toISOString().substring(0, 10).toString());
</script>
</html>