<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cocean</title> 
    
     <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- icon-->
<link
	href="<c:url value='/resource/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
<link rel="icon" href="<c:url value='/resource/img/favi.png'/>"
	type="image/x-icon">
<!-- Custom styles template-->
<link href="<c:url value='/resource/css/sb-admin-2.css'/>" rel="stylesheet">
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- icon CDN-->
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.1.0/uicons-solid-rounded/css/uicons-solid-rounded.css'>  
</head>

<<<<<<< HEAD
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
						<a href='<c:url value="/approval/myApprovalList.go"/>' class="list-group-item" data-parent="#sidebar">나의결재함</a>
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
=======
<style>
	#accordionSidebar {
		height: 100%;
		position: fixed;
		top: 0;
		z-index: 2;
		overflow-y: scroll;
	}
	#accordionSidebar::-webkit-scrollbar{
		width: 0;
	}
	#content-wrapper{
		width: 100%;
		position: fixed;
		top: 0;
		z-index: 1;
	}
	.contentField{
		padding-left: 250px;
		margin-top: 80px;
	}
	.heightcontrol{
		max-height: 200px;
		overflow-y: scroll;
	}
	.heightcontrol::-webkit-scrollbar{
		width: 0;
	}
	.alarmclick:hover{
		cursor: pointer;
	}
	.alrmDel:hover{
		cursor: pointer;
	}
	#alarmtest{
		display: none;
		position: fixed;
		width: 300px;
		background-color : red;
		right: 30px;
		bottom: 10px;
>>>>>>> 71e126b6ea336b700844906d0de817b6bd2f1041
	}
	
</style>

<body id="page-top">

    <!-- Page Wrapper -->


        <!-- 사이드바 영역 -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- 사이드바 로고-->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/home'/>">
                <div class="sidebar-brand-icon">                
                    <img src="<c:url value='/resource/img/cocean2.png'/>" style="width: 50px;"/>
                </div>
                <div class="sidebar-brand-text mx-3">Cocean</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">


            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Menu
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/animal/list.go'/>">
                    <i class="fi fi-sr-dolphin"></i>
                    <span>코션친구들</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/tank/list.go'/>">
                    <i class="fi fi-sr-house-flood"></i>
                    <span>코션하우스</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fi fi-sr-chart-pie-alt"></i>
                    <span>통계</span></a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fi fi-sr-bullhorn"></i>
                    <span>스토어 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!--<h6 class="collapse-header">Custom Utilities:</h6> -->
                        <a class="collapse-item" href='<c:url value="/store/storeList.go"/>'>지점 관리</a>
                        <a class="collapse-item" href="#">상품 관리</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fi fi-sr-clipboard-user"></i>
                    <span>인사 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href='<c:url value="/personnel/orgManage.go"/>'>조직 관리</a>
                        <a class="collapse-item" href='<c:url value="/personnel/personnelList.go"/>'>사원 관리</a>
                        <a class="collapse-item" href='<c:url value="/personnel/annualManage.go"/>'>연차 관리</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href='<c:url value="/facility/facility.go"/>'>
                    <i class="fi fi-sr-hammer-crash"></i>
                    <span>시설 관리</span>
                    </a>
            </li>


            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
                    aria-expanded="true" aria-controls="collapseThree">
                    <i class="fi fi-sr-assept-document"></i>
                    <span>전자결재</span>
                </a>
                <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href='<c:url value="/approval/formList.go"/>' >결재문서작성</a>
                        <a class="collapse-item" href='<c:url value="/approval/waitingList.go"/>'>결재대기함</a>
                        <a class="collapse-item" href='<c:url value="/approval/refList.go"/>'>참조/열람함</a>
                        <a class="collapse-item" href='<c:url value="/approval/myDraftList.go"/>'>나의 기안함</a>
                        <a class="collapse-item" href='<c:url value="/approval/completeList.go"/>'>완료함</a>
                        <a class="collapse-item" href='<c:url value="/approval/department.go"/>'>부서함</a>
                        <a class="collapse-item" href='<c:url value="/approval/tempSaveList.go"/>' >임시저장함</a>
                    </div>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#board"
                    aria-expanded="true" aria-controls="board">
                    <i class="fi fi-sr-flag-alt"></i>
                    <span>게시판</span>
                </a>
                <div id="board" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="#">공지사항</a>
                        <a class="collapse-item" href="#">익명게시판</a>
                        <a class="collapse-item" href="#">부서게시판</a>
                        <a class="collapse-item" href="#">프로그램 일정</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">



            <!-- 사이드바 공통메뉴  -->
            <li class="nav-item">
                <a class="nav-link" href='<c:url value="/schedule/schedule.go"/>'>
                    <i class="fi fi-sr-calendar-pen"></i>
                    <span>캘린더</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fi fi-sr-gift"></i>
                    <span>복지몰</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- 사이드바 토글 (작게) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- 여기까지 사이드바 -->

       
       
        <div id="content-wrapper" class="d-flex flex-column">
			
			<!-- Topbar -->
			<nav	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>
			
				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">
			
					<!-- 상단바 알림 -->
					<li class="nav-item dropdown no-arrow mx-1">
						<a  class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<i class="fas fa-bell fa-fw"></i> 
							<!-- 알림 뱃지- Alerts -->
							<span class="badge badge-danger badge-counter" id="alarmCnt">1</span>
						</a> 
					
						<!-- 알림 드롭다운 -->
						<div	id="alarmDrop" class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
							<h6 class="dropdown-header">알림</h6>
							<div class="dropdown-item text-center small text-gray-500">알림이 없습니다.</div>
						</div>
					</li>
			
					<!-- 알림/유저 아이콘 선-->
			
					<div class="topbar-divider d-none d-sm-block"></div>
			
					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="mr-2 d-none d-lg-inline text-gray-600 small">사용자</span>
							<img	class="img-profile rounded-circle"	src="<c:url value='/resource/img/undraw_profile.svg'/>"/>
						</a>
						
						<!-- Dropdown - User Information -->
						<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
							<a class="dropdown-item" href="<c:url value='/mypage/mypage'/>">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
								내정보
							</a>
							<a class="dropdown-item" href="<c:url value='/mypage/work'/>">
								<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
								주소록
							</a>
							<a class="dropdown-item" href="<c:url value='/mypage/address'/>">
								<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
								근태기록
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal"	data-target="#logoutModal">
								<i	class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								로그아웃
							</a>
						</div>
					</li>
			
				</ul>
			
			</nav>
			
		</div>

    <!-- 여기까지 사이드/상단바 -->

    <!-- 페이지 상단 이동버튼-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- 로그아웃 확인 모달-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 확인 메시지</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="#">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 알림오면 생기는 창 -->
    <div id="alarmtest">
		<div>eeeeeeeee</div>
		<div ><i class="fas fa-times alrmDel" onclick="alarmHidden()"></i></div>
	</div>
<%-- <script src="<c:url value='/resource/vendor/jquery/jquery.min.js'/>"></script> --%>
<script	src="<c:url value='/resource/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resource/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
<script src="<c:url value='/resource/js/sb-admin-2.min.js'/>"></script>
</body>

<script>
	// 알람창

	var employeeID = '${userInfo.employeeID}';
	var eventSource = new EventSource(	'<c:url value="/sse/subscibe/'+employeeID+'"/>');

	eventSource.addEventListener('connect', function(event) {
		console.log(event.data);
	});
	
	eventSource.addEventListener('alarm', function(event) {
		//console.log(event.data);
		$('#alarmtest').html(event.data);
		$('#alarmtest').css({'display':'block'});
		setTimeout(function () {
			alarmHidden();
        }, 5000);
		alarmList();
	});

	function alarmHidden(){
		$('#alarmtest').css({'display':'none'});
	}
	
	alarmList();

	function alarmList() {
		$.ajax({
			type : 'post',
			url : '<c:url value="/alarm/getList"/>',
			data : {},
			success : function(data) {
				//console.log(data);
				drawAlarm(data.alarmList);
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	function drawAlarm(list) {
		
		$('#alarmCnt').html(list.length);
		
		$('#alarmDrop').html('');
		
		var dropdown = '<h6 class="dropdown-header">알림</h6>';
		
		if(list.length == 0){
		 	dropdown += '<div class="dropdown-item text-center small text-gray-500">알림이 없습니다.</div>';
		}else{
			dropdown += '<div class="heightcontrol">';
			for(var i = 0; i < list.length; i++){
				
				var con = '<div class="dropdown-item d-flex align-items-center"><div class="mr-3">';

				if(list[i].url.includes('/approval')){
					con += '<div class="icon-circle bg-success"><i class="fi fi-sr-assept-document text-white">';
				}else if(list[i].url.includes('/schedule')){
					con += '<div class="icon-circle bg-info"><i class="fi fi-sr-calendar-pen text-white">';
				}else{
					con += '<div class="icon-circle bg-info"><i class="fi fi-sr-calendar-pen text-black">';
				}
				
				con += '</i></div></div><div class="alarmclick mr-5" style="width: 100%" onclick="location.href=\'';
				con += '/Cocean'+list[i].url+'\'"><div class="small text-gray-500">';
				con += list[i].notificationTime;
				con += '</div><div>';
				con += list[i].content;
				con += '</div></div><div class="float-right"><i class="fas fa-times hover" onclick="alarmDel('
				con += list[i].historyID;
				con += ')"></i></div></div>';
				dropdown += con;
			}
			dropdown +='</div><div class="dropdown-item text-center small text-gray-500" onclick="alarmDel(\'all\')">모두 삭제</a>';					
		}		
		$('#alarmDrop').html(dropdown);
		
	}
	
	function alarmDel(id){
		var url = '<c:url value="/alarm/del/"/>'+employeeID+'/'+id;
		if(id == 'all'){
			url = '<c:url value="/alarm/allDel/"/>'+employeeID;
		}
		
		$.ajax({
			type:'get',
			url:url,
			data:{},
			dataType:'JSON',
			success:function(data){
				drawAlarm(data.alarmList);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
</script>

</html>


















