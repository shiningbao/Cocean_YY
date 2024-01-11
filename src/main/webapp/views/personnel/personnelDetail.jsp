<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<!-- <link rel="icon" href="resource/img/favi.png" type="image/x-icon"> -->
<!-- <link -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" -->
<!-- 	rel="stylesheet"> -->
<!-- <!-- Bootstrap CSS --> 
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
<!-- <!-- Bootstrap JS -->
<!-- <script -->
<!-- 	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->
<%-- <link rel="stylesheet" href="<c:url value='/resource/css/sidebar.css'/>"> --%>
<!-- <link rel="stylesheet" -->
<%-- 	href="<c:url value='/resource/css/personnel/personnel.min.css'/>"> --%>
	
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>

.delBtn ,.addBtn{
	border: none;
    background: none;
}
}
.photo {
	justify-content: start !important;
}
/* 컨텐츠 영역 */
/* .content {
    margin: 20px auto;
    width: 80%;
    background-color: #fff;

} */

.wrap_info_content {
}



/* th, td { */
/*     padding: 8px; */
/*     text-align: left; */
/* } */

/* th { */
/*     background-color: #f4f4f4; */
/* } */
td{
	color: gray;
}
/* 이미지 */
.photo img, .photo2 img {
    max-width: 150px;
    height: auto;
    border-radius: 50%;
    border: 1px solid #ccc;
}

.mainPs{
	    left: 35%;
    position: absolute;
    top: 30%;
}

.subPs{
	margin-top: 12%;
}


.tab_menu {
    list-style: none;
    padding: 0;
    margin-bottom: 40px ;
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
    .formbtn{
    	    text-align: center;
    }

    #fileInput, #fileSignatureInput {
	display: none;
}


.photo img {
	width: 150px;
	height: 150px;
	border-radius: 50%; /* 이미지를 동그랗게 처리하는 CSS */
}

.photo2 img {
	width: 55px;
	height: 55px;
}
.file-icon {
	width: 40px;
	height: 40px;
	transform :translate(280%, -100%);
	font-size: 24px;
	color: #379cff;
	cursor: pointer;
	border-radius: 50%;
	background-color: #ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
}


.file-icon3 {
	width: 40px;
	height: 40px;
	transform: translate(650%, -130%);
	font-size: 20px;
	color: #379cff;
	cursor: pointer;
	border-radius: 50%;
	background-color: #ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
}

#resetPassword{
	float: right;
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
.divide_bar {
    box-shadow: 1px 1px 1px 0px #555555;
    display: inline-block;
    margin: -2px 17px;
    width: 1px;
    height: 27px;
    background: #bebebe;
    vertical-align: top;
}
</style>
</head>
<body>
<c:import url="/side"/>
<form id="detailSave"  enctype="multipart/form-data">
<div class="container-fluid contentField">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">사원상세</h1>
	</div>
	
		<div class="col-12">
			<div class="card shadow">
				<div class="card-body">
					
						<div class="">
							<div class="wrap_info_content" >
								<div class="wrap_header">
									<div class="wrap_photo">
									
									</div>
								</div>
							</div>
			
			
			<table class="table">
				<tbody>
					<tr>
						<td class="profile_image" rowspan="4" style="width: 10%">
						<span class="img_profile"> <label class="photo" for="fileInput"> 
								<label class="photo" for="fileInput">
								<c:choose>
										<c:when test="${person.profileImage != null}">
											<img src="/photo/cocean/profile/${person.profileImage}"
												id="thumbnail_image" alt="프로필 사진">
										<span class="file-icon"><i class="fas fa-pencil-alt"></i></span>
										</c:when>
										<c:otherwise>
											<img src="/Cocean/resource/img/psProfile.jpg"
												id="thumbnail_image" alt="프로필 사진">
										<span class="file-icon"><i class="fas fa-pencil-alt"></i></span>
										</c:otherwise>
									</c:choose>
									</label>
							</label>
							
								<input type="file" name="file" id="fileInput" title="등록" style="height:inherit;">
							</span></td>
							<th class="name">이름</th>
							<th class="team">소속</th>
	
							<td class="last" colspan="">${person.departmentName }</td>
							<th>입사일</th>
							<td class="" colspan="1">
								  <span class="wrap_date">${person.joinDate}<span class="ic ic_calendar"></span></span>
							</td>
						</tr>
						<tr>
							<td class="name_txt" rowspan="3">
								<p class="kor">${person.name}</p>
	
							</td>
							<th class="number">사번</th>
							<td class="number_txt">${person.employeeID }</td>
							<th class="telephone">지점</th>
							<td class="telephone_txt last">${person.branchName }</td>
						</tr>
						<tr>
							<th class="email">직급 / 직책</th>
							<td class="email_txt">
							${person.rankName }/${person.positionName}
								</td>
							<th class="mobile">휴대번호</th>
							<td class="mobile_txt last">${person.phoneNumber }</td>
						</tr>
						<tr>
							<th class="rank">담당</th>
							<td class="rank_txt">${person.responName }</td>
							<th class="address">주소</th>
							<td class="address_txt ">${person.address }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

		<div class="col-12" style="margin-top: 20px;">
			<div class="card shadow">
				<div class="card-body">

		<div class="tab_menu_wrap">
		<button class="btn btn-outline-primary" id="resetPassword" type="button">비밀번호 초기화 </button>
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
				<div class="tab-content" id="basicTab" style="display: none;">
					<div>
						<h3 class="tab_title" style="display: none;">기본 정보</h3>
						<div class="ehr_basic viewForm">
						
							<table class="table table-hover" style="width:100%;">
							    <tbody>
							        <tr>
										<th class="col3">지점</th>
							            <td class="col4">
							                <select id="branchSelect" class="psSelect" name="branchID"></select>
							            </td>
							            <th class="col3"><span class="title_txt">직급</span></th>
							            <td class="col4">
							                <select id="selectRankID" name="rankID" class="psSelect"></select>
							            </td>
							            <th class="col3"><span class="title_txt">직책</span></th>
							            <td class="col4">
							                <select id="selectPositionID" name="positionID" class="psSelect"></select>
							            </td>
							            <th class="col3"><span class="title_txt">상태</span></th>
							            <td class="col4">
							                <select id="selectStatus" name="status" class="psSelect">
							                    <option value="재직" ${person.status == '재직' ? 'selected' : ''}>재직</option>
							                    <option value="휴직" ${person.status == '휴직' ? 'selected' : ''}>휴직</option>
							                    <option value="퇴사" ${person.status == '퇴사' ? 'selected' : ''}>퇴사</option>
							                </select>
							            </td>
							        </tr>
							        <tr>

							            <th>본부</th>
							            <td>
							                <select id="deSelect" class="psSelect" name="hqID"></select>
							            </td>
							            <th>부서</th>
							            <td>
							                <select id="departmentSelect" name="departmentID" class="psSelect"></select>
							            </td>
							            <th>담당</th>
							            <td>
							                <select id="resSelect" name="responID" class="psSelect"></select>
							            </td>
							             <th>서명이미지</th>
							            <td>
							                <label class="photo2" for="fileSignatureInput" style="height: 10px;">
							                    <img src="/photo/cocean/signature/${person.signatureImage}" id="signatureImg" alt="서명 이미지">
							                    <span class="file-icon2"><i class="fas fa-upload"></i></span>
							                </label>
							                <div class="file-upload">
							                    <input type="file" name="fileSignature" id="fileSignatureInput" title="등록" style="height:inherit;">
							                </div>
							            </td>
							        </tr>

							           

							    </tbody>
							</table>
						</div>
					</div>

				</div>

	<!-- 이력 탭 내용 -->

	
	<div class="tab-content" id="workHistoryTab" style="display: none;">
	<input type="hidden" name="employeeID" value="${person.employeeID }"> 
	<input type="hidden" name="tabID">
		<table class="table table-hover"style="width:100%" id="workHistoryTable">
		
			<tbody>
				<tr>
					
					<th>입사일 
					
					</th>
					<th>퇴사일</th>
					<th>회사명</th>
					<th>비고</th>
					<th>수정</th>
				</tr>

				<c:forEach var="history" items="${workHistory}">
					
					<tr>
					<td style="display:none;">
					<input type="hidden" class="historyID" value="${history.historyID }">
					</td>
						<td>${history.startDate}</td>
						<td>${history.endDate}</td>
						<td>${history.organizationName}</td>
						<td>${history.remarks}</td>
						<td><button onclick='delHistory()' type='button' class='delBtn'>X</button></td>
					</tr>
				</c:forEach>
			<tr>
				<td><input type="date" name="historyArray[0].startDate"></td>
	            <td><input type="date" name="historyArray[0].endDate"></td>
	            <td><input type="text" name="historyArray[0].organizationName"></td>
	            <td><input type="text" name="historyArray[0].remarks"></td>
					<td>
					<input type="hidden" name="historyArray[0].category" value="이력">
						<button onclick="addRow1()" type="button" style="
						    border: none;
						    background: none;
						    font-size: 25px;
						">+</button>
					</td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<!-- 학력 탭 내용 -->
	<div class="tab-content" id="historyTab" style="display: none;">
	
		<table class="table table-hover"style="width:100%;" id="historyTable">
			<tr>
				<th>입학일</th>
				<th>졸업일</th>
				<th>학교명</th>
				<th>비고</th>
				<th>수정</th>
			</tr>

					<c:forEach var="history" items="${employeeHistory}">
						<tr>
						<td style="display:none;">
							<input type="hidden" class="historyID" value="${history.historyID }">
							<td>${history.startDate}</td>
							<td>${history.endDate}</td>
							<td>${history.organizationName}</td>
							<td>${history.remarks}</td>
							<td><button onclick='delscHistory()' type='button' class='delBtn'>X</button></td>
						</tr>
					</c:forEach>
					<tr>
			<td><input type="date" name="schistoryArray[0].startDate"></td>
            <td><input type="date" name="schistoryArray[0].endDate"></td>
            <td><input type="text" name="schistoryArray[0].organizationName"></td>
            <td><input type="text" name="schistoryArray[0].remarks"></td>

					<td>
					<input type="hidden" name="schistoryArray[0].category" value="학력">
						<button onclick="addRow()" type="button" style="
						    border: none;
						    background: none;
						    font-size: 25px;
						">+</button>
					</td>
				</tr>

		</table>
		
	</div>
	<div class="subPs2 tab-content" id="departmentChangeLogTab"
		style="display: none;">
		<table class="table table-hover"style="width:100%" id="dpChangeTable">
			<tr>
				<th>변경일</th>
				<th>변경전부서</th>
				<th>변경후부서</th>
				<th></th>
			</tr>
			<c:forEach var="dplog" items="${departmentChangeLog}">
			<tr>
				<td style="display:none;">
					<input type="hidden" class="logID" value="${dplog.logID }">
				</td>
				<td>${dplog.changeDate}</td>
				<td>${dplog.beforedpID}</td>
				<td>${dplog.afterdpID}</td>
				<td><button onclick='delDepartmentLog()' type='button' class='delBtn'>X</button></td>
			</tr>
			</c:forEach>
		</table>
		 <c:choose>
        <c:when test="${empty departmentChangeLog}">
            <p>부서 변경 로그가 없습니다.</p>
        </c:when>
    </c:choose>
	</div>
	
		<div class="tab-content" id="annualLeaveTab" style="display: none;">
		
	
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
				<td>${person.remainingAnnualLeave }일</td>
				<td>${getEmployeeAnnual.value - person.remainingAnnualLeave}일</td>
			</tr>
			</tbody>
		</table>
					<div>
                        <span class="stat_tit">연차 사용기간 :</span>
                        <select id="vacation_term_list" class="psSelect" style="display: inline-block; width:25%;"><option value="2024-12-31">2024-01-01 ~ 2024-12-31</option><option value="2023-12-31">2023-01-01 ~ 2023-12-31</option><option value="2022-12-31">2022-01-01 ~ 2022-12-31</option><option value="2021-12-31">2021-01-01 ~ 2021-12-31</option><option value="2020-12-31">2020-01-01 ~ 2020-12-31</option><option value="2019-12-31">2019-01-01 ~ 2019-12-31</option><option value="2018-12-31">2018-01-01 ~ 2018-12-31</option></select>
					</div>
		<table class="table table-hover findAttend">
			<colgroup>
				<col width="30%">
				<col width="30%">
				<col width="40%">
			</colgroup>

		</table>

				

	</div>
	
	
		<div class="tab-content" id="infoTab" style="display: none;">
		<table class ="table table-hover">
			<tr>
				<th>이름</th>
				<th>휴대번호</th>
				<th>주소</th>
				
			</tr>
			<tr>
				<td> 
					<input type="text" name="name" pattern="[가-힣]*" title="한글만 입력하세요." class="form-control mb-2" value="${person.name }" required/>
				</td>
				<td>
					 <input type="text" name="phoneNumber" class="form-control mb-2"placeholder="010-0000-0000"  pattern="\d{3}-\d{4}-\d{4}" title="전화번호 형식인 010-0000-0000으로 입력하세요." value="${person.phoneNumber }"required/>
				</td>
				<td>
					<input type="text" name="address" id="address" class="form-control mb-2" value="${person.address }" required/>
					<span class="file-icon3"><i class="fas fa-map-marker-alt" onclick="sample6_execDaumPostcode()"></i></span>
				</td>
			</tr>
		</table>

	</div>

		<div class="tool_bar">
	        <span class="btn_wrap">
	            <span class="ic_classic ic_close" id="foldTab" style="display:none"></span>
	            <span class="ic_classic ic_open" id="unfoldTab"></span>
	        </span>
	    </div>
        <div class="formbtn">
        
        <button class="btn btn-outline-primary detailCancleBtn">취소</button>
        <button class="btn btn-primary detailSaveBtn" type="submit">저장</button>
        </div>

		</div>
		</div>
		</div>
	</div>
	<div  style="float:right">
	<button class="btn btn-primary" type="button" onclick="location.href='http://localhost:8080/Cocean/personnel/personnelList.go'">목록</button>
	</div>
</form>
<c:import url="/footer"/>
</body>

<script>
var rankID = '${person.rankID}';
var positionID ='${person.positionID}';
var branchPsID ='${person.branchID}';
var hqPsID = '${person.hqID}';
var dpName ='${person.departmentID}';
var psResponsibility = '${person.responID}';
var employeeID = '${person.employeeID}';
var workHistory = '${workHistory}';
console.log('------------');


var departmentSelect = $('#departmentSelect');
var resSelect = $('#resSelect');
var branchSelect = $('#branchSelect');

function getPositionName() {
    $.ajax({
        url: 'getPositionName.do',
        method: 'POST',
        data: {},
        success: function(data) {
            console.log(data);
            data.forEach(function(option, index) {
                var $option = $('<option>', {
                    value: option.positionID,
                    text: option.positionName
                });

                // 여기에 원하는 조건을 추가하여 선택되도록 설정
                if (option.positionID == positionID) {
                    $option.prop('selected', true);
                }

                $('#selectPositionID').append($option);
            });


        },
        error: function(e) {
            console.log(e);
        }
    });
}
function getRankName() {
    $.ajax({
        url: 'getRankName.do',
        method: 'POST',
        data: {},
        success: function(data) {
            console.log(data);
            data.forEach(function(option, index) {
                var $option = $('<option>', {
                    value: option.rankID,
                    text: option.rankName
                });

                // 여기에 원하는 조건을 추가하여 선택되도록 설정
                if (option.rankID == rankID) {
                    $option.prop('selected', true);
                }

                $('#selectRankID').append($option);
            });

        },
        error: function(e) {
            console.log(e);
        }
    });
}
function onBranchSelectChange() {
    console.log('지점 선택시 본부항목 변경!!!!!!!!!!!!!!!!!');
    var branchID = $('#branchSelect').val();
    console.log(branchID);
    $.ajax({
        url: 'getBranchID.do',
        method: 'GET',
        data: { branchID: branchID },
        success: function(data) {
            console.log(data);
            $('#deSelect').empty();
            data.forEach(function(option, index) {
                var $option = $('<option>', {
                    value: option.hqID,
                    text: option.hqName
                });

                // 여기에 원하는 조건을 추가하여 선택되도록 설정
                if (index == hqPsID) {
                    $option.prop('selected', true);
                    
                }

                $('#deSelect').append($option);
            });
            $('#deSelect').val(hqPsID).trigger('change');
		
                
            console.log($('#branchSelect').val());
        },
        error: function(e) {
            console.log(e);
        }
    });
}


function onDeSelectChange() {
    console.log('본부 선택시 부서항목 변경!!!!!!!!!!!!');
    departmentSelect.empty();
    var hqID = $('#deSelect').val();
    console.log(hqID);
    $.ajax({
        url: 'getHqID.do',
        data: { hqID: hqID },
        success: function(data) {
            console.log(data);
            var departmentText = $('#departmentSelect option:selected').text();
            var firstOptionValue = $('#departmentSelect option:first').val();
            data.forEach(function(option) {
                var $option = $('<option>', {
                    value: option.departmentID,
                    text: option.departmentName
                });

                // 여기에 원하는 조건을 추가하여 선택되도록 설정
                if (option.departmentID == dpName) {
                    $option.prop('selected', true);
                    
                }

                $('#departmentSelect').append($option);
            });
            $('#departmentSelect').val(dpName).trigger('change');

           
        },
        error: function(e) {	
            console.log(e);
        }
    });
}

function onDepartmentSelect() {
    console.log('부서 선택시 담당 변경!!!!!!!!!!!!');
    resSelect.empty();
    var departmentText = $('#departmentSelect option:selected').text();
    var selectPositionID = $('#selectPositionID').val();
    
    console.log(departmentText);
    
        $.ajax({
            url: 'getDepartmentText.do',
            data: { departmentText: departmentText },
            success: function(data) {
                console.log(data);
                data.forEach(function(option) {
                    var $option = $('<option>', {
                        value: option.responID,
                        text: option.responName
                    });

                    // 여기에 원하는 조건을 추가하여 선택되도록 설정
                    if (option.responID == psResponsibility) {
                        $option.prop('selected', true);
                        
                    }

                    $('#resSelect').append($option);
                });
            },
            error: function(e) {
                console.log(e);
            }
        });
}

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
        if(tabId == 'annualLeave' || tabId == 'departmentChangeLog'){
        	$('.formbtn').hide();
        }else{
        	$('.formbtn').show();
        }
    });
    
	getPositionName();
	getRankName();

	$('input[name="joinDate"]').val(new Date().toISOString().substring(0, 10).toString());
    $('#branchSelect').change(function() {
        onBranchSelectChange();
        console.log('지점변경!!!');
    });

    $('#deSelect').on('change', function() {
        console.log('본부변경!!!');
        onDeSelectChange();
        console.log($('#deSelect').val() + '!!!!!!!!!!!!!');
    });

    $('#departmentSelect').change(function() {
        console.log('부서변경!!!');
        console.log('@@@@@@@@@' + $(this).val());
        onDepartmentSelect();
    });

    $.ajax({
        url: 'getBranch.do',
        success: function(data) {
            console.log(data);
            data.forEach(function(option, index) {
                var $option = $('<option>', {
                    value: option.branchID,
                    text: option.branchName
                });

                // 여기에 원하는 조건을 추가하여 선택되도록 설정
                if (index == branchPsID) {
                    $option.prop('selected', true);
                    
                }

                $('#branchSelect').append($option);
            });
            $('#branchSelect').val(branchPsID).trigger('change');
        },
        error: function(e) {
            console.log(e);
        }
    });

      

    departmentSelect.empty();
    resSelect.empty();
    $('#deSelect').empty();
});
var rowIndex = 1;
var rowIndex1= 1;
function addRow() {
    var newRow = "<tr>" +
        "<td><input type='date' name='schistoryArray[" + rowIndex + "].startDate'></td>" +
        "<td><input type='date' name='schistoryArray[" + rowIndex + "].endDate'></td>" +
        "<td><input type='text' name='schistoryArray[" + rowIndex + "].organizationName'></td>" +
        "<td><input type='text' name='schistoryArray[" + rowIndex + "].remarks'></td>" +
        "<td>" +
        "<input type='hidden' name='schistoryArray[" + rowIndex + "].category' value='학력'>" +
        "<button onclick='delRow(this)' type='button' class='delBtn'  >-</button>" +
        "<button onclick='addRow()' type='button' class='addBtn' >+</button>" +
        "</td>" +
        "</tr>";

    rowIndex++;
    $("#historyTable tbody").append(newRow);
}

function delRow(btn) {
    rowIndex--;
    $(btn).closest("tr").remove();
}
function addRow1() { // 이력
	console.log('학력 추가버튼클릭');
    var newRow = "<tr>" +
        "<td><input type='date' name='historyArray[" + rowIndex1 + "].startDate'></td>" +
        "<td><input type='date' name='historyArray[" + rowIndex1 + "].endDate'></td>" +
        "<td><input type='text' name='historyArray[" + rowIndex1 + "].organizationName'></td>" +
        "<td><input type='text' name='historyArray[" + rowIndex1 + "].remarks'></td>" +
        "<td>" +
        "<input type='hidden' name='historyArray[" + rowIndex1 + "].category' value='이력'>" +
        "<button onclick='delRow1(this)' type='button' class='delBtn'>-</button>" +
        "<button onclick='addRow1()' type='button' class='addBtn'>+</button>" +
        "</td>" +
        "</tr>";
	
        rowIndex1++;
    $("#workHistoryTable tbody").append(newRow);
}


function delRow1(btn) {
    $(btn).closest("tr").remove();
}
function drawscHistoryTable() {

    $.ajax({
        url: 'ajaxGetscHistory.do',
        data: { employeeID: employeeID },
        type: 'post',
        success: function(data) {
            console.log(data);
            var tableBody = $('#historyTable tbody');
            tableBody.empty(); 

            var tableHeader = $('<tr>');
            tableHeader.append('<th>입학일</th>');
            tableHeader.append('<th>졸업일</th>');
            tableHeader.append('<th>학교명</th>');
            tableHeader.append('<th>비고</th>');
            tableHeader.append('<th>수정</th>');
            tableBody.append(tableHeader);

            // 이 부분에서 data에 들어있는 내용을 반복하면서 로우를 추가해줍니다.
            data.forEach(function(item) {
                var row = $('<tr>');
                row.append('<td style="display:none;"><input type="hidden" class="historyID" value="' + item.historyID + '"></td>');
                row.append('<td>' + item.startDate + '</td>');
                row.append('<td>' + item.endDate + '</td>');
                row.append('<td>' + item.organizationName + '</td>');
                row.append('<td>' + item.remarks + '</td>');
                row.append('<td><button onclick="delscHistory()" type="button" class="delBtn">X</button></td>');
                tableBody.append(row);
            });

            var newRow = $('<tr>');
            newRow.append('<td><input type="date" name="schistoryArray[0].startDate"></td>');
            newRow.append('<td><input type="date" name="schistoryArray[0].endDate"></td>');
            newRow.append('<td><input type="text" name="schistoryArray[0].organizationName"></td>');
            newRow.append('<td><input type="text" name="schistoryArray[0].remarks"></td>');
            newRow.append('<td><input type="hidden" name="schistoryArray[0].category" value="학력"><button onclick="addRow()" type="button" style="border: none; background: none; font-size: 25px;">+</button></td>');

            tableBody.append(newRow);
        },
        error: function(e) {
            console.log(e);
        }
    }); 	
}


function drawHistoryTable() {

    $.ajax({
        url: 'ajaxGetHistory.do',
        data: { employeeID: employeeID },
        type: 'post',
        success: function(data) {
            console.log(data);
            var tableBody = $('#workHistoryTable tbody');
            tableBody.empty(); 

            var tableHeader = $('<tr>');
            tableHeader.append('<th>입사일</th>');
            tableHeader.append('<th>퇴사일</th>');
            tableHeader.append('<th>회사명</th>');
            tableHeader.append('<th>비고</th>');
            tableHeader.append('<th>수정</th>');
            tableBody.append(tableHeader);

            // 이 부분에서 data에 들어있는 내용을 반복하면서 로우를 추가해줍니다.
            data.forEach(function(item) {
                var row = $('<tr>');
                row.append('<td style="display:none;"><input type="hidden" class="historyID" value="' + item.historyID + '"></td>');
                row.append('<td>' + item.startDate + '</td>');
                row.append('<td>' + item.endDate + '</td>');
                row.append('<td>' + item.organizationName + '</td>');
                row.append('<td>' + item.remarks + '</td>');
                row.append('<td><button onclick="delHistory()" type="button" class="delBtn">X</button></td>');
                tableBody.append(row);
            });

            var newRow = $('<tr>');
            newRow.append('<td><input type="date" name="historyArray[0].startDate"></td>');
            newRow.append('<td><input type="date" name="historyArray[0].endDate"></td>');
            newRow.append('<td><input type="text" name="historyArray[0].organizationName"></td>');
            newRow.append('<td><input type="text" name="historyArray[0].remarks"></td>');
            newRow.append('<td><input type="hidden" name="historyArray[0].category" value="이력"><button onclick="addRow1()" type="button" style="border: none; background: none; font-size: 25px;">+</button></td>');

            tableBody.append(newRow);
        },
        error: function(e) {
            console.log(e);
        }
    }); 	
}
function ajaxDepartmentLog(){
    $.ajax({
        url:'departmentChangeLog.do',
        data:{employeeID:employeeID},
        type:'post',
        success: function(data) {
            console.log(data);
            var tableBody = $('#dpChangeTable tbody');
            tableBody.empty();

            var tableHeader = $('<tr>' +
                '<th>변경일</th>' +
                '<th>변경전부서</th>' +
                '<th>변경후부서</th>' +
                '<th></th>' +
                '</tr>');
            tableBody.append(tableHeader);

            data.forEach(function(item) {
                var row = $('<tr>');
                row.append('<td style="display:none;"><input type="hidden" class="logID" value="' + item.logID + '"></td>');
                row.append('<td>' + item.changeDate + '</td>');
                row.append('<td>' + item.beforedpID + '</td>');
                row.append('<td>' + item.afterdpID + '</td>');
                row.append('<td><button onclick="delDepartmentLog()" type="button" class="delBtn">X</button></td>');

                tableBody.append(row);
            });
        },
        error:function(e){
            console.log(e);
        }
    });
}
function delHistory(){
	var historyID =$(event.target).closest('tr').find('.historyID').val();
	if(confirm("해당 이력을 삭제하시겠습니까?")){
		
	$.ajax({
		url:'delHistory.do',
		data:{historyID:historyID},
		type:'post',
		success:function(data){
			console.log(data);
			alert(data.message);
			drawHistoryTable();
		},
		error:function(e){
			console.log(e);
		}
		
	});
	}
}

function delscHistory(){
	var historyID =$(event.target).closest('tr').find('.historyID').val();
	if(confirm("해당 학력을 삭제하시겠습니까?")){
		
	$.ajax({
		url:'delscHistory.do',
		data:{historyID:historyID},
		type:'post',
		success:function(data){
			console.log(data);
			alert(data.message);
			drawscHistoryTable();
			
		},
		error:function(e){
			console.log(e);
		}
		
	});
	}
}

function delDepartmentLog(){
    var logID = $(event.target).closest('tr').find('.logID').val();
    console.log(logID);
    if(confirm("해당 로그을 삭제하시겠습니까?")){
        $.ajax({
            url:'delDepartmentLog.do',
            data:{logID:logID},
            type:'post',
            success:function(data){
                console.log(data);
                alert(data.message);
                // 삭제 성공 후에 새로운 데이터로 테이블 갱신
                ajaxDepartmentLog();
            },
            error:function(e){
                console.log(e);
            }
        });
    }
}

    // 마지막에 추가할 새로운 입력란

$('#fileInput').on('change', function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
        $('#thumbnail_image').attr('src', e.target.result);
    };
    reader.readAsDataURL(file);
});

$('#fileSignatureInput').on('change', function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
        $('#signatureImg').attr('src', e.target.result);
    };
    reader.readAsDataURL(file);
});

$('input[name="employeeID"]').on('focusout',function(){
	var employeeID = $('#employeeID').val();
	console.log(employeeID);
	$.ajax({
		url:'checkDuplicateEmployeeID.do',
		type:'POST',
		data:{employeeID:employeeID},
		success:function(result){
			if(result== true){
				$('#duplicateMsg').css('display', 'block');
				$('#employeeID').val('');
			}else{
				$('#duplicateMsg').css('display', 'none');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
})

// $('.detailSaveBtn').on('click',function(){
// 	console.log('click');
// 	if(confirm("저장 하시겠습니까?")){
// 		$('#detailSave').submit();	
// 		/* location.href = location.href; */
// 	}else{
		
// 	}
	
   
    
// });

$('#detailSave').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);

    $.ajax({
        url: 'detailSave.do',
        type: 'POST',
        data: formData,
        processData: false, // 데이터 처리 방법을 설정합니다.
        contentType: false, // 컨텐츠 타입을 설정합니다.
        success: function(response) {
            // 성공적으로 응답을 받았을 때
            console.log(response);
            alert('저장 성공');
            if(response.tabID=='workHistory'){
            	drawHistoryTable();
            }else if(response.tabID=='history'){
            	drawscHistoryTable();
            }else if(response.tabID=='basic'){
            	ajaxDepartmentLog();
            }
            // 여기서 받은 response를 이용해 테이블을 다시 그리는 로직을 추가하세요.
            // response를 통해 어떤 탭을 그릴지 판단하고 그에 맞는 로직을 구현합니다.
        },
        error: function(xhr, status, error) {
            // 오류가 발생했을 때
            console.error(error);
            // 오류 처리 로직을 추가하세요.
        }
    });

});

$('#resetPassword').on('click',function(){
	if(confirm("비밀번호를 초기화 하시겠습니까?")){
		$.ajax({
			url:'resetPassword.do',
			data:{employeeID:employeeID},
			type:'post',
			success:function(data){
				console.log(data);
			},
			error:function(e){
				console.log(e);
			}
		})
	}else{
		
	}

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
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("address").value = extraAddr;
            
            } else {
                document.getElementById("address").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address").focus();
        }
    }).open();
}
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}


</script>
</html>