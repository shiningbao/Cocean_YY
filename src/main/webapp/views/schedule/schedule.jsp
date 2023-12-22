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

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	max-width: 1100px;
	margin: 0 auto;
	margin-top: 100px;
}

.sidebar {
	float: left;
	border-right: 1px solid rgb(192, 192, 192);
	height: 100vh;
}

.calendarBtn {
	float: right;
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
</style>
</head>

<body>
	<jsp:include page="../side.jsp"></jsp:include>


	<!-- 시설예약 모달창 -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">관리일지</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="">
						<!-- 입력폼 -->
						<div class="form-group">
							<label>예약</label> 예약리스트
						</div>

						<div class="form-row">
							 <div>
							    <label for='start'>시작일</label>
							    <input type="date" id='start'>
							    <input type="time">
							  </div>
							  <div>
							    <label for='end'>종료일</label>
							    <input type="date" id='end'>
							    <input type="time">
							  </div>
						</div>
						<div class="form-group">
							<label>목적</label>
							<textarea type="text" class="form-control" requiredoninvalid="this.setCustomValidity('목적을 입력해주세요.')"oninput="this.setCustomValidity('')" maxlength="500"placeholder="목적을 입력해주세요." style="height: 180px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">저장</button>
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
							<p>제목 <input type="text" name="title" placeholder="제목을 입력해주세요."></p>
							<p>시작일
								<input type="datetime-local" name="start" value="${dto.start}" >
							</p>
							<p>종료일
								<input type="datetime-local" name="end" value="${dto.end}" >
							</p>
							<p>중분류    
								<select id="midSelect" name="mainCategory">
									<option value="개인">개인</option>
									<option value="팀">팀</option>
								</select>
							</p>
							<p>소분류
							    <select id="subSelect" name="subCategory">
							        <!-- 선택된 중분류에 따라 옵션이 동적으로 추가될 것입니다 -->
							    </select>
							</p>
							<p class="writeViewCallender">개인캘린더
							    <select id="myCallender" name="category">
							    	<option value="내 일정(기본)">내 일정(기본)</option>
							    </select>
							</p>
							<p>비고
								<input type="text" name="remarks">
							</p>
							<p>내용
								<textarea name="description"></textarea>
							</p>
							
						<div class="modal-footer">
							<button type="button" id="calSubmit" class="btn btn-primary">저장</button>
							<button type="button" class="btn btn-secondary"data-dismiss="modal" class="cancleBtn">취소</button>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="sidebar">
		<section class="gnb_title">
			<h1>캘린더</h1>
		</section>
		
		<section>
			<h5>내 캘린더</h5>
			<label>
				<input type="checkbox" value="예약 일정(기본)" class="myCallender" checked/>
				내 일정(기본)
			</label>

		</section>
		<section class="rsvCallendar">
			<h5>예약 캘린더</h5>
			<label>
				<input type="checkbox" value="예약 일정(기본)" class="rsvCallender" checked/>
				예약 일정(기본)
			</label>
		</section>
		<section class="interestCalendar">
			<div>
				<button class="interestCalendar Hide">
					<img src="<c:url value='/resource/img/carrot-side.PNG'/>">
				</button>
			</div>
			<h5>관심 캘린더</h5>
			<div class="addCal">
				<span class="addInterestCallender">관심 캘린더 추가</span>
			</div>
		</section>
		
		<section class="teamCalendarHide">
			<div>
				<button class="interestCalendar Hide">
					<img src="<c:url value='/resource/img/carrot-side.PNG'/>">
				</button>
			</div>
			<h5>팀 캘린더</h5>
			<div class="addCal">
				<span class="addTeamCallender">팀 캘린더 추가</span>
			</div>
		</section>
		
		
	</div>
	<div class="calendarBtn">
		<button type="button" class="btn btn-primary" id="modalBtn" data-toggle="modal" data-target="#modal">시설 예약</button>
		<button type="button" class="btn btn-primary" id="modalBtnReg" data-toggle="modal" data-target="#regModal">일정 등록</button>
	</div>
	<div id="calendar"></div>

</body>

<script>
	var loginEmployeeID = ${userInfo.employeeID};
	var img= $('.myCallenderbtn img');
	var isDown = false;
	console.log(loginEmployeeID);
	$('#midSelect').change(function(){
		var selectVal = $(this).val(); 
		var subSelect = $('#subSelect'); // 드롭다운 소분류
		var myCallender = $('#myCallender'); // 드롭다운 개인캘린더
		var myCallenderBtn = $('#myCallenderBtn'); // 일정에서 버튼
		var myCallenderList =$('.myCallenderList'); // 일정 리스트 드롭다운
		console.log(selectVal); 

		subSelect.empty();
		if(selectVal == '팀'){
			$('.writeViewCallender').hide();
			console.log(selectVal+'+++확인중!!!!!');
			$.ajax({
				url:'getTeams.do',
				method:'GET',
				success:function(data){
					console.log(data);
					data.forEach(function(option,index){
						subSelect.append($('<option>',{
							value:index,
							text:option
						}))
					})
				},
				error:function(e){
					console.log(e);
				}
			});
		}else if(selectVal=='개인'){
			console.log(selectVal+'+++확인중!!!!!'); 	
//			$('.myCallenderList').empty();
// 			callendarCall(); 
			$('.writeViewCallender').show();

// 			$('#myCallendar').val('내 일정(기본)').trigger('change');
// 			myCallenderSelect.empty();
			function callendarCall(){
				$.ajax({
					url:'getCallender.do',
					data:{loginEmployeeID:loginEmployeeID},
					method:'get',
					success:function(data){
						console.log(data);
						
					},
					error:function(e){
						console.log(e);
					}
				});
			};
			
			var options =['반차','연차','출장','기타'];
			options.forEach(function(option){
				subSelect.append($('<option>',{
					value:option,
					text:option
				}))
			});
			
			
		}
	});

	

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
	
$('#midSelect').val('개인').trigger('change');


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
    	      dayMaxEventRows: 6
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
   
   function fetchEvents() {
	    $.ajax({
	      url: 'getCallenderEvents.do',
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

	  // 페이지 로드 시 DB에서 일정을 가져와서 events 배열에 추가합니다.
	  fetchEvents();
 }); 

	$('#calSubmit').click(function(){
		if(confirm('일정을 등록하시겠습니까?')){
		calForm.submit();
		/* location.href='schedule.go'; */ 
		}else{
			
		}
	})

var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

</script>
</html>
