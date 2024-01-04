<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>

<!-- popper CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> -->

<!-- 부트스트랩 자바스크립트 -->
<script src="<c:url value='/resource/js/bootstrap.min.js'/>"></script>
<link rel="icon" href="<c:url value='/resource/img/favi.png'/>"	type="image/x-icon">

<!-- 부트스트랩 CSS/favicon -->
<link rel="stylesheet"	href="<c:url value='/resource/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resource/css/sidebar.css'/>">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>

<body>
	<header>
		<div id="header">
		<a href="<c:url value='/home'/>">
			<img	style="width: 75px; height: 75px; margin-left: 20px; margin-top: -3px;" 
				src="<c:url value='/resource/img/logo.svg'/>"/>
				</a>
				<div class="thisTime" style="height: 50px; width: 200px; float: right; margin-top: 30px;">
				<img style="width: 25px; margin-right: 5px;" src="<c:url value='/resource/img/Time.svg'/>"/>
					<a id="curTime"></a>
				</div>
		</div>
	</header>
	<div class="container-fluid">
		<div class="row d-flex d-md-block flex-nowrap wrapper">
			<nav class="col-md-3 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
				<div class="list-group border-0 card text-center text-md-left">
					<a href="#myPage_bar" class="list-group-item d-inline-block collapsed" data-toggle="collapse"
						data-parent="#sidebar" aria-expanded="false">
						<img style="width: 25px; margin-right: 5px;" src="<c:url value='/resource/img/my.svg'/>">
						<span class="d-none d-md-inline ml-1">마이페이지</span>
					</a>
					<div class="collapse" id="myPage_bar">
					<a href="<c:url value='/mypage/mypage'/>" class="list-group-item" data-parent="#sidebar">내정보</a>
						<a href="<c:url value='/mypage/work'/>" class="list-group-item" data-parent="#sidebar">근태기록</a>
						<a href="<c:url value='/mypage/address'/>" class="list-group-item" data-parent="#sidebar">주소록</a>
					</div>
					<a href="<c:url value='/animal/list.go'/>" class="list-group-item d-inline-block collapsed"
						 data-parent="#sidebar">
						<img style="width: 25px; margin-right: 5px; margin-bottom: 5px;"
							src="<c:url value='/resource/img/Star_fill.svg'/>">
						<span class="d-none d-md-inline ml-1">코션친구들</span>
					</a>
					<a href="<c:url value='/tank/list.go'/>" class="list-group-item d-inline-block collapsed"
						data-parent="#sidebar" id="house">
						<img style="width: 24px; margin-right: 5px; margin-bottom: 5px;"
							src="<c:url value='/resource/img/house.svg'/>">
						<span class="d-none d-md-inline ml-1">코션하우스</span>
					</a>
					<a href="#" class="list-group-item d-inline-block collapsed"
						data-parent="#sidebar">
						<img style="width: 25px; margin-right: 5px; margin-bottom: 5px;"
							src="<c:url value='/resource/img/Chart_alt.svg'/>">
						<span class="d-none d-md-inline ml-1">통계</span>
					</a>
					<a href="#store_bar" class="list-group-item d-inline-block collapsed"
						data-toggle="collapse" data-parent="#sidebar" aria-expanded="false">
						<img style="width: 27px; margin-right: 5px; margin-bottom: 3px;"
							src="<c:url value='/resource/img/marketing.svg'/>">
						<span class="d-none d-md-inline ml-1">스토어 관리</span>
					</a>
					<div class="collapse" id="store_bar">
						<a href='<c:url value="/store/storeList.go"/>' class="list-group-item" data-parent="#sidebar">지점 관리</a>
						<a href="#" class="list-group-item" data-parent="#sidebar">상품 관리</a>
					</div>
					<a href="#group_bar" class="list-group-item d-inline-block collapsed"
						data-toggle="collapse" data-parent="#sidebar" aria-expanded="false">
						<img style="width: 27px; margin-right: 5px; margin-bottom: 3px;"
							src="<c:url value='/resource/img/group.svg'/>">
						<span class="d-none d-md-inline ml-1">인사 관리</span>
					</a>
					<div class="collapse" id="group_bar">
						<a href='<c:url value="/personnel/orgManage.go"/>' class="list-group-item" data-parent="#sidebar">조직 관리</a>
						<a href='<c:url value="/personnel/personnelList.go"/>' class="list-group-item" data-parent="#sidebar">사원 관리</a>
						<a href='<c:url value="/personnel/annualManage.go"/>' class="list-group-item" data-parent="#sidebar">연차 관리</a>
					</div>
					<a href='<c:url value="/facility/facility.go"/>' class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
						<img style="width: 27px; margin-right: 5px; margin-bottom: 3px;"
							src="<c:url value='/resource/img/facility.svg'/>">
						<span class="d-none d-md-inline ml-1">시설 관리</span>
					</a>
					<a href="#approval_bar" class="list-group-item d-inline-block collapsed"
						data-toggle="collapse" data-parent="#sidebar" aria-expanded="false">
						<img style="width: 27px; margin-right: 5px; margin-bottom: 5px;"
							src="<c:url value='/resource/img/Desk_alt.svg'/>">
						<span class="d-none d-md-inline ml-1">전자결재</span>
					</a>
					<div class="collapse" id="approval_bar">
						<a href='<c:url value="/approval/formList.go"/>' class="list-group-item" data-parent="#sidebar">결재문서작성</a>
						<a href='<c:url value="/approval/waitingList.go"/>' class="list-group-item" data-parent="#sidebar">결재대기함</a>
						<a href='<c:url value="/approval/refList.go"/>' class="list-group-item" data-parent="#sidebar">참조/열람함</a>
						<a href='<c:url value="/approval/myDraftList.go"/>' class="list-group-item" data-parent="#sidebar">나의기안함</a>
						<a href='<c:url value="/approval/completeList.go"/>' class="list-group-item" data-parent="#sidebar">완료함</a>
						<a href='<c:url value="/approval/department.go"/>' class="list-group-item" data-parent="#sidebar">부서함</a>
						<a href='<c:url value="/approval/tempSaveList.go"/>' class="list-group-item" data-parent="#sidebar">임시저장함</a>
					</div>
					<a href="#board_bar" class="list-group-item d-inline-block collapsed"
						data-toggle="collapse" data-parent="#sidebar" aria-expanded="false">
						<img style="width: 27px; margin-right: 5px; margin-bottom: 5px;"
							src="<c:url value='/resource/img/board.svg'/>">
						<span class="d-none d-md-inline ml-1">게시판</span>
					</a>
					<div class="collapse" id="board_bar">
						<a href="#" class="list-group-item" data-parent="#sidebar">공지사항</a>
						<a href="#" class="list-group-item" data-parent="#sidebar">익명게시판</a>
						<a href="#" class="list-group-item" data-parent="#sidebar">부서게시판</a>
						<a href="#" class="list-group-item" data-parent="#sidebar">프로그램 일정</a>
					</div>
					<a href='<c:url value="/schedule/schedule.go"/>' class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
						<img style="width: 27px; margin-right: 5px; margin-bottom: 5px;"
							src="<c:url value='/resource/img/calender.svg'/>">
						<span class="d-none d-md-inline ml-1">캘린더</span>
					</a>
					<a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar">
						<img style="width: 27px; margin-right: 5px; margin-bottom: 5px;"
							src="<c:url value='/resource/img/mall.svg'/>">
						<span class="d-none d-md-inline ml-1">복지몰</span>
					</a>
					<a href="#" class="list-group-item d-inline-block collapsed"	data-parent="#sidebar">
						<img style="width: 25px; margin-right: 7px; margin-bottom: 5px;"
							src="<c:url value='/resource/img/out.svg'/>">
						<span class="d-none d-md-inline ml-1">로그아웃</span>
					</a>
				</div>
			</nav>
		</div>
	</div>
	
	
	
	<div id="alarm">
		eeeeeeeee
	</div>
	
	
</body>
<script>

	const curTime = document.getElementById('curTime');
	
	setInterval(() => {
		const date = new Date();
		curTime.innerHTML = date.toLocaleTimeString();
	}, 1000);
	
	// main 사이즈 조절
	window.addEventListener('resize',resizeWidth);
	function resizeWidth(){
		var winWidth = window.innerWidth;
		//console.log(winWidth);
		var sideWidth = $('nav').outerWidth();
		//console.log(sideWidth);
		var contentWidth = winWidth-sideWidth;
		$('main').css({'width':contentWidth, 'left':sideWidth,'top':'80px'});
	}
	
	resizeWidth();
	
	
	// 알람창

	var  employeeID = '${userInfo.employeeID}';
	var eventSource = new EventSource('<c:url value="/sse/subscibe/'+employeeID+'"/>');
	
	eventSource.addEventListener('alarm', function(event){
		console.log(event.data);
		$('#alarm').html(event.data);
	});
	
	eventSource.addEventListener('connect', function(event){
		console.log(event.data);	
	});
	alarmList();
	function alarmList(){
		$.ajax({
			type:'post',
			url:'<c:url value="/alarm/getList"/>',
			data:{},
			success:function(data){
				console.log(data);
				drawAlarm(data.alarmList);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function drawAlarm(list){
		
	}
	
	
	
	
	
</script>
</html>