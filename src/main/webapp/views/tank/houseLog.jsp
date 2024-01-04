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
	top: 200px;
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

#tank_table th {
	background-color: #86B0F3;
}

#tank_table td {
	background-color: #E9ECEF;
}

button {
	width: 100px;
}

.btnGroup {
	left: 80%;
	top: 95%;
	position: absolute;
}

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

.logH {
	width: 72%;
	height: 25%;
	position: absolute;
	border: 1px solid black;
	left: 365px;
	top: 27%;
}

.logB {
	width: 72%;
	height: 75%;
	position: absolute;
	border: 1px solid black;
	left: 365px;
	top: 53%;
	overflow: auto;
}
</style>
</head>
<body>
	<c:import url="/side" />
	<div class="container-fluid contentField">
<!-- 		<div id="hTitle"> -->
<!-- 			<a>코션하우스 일지</a> -->
<!-- 		</div> -->
		<div class="topBar">
			<div class="barItem"
				onclick="location.href='detail.go?tankID=${map.tankID}'">하우스
				정보</div>
			<div>하우스 기록</div>
			<div class="barItem">관리 계획</div>
			<div class="barItem" data-toggle="modal" data-target="#animo">코션친구들</div>
		</div>
		<div class="logH">
			<form action="" method="post">
				<div class="form-group">
					<table style="align:center;">
						<tr>
							<th>담당자</th>
							<td>
							<input type="text" value="${sessionScope.userInfo.name}" readonly class="form-control" style="width: 140px;"/>
							</td>
							<th>상태</th>
							<td>
								<input type="text" name="tankStatus"value="${map.tankStatus}" readonly class="form-control" style="width: 140px;" />
							</td>
							<th>작성일</th>
							<td>
								<input type="text" id="currentDate" readonly name="creationDate" readonly class="form-control" style="width: 140px;"/>
							</td>



						</tr>
						<tr>
							<td colspan="8">
							<textarea class="form-control" required style=" width: 1190px; height: 170px;">
                			</textarea>
                			</td>

						</tr>
					</table>
				</div>
			</form>

		</div>

		<div class="logB"></div>







	<c:import url="tankModal" />
	</div>
	</main>
</body>
<script>
	$('#currentDate').val(new Date().toISOString().substring(0, 10).toString());
</script>
</html>