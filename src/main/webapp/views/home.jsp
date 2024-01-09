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
			<div class="card border-secondary  shadow mb-3" style="width:39%; text-align: center; align-items: center;">
			  <div class="card-body" style="align-items: center;">
			    <h3 class="card-title" id="branch"></h3>
			    <div style="width: 180px; height: 180px; margin-bottom: 5%;">
			    <h5 class="card-text" id="icon"> </h5>
			    </div>
			    <h5 class="card-text" id="nowTemp">현재 온도: </h5>
			    <h5 class="card-text" id="feels">체감 온도: </h5>
			    <h5 class="card-text" id="minTemp">최저 기온:  </h5>
			    <h5 class="card-text" id="maxTemp">최고 기온:  </h5>
			  </div>
			</div>
		<!-- 기타 정보 끝 -->	
			
			</div>
			
		<!-- 게시판 영역 시작 -->
			<div class="row" style="height: 100%; margin-top: 4%;"">
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

var url = '';

if(${sessionScope.userInfo.branchID} == 1){
	$('#branch').html('가산동');
	url = 'https://api.openweathermap.org/data/2.5/weather?lat=37.4765800&lon=126.8802000&appid=2bbf4a1d6f2c86d2569a4fe70726f66c&units=metric';
}else{
	$('#branch').html('이호일동');
	url = 'https://api.openweathermap.org/data/2.5/weather?lat=33.4935000&lon=126.4497280&appid=2bbf4a1d6f2c86d2569a4fe70726f66c&units=metric'
}

$.getJSON(url,function(response){
	$('#nowTemp').append(response.main.temp);
	$('#feels').append(response.main.feels_like);
	$('#minTemp').append(response.main.temp_min);
	$('#maxTemp').append(response.main.temp_max);
	
    var weatherIcon =
        '<img src= "http://openweathermap.org/img/wn/'
        + response.weather[0].icon +
        '.png" alt="' + response.weather[0].description +'"style="width:80%; height:80%;"'+'/>'
       

    $('#icon').html(weatherIcon);
	
});


</script>
</html>