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
						<div class="barItem"
							onclick="location.href='detail.go?tankID=${map.tankID}'">하우스
							정보</div>
						<div style="color: #ffffff;">
							하우스 기록
						</div>
						<div class="barItem">관리 계획</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/footer" />
	</div>
</body>
<script>
	$('#currentDate').val(new Date().toISOString().substring(0, 10).toString());
</script>
</html>