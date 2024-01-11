<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

/*주 내용*/
/*
.list_box th, .list_box td {
    padding: 15px;
    text-align: left;
}

.profile_image {
    vertical-align: top;
}

.img_profile {
    display: inline-block;
    width: 200px;
    height: 150px;
    text-align: center;
}

  .img_profile img {
    width: 90%;
    height: 100%;
    border-radius: 50%; 
  }


th{
background-color: #f4f4f4;
}


/*연찯,반차*/
/*
#Synthesis {
	margin-left: 265px;
	margin-top: 50px;
	text-align: center;
	
}

#Synthesis .Synthesiscount {
    float: left;
    text-align: center;
    margin: 5px;
    border: 1px solid #86B0F3;
    border-radius: 50%; 
    width: 350px; 
    height: 100px; 
    padding: 20px; 
    background-color: #0099FF;
    
}

.Synthesiscount div {
    padding-top: 30px; 
    
}



#usermody{
	position: absolute;
    top: 70px;
    right: 0;
    left:1352px;
    margin-right: 50px;
    width: 100px;
    height: 40px;
} */
td{
	color : gray;
}
#thumbnail_image{
	width: 150px;
	height: 150px;
	border-radius: 50%;
}

#signatureImg{
	width: 50px;
	height: 50px
}

.tab_menu {
	list-style: none;
	padding: 0;
	margin-bottom: 40px;
}

.tab_menu li {
	display: inline-block;
	margin-right: 10px;
}

.tab_menu li a {
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 5px 5px 0 0;
	background-color: #f2f2f2;
}

.tab_menu li.active a {
	background-color: #fff;
}

.tab.active {
	color: grey; /* 회색으로 변경 */
	font-size: 100%; /* 글씨 크기 조정 */
}

.tab:hover {
	color: grey; /* 마우스 오버 시 글자 색상을 회색으로 변경 */
	font-size: 100%; /* 마우스 오버 시 글자 크기를 원래 크기로 변경 */
	cursor: pointer;
}
/* 탭 내용 숨김 */
.tab-content {
	display: none;
	padding: 10px;
	background-color: #fff;
	border-radius: 0 0 5px 5px;
}

/* 활성화된 탭 내용 표시 */
.tab-content.active {
	display: block;
}

.divide_bar {
	box-shadow: 1px 1px 1px 0px #555555;
	display: inline-block;
	margin: -2px 17px;
	width: 1px;
	height: 27px;
	background: #bebebe;
	vertical-align: top;
}
.psSelect {
	/* form-control 클래스 스타일 */
	margin-bottom: 12px;
	height: 38px;
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
</style>
</head>
<body>

<c:import url="/side" />



    <!-- div 건들지 말기 -->
	<div class="container-fluid contentField">

		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">내 정보</h1>
		</div>

		<div class="card shadow p-3">

			<div class="content">
				<div class="wrap_info_content" >
					<div class="wrap_header">
						<div class="wrap_photo"></div>
					</div>
				</div>



				<table class="list_box table table-hover">
					<tr>
						<td class="profile_image" rowspan="4" style="width: 10%"><span
							class="img_profile"> <label class="photo" for="fileInput">
									<label class="photo" for="fileInput"> <c:choose>
											<c:when test="${mypage.profileImage != null}">
												<img src="/photo/cocean/profile/${mypage.profileImage}"
													id="thumbnail_image" alt="프로필 사진">
											</c:when>
											<c:otherwise>
												<img src="/Cocean/resource/img/psProfile.jpg"
													id="thumbnail_image" alt="프로필 사진">

											</c:otherwise>
										</c:choose>
														

								</label>
							</label>

						</span></td>

						<th class="name">이름</th>
						<td class="name" colspan="">${mypage.name }</td>
						<th class="team">소속</th>
						<td class="last" colspan="">${mypage.departmentName }</td>
					</tr>
					<tr>
						<th class="number">사번</th>
						<td class="number_txt">${mypage.employeeID }</td>
						<th class="telephone">지점</th>
						<td class="telephone_txt last">${mypage.branchName }</td>
					</tr>
					<tr>
						<th class="email">직위 / 직책</th>
						<td class="email_txt">${mypage.positionName}/
							${mypage.rankName }</td>
						<th class="mobile">휴대번호</th>
						<td class="mobile_txt last">${mypage.phoneNumber }</td>
					</tr>
					<tr>
						<th class="rank">담당</th>
						<td class="rank_txt">${mypage.responName }</td>
						<th class="address">주소</th>
						<td class="address_txt ">${mypage.address }</td>

					</tr>

				</table>
				




			</div>

		</div>
		
		<div class="col-12" style="margin-top: 20px;">
			<div class="card shadow">
				<div class="card-body">
					<div class="tab_menu_wrap">
										<div class=""  style="float:right">
										<button type="button" id="usermody" data-toggle="findPw" data-target="#findPw" class="btn btn-outline-primary">비밀번호 수정</button>
									</div>
						<input type="hidden" name="beforeDpID" value="${person.departmentID}">
						<div>
							<ul class="tab_menu">
								<li data-tab="basic" class="tab">기본</li>
								<span class="divide_bar"></span>
								<li data-tab="info" class="tab">신상</li>
								<span class="divide_bar"></span>
								<li data-tab="workHistory" class="tab">이력</li>
								<span class="divide_bar"></span>
								<li data-tab="history" class="tab">학력</li>
								<span class="divide_bar"></span>
								<li data-tab="departmentChangeLog" class="tab">부서변경로그</li>
								<span class="divide_bar"></span>
								<li data-tab="annualLeave" class="tab">연차기록</li>
								<!-- 다른 탭 추가 -->

							</ul>

							<!-- 기본탭  -->
							<div class="tab-content" id="basicTab" style="display: none;">
								<div>
									<h3 class="tab_title" style="display: none;">기본 정보</h3>
									<div class="ehr_basic viewForm">

										<table class="table table-hover" style="width: 100%;">
											<tbody>
												<tr>
													<th class="col3">지점</th>
													<td class="col4">${mypage.branchName}</td>
													<th class="col3"><span class="title_txt">직급</span></th>
													<td class="col4">${mypage.positionName}</td>
													<th class="col3"><span class="title_txt">직책</span></th>
													<td class="col4">${mypage.rankName}</td>
													<th class="col3"><span class="title_txt">상태</span></th>
													<td class="col4">${mypage.status}</td>
												</tr>
												<tr>

													<th>본부</th>
													<td>${mypage.hqName}</td>
													<th>부서</th>
													<td>${mypage.departmentName}</td>
													<th>담당</th>
													<td>${mypage.responName}</td>
													<th>서명이미지</th>
													<td><label class="photo2" for="fileSignatureInput"
														style="height: 10px;"> <img
															src="/photo/cocean/signature/${mypage.signatureImage}"
															id="signatureImg" alt="서명 이미지">
													</label>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- 이력탭 -->
							<div class="tab-content" id="workHistoryTab"
								style="display: none;">
								<input type="hidden" name="employeeID"
									value="${person.employeeID }"> <input type="hidden"
									name="tabID">
								<table class="table table-hover" style="width: 100%"
									id="workHistoryTable">

									<tbody>
										<tr>

											<th>입사일</th>
											<th>퇴사일</th>
											<th>회사명</th>
											<th>비고</th>
										</tr>

										<c:forEach var="history" items="${workHistory}">

											<tr>
												<td style="display: none;"><input type="hidden"
													class="historyID" value="${history.historyID }"></td>
												<td>${history.startDate}</td>
												<td>${history.endDate}</td>
												<td>${history.organizationName}</td>
												<td>${history.remarks}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:choose>
									<c:when test="${empty workHistory}">
										<p>등록된 이력이 없습니다.</p>
									</c:when>
								</c:choose>
							</div>
							<!-- 학력탭 -->
							<div class="tab-content" id="historyTab" style="display: none;">

								<table class="table table-hover" style="width: 100%;"
									id="historyTable">
									<tr>
										<th>입학일</th>
										<th>졸업일</th>
										<th>학교명</th>
										<th>비고</th>
									</tr>

									<c:forEach var="history" items="${employeeHistory}">
										<tr>
											<td style="display: none;"><input type="hidden"
												class="historyID" value="${history.historyID }">
											<td>${history.startDate}</td>
											<td>${history.endDate}</td>
											<td>${history.organizationName}</td>
											<td>${history.remarks}</td>
										</tr>
									</c:forEach>
								</table>
								<c:choose>
									<c:when test="${empty employeeHistory}">
										<p>등록된 학력이 없습니다.</p>
									</c:when>
								</c:choose>
							</div>
							<!-- 부서변경로그 탭 -->
							<div class="subPs2 tab-content" id="departmentChangeLogTab"
								style="display: none;">
								<table class="table table-hover" style="width: 100%"
									id="dpChangeTable">
									<tr>
										<th>변경일</th>
										<th>변경전부서</th>
										<th>변경후부서</th>
									</tr>
									<c:forEach var="dplog" items="${departmentChangeLog}">
										<tr>
											<td style="display: none;"><input type="hidden"
												class="logID" value="${dplog.logID }"></td>
											<td>${dplog.changeDate}</td>
											<td>${dplog.beforedpID}</td>
											<td>${dplog.afterdpID}</td>
										</tr>
									</c:forEach>
								</table>
								<c:choose>
									<c:when test="${empty departmentChangeLog}">
										<p>부서 변경 로그가 없습니다.</p>
									</c:when>
								</c:choose>
							</div>
							<!-- 잔여연차 -->
							<div class="tab-content" id="annualLeaveTab"
								style="display: none;">


								<table class="table table-hover">
									<colgroup>
										<col width="30%">
										<col width="30%">
										<col width="40%">
									</colgroup>
									<thead>

										<tr>
											<th scope="col">발생한 연차</th>
											<th scope="col">잔여 연차</th>
											<th scope="col">사용 연차</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${getEmployeeAnnual.value}일</td>
											<td>${mypage.remainingAnnualLeave}일</td>
											<td>${getEmployeeAnnual.value - mypage.remainingAnnualLeave}일</td>
										</tr>
									</tbody>
								</table>
								<div>
									<span class="stat_tit">연차 사용기간 :</span> <select
										id="vacation_term_list" class="psSelect"
										style="display: inline-block; width: 25%;"><option
											value="2024-12-31">2024-01-01 ~ 2024-12-31</option>
										<option value="2023-12-31">2023-01-01 ~ 2023-12-31</option>
										<option value="2022-12-31">2022-01-01 ~ 2022-12-31</option>
										<option value="2021-12-31">2021-01-01 ~ 2021-12-31</option>
										<option value="2020-12-31">2020-01-01 ~ 2020-12-31</option>
										<option value="2019-12-31">2019-01-01 ~ 2019-12-31</option>
										<option value="2018-12-31">2018-01-01 ~ 2018-12-31</option></select>
								</div>
								<table class="table table-hover findAttend">
									<colgroup>
										<col width="30%">
										<col width="30%">
										<col width="40%">
									</colgroup>

								</table>
							</div>
							<!-- 신상 탭 -->
							<div class="tab-content" id="infoTab" style="display: none;">
								<table class="table table-hover">
									<tr>
										<th>이름</th>
										<th>휴대번호</th>
										<th>주소</th>

									</tr>
									<tr>
										<td>${mypage.name }</td>
										<td>${mypage.phoneNumber }</td>
										<td>${mypage.address }</td>
									</tr>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- 비밀번호 수정 모달 -->
	<div class="modal fade" id="findPw" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">비밀번호 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="changePw" method="post" name="mypage=form">

						<div class="update">

							<div class="mypage-row">
								<label>현재 비밀번호</label> <input type="password" name="currentPw" class="form-control mb-2"
									id="currentPw" maxlength="20" required/>
							</div>
							<div class="mypage-row">
								<label>새 비밀번호</label> <input type="password" name="newPw"
									id="password_1" class="pw form-control mb-2" maxlength="20" required/>
							</div>
							<div class="mypage-row">
								<label>새 비밀번호 확인</label> <input type="password"
									name="newPwConfirm" id="password_2" class="pw form-control mb-2" maxlength="20" required/>
								<th colspan="2" id="pwCh"><font id="checkPw" size="2"></font>
								</th>


							</div>
							<div class="button-container" style="float: right">
								<button type="button" id="info-del-btn"
									class="btn btn-outline-primary">취소</button>
								<button type="submit" id="info-update-btn"
									class="btn btn-primary">수정</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>


	<c:import url="/footer"/>
</body>
<script>
// var msg = "${msg}";
// if(msg != ""){
//    alert(msg);
// }

	$(document).ready(function() {
		var employeeID = '${person.employeeID}';
		console.log(employeeID);
		$('#vacation_term_list').val('2024-12-31').trigger('change');
		// 기본 탭을 선택한 상태로 초기화
		$('.tab').removeClass('active');
		$('.tab-content').removeClass('active');
		$('li[data-tab="basic"]').addClass('active');
		var tabId = 'basic'; // 기본으로 표시할 탭의 ID
		$('input[name="tabID"]').val(tabId);
		$("#" + tabId + "Tab").show();
		// 기본 탭 활성화
		// 아이디를 기준으로 선택
		// 기본 탭 콘텐츠 보이기
		// 탭 클릭 이벤트
		$(".tab").click(function() {
			$('.tab').removeClass('active');
			$('.tab-content').removeClass('active');

			$(this).addClass('active');

			var tabContentId = $(this).data('tab');
			$('#' + tabContentId).addClass('active');

			$(".tab-content").hide();

			var tabId = $(this).attr("data-tab");
			$('input[name="tabID"]').val(tabId);
			$("#" + tabId + "Tab").show();
			if (tabId == 'annualLeave' || tabId == 'departmentChangeLog') {
				$('.formbtn').hide();
			} else {
				$('.formbtn').show();
			}
		});
	});
	
	$('#vacation_term_list').on('change', function () {
	    $('.findAttend').empty(); // 기존의 데이터를 비워줍니다.
	    var dateVal = $(this).find('option:selected').text();
	    var [startYear, endYear] = dateVal.split(' ~ ');
	    console.log(startYear, endYear);
	    $.ajax({
	        url: 'findAttend.do',
	        data: {
	            employeeID: employeeID,
	            startYear: startYear,
	            endYear: endYear
	        },
	        type: 'post',
	        success: function (data) {
	            console.log(data);
	            if (data.length === 0) {
	                $('.findAttend').html('<td colspan="4">사용한 연차가 없습니다.</td>'); // 데이터가 없을 때 출력하는 부분입니다.
	            } else {
	            	var table = '<tr><th scope="col">종류</th><th scope="col">연차 사용기간</th><th scope="col">사용일수</th></tr>';

	            	data.forEach(function (item) {
	            	    table += '<tr>';
	            	    table += '<td>' + item.category + '</td>';
	            	    table += '<td>' + item.vacationStartDate +'/'+ (item.vacationEndDate === undefined ? '' : item.vacationEndDate) + '</td>';
	            	    table += '<td>' + item.usageTime + '</td>';
	            	    table += '</tr>';
	            	});

	            	table += '</table>';
	            	$('.findAttend').append(table);
	            }
	        },
	        error: function (e) {
	            console.log(e);
	        }
	    })
	})
	
	$('#usermody').on('click',function(){
		$('#findPw').modal('show');
	})
	
	$('#info-del-btn').on('click',function(){
		$('#findPw').modal('hide');
	})
	
	
	$('.pw').keyup(function(){
	   let pass1 = $("#password_1").val();
	   let pass2 = $("#password_2").val();
	   let checkPw = $("#checkPw");

	   if (pass1 !== "" || pass2 !== "") {
	      if (pass1 === pass2) {
	         checkPw.html("비밀번호가 일치합니다.");
	         checkPw.css("color", "blue");
	      } else {
	         checkPw.html("비밀번호가 불일치합니다.");
	         checkPw.css("color", "red");
	      }
	   } else {
	      checkPw.html(""); 
	   }
	});


</script>
</html>