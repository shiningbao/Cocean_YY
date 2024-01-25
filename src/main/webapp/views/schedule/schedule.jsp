<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">



<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->
<!-- Moment JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<%-- <!--cs 파일관리  -->
<link href='<c:url value="/resource/css/schedule/main.css"/>' rel='stylesheet' /> --%>
<!--js 파일관리  -->
<script src='<c:url value="/resource/js/schedule/main.js"/>'></script>
<!-- 풀캘린더 라이브러리 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">


<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<title>Insert title here</title>





<style>

.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}


/* .sidebar {
	float: left;
	border-right: 1px solid rgb(192, 192, 192);
	height: 100vh;
} */

.myCallenderList{
	list-style-type: none;
}

.addInterestCallender:hover{
	cursor: pointer;
	color: #DEDEDE;
}

.Hide{
    border: none;
    background: none;
    padding: 0; /* 내부 여백 제거 */
    cursor: pointer;
    float:right;
}

.img2{
	widht:20px;
	height:20px;
}

.Hide-x{
    border: none;
    background: none;
    padding: 0; /* 내부 여백 제거 */
    cursor: pointer;
    float:right;
}


.checkPublic{
	float: right;
	font-size: 16px;
}


.modal-content{
	width:700px;
}
.section {
	font-size:20px;
}
.ing{
	font-size: 25px;
}
.facilityRoom2, .facilityRoom3, .facilityCar {
    background-color: LightGray;
    margin-bottom: 10px;
}

.facilityAdd{
	display: inline-block;
    padding: 0px 8px;
    background: #e2f5f6;
    border-radius: 13px;
    border: 1px solid #c2dde6;
    height: 21px;
    line-height: 20px!important;
}

.side-bar-right {
  z-index: 999;
}


.cal-font{
	font-size: 23px;
}
/* .cal-btn{
	margin-right: 500px;
} */

.modal-title{
/* 	font-size: 28px; */
	padding-left: 34px;
}
.fc-event {
    /* 이벤트의 높이와 너비를 조정할 수 있습니다. */
    height: 25px; /* 원하는 높이 */
    width: 100%; /* 원하는 너비 */

    /* 그림자나 테두리 등의 스타일링을 추가할 수 있습니다. */
     border: none;
    border-radius: 5px;
}
.fcCalColor {
	display: inline-block;
    padding: 0px 8px;
    background: #F3B0C3;
    border-radius: 50%;
    height: 15px;
    width:15px;
    line-height: 20px!important;
    vertical-align: middle; /* 수직 가운데 정렬 */
	
}
.myCalColor{
	display: inline-block;
    padding: 0px 8px;
    background: #ABDEE6;
    border-radius: 50%;
    height: 15px;
    width:15px;
    line-height: 20px!important;
    vertical-align: middle; /* 수직 가운데 정렬 */
}
.colorDIV {
    display: inline-block;
    padding: 0px 8px;
    border-radius: 50%; /* 요소를 원형으로 만듭니다 */
    height: 15px;
    line-height: 20px!important;
    width: 15px; /* 너비와 높이를 동일하게 설정하여 원형을 유지합니다 */
    text-align: center; /* 내용을 가운데 정렬합니다 */
    vertical-align: middle; /* 수직 가운데 정렬 */
}

.addLabel{
	width: 180px;
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.fc-popover.fc-more-popover {
    position: fixed; /* 모달이 스크롤에 영향을 받지 않도록 고정 위치로 설정 */
    top: 10%; /* 원하는 위치의 상단 여백 조정 */
    left: 10%; /* 원하는 위치의 왼쪽 여백 조정 */
}
.fc-scrollgrid-sync-table{
	width:100% !important;
}
.fc-daygrid-body-balanced{
	width:100% !important;
}

.fc-scroller {
  overflow: hidden !important;
}
.itCallenderList {
    display: flex;
    flex-direction: column; /* 요소들을 세로로 쌓도록 설정 */
}
.dateSelect{
	display: flex;
}

.timeSelect {
    /* form-control 클래스 스타일 */
    height:38px;
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.fc-list-empty-cushion::before {
    content: "이벤트가 없습니다"; /* 변경할 텍스트로 대체합니다 */
    display: block;
    position: relative;
    top: 50%;
    transform: translateY(-50%);
    text-align: center;
    color: red !important; /* 텍스트 색상을 변경합니다 */
    /* 추가적인 스타일링을 적용할 수 있습니다 */
}


.reserve-btn.btn.btn-primary {
    height: 25px;
    width: 50px;
    text-align: center;
    font-size: 13px;
}
.facility-list li {
    margin-bottom: 10px;
}
.reserve-btn {
    text-align: center;
    line-height: 2px !important; /* 버튼의 높이와 동일하게 설정 */
}

.detail{
	display: flex;
}
.modal-content{
	width: 700px !important;
}

.calDetail tr th{
	text-align: center;
}

.fc-customPrev-button,
.fc-button,
.fc-button-primary {
    /* 원하는 스타일을 적용하세요 */
    /* 예시로 배경색과 글자색을 변경합니다 */
    background-color: #2554C7 !important;
    color: white !important;
    border: 1px solid blue;
    margin: 0 2;
    /* 추가적인 스타일 속성을 필요에 따라 적용하세요 */
}

/*
.calDetail-body {
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 8px;
    background-color: #f9f9f9;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
*/
/* 각 섹션에 대한 스타일 */
.detail {
    margin-bottom: 15px;
}

.detail h5 {
    font-size: 16px;
    color: #333;
}

/* 내용에 대한 스타일 */
.detail div {
    font-size: 14px;
    color: #666;
}

/* 제목에 대한 스타일 */
.calDetail-title {
    font-weight: bold;
    color: #444;
}

/* 버튼 영역 스타일 */
.calDetail-buttons {
    text-align: right;
}

.calDetail-buttons button {
    padding: 8px 16px;
    margin-right: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.calDetail-buttons button:hover {
    background-color: #0056b3;
}
/* #calendar .fc-daygrid-body {
  width: 100%;
} */
</style>
</head>

<body>
<c:import url="/side"/>
	<div class="container-fluid contentField">
		
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">캘린더</h1>
		</div>

			
	
	<div class="modal fade" id="chartModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">조직도</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<c:import url="/personnel/organization/1"/>
				</div>
			</div>
		</div>
	</div>
	<!-- 일정 상세 모달창 -->
	<div class="modal fade" id="calDetailModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h4 class="modal-title">제목</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<table class="table calDetail">
						<colgroup>
							<col width="30%" align="center">
							<col width="70%">
						</colgroup>
						<tr>
							<th>작성자</th>
							<td><div class="calDetail-write"></div></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><div class="calDetail-title"></div></td>
						</tr>
						<tr>
							<th>일시</th>
							<td>
								<div class="d-flex">
									<div class="calDetail-start"></div>
									 &nbsp;~&nbsp;
									<div class="calDetail-end"></div>
								</div>
							</td>
						
						</tr>
						<tr>
							<th>내용</th>
							<td><div class="calDetail-content"></div></td>
						</tr>
						<tr>
							<th>비고</th>
							<td><div class="calDetail-remark"></div></td>
						</tr>
					</table>
					<!-- 
					<div class="detail-write detail">
						<h5>작성자 :</h5>
						<div class="calDetail-write"></div>
					</div>
					<div class="detail-title detail">
						<h5>제목 :</h5>
						<div class="calDetail-title"></div>
					</div>
					<div class="detail-date detail">
						<h5>일시 :</h5>
						<div class="calDetail-start"></div>~
						<div class="calDetail-end"></div>
					</div>
					<div class="detail-content detail">
						<h5>내용 :</h5>
						<div class="calDetail-content"></div>
					</div>
					<div class="detail-remark detail">	
						<h5>비고 :</h5>
						<div class="calDetail-remark"></div>
					</div>	
					
					<div class="calDetail-buttons"></div>
				 -->
				</div>
				<div class="modal-footer">
							
				</div>
			</div>
		</div>
	</div>

	<!-- 시설예약 모달창 -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">시설예약</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="facility.do" id="facilityForm" method="POST">
						<!-- 입력폼 -->
						
							<div class="section">일시
								<div class="checkPublic" >
									종일 <input type="checkbox" class="allday">
								</div>
							</div>
							<div class="dateSelect">
								
							    <input type="date" name="start" id="startFac" value="2023-12-24" class="form-control mb-2" required>
							    <select class="timeSelect" name="startTime">
									  <!-- 00:00부터 24:00까지 시간을 30분 간격으로 표시합니다. -->
									  <option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="16:30">16:30</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option>
									</select>
							    
							    <p>~</p>
							    <input type="date" name="end" id="endFac" value="2023-12-24" class="form-control mb-2">
							    <select class="timeSelect" name="endTime">
									<option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="16:30">16:30</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option>
								</select>
							    
							</div>
						<div class="form-group">
							예약리스트
							<div class="facilityAdd" name="title"></div>
							<div class="facilityRoom2">본사 2층</div>
							<div class="facilityRoom2-target"></div>
							<div class="facilityRoom3">본사 3층</div>
							<div class="facilityRoom3-target"></div>
							<div class="facilityCar">차량</div>
							<div class="facilityCar-target"></div>
						</div>	
							
						<div class="form-group">
							<label>목적</label>
							<textarea type="text"  name ="description"class="form-control mb-2" requiredoninvalid="this.setCustomValidity('목적을 입력해주세요.')"oninput="this.setCustomValidity('')" maxlength="500"placeholder="목적을 입력해주세요." style="height: 180px;" required></textarea>
						</div>
						<div class="modal-footer">
							
							<button type="button" class="btn btn-secondary"data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="facilitySubmit">저장</button>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 일정등록 모달창 -->
	<div class="modal fade" id="regModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">일정등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="scheduleWrite.do" method="POST" id="calForm">
						<!-- 입력폼 -->
						<div class="checkPublic">
						공개여부 <input type="checkbox" name="publicCategory">
						</div>
							<div class="section">
								제목 <input type="text" name="title" placeholder="제목을 입력해주세요."  class="form-control mb-2" required>
								
							</div>
							<div class="section">
								일시
								<div class="checkPublic" >
									종일 <input type="checkbox" class="allday">
								</div>
							</div>
							
							<div class="dateSelect">
							
							    <input type="date" name="start" id="startCal" value="2023-12-24" class="form-control mb-2" required>
							    <select class="timeSelect" name="startTime">
									  <!-- 00:00부터 24:00까지 시간을 30분 간격으로 표시합니다. -->
									  <option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="16:30">16:30</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option>
									</select>
							    
							    <p class="ing">~</p>
							    <input type="date" name="end" id="endCal" value="2023-12-24" class="form-control mb-2" required>
							    <select class="timeSelect" name="endTime">
									<option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="16:30">16:30</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option>
								</select>
							    
							</div>

							<div class="section">내용
								<textarea name="description" class="form-control mb-2" placeholder="내용을 입력해주세요." required></textarea>
							</div> 
							
							<div class="section" >비고
								<input type="text" name="remarks" class="form-control mb-2" required>
							</div>
							
							
						<div class="modal-footer">
							
							<button type="button" class="btn btn-secondary"data-dismiss="modal" class="cancleBtn">취소</button>
							<button type="button" id="calSubmit" class="btn btn-primary">저장</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<div class="row">
			<div class="col-10">
				<div class="card shadow">
					<div class="card-body">
						<div id="calendar">
						
						</div>
					</div>
				</div>
			</div>
<div class="col-2">
<div class="card shadow">
		<div class="card-body">

				<div class="side-bar-right">
					<div class="cal-css-myCallender">

						<p class="cal-font">캘린더</p>
						<label> <input type="checkbox" value="내 일정(기본)"
							id="myCallender" class="myCallender" checked /> 내 일정(기본)
							<div class="myCalColor"></div>
						</label>

						<div class="cal-css">
							<p class="cal-font">예약 캘린더</p>
							<label> <input type="checkbox" value="예약 일정(전체)"
								id="rsvCallender" class="rsvCallender" checked /> 예약 일정(전체)
								<div class="fcCalColor"></div>
							</label>
						</div>

						<div class="cal-Inter">


							<p class="cal-font">
								관심 캘린더
								<button class="interestCalendar Hide">
									<img src="<c:url value='/resource/img/carrot-side2.png'/>"
									class="img2" alt="버튼 이미지">
								</button>
							</p>

							<div class="itCallenderList"></div>

							<div class="addCal">
								<a href="#" class="addInterestCallender" data-toggle="modal"
								class="img2"	data-target="#chartModal">관심 캘린더 추가</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<c:import url="/footer"/>
</body>

				

<script>
	
	var loginEmployeeID = ${userInfo.employeeID};
	var img= $('.myCallenderbtn img');
	var isDown = false;
	var carrotSideImgUrl = '<c:url value="/resource/img/carrot-side2.png"/>';
    var carrotDownImgUrl = '<c:url value="/resource/img/carrot-down.png"/>';
	console.log(loginEmployeeID);
	var employeeID;
	

$('.addMyCallender').click(function(){
	console.log('click');
});

//캘린더 js
document.addEventListener('DOMContentLoaded', function() {
	getAddCalenderCall();
   var calendarEl = document.getElementById('calendar');

   var calendar = new FullCalendar.Calendar(calendarEl, {
	   height:800,
	   width:1000,
	   
	   locale:"ko",
	   /* timeZone:"Asia/seoul", */
	   eventTimeFormat: { // 이 부분을 추가해 보세요.
		    hour: 'numeric',
		    minute: '2-digit',
		    hour12: false
		  },
		  customButtons: {
			    customPrevY: { // 이전 연도로 이동
			    icon: 'fc-icon-chevrons-left',
			    click: function() {
			    	calendar.prevYear();
			         }
			},
			    customPrev: { // 이전 달로 이동
			    icon: 'fc-icon-chevron-left',
			    click: function() {
			    	calendar.prev();
			}
			},
			customToday: { // 오늘 날짜로 이동
			text: 'Today',
			click: function() {
				calendar.today();
			}
			},
			customNext: { // 다음 월로 이동
			        icon: 'fc-icon-chevron-right',
			        click: function() {
			        	calendar.next();
			        }
			},
			myCustomButon:{
				text:"시설 예약",
				click:function(){
					$("#modal").modal("show");
				}, 
				removeClass:"",
				addClass: "btn btn-primary" 
			},
			myCustomButon2:{
				text:"일정 등록",
				click:function(){
					$("#regModal").modal("show");
				}, addClass: "btn btn-primary" 
			},
			
			customNextY: { // 다음 연도로 이동
			        icon: 'fc-icon-chevrons-right',
			        click: function() {
			        	calendar.nextYear();
			        }
			}
			},
     headerToolbar: {
       left: 'customPrev,customToday,customNext,dayGridMonth,listWeek',
       center: 'title',
       right: 'myCustomButon,myCustomButon2',

     },
     navLinks: true, // 날짜 선택하면 day 캘린더나 week 캘린더로 이동
     businessHours: true, //
     editable: false, // 수정 가능
     selectable: false, // 드래그 일정변경
     scrollTime: null, // 스크롤 비활성화
     nowIndicator: true,
     dayMaxEventRows: true,
     views: {
    	    timeGrid: {
    	      dayMaxEventRows: 3
    	    }
    	  },
     eventClick: function(info) {
    	 $('#calDetailModal .modal-footer').empty(); // 기존 내용을 지우고
    	// 일정 클릭 시 발생할 이벤트
    	//클릭한 일정 Id
    	var id = info.event.id;
    	 
    	console.log(id);
    	console.log(info);
    	// 상세보기
        info.jsEvent.preventDefault();
        var eventObj = info.event;
        var title = eventObj.title;
        var description = eventObj.extendedProps.description;
        var remarks = eventObj.extendedProps.remarks;
        console.log(remarks);
        var employeeID = eventObj.extendedProps.employeeID;
        console.log(name);
       	console.log(info.event._instance.range.start);
       	console.log(info.event._instance.range.start);
       	var startDate = new Date(info.event._instance.range.start);
       	var endDate = new Date(info.event._instance.range.end);


		const koreanStartDate = moment(startDate).subtract(9, 'hours').format('YYYY-MM-DD HH:mm');
		const koreanEndDate = moment(endDate).subtract(9, 'hours').format('YYYY-MM-DD HH:mm');
		console.log(koreanStartDate);
		console.log(koreanEndDate); // 2023-12-01 12:00 AM 형식의 종료 날짜
		
		const koreanStartDateDate = moment(startDate).subtract(9, 'hours').format('YYYY-MM-DD');
		const koreanStartTime = moment(startDate).subtract(9, 'hours').format('HH:mm');
	
		
		
		const koreanEndDateDate = moment(endDate).subtract(9, 'hours').format('YYYY-MM-DD');
		const koreanEndTime = moment(endDate).subtract(9, 'hours').format('HH:mm');
		
		if (koreanStartDate.valueOf() == koreanEndDate.valueOf()) {
		    // 시작 시간과 종료 시간이 동일한 경우, 종료 시간을 시작 시간과 동일하게 설정합니다.
		    koreanEndDate.hour(koreanStartDate.hour()); // 시간을 동일하게 맞춤
		    koreanEndDate.minute(koreanStartDate.minute()); // 분을 동일하게 맞춤
		}
		console.log(koreanStartDateDate);
		console.log(koreanStartTime);
		console.log(koreanEndDateDate);
		console.log(koreanEndTime);
        $.ajax({
        	url:'getDetailWriteName.do',
        	data:{id:id},
        	success:function(name){
        		console.log(name);
        		$('#calDetailModal .calDetail-write').text(name);
        	},
        	error:function(e){
        		console.log(e);
        	}
        });
        
        console.log('@@@@@@@@@@@@'+title);
        console.log('@@@@@@@@@@@@'+remarks);
        console.log('@@@@@@@@@@@@'+description);
        $('#calDetailModal .modal-title').text(title);
        $('#calDetailModal .calDetail-title').text(title);
        $('#calDetailModal .calDetail-remark').text(remarks);
        $('#calDetailModal .calDetail-start').text(koreanStartDate);
        $('#calDetailModal .calDetail-end').text(koreanEndDate);
        $('#calDetailModal .calDetail-content').text(description);
        console.log(loginEmployeeID +'같은가'+employeeID);
        if (loginEmployeeID == employeeID) {
        	console.log("같다!!");
            // 수정 버튼 생성
            var editButton = '<button id="editButton" class="btn btn-primary">수정</button>';
            // 삭제 버튼 생성
            var deleteButton = '<button id="deleteButton" class="btn btn-primary">삭제</button>';
            
            // 버튼 추가
            
             
            $('#calDetailModal .modal-footer').append(editButton + deleteButton); // 새 버튼 추가
            
            // Edit 버튼 클릭 시 이벤트 처리
            $('#editButton').click(function () {
            	$('#editButton').hide();
            	$('#deleteButton').hide();
            	$('#calDetailModal .modal-title').text('일정 수정');
                $('#calDetailModal .modal-footer').html('<button type="button" class="btn btn-secondary" id="cancelButton">취소</button><button type="button" class="btn btn-primary" id="saveButton">저장</button>');

                // Title 수정
                var titleInput = $('<input type="text" class="form-control mb-2" id="titleInput">').val(title);
                $('#calDetailModal .calDetail-title').empty().append(titleInput);

                // Remarks 수정
                var remarksInput = $('<input type="text" class="form-control mb-2" id="remarksInput">').val(remarks);
                $('#calDetailModal .calDetail-remark').empty().append(remarksInput);
             // 기존 코드에서 koreanStartDate 생성 후 추가로 변환하는 부분입니다.
                // koreanStartDate, koreanEndDate를 YYYY-MM-DD 형식으로 변환
                // Start Date 수정
                var startDateInput = $('<input type="date" class="form-control mb-2" id="startDateInput">').val(koreanStartDateDate);
				var startTimeSelect = $('<select class="timeSelect" name="startTime"></select>');
				 appendTimeOptions(startTimeSelect, koreanStartTime); 
				startTimeSelect.append('<option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option><option value="16:30">16:30</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option>');
				 $('.timeSelect').val('09:00').prop("selected",true);
				 $('#calDetailModal .calDetail-start').empty().append(startDateInput).append(startTimeSelect);
                // End Date 수정
                var endDateInput = $('<input type="date" class="form-control mb-2" id="endDateInput">').val(koreanEndDateDate);
				var endTimeSelect = $('<select class="timeSelect" name="endTime"></select>');
				appendTimeOptions(endTimeSelect, koreanEndTime); 
				endTimeSelect.append('<option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option><option value="16:30">16:30</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option>');
				$('#calDetailModal .calDetail-end').empty().append(endDateInput).append(endTimeSelect);

                // Content 수정
                var contentInput = $('<textarea class="form-control mb-2" id="contentInput" rows="3"></textarea>').val(description);
                $('#calDetailModal .calDetail-content').empty().append(contentInput);

                // 저장 버튼 클릭 시 이벤트
                $('#saveButton').click(function() {
                    var updatedTitle = $('#titleInput').val();
                    var updatedRemarks = $('#remarksInput').val();
                    var updatedStartDate = $('#startDateInput').val();
                    var updatedEndDate = $('#endDateInput').val();
                    var updatedStartTime = $('select[name="startTime"]').val();
                    var updatedendTime = $('select[name="endTime"]').val();
                    var updatedContent = $('#contentInput').val();
					console.log(updatedStartDate);
					console.log(updatedStartTime);
					console.log(updatedEndDate);
					console.log(updatedendTime);
					
					swal({
						title: "수정하시겠습니까?",
						text: "",
						icon: "warning",
						buttons: ["취소","수정"],
					})
					.then((isOkey) => {
						if (isOkey) {
							swal('수정이 완료되었습니다.','','success')
							.then((isOkey) => {
								if(isOkey){
			                    	var dataToSend = {
			                    			id : id,
			                    	        title: updatedTitle,
			                    	        remarks: updatedRemarks,
			                    	        startDate: updatedStartDate,
			                    	        endDate: updatedEndDate,
			                    	        startTime: updatedStartTime,
			                    	        endTime: updatedendTime,
			                    	        content: updatedContent
			                    	    };
			                    	$.ajax({
			                    		url:'updateCal.do',
			                    		type:'post',
			                    		data:dataToSend,
			                    		success:function(data){
			                    			console.log(data);
			                    			location.href=location.href;
			                    		},
			                    		error:function(e){
			                    			console.log(e);
			                    		}
			                    	});
									
								}
							})
						}
					});
	

                    // 업데이트 완료 후 모달 닫기
                    
                });
                $('#cancelButton').click(function() {
			        // 모달 닫기
			        $('#calDetailModal').modal('hide');
			    });
            });
            
            function appendTimeOptions(selectElement, selectedTime) {
                var times = ["00:00", "00:30", "01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30", "05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30"];

                for (var i = 0; i < times.length; i++) {
                    var option = $('<option>').val(times[i]).text(times[i]);
                    if (times[i] === selectedTime) {
                        option.prop('selected', true);
                    }
                    selectElement.append(option);
                }
            }
            // Delete 버튼 클릭 시 이벤트 처리
            $('#deleteButton').click(function () {
            	
            	swal({
            		title: "일정을 삭제하시겠습니까?",
            		text: "",
            		icon: "warning",
            		buttons: ["취소","삭제"],
            	})
            	.then((isOkey) => {
            		if (isOkey) {
            			swal('삭제가 완료되었습니다.','','success')
            			.then((isOkey) => {
            				if(isOkey){
                        		$.ajax({
                                	url:'delMyCal.do',
                                	data:{id:id},
                                	type:'post',
                                	success:function(data){
                                		location.href = location.href;
                                	},
                                	error:function(e){
                                		console.log(e);
                                	}
                                });
            				}
            			})
            		}
            	});
                
            });
        }
        $('#calDetailModal').modal('show');
    	},
    	
    	
     events: [ ],
   });

   calendar.render();
   fetchEvents();
   $('#myCallender').on('change',function(){
	   if($(this).prop('checked')){
		   calendar.addEventSource(eventList);
	   }else{
		   removePersonalEvents()
	   }
   });
   
   $('#rsvCallender').on('change',function(){
	   if($(this).prop('checked')){
		   calendar.addEventSource(facilityList);
	   }else{
		   removeFacilityEvents()
	   }
   });
   
var eventList;
var facilityList;
   function fetchEvents() {
/* 	   var isChecked = $('.myCallender').prop('checked');
	   var isCheckedrsv = $('.rsvCallender').prop('checked'); */
	    $.ajax({
	      url: 'getCallenderEvents.do',
	      data:{},
	      dataType: 'json',
	      success: function(data) {
	    	  eventList = data.eventList;
	    	  facilityList = data.facilityList;
	    	console.log(data.eventList);
	    	console.log(data.facilityList);
	        calendar.addEventSource(eventList);
	        calendar.addEventSource(facilityList);
	      },
	      error: function(xhr, status, error) {
	        console.error('에러 발생:', status, error);
	      }
	    });
	  }
   
   
   function removePersonalEvents() {
	    var events = calendar.getEvents(); // 캘린더의 모든 이벤트 가져오기
	    events.forEach(function(event) {
	        if (event.extendedProps.subCategory == '개인'&& event.extendedProps.employeeID == loginEmployeeID ) {
	            event.remove(); // subCategory가 '개인'인 이벤트 제거
	        }
	    });
	}
   function removeFacilityEvents() {
	    var events = calendar.getEvents(); // 캘린더의 모든 이벤트 가져오기
	    events.forEach(function(event) {
	        if (event.extendedProps.subCategory == '예약') {
	            event.remove(); // subCategory가 '개인'인 이벤트 제거
	        }
	    });
	}
	

	$('.interestCalendar').on('click', function() {
	    console.log('click');
	    var img = $(this).find('img'); // 버튼 내의 이미지 요소를 찾습니다.
	    isDown = !isDown; // true 이면 false로 false면 true로
	    if (isDown) {
	        img.attr('src', carrotDownImgUrl); // 이미지 경로를 직접 지정합니다.
	        console.log('true');
	        $('.itCallenderList').empty();	
	    } else {
	        img.attr('src', carrotSideImgUrl); 
	        // 이미지 경로를 직접 지정합니다.
	        getAddCalenderCall();
	        console.log('false');
	       
	    }
	});
	var color = ['#CBAACB','#97C1A9','#BFCACA','#CCE2CB','#ECEAE4','#FFDBCC','#FF1493','#FFFACD','#2F4F4F','#FFF0F5','#FFFFE0','#DB7093','#4B0082','#E6E6FA','#7B68EE'];
	function getAddCalenderCall(){
		 $.ajax({
	        	url:'getAddCalender.do',
	        	data:{loginEmployeeID:loginEmployeeID},
	        	type:'POST',
	        	success:function(data){
	        		console.log(data);
					
	        		var container = $('.itCallenderList'); // 라벨을 담을 컨테이너 선택
	        		data.forEach(function (item, index) {
	        		    var label = $('<label>'); // 라벨 생성
	        		    var div = $('<div class="colorDIV"></div>').css('background-color', color[index]);
	        		    var input = $('<input>').attr({
	        		        type: 'hidden',
	        		        value: color[index]
	        		    });
	        		    var checkbox = $('<input>').attr({
	        		        type: 'checkbox',
	        		        value: item.addemployeeID,
	        		        class: 'calendar-checkbox-' + index,
	        		    });

	        		    var calendarName = item.calendarName;
	        		    if (calendarName.length > 10) {
	        		        calendarName = calendarName.substring(0, 10) + '...'; // 10글자 이후는 ...으로 처리
	        		    }

	        		    label.append(checkbox).append(calendarName); // 라벨에 체크박스와 데이터 추가
	        		    label.append(div).append(input);

	        		    var button = $('<button class="interestDelCalendar Hide" data-calendar-id="' + item.calendarID + '">')
	        		        .append('<img src="/Cocean/resource/img/carrot-x.png" class ="img2"alt="버튼 이미지">');
	        		    
	        		    label.append(button); // 라벨에 삭제 버튼 추가

	        		    var labelWrapper = $('<div class="labelWrapper"></div>'); // 라벨을 감싸는 div 생성
	        		    labelWrapper.append(label); // 라벨을 감싸는 div에 라벨 추가

	        		    container.append(labelWrapper); // 컨테이너에 라벨을 감싸는 div 추가
	        		});

	        	
	        	},
	        	error:function(e){
	        		console.log(e);
	        	}
	        	
	        }); 
	}
	$(document).on('click','.interestDelCalendar',function(){
	    console.log('click');
	    var calendarID = $(this).data('calendar-id');
	    console.log('Calendar ID:', calendarID);
	    var targetLabel = $(this).closest('label'); // 클릭한 버튼에 가장 가까운 라벨을 찾음
		swal({
			title: "삭제하시겠습니까??",
			text: "",
			icon: "info",
			buttons: ["취소","확인"],
		})
		.then((isOkey) => {
			if (isOkey) {
				swal('삭제가 완료되었습니다.','','success')
				.then((isOkey) => {
					if(isOkey){
					    $.ajax({
					        url:'interestDelCalendar.do',
					        type:'post',
					        data:{calendarID:calendarID},
					        success:function(data){
					            console.log(data);
					            targetLabel.remove(); // 라벨 제거
					            location.href=location.href;
					        },
					        error:function(e){
					            console.log(e);
					        }
					    });
					}
				})
			}
		});

	    

	});

	

	var eventAddList;	
	var val;
	$('.itCallenderList').on('change','input[type="checkbox"]',function(){
		var backgroundColor = $(this).parent().find('input[type="hidden"]').val();
	    console.log('Background Color:', backgroundColor);
		console.log($(this).val());
		console.log($(this).prop('checked'));
		 val = $(this).val();
		var CalChecked = $(this).prop('checked');
		if(CalChecked){
			$.ajax({
				url:'getAddCalList.do',
				data: {val:val,
					CalChecked:CalChecked,
					backgroundColor:backgroundColor},
				type:'POST',
				success:function(data){
					console.log(data);
					console.log(data.eventAddList);
					eventAddList = data.eventAddList;
					calendar.addEventSource(eventAddList);
				},
				error:function(e){
					console.log(e);
				}
			});
		}else{
			 removeAddCalEvents()
		};
		
		console.log(val);
	});
	
	
	 function removeAddCalEvents() {
		    var events = calendar.getEvents(); // 캘린더의 모든 이벤트 가져오기
		    events.forEach(function(event) {
		        if (event.extendedProps.subCategory == '개인' && event.extendedProps.employeeID == val) {
		            event.remove(); // subCategory가 '개인'인 이벤트 제거
		        }
		    });
		}
   
 }); 

	$('#calSubmit').click(function(){
		 var titleValue = $('#calForm input[name="title"]').val();
		    var startValue = $('#calForm input[name="start"]').val();
		    var endValue = $('#calForm input[name="end"]').val();
		    var descriptionValue = $('#calForm textarea[name="description"]').val();
		    var remarksValue = $('#calForm input[name="remarks"]').val();

		    // 값이 비어있는지 확인하여 유효성을 검사합니다.
		    if (titleValue === '' || startValue === '' || endValue === '' || descriptionValue === '' || remarksValue === '') {
		        swal('필수 입력 항목을 모두 작성해주세요.','','warning');
		    } else {
		    	
		    	swal({
		    		title: "일정을 등록하시겠습니까?",
		    		text: "",
		    		icon: "info",
		    		buttons: ["취소","확인"],
		    	})
		    	.then((isOkey) => {
		    		if (isOkey) {
		    			swal('등록이 완료되었습니다.','','success')
		    			.then((isOkey) => {
		    				if(isOkey){
		    		            $('#calForm').append('<input type="hidden" name="requestType" value="scheduleWrite">');
		    		            $('#calForm').submit();
		    				}
		    			})
		    		}
		    	});

		    }
	})
var room2Flag = false;
var room3Flag = false;
var carFlag = false;

$('.facilityRoom2').click(function() {
    var $target = $(this).next('.facilityRoom2-target');
    var room2Text = $(this).text(); // 클릭한 요소의 텍스트 가져오기
    console.log('click');
    room2Flag = !room2Flag; // 해당 요소의 상태 토글
    getFacility(room2Text, $target, room2Flag); // 이미 존재하는 div에 데이터를 채워넣음
});

$('.facilityRoom3').click(function() {
    var $target = $(this).next('.facilityRoom3-target');
    var room3Text = $(this).text(); // 클릭한 요소의 텍스트 가져오기
    console.log('click');
    room3Flag = !room3Flag; // 해당 요소의 상태 토글
    getFacility(room3Text, $target, room3Flag); // 이미 존재하는 div에 데이터를 채워넣음
});

$('.facilityCar').click(function() {
    var $target = $(this).next('.facilityCar-target');
    var carText = $(this).text(); // 클릭한 요소의 텍스트 가져오기
    console.log('click');
    carFlag = !carFlag; // 해당 요소의 상태 토글
    getFacility(carText, $target, carFlag); // 이미 존재하는 div에 데이터를 채워넣음
});

function getFacility(text, $target, flag) {
    $.ajax({
        url: 'getFacility.do',
        data: { text: text},
        success: function(data) {
            console.log(data);
            var list = ''; // 빈 문자열로 초기화

            if (data.length !== 0) {
                list = '<ul class="facility-list">';
                for (var i = 0; i < data.length; i++) {
                    list += '<li>' + data[i] + '<button class="reserve-btn btn btn-primary" type="button">예약</button></li>';
                }
                list += '</ul>';
            } else {
                list = '<div>이용 가능한 시설이 없습니다.</div>';
            }
            

            // 받은 데이터를 해당 div 내에 추가
            $target.html(list);

            // 상태에 따라 리스트 보이기/숨기기
            if (flag) {
                $target.show(); // 상태가 true일 때 리스트 표시
            } else {
                $target.hide(); // 상태가 false일 때 리스트 숨김
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}
var clickedText = ''; // 클릭된 텍스트 저장할 변수
var isDivAdded = false;
$('.form-group').on('click', '.reserve-btn', function() {
    clickedText = $(this).parent().text().replace('예약', '').trim();
    var closeBtn = '<button type="button" class="close-btn Hide-x"><img src="/Cocean/resource/img/carrot-x.png" alt="버튼 이미지" style="width:20px"></button>';
    	 if (!isDivAdded) { // 추가된 div가 없는 경우
    	        $('.facilityAdd').empty(); // 기존 데이터 삭제
    	        $('.facilityAdd').append(clickedText);
    	        $('.facilityAdd').append(closeBtn);
    	        isDivAdded = true; // 추가 표시 갱신
    	        
    	        $('.facilityAdd').append('<input type="hidden" name="title" value="' + clickedText + '">');
    	    } else {
    	        // 기존 추가된 div가 있을 경우 교체
    	        $('.facilityAdd').empty();
    	        $('.facilityAdd').append(clickedText);
    	        $('.facilityAdd').append(closeBtn);
    	    }
   
});
$('.form-group').on('click', '.close-btn', function() {
    isDivAdded = false; // 닫기 버튼 클릭 시 추가된 div 표시 초기화
    $('.facilityAdd').empty(); // 데이터 삭제
});
$('#facilitySubmit').on('click',function(){
	
	  var startValue = $('#facilityForm input[name="start"]').val();
	    var endValue = $('#facilityForm input[name="end"]').val();
	    var descriptionValue = $('#facilityForm textarea[name="description"]').val();
	    var facilityAddText = $.trim($('.facilityAdd').text()); // facilityAdd 클래스의 텍스트를 가져옵니다.

	    if (startValue === '' || endValue === '' || descriptionValue === '' || facilityAddText === '') {
	        swal('모든 필수 입력란을 입력해주세요.','','warning');
	    } else {
	        // 필요한 처리
	        
	        	swal({
				title: "예약 일정을 등록하시겠습니까?",
				text: "",
				icon: "info",
				buttons: ["취소","확인"],
			})
			.then((isOkey) => {
				if (isOkey) {
					swal('등록이 완료되었습니다.','','success')
					.then((isOkey) => {
						if(isOkey){
					        
					        $('#facilitySubmit').append('<input type="hidden" name="requestType" value="facility">');	
					        $('#facilityForm').submit();
						}
					})
				}
			});

	    }
})


function getEmployeeID(employeeID, nodeText) {
    // employeeID가 6자리 숫자가 아니면 함수 실행 중단
    if (!isValidEmployeeID(employeeID)) {
        console.log("employeeID가 6자리 숫자가 아닙니다.");
        return;
    }

    // 나머지 코드는 여기에 위치합니다.
    employeeID = employeeID;
    console.log(employeeID);

    if (employeeID != loginEmployeeID) {
        swal({
            title: nodeText + "님을 관심캘린더로 등록하시겠습니까??",
            text: "",
            icon: "info",
            buttons: ["취소", "확인"],
        }).then((isOkey) => {
            if (isOkey) {
                swal('등록이 완료되었습니다.', '', 'success')
                    .then((isOkey) => {
                        if (isOkey) {
                            addCal(employeeID, nodeText);
                        }
                    });
            }
        });
    } else {
        swal('본인은 추가 할 수 없습니다.', '', 'warning');
    }
}

// 정규 표현식을 사용하여 6자리 숫자인지 확인하는 함수
function isValidEmployeeID(employeeID) {
    var regex = /^\d{6}$/;
    return regex.test(employeeID);
}

	function addCal(employeeID, nodeText) {
		console.log('@@@@@@@@@@@@@'+employeeID);
		console.log('@@@@@@@@@@@@@'+loginEmployeeID);

	    $.ajax({
	        url: 'addCalender.do',
	        type: 'POST',
	        data: {
	            loginEmployeeID: loginEmployeeID,
	            employeeID: employeeID,
	            nodeText: nodeText
	        },
	        success: function (data) {
	            console.log(data);
	             location.href="/Cocean/schedule/schedule.go"; 

	        },
	        error: function (e) {
	            console.log(e);
	        }
	    });
	}
	/* $('.side-bar-right').css('display', 'none'); */

$('.allday').change(function() {
        if ($(this).is(':checked')) {
            $('.timeSelect').hide(); // timeSelect 클래스를 제거합니다
            $('.timeSelect[name="endTime"]').val('23:30');
        } else {
            $('.timeSelect').show(); // timeSelect 클래스를 다시 추가합니다
        }
    });
/* $('#startCal,#endCal,#startFac,#endFac, .timeSelect').change(function() {
    var startDateVal = new Date($('#startCal').val());
    var endDateVal = new Date($('#endCal').val());
    var startDateFacVal = new Date($('#startFac').val());
    var endDateFacVal = new Date($('#endFac').val());
    
    var startTimeVal = $('.timeSelect[name="startTime"]').val();
    var endTimeVal = $('.timeSelect[name="endTime"]').val();
    
    var startDateTimeVal = new Date(startDateVal.getFullYear(), startDateVal.getMonth(), startDateVal.getDate(), parseInt(startTimeVal.split(':')[0]), parseInt(startTimeVal.split(':')[1]));
    var endDateTimeVal = new Date(endDateVal.getFullYear(), endDateVal.getMonth(), endDateVal.getDate(), parseInt(endTimeVal.split(':')[0]), parseInt(endTimeVal.split(':')[1]));
    
    var startDateFacTimeVal = new Date(startDateFacVal.getFullYear(), startDateFacVal.getMonth(), startDateFacVal.getDate(), parseInt(startTimeVal.split(':')[0]), parseInt(startTimeVal.split(':')[1]));
    var endDateFacTimeVal = new Date(endDateFacVal.getFullYear(), endDateFacVal.getMonth(), endDateFacVal.getDate(), parseInt(endTimeVal.split(':')[0]), parseInt(endTimeVal.split(':')[1]));
    
    if (endDateTimeVal <= startDateTimeVal) {
    	console.log('1');
        alert('끝나는 시간보다 시작시간이 더 빠릅니다.');
        $('.timeSelect[name="startTime"]').val('00:00');
        $('.timeSelect[name="endTime"]').val('00:00');
        $('#startCal').val(new Date().toISOString().substring(0, 10).toString());
        $('#endCal').val(new Date().toISOString().substring(0, 10).toString());
    } 
    
    if (endDateFacTimeVal <= startDateFacTimeVal) {
    	console.log('2');
        alert('끝나는 시간보다 시작시간이 더 빠릅니다.');
        $('.timeSelect[name="startTime"]').val('00:00');
        $('.timeSelect[name="endTime"]').val('00:00');
        $('#startFac').val(new Date().toISOString().substring(0, 10).toString());
        $('#endFac').val(new Date().toISOString().substring(0, 10).toString());
    }
}); */
 
$('#modal').on('hidden.bs.modal', function (e) {
    // 모달이 닫힐 때 실행될 코드
   $(this).find('form')[0].reset();
   $('#startFac').val(new Date().toISOString().substring(0, 10).toString());
   $('#endFac').val(new Date().toISOString().substring(0, 10).toString());
   startSelect.val(optimalValue);
   endSelect.val(optimalValue); 
    $('.checkPublic, .allday').prop('checked', false);
    $('.timeSelect').show();
    // 그 외 초기화할 필드들 추가
});

$('#regModal').on('hidden.bs.modal', function (e) {
    // 모달이 닫힐 때 실행될 코드
    $(this).find('form')[0].reset();
    $('#startCal').val(new Date().toISOString().substring(0, 10).toString());
    $('#endCal').val(new Date().toISOString().substring(0, 10).toString());
    startSelect.val(optimalValue);
    endSelect.val(optimalValue); 
    $('.checkPublic, .allday').prop('checked', false);
    $('.timeSelect').show();
    // 그 외 초기화할 필드들 추가
});
var now = new Date();
var currentHour = now.getHours();
var currentMinute = now.getMinutes();

// 최적의 시간 계산
var optimalHour = Math.floor(currentHour); // 현재 시간
var optimalMinute = currentMinute >= 30 ? '30' : '00'; // 현재 분을 30분 간격으로 맞춤

// 선택할 select 요소와 옵션을 찾아 설정
$('.timeSelect').each(function() {
    var optimalValue = ('0' + optimalHour).slice(-2) + ':' + optimalMinute;
    $(this).val(optimalValue);
});

$('#startCal').val(new Date().toISOString().substring(0, 10).toString());
$('#endCal').val(new Date().toISOString().substring(0, 10).toString());
$('#startFac').val(new Date().toISOString().substring(0, 10).toString());
$('#endFac').val(new Date().toISOString().substring(0, 10).toString());
$('#startDateInput').val(new Date().toISOString().substring(0, 10).toString());
$('#endDateInput').val(new Date().toISOString().substring(0, 10).toString());
$('.fc-customToday-button').text('오늘');
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

</script>
</html>
