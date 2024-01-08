<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resource/css/common.css'/>">
</head>
<body>
	<c:import url="/side" />
	<div class="container-fluid contentField">
		<div class="container">

		<div class="row" style="justify-content: space-between; height: 400px; padding-top: 3%">
			
		<!-- 사원 정보 시작 -->
			<div class="card border-secondary mb-3" style="width:60%;">
			  <div class="card-body">
			    <h4 class="card-title">접속 사원 정보</h4>
			    <p class="card-text">출퇴근 버튼 배치</p>
			  </div>
			    <div style="display: flex; justify-content: space-around;">
			  	<button class="btn btn btn-primary btn-lg" style="width:48%;">출근</button>
			  	<button class="btn btn btn-secondary btn-lg" style="width:48%;">퇴근</button>
			  	</div>
			</div>
		<!-- 사원 정보 끝 -->
		
		<!-- 기타 정보 시작 -->
			<div class="card border-secondary mb-3" style="width:39%;">
			  <div class="card-body">
			    <h4 class="card-title">기타 정보</h4>
			    <p class="card-text">etc</p>
			  </div>
			</div>
		<!-- 기타 정보 끝 -->	
			
			</div>
			
		<!-- 게시판 영역 시작 -->
			<div class="row" style="height: 100%;">
				<div class="card border-secondary mb-5" style="width:100%;">
				  <div class="card-body">
				    <h4 class="card-title">공지사항</h4>
				    <p class="card-text">게시판 배치</p>
				  </div>
				</div>
			</div>
		<!-- 게시판 영역 끝 -->
		</div>
		<c:import url="/footer" />
	</div>
</body>
<script>



</script>
</html>