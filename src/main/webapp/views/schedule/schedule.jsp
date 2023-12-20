<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href='<c:url value="/resource/css/schedule/main.css"/>' rel='stylesheet' />
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
	max-width: 700px;
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
					<form action="scheduleWrite.do">
						<!-- 입력폼 -->
							<p>제목 <input type="text" name="title" placeholder="제목을 입력해주세요."></p>
							<p>시작일
								<input type="datetime-local" name="startDate">
							</p>
							<p>종료일
								<input type="datetime-local" name="endDate">
							</p>
							<p>중분류    
								<select id="midSelect" name="mainCategory">
									<option value="individual">개인</option>
									<option value="team">팀</option>
								</select>
							</p>
							<p>소분류
							    <select id="subSelect" name="subCategory">
							        <!-- 선택된 중분류에 따라 옵션이 동적으로 추가될 것입니다 -->
							    </select>
							</p>
							<p class="myCallender">개인캘린더
							    <select id="myCallender" name="category">
							    </select>
							</p>
							<p>비고
								<input type="text" name="remarks">
							</p>
							<p>내용
								<textarea name="description"></textarea>
							</p>
							
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">저장</button>
							<button type="button" class="btn btn-secondary"data-dismiss="modal">취소</button>
							
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
		<section class="myCalendar">

			<div>
				<button class="myCallenderHide">접기</button>
				내 캘린더
			</div>
			<ul>
				<li class="myCallenderList">
					<!-- 동적으로 캘린더리스트 -->
				</li>
			</ul>
			<div>
				<span class="addMyCallender">내 캘린더 추가</span>
			</div>
		</section>
		<section class="interestCalendar">
			<h3>관심 캘린더</h3>
			<div>
				<span class="addInterestCallender">관심 캘린더 추가</span>
			</div>
		</section>
		<section class="teamCalendar">
			<h3>팀 캘린더</h3>
			<div>
				<span class="addTeamCallender">팀 캘린더 추가</span>
			</div>
		</section>
		<section class="rsvCalendar">
			<h3>예약 캘린더</h3>
			<label>
				<input type="checkbox" value="예약 일정(기본)" class="rsvCallender"/>
				예약 일정(기본)
			</label>
		</section>
	</div>
	<div class="calendarBtn">
		<button type="button" class="btn btn-primary" id="modalBtn" data-toggle="modal" data-target="#modal">시설 예약</button>
		<button type="button" class="btn btn-primary" id="modalBtnReg" data-toggle="modal" data-target="#regModal">일정 등록</button>
	</div>
	<div id="calendar"></div>

</body>

<script>
	var loginEmployeeID = '230001';
	$('#midSelect').change(function(){
		var selectVal = $(this).val();
		var subSelect = $('#subSelect');
		var myCallender = $('.myCallender');
		var myCallenderSelect = $('#myCallender');
		var myCallenderList =$('.myCallenderList');
		console.log(selectVal); 
		myCallender.hide();
		subSelect.empty();
		if(selectVal == 'team'){
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
		}else if(selectVal=='individual'){
			
			myCallender.show();
			myCallenderSelect.empty();
			$.ajax({
				url:'getCallender.do',
				data:{loginEmployeeID:loginEmployeeID},
				method:'get',
				success:function(data){
					console.log(data);
					data.forEach(function(option){
						myCallenderSelect.append($('<option>',{
							value:option.callenderTitle,
							text:option.callenderTitle
						}))
						var listItem = $('<li>');

						var checkbox = $('<input>').attr({
						    type: 'checkbox',
						    value: option.callenderTitle, // 선택된 옵션의 값 설정
						    class: 'calendarCheckbox' // 필요한 경우 클래스 추가
						});
						var label = $('<label>').text(option.callenderTitle); // 체크박스 설명을 라벨에 추가
						label.prepend(checkbox); // 체크박스를 라벨 내부에 추가
						listItem.append(label); // 라벨을 리스트 아이템에 추가
						myCallenderList.append(listItem); // 리스트 아이템을 리스트에 추가
					})
					
				},
				error:function(e){
					console.log(e);
				}
			});
			var options =['반차','연차','출장','기타'];
			options.forEach(function(option){
				subSelect.append($('<option>',{
					value:option,
					text:option
				}))
			});
		}
	});
$('.myCallenderHide').click(function(){
	console.log('click');
})
	
$('#midSelect').val('individual').trigger('change');

var msg = "${msg}";
if(msg!=""){
	confirm(msg);
}

</script>
</html>
