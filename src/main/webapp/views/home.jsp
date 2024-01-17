<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resource/css/common.css'/>">
<style>
	.rounded-circle{
		width:200px;
		height:200px;
	}
</style>
</head>
<body>
	<c:import url="/side" />
	<div class="container-fluid contentField">
		<div class="container">

		<div class="row" style="justify-content: space-between; height: 470px; padding-top: 3%">
			
		<!-- 사원 정보 시작 -->
			<div class="card shadow mb-3" style="width:30%;">
			  <div class="card-body">
			    <h4 class="card-title"></h4>
			    <p class="card-text"></p>
			    <div style="text-align:center">
				<img class="img-profile rounded-circle"	src="/photo/cocean/profile/${sessionScope.userInfo.serverFileName}"/>
				  	<div>
				  	<span>${sessionScope.userInfo.name}</span>
				  	<span>${sessionScope.userInfo.positionName}</span>
				  	</div>
				  	<div>
				  		<span>${sessionScope.userInfo.departmentName}</span>
				  	</div>
			  	</div>
			  </div>
			    <div style="text-align:center; margin-bottom: 30px">
			  	<button class="btn btn btn-primary btn-lg" id="attendanceButton" style="width:130px">출근</button>
			  	<button class="btn btn btn-secondary btn-lg" id="leaveButton" style="width:130px" >퇴근</button>
			  	</div>
			</div>
		<!-- 사원 정보 끝 -->
		<!-- 결재대기문서 리스트 -->
					<div class="card shadow mb-3" style="width:39%;">
			  <div class="card-body">
			    <h4 class="card-title">결재대기문서</h4>
			      <table class="table table-hover" style="text-align:center;">
						<colgroup>
							<col width="20%">
							<col width="40%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead style="background-color:#86B0F3;">
							<tr>
								<th scope="col">기안일</th>
								<th scope="col">제목</th>
								<th scope="col">상태</th>
								<th scope="col">기안자</th>
							</tr>
						</thead>
						<tr>
						<c:if test="${empty wList}">
							<tr>
								<td colspan="4" style="text-align:center;color:gray; font-weight:bold;">-- 문서가 없습니다. --</td>
							</tr>
						</c:if>
						<c:forEach items="${wList}" var="item">
							<tr>
								<td>${item.draftDate}</td>
								<td>
									<c:choose>
										<c:when test="${item.title == null}">
										<a href="/Cocean/approval/draftDetail.go?idx=${item.idx}&employeeID=${item.id}&category=${item.category}&hTitle=waiting">${item.formTitle}</a>
										</c:when>
										<c:otherwise>
								        <a href="/Cocean/approval/draftDetail.go?idx=${item.idx}&employeeID=${item.id}&category=${item.category}&hTitle=waiting">${item.title}</a>
								        </c:otherwise>
									</c:choose>
								</td>
								<td>${item.approvalStatus}</td>
								<td>${item.name}</td>
							</tr>
						</c:forEach>
					</table>
					<a href="./approval/waitingList.go" class="card-text" style="float:right;font-weight:bold;">+더보기</a>
			    

			  </div>

			</div>
			<!-- 결재대기문서 리스트 끝 -->
		<!-- 기타 정보 시작 -->
			<div class="card text-white bg-primary shadow mb-3 " style="width:30%; text-align: center; align-items: center;">
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
				<div class="card shadow mb-5" style="width:100%;">
				  <div class="card-body">
				    <h4 class="card-title">공지사항</h4>
				    
					    <table class="table table-hover">
						<colgroup>
							<col width="20%">
							<col width="40%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead style="background-color:#86B0F3; text-align:center;">
							<tr>
								<th scope="col">글 번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tr>
						<c:if test="${empty notice}">
							<tr>
								<td colspan="4" style="text-align:center;color:gray; font-weight:bold;">게시글이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${notice}" var="item">
							<tr style="text-align:center;">
								<td>
									<c:if test="${item.isPinned eq 1}">공지</c:if>
									<c:if test="${item.isPinned ne 1}">${item.boardID}</c:if>
								</td>
								<td><a href="board/notice/detail?boardID=${item.boardID}">${item.title}</a></td>
								<td>${item.name}</td>
								<td>${item.creationDate}</td>
							</tr>
						</c:forEach>
					</table>
				
				    <a href="./board/notice/list?searchCategory=&search=&page=1"class="card-text" style="float:right;font-weight:bold;">+더보기</a>
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
    var timezoneOffsetInMinutes = date.getTimezoneOffset();

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


/*
var attendanceChecked, leaveChecked, canClick, userId;


function getEmployeeIdFromSession(callback) {
    $.ajax({
        type: "GET",
        url: "getSessionEmployeeId",
        success: function (response) {
            var employeeId = response.employeeId;

            // 여기서부터 이후 코드에서 employeeId를 사용할 수 있음
            // 예를 들어, 출근 또는 퇴근 버튼 클릭 이벤트에서 사용 가능
            console.log("EmployeeID from session:", employeeId);

            // callback 함수를 호출하여 employeeId를 전달
            if (typeof callback === "function") {
                callback(employeeId);
            }
        },
        error: function (error) {
            console.error("Error fetching EmployeeID from session:", error);
        }
    });
}

// 페이지 로드 시 세션에서 EmployeeID를 가져오기
$(document).ready(function () {
    getEmployeeIdFromSession(function(employeeId) {
        initializeValues(employeeId);
        updateButtonState();
    });
});

//초기화 함수
function initializeValues(employeeId) {
 userId = employeeId;
 attendanceChecked = JSON.parse(localStorage.getItem(userId + '_attendanceChecked'));
 leaveChecked = JSON.parse(localStorage.getItem(userId + '_leaveChecked'));
 canClick = JSON.parse(localStorage.getItem(userId + '_canClick'));

 // Debugging
 console.log("Raw values from localStorage:");
 console.log("attendanceChecked:", localStorage.getItem(userId + '_attendanceChecked'));
 console.log("leaveChecked:", localStorage.getItem(userId + '_leaveChecked'));
 console.log("canClick:", localStorage.getItem(userId + '_canClick'));

 // 기본값 설정
 if (attendanceChecked === null || attendanceChecked === undefined) {
     attendanceChecked = false;
 }

 if (leaveChecked === null || leaveChecked === undefined) {
     leaveChecked = false;
 }

 if (canClick === null || canClick === undefined) {
     canClick = true;
 }
}


//1분마다 클릭 여부 초기화 확인
setInterval(resetClickPermission, 60000);

//클릭 여부 초기화 함수
function resetClickPermission() {
 console.log("클릭 권한 재설정 중.");
 var now = new Date();
 var hours = now.getHours();

 // 아침 6시 이후에 초기화
 if (hours >= 6 && !canClick) {
     canClick = true;
     console.log("클릭 권한이 성공적으로 재설정되었습니다.");
     // 변경된 데이터를 localStorage에 저장
     localStorage.setItem(userId + '_canClick', JSON.stringify(canClick));
     // 버튼 상태 업데이트
     updateButtonState();
 }
}

//버튼 상태 업데이트 함수
function updateButtonState() {
 console.log("updateButtonState 호출됨");

 console.log("attendanceChecked:", attendanceChecked);
 console.log("leaveChecked:", leaveChecked);
 console.log("canClick:", canClick);

 // 출근 버튼 상태 업데이트
 if (attendanceChecked || !canClick) {
     console.log("출근 체크됨 또는 클릭 불가");
     $("#attendanceButton").prop("disabled", true);
 } else {
     console.log("출근 체크 안 됨");
     $("#attendanceButton").prop("disabled", false);
 }

 // 퇴근 버튼 상태 업데이트
 if (leaveChecked) {
     console.log("퇴근 체크됨");
     $("#leaveButton").prop("disabled", true);
 } else {
     console.log("퇴근 체크 안 됨");
     $("#leaveButton").prop("disabled", false);
 }
}

//출근 버튼 클릭 이벤트
$("#attendanceButton").click(function () {
 sendAttendanceData();
});

//퇴근 버튼 클릭 이벤트
$("#leaveButton").click(function () {
 leaveAttendanceData();
});

//출근 데이터 전송 함수
function sendAttendanceData() {
 if (!canClick) {
     swal('아침 6시 이후에 다시 출근 체크를 할 수 있습니다.', '', 'success');
     return;
 }

 if (attendanceChecked) {
     swal('이미 출근 체크 하셨습니다.', '', 'success');
     return;
 }

 var currentTimestamp = Date.now();
 var formattedTime = formatTimeFromTimestamp(currentTimestamp);
 var formattedDate = formatDateFromTimestamp(currentTimestamp);

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
         swal('출근이 되었습니다', '', 'success');
         attendanceChecked = true;
         leaveChecked = false; // 퇴근 체크 초기화
         canClick = false;
         updateButtonState();
         // 변경된 데이터를 localStorage에 저장
         localStorage.setItem(userId + '_attendanceChecked', JSON.stringify(attendanceChecked));
         localStorage.setItem(userId + '_leaveChecked', JSON.stringify(leaveChecked));
         localStorage.setItem(userId + '_canClick', JSON.stringify(canClick));
     },
     error: function (error) {
         console.error(error);
     }
 });
}

//퇴근 데이터 전송 함수
function leaveAttendanceData() {
 if (leaveChecked) {
     swal('아침 6시 이후에 다시 퇴근 체크를 할 수 있습니다.', '', 'success');
     return;
 }

 if (!attendanceChecked) {
     swal('출근 체크를 먼저 해주세요.', '', 'success');
     return;
 }

 var currentTimestamp = Date.now();
 var formattedTime = formatTimeFromTimestamp(currentTimestamp);
 var formattedDate = formatDateFromTimestamp(currentTimestamp);

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
         swal('퇴근이 되었습니다', '', 'success');
         leaveChecked = true;
         attendanceChecked = false;
         canClick = false;
         updateButtonState();
         // 변경된 데이터를 localStorage에 저장
         localStorage.setItem(userId + '_attendanceChecked', JSON.stringify(attendanceChecked));
         localStorage.setItem(userId + '_leaveChecked', JSON.stringify(leaveChecked));
         localStorage.setItem(userId + '_canClick', JSON.stringify(canClick));
     },
     error: function (error) {
         console.error(error);
     }
 });
}
*/

var attendanceChecked, leaveChecked, canClick, userId;


function getEmployeeIdFromSession(callback) {
    $.ajax({
        type: "GET",
        url: "getSessionEmployeeId",
        success: function (response) {
            var employeeId = response.employeeId;

            // 여기서부터 이후 코드에서 employeeId를 사용할 수 있음
            // 예를 들어, 출근 또는 퇴근 버튼 클릭 이벤트에서 사용 가능
            console.log("EmployeeID from session:", employeeId);

            // callback 함수를 호출하여 employeeId를 전달
            if (typeof callback === "function") {
                callback(employeeId);
            }
        },
        error: function (error) {
            console.error("Error fetching EmployeeID from session:", error);
        }
    });
}

// 페이지 로드 시 세션에서 EmployeeID를 가져오기
$(document).ready(function () {
    getEmployeeIdFromSession(function(employeeId) {
        initializeValues(employeeId);
        updateButtonState();
    });
});

//초기화 함수
function initializeValues(employeeId) {
    userId = employeeId;
    attendanceChecked = JSON.parse(localStorage.getItem(userId + '_attendanceChecked'));
    leaveChecked = JSON.parse(localStorage.getItem(userId + '_leaveChecked'));
    canClick = JSON.parse(localStorage.getItem(userId + '_canClick'));

    // Debugging
    console.log("Raw values from localStorage:");
    console.log("attendanceChecked:", localStorage.getItem(userId + '_attendanceChecked'));
    console.log("leaveChecked:", localStorage.getItem(userId + '_leaveChecked'));
    console.log("canClick:", localStorage.getItem(userId + '_canClick'));

    // 기본값 설정
    if (attendanceChecked === null || attendanceChecked === undefined) {
        attendanceChecked = false;
    }

    if (leaveChecked === null || leaveChecked === undefined) {
        leaveChecked = false;
    }

    // 아침 6시 이후에만 클릭 가능하도록 설정
    var now = new Date();
    var hours = now.getHours();

    if (canClick === null || canClick === undefined) {
        canClick = hours >= 6;
    }
}


//1분마다 클릭 여부 초기화 확인
setInterval(resetClickPermission, 6000);

//클릭 여부 초기화 함수
function resetClickPermission() {
    console.log("클릭 권한 재설정 중.");
    var now = new Date();
    var hours = now.getHours();

    // 현재 날짜와 localStorage에 저장된 클릭된 날짜 확인
    var lastClickedDate = JSON.parse(localStorage.getItem(userId + '_lastClickedDate'));
    var currentDate = now.toISOString().split('T')[0]; // 형식: YYYY-MM-DD

    // 아침 6시 이후에 초기화하고, 클릭된 날짜가 오늘인 경우에만 실행
    if (hours >= 6 && lastClickedDate === currentDate && !canClick) {
        canClick = true;
        console.log("클릭 권한이 성공적으로 재설정되었습니다.");
        // 변경된 데이터를 localStorage에 저장
        localStorage.setItem(userId + '_canClick', JSON.stringify(canClick));
        // 버튼 상태 업데이트
        updateButtonState();
    }
}

//버튼 상태 업데이트 함수
function updateButtonState() {
 console.log("updateButtonState 호출됨");

 console.log("attendanceChecked:", attendanceChecked);
 console.log("leaveChecked:", leaveChecked);
 console.log("canClick:", canClick);

 // 출근 버튼 상태 업데이트
 if (attendanceChecked || !canClick) {
     console.log("출근 체크됨 또는 클릭 불가");
     $("#attendanceButton").prop("disabled", true);
 } else {
     console.log("출근 체크 안 됨");
     $("#attendanceButton").prop("disabled", false);
 }

 // 퇴근 버튼 상태 업데이트
 if (leaveChecked) {
     console.log("퇴근 체크됨");
     $("#leaveButton").prop("disabled", true);
 } else {
     console.log("퇴근 체크 안 됨");
     $("#leaveButton").prop("disabled", false);
 }
}

//출근 버튼 클릭 이벤트
$("#attendanceButton").click(function () {
 sendAttendanceData();
});

//퇴근 버튼 클릭 이벤트
$("#leaveButton").click(function () {
 leaveAttendanceData();
});

//출근 데이터 전송 함수
function sendAttendanceData() {
 if (!canClick) {
     swal('아침 6시 이후에 다시 출근 체크를 할 수 있습니다.', '', 'success');
     return;
 }

 if (attendanceChecked) {
     swal('이미 출근 체크 하셨습니다.', '', 'success');
     return;
 }

 var currentTimestamp = Date.now();
 var formattedTime = formatTimeFromTimestamp(currentTimestamp);
 var formattedDate = formatDateFromTimestamp(currentTimestamp);

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
         swal('출근이 되었습니다', '', 'success');
         attendanceChecked = true;
         leaveChecked = false; // 퇴근 체크 초기화
         canClick = false;
         updateButtonState();
         // 변경된 데이터를 localStorage에 저장
         localStorage.setItem(userId + '_attendanceChecked', JSON.stringify(attendanceChecked));
         localStorage.setItem(userId + '_leaveChecked', JSON.stringify(leaveChecked));
         localStorage.setItem(userId + '_canClick', JSON.stringify(canClick));
      // 버튼이 클릭된 날짜 저장
         localStorage.setItem(userId + '_lastClickedDate', JSON.stringify(currentDate));
     },
     error: function (error) {
         console.error(error);
     }
 });
}

//퇴근 데이터 전송 함수
function leaveAttendanceData() {
 if (leaveChecked) {
     swal('아침 6시 이후에 다시 퇴근 체크를 할 수 있습니다.', '', 'success');
     return;
 }

 if (!attendanceChecked) {
     swal('출근 체크를 먼저 해주세요.', '', 'success');
     return;
 }

 var currentTimestamp = Date.now();
 var formattedTime = formatTimeFromTimestamp(currentTimestamp);
 var formattedDate = formatDateFromTimestamp(currentTimestamp);

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
         swal('퇴근이 되었습니다', '', 'success');
         leaveChecked = true;
         attendanceChecked = false;
         canClick = false;
         updateButtonState();
         // 변경된 데이터를 localStorage에 저장
         localStorage.setItem(userId + '_attendanceChecked', JSON.stringify(attendanceChecked));
         localStorage.setItem(userId + '_leaveChecked', JSON.stringify(leaveChecked));
         localStorage.setItem(userId + '_canClick', JSON.stringify(canClick));
         // 버튼이 클릭된 날짜 저장
         localStorage.setItem(userId + '_lastClickedDate', JSON.stringify(currentDate));
     },
     error: function (error) {
         console.error(error);
     }
 });
}


</script>
</html>