<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--cs 파일관리  -->
<link href='<c:url value="/resource/css/schedule/main.css"/>' rel='stylesheet' />
<!--js 파일관리  -->
<script src='<c:url value="/resource/js/schedule/main.js"/>'></script>
<script src='<c:url value="/resource/js/schedule/startEndDate.js"/>'></script>
<script src='<c:url value="/resource/js/schedule/schedule.js"/>'></script>

<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">





<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 800px;
	margin: 0 auto;
	margin-top: 100px;
}

/* .sidebar {
	float: left;
	border-right: 1px solid rgb(192, 192, 192);
	height: 100vh;
} */

.calendarBtn {
	float: right;
}
.side-bar-right{
	float:right;
}
.myCallenderList{
	list-style-type: none;
}
.addCal{
	font-size: 12px;
}

.addCal:hover{
	cursor: pointer;
	color: #DEDEDE;
}

.Hide {
    border: none;
    background: none;
    padding: 0; /* 내부 여백 제거 */
    cursor: pointer;
}

section{
	margin-bottom: 50px;
}

.Hide{
	float:left;
}
img{
	weight:25px;
	height:25px;
}
.modal-content{
	width:700px;
}
.section{
	margin-bottom: 30px;
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
 .cal-css-myCallender{
	margin-top: 100px;
} 
.cal-font{
	font-size: 20px;
}
/* .cal-btn{
	margin-right: 500px;
} */
</style>
</head>

<body>
	<jsp:include page="../side.jsp"></jsp:include>
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
					<jsp:include page="../personnel/organization.jsp"></jsp:include>
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
						

							<div class="section">
							    <input type="date" name="start" id="start" value="2023-12-24">
							    <select class="timeSelect" name="startTime">
									  <!-- 00:00부터 24:00까지 시간을 30분 간격으로 표시합니다. -->
									  <option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="24:00">24:00</option>
									</select>
							    
							    ~
							    <input type="date" name="end" id="end" value="2023-12-24">
							    <select class="timeSelect" name="endTime">
									<option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="24:00">24:00</option>
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
							<textarea type="text"  name ="description"class="form-control" requiredoninvalid="this.setCustomValidity('목적을 입력해주세요.')"oninput="this.setCustomValidity('')" maxlength="500"placeholder="목적을 입력해주세요." style="height: 180px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="facilitySubmit">저장</button>
							<button type="button" class="btn btn-secondary"data-dismiss="modal">취소</button>
							
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
							<div class="section">
								제목 <input type="text" name="title" placeholder="제목을 입력해주세요.">
								공개여부 <input type="checkbox" name="publicCategory">
							</div>
						
							<div class="section">
							    <input type="date" name="start" id="start" value="2023-12-24">
							    <select class="timeSelect" name="startTime">
									  <!-- 00:00부터 24:00까지 시간을 30분 간격으로 표시합니다. -->
									  <option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="24:00">24:00</option>
									</select>
							    
							    ~
							    <input type="date" name="end" id="end" value="2023-12-24">
							    <select class="timeSelect" name="endTime">
									<option value="00:00">00:00</option><option value="00:30">00:30</option><option value="01:00">01:00</option><option value="01:30">01:30</option><option value="02:00">02:00</option> <option value="02:30">02:30</option><option value="03:00">03:00</option><option value="03:30">03:30</option><option value="04:00">04:00</option><option value="04:30">04:30</option><option value="05:00">05:00</option><option value="05:30">05:30</option><option value="06:00">06:00</option><option value="06:30">06:30</option> <option value="07:00">07:00</option><option value="07:30">07:30</option><option value="08:00">08:00</option><option value="08:30">08:30</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option><option value="18:30">18:30</option><option value="19:00">19:00</option><option value="19:30">19:30</option><option value="20:00">20:00</option><option value="20:30">20:30</option><option value="21:00">21:00</option><option value="21:30">21:30</option><option value="22:00">22:00</option><option value="22:30">22:30</option><option value="23:00">23:00</option><option value="23:30">23:30</option><option value="24:00">24:00</option>
								</select>
							    
							</div>


							
							<div class="section">비고
								<input type="text" name="remarks">
							</div>
							<div class="section">내용
								<textarea name="description"></textarea>
							</div>
							
						<div class="modal-footer">
							<button type="button" id="calSubmit" class="btn btn-primary">저장</button>
							<button type="button" class="btn btn-secondary"data-dismiss="modal" class="cancleBtn">취소</button>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

		
			
		

		
		
	<div class="calendarBtn cal-btn">
		<button type="button" class="btn btn-primary" id="modalBtn" data-toggle="modal" data-target="#modal">시설 예약</button>
		<button type="button" class="btn btn-primary" id="modalBtnReg" data-toggle="modal" data-target="#regModal">일정 등록</button>
	</div>
	<div class="side-bar-right">	
		<div class="cal-css-myCallender"><p class="cal-font">캘린더</p>
				<label>
					<input type="checkbox" value="예약 일정(기본)" class="myCallender" checked/>
					내 일정(기본)
				</label>
			</div>
			<div class="cal-css"><p class="cal-font">예약 캘린더</p>
				<label>
					<input type="checkbox" value="예약 일정(기본)" class="rsvCallender" checked/>
					예약 일정(기본)
				</label>
			</div>
			<div>
				<button class="interestCalendar Hide">
					<img src="<c:url value='/resource/img/carrot-side.PNG'/>">
				</button>
			
			<p class="cal-font">관심 캘린더</p>
				<div class="addCal">
					<a href="#" class="addInterestCallender" data-toggle="modal" data-target="#chartModal">관심 캘린더 추가</a>
				</div>
			</div>
	</div>
	<div id="calendar"></div>

</body>

<script>

	
	var loginEmployeeID = ${userInfo.employeeID};
	var img= $('.myCallenderbtn img');
	var isDown = false;
	console.log(loginEmployeeID);
	
	

	/* $('.interestCalendar').off().click(function(){
	    console.log('click');
	    $('.myCallenderList').css('display', 'block');
	    $('.myCallenderList').empty();
	    isDown = !isDown; // true 이면 false로 false면 true로
	    if (isDown) {
	    	img.attr('src', '<c:url value="/resource/img/carrot-down.PNG"/>');
	        console.log('true');
	        callendarCall();
	        $('#myCallender').empty();
	        
	    } else {
	        
	        img.attr('src', '<c:url value="/resource/img/carrot-side.PNG"/>');
	        console.log('false');
	        $('.myCallenderList').empty();
	       
	    }
	    
	    
	   
	}); */
$('.addMyCallender').click(function(){
	console.log('click');
});

//캘린더 js
document.addEventListener('DOMContentLoaded', function() {
   var calendarEl = document.getElementById('calendar');

   var calendar = new FullCalendar.Calendar(calendarEl, {
     
     headerToolbar: {
       left: 'prev,next today',
       center: 'title',
       right: 'dayGridMonth,timeGridDay'
     },
     navLinks: true, // 날짜 선택하면 day 캘린더나 week 캘린더로 이동
     businessHours: true, //
     editable: false, // 수정 가능
     selectable: true, // 드래그 일정변경
     default: false,
     nowIndicator: true,
     dayMaxEventRows: true,
     views: {
    	    timeGrid: {
    	      dayMaxEventRows: 15
    	    }
    	  },
     eventClick: function(info) {

    	// 일정 클릭 시 발생할 이벤트
    	//클릭한 일정 Id
    	var id = info.event._def.defId;
    	console.log(id);
    	console.log('click');
    	},
     events: [ ]
   });

   calendar.render();
   fetchEvents();
   $('.myCallender').on('change',function(){
	   if($(this).prop('checked')){
		   fetchEvents(); 
	   }else{
		   calendar.removeAllEvents();
	   }
   });
   function fetchEvents() {
	   var isChecked = $('.myCallender').prop('checked');
	    $.ajax({
	      url: 'getCallenderEvents.do',
	      data:{isChecked:isChecked},
	      dataType: 'json',
	      success: function(data) {
	    	console.log(data);
	        calendar.addEventSource(data);
	      },
	      error: function(xhr, status, error) {
	        console.error('에러 발생:', status, error);
	      }
	    });
	  }

	
   
 }); 

	$('#calSubmit').click(function(){
		if(confirm('일정을 등록하시겠습니까?')){
		calForm.submit();
		/* location.href='schedule.go'; */ 
		}else{
			
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
                    list += '<li>' + data[i] + '<button class="reserve-btn" type="button">예약</button></li>';
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
    var closeBtn = '<button type="button" class="close-btn"> 닫기</button>'
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
	
	$('#facilityForm').submit();
})
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

</script>
</html>
