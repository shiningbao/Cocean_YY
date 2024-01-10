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

		<div class="row" style="justify-content: space-between; height: 470px; padding-top: 3%">
			
		<!-- 사원 정보 시작 -->
			<div class="card border-secondary mb-3" style="width:60%;">
			  <div class="card-body">
			    <h4 class="card-title">접속 사원 정보</h4>
			    <p class="card-text">출퇴근 버튼 배치</p>
			  </div>
			    <div style="display: flex; justify-content: space-around;">
			  	<button class="btn btn btn-primary btn-lg" id="attendanceButton" style="width:48%;">출근</button>
			  	<button class="btn btn btn-secondary btn-lg" id="leaveButton"  style="width:48%;">퇴근</button>
			  	</div>
			</div>
		<!-- 사원 정보 끝 -->
		
		<!-- 기타 정보 시작 -->
			<div class="card text-white bg-primary shadow mb-3 " style="width:39%; text-align: center; align-items: center;">
			  <div class="card-body" style="align-items: center;">
			    <h3 class="card-title" id="branch"></h3>
			    <div style="width: 200px; height: 200px;">
			    <h5 class="card-text" style="background-color: white; width: 80%; height: 80%; border-radius: 50%; margin-left: 10%;"
			    ><img src="" id="icon" style="width: 75%; height: 75%; border-radius: 50%; margin-top: 10%;"/></h5>
			    <h5 id="weatherMain"></h5>
			    </div>
			    <h3 class="card-text" id="nowTemp">&nbsp;</h3>
			    <h5 class="card-text" id="feels">체감 온도&nbsp; </h5>
			    <h5 class="card-text" id="minTemp">최저 기온&nbsp;  </h5>
			    <h5 class="card-text" id="maxTemp">최고 기온&nbsp;  </h5>
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
				    <p class="card-text"></p>
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
const branch = ${sessionScope.userInfo.branchID};
if(branch == 1){
	$('#branch').html('가산동');
	url = 'https://api.openweathermap.org/data/2.5/weather?lat=37.4765800&lon=126.8802000&appid=2bbf4a1d6f2c86d2569a4fe70726f66c&units=metric';
}else{
	$('#branch').html('이호일동');
	url = 'https://api.openweathermap.org/data/2.5/weather?lat=33.4935000&lon=126.4497280&appid=2bbf4a1d6f2c86d2569a4fe70726f66c&units=metric'
}

// 날씨 API
$.getJSON(url,function(response){
	$('#weatherMain').append(response.weather[0].main);
	$('#nowTemp').append(Math.round(response.main.temp)+'°');
	$('#feels').append(Math.round(response.main.feels_like)+'°');
	$('#minTemp').append(Math.round(response.main.temp_min)+'°');
	$('#maxTemp').append(Math.round(response.main.temp_max)+'°');
	
    var weatherIcon = response.weather[0].icon.substring(0,2);
	$('#icon').attr('src','<c:url value="/resource/img/'+weatherIcon+'.gif"/>');	
});








// 출/ 퇴근
function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);

    var formattedDate = year + '-' + month + '-' + day;

    return formattedDate;
}

// 타임스탬프를 시간 형식으로 변환하는 함수
function formatTimeFromTimestamp(timestamp) {
    var date = new Date(timestamp);

    // 로컬 시간대와 UTC 시간과의 차이를 계산
    var timezoneOffsetInMinutes = date.getTimezoneOffset();

    // UTC 기준 시간에서 로컬 시간대와의 차이를 뺀 후, 시간 형식으로 변환
    date.setMinutes(date.getMinutes() - timezoneOffsetInMinutes);

    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    
    var hours = ('0' + date.getHours()).slice(-2);
    var minutes = ('0' + date.getMinutes()).slice(-2);
    var seconds = ('0' + date.getSeconds()).slice(-2);

    var formattedTime = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;

    return formattedTime;
}




// 타임스탬프를 날짜 및 시간 형식으로 변환하는 함수(공통)

function formatDateTimeFromTimestamp(timestamp) {
    var formattedDate = formatDateFromTimestamp(timestamp);
    var formattedTime = formatTimeFromTimestamp(timestamp);

    return formattedDate + ' ' + formattedTime;
}






// 출근 퇴근 버튼
var attendanceChecked = false;
var leaveChecked = false;
var canClick = true;

function resetClickPermission() {
    console.log("클릭 권한 재설정 중.");
    var now = new Date();
    var hours = now.getHours();

    // 아침 6시에 초기화
    if (hours === 6) {
        canClick = true;
        console.log("클릭 권한이 성공적으로 재설정되었습니다.");
    }
}

function sendAttendanceData() {
    if (!canClick) {
        alert("아침 6시이후에 다시 출근 체크를 할 수 있습니다.");
        return;
    }

    if (attendanceChecked) {
        alert("이미 출근 체크 하셨습니다.");
        return;
    }

    var currentTimestamp = Date.now();
    var formattedTime = formatTimeFromTimestamp(currentTimestamp); // 시간
    var formattedDate = formatDateFromTimestamp(currentTimestamp); // 년월일

    var url = "gocheck";

    var requestData = {
        timedata: formattedTime, datedate: formattedDate
    };

    $.ajax({
        type: "POST",
        url: url,
        data: requestData,
        dataType: "json",
        success: function (data) {
            console.log("서버 응답: " + data);
            alert("출근이 되었습니다.");
            attendanceChecked = true;
            canClick = false; // 출근 클릭 후에는 다시 클릭하지 못하게 설정
        },
        error: function (error) {
            console.error(error);
        }
    });
}

$("#attendanceButton").click(function () {
    sendAttendanceData();
});

function leaveAttendanceData() {
    if (leaveChecked) {
        alert(" 아침 6시이후에 다시 퇴근체크를 할 수 있습니다.");
        return;
    }

    if (!attendanceChecked) {
        alert("출근 체크를 먼저 해주세요.");
        return;
    }

    var currentTimestamp = Date.now();
    var formattedTime = formatTimeFromTimestamp(currentTimestamp); // 시간
    var formattedDate = formatDateFromTimestamp(currentTimestamp); // 년월일

    var url = "leavecheck";

    var leaveData = {
        timedata: formattedTime, datedate: formattedDate
    };

    $.ajax({
        type: "POST",
        url: url,
        data: leaveData,
        dataType: "json",
        success: function (data) {
            console.log("서버 응답: " + data);
            alert("퇴근이 되었습니다.");
            leaveChecked = true; // 퇴근 체크 후 플래그 설정
            attendanceChecked = false; // 출근 체크 여부 초기화
            canClick = false; // 퇴근 클릭 후에는 다시 클릭하지 못하게 설정
        },
        error: function (error) {
            console.error(error);
        }
    });
}

$("#leaveButton").click(function () {
    leaveAttendanceData();
});

// 1분마다 클릭 여부 초기화 확인
setInterval(resetClickPermission, 60000);

</script>
</html>