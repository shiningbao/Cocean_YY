<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<link rel="icon" href="resource/img/favi.png" type="image/x-icon">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="<c:url value='/resource/css/personnel/personnel.min.css'/>">


<style>
#hTitle {
	width: 120px;
	height: 50px;
	left: 400px;
	position: absolute;
	top: 120px;
}

#hTitle a {
	font-size: 22px;
}

.photo {
	justify-content: start !important;
}
/* 컨텐츠 영역 */
.content {
    margin: 20px auto;
    width: 80%;
    background-color: #fff;
    padding: 20px;

}

.wrap_info_content {
        margin-left: 17%;
    margin-top: 15% !important;
}

/* 테이블 */
table {
    width: 80%%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f4f4f4;
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
.subPs1{
}
.subPs2{
	
}

.type_list_box{
	margin-left: 20%;
    width: 90%;
}

.tab_menu {
    list-style: none;
    padding: 0;
    margin: 0;
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

.tab_content {
    display: none;
    border: 1px solid #ccc;
    padding: 10px;
    background-color: #fff;
    border-radius: 0 0 5px 5px;
}

.tab_content.active {
    display: block;
}
.tab_menu_wrap{
	margin-left: 27%;
}
    .tab.active {
        color: grey; /* 회색으로 변경 */
        font-size: 90%; /* 글씨 크기 조정 */
    }

    /* 탭 내용 숨김 */
    .tab-content {
        display: none;
    }

    /* 활성화된 탭 내용 표시 */
    .tab-content.active {
        display: block;
    }
</style>
</head>
<body>
	<jsp:include page="../side.jsp"></jsp:include>
	<div id="hTitle">
		<a>사원상세</a>
	</div>
	<c:forEach var='person' items="${list}">
	<div class="content">
		<div class="wrap_info_content" style="margin-top: 10%;">
			<div class="wrap_header">
				<div class="wrap_photo">
				    
				</div>




			</div>
		</div>
		 <table class="type_list_box">
        <tbody>
            <tr>
                <td class="profile_image" rowspan="4">
                    <span class="img_profile">
                       <label class="photo" for="fileInput" style="width: 10%;">
                        <c:choose>
                            <c:when test="${person.profileImage != null}">
                                <img src="/photo/cocean/personnel/${person.profileImage}" id="thumbnail_image" alt="프로필 사진">
                            </c:when>
                            <c:otherwise>
                                <img src="/Cocean/resource/img/psProfile.jpg" id="thumbnail_image" alt="프로필 사진">
                            </c:otherwise>
                        </c:choose>
				    </label>
                    </span>
                </td>
                <th class="name">이름</th>
                <th class="team">소속</th>
                <td class="last" colspan="3">${person.departmentName }</td>
            </tr>
            <tr>
                <td class="name_txt" rowspan="3">
                    <p class="kor">오광숙</p>

                </td>
                <th class="number">사번</th>
                <td class="number_txt">${person.employeeID }</td>
                <th class="telephone">지점</th>
                <td class="telephone_txt last">${person.branchName }</td>
            </tr>
            <tr>
                <th class="email">직위 / 직책</th>
                <td class="email_txt">${person.positionName} / ${person.rankName }</td>
                <th class="mobile">휴대번호</th>
                <td class="mobile_txt last">${person.phoneNumber }</td>
            </tr>
            <tr>
                <th class="rank">담당</th>
                <td class="rank_txt">${person.responsibility }</td>
                <th class="address">주소</th>
                <td class="address_txt ">${person.address }</td>
            </tr>
        </tbody>
    </table>
    </div>
    </c:forEach>
			<div class="tab_menu_wrap">
    <div>
        <ul class="tab_menu">
            <li data-tab="basic" class="tab">기본</li>
			<li data-tab="workHistory" class="tab">이력</li>
			<li data-tab="history" class="tab">학력</li>
			<li data-tab="departmentChangeLog" class="tab">발령</li>
			<li data-tab="vacation" class="tab">휴직</li>
			
            <!-- 다른 탭 추가 -->
        </ul>
        <div class="tab_content" id="basic">
            <!-- 기본 탭 내용 -->
            <table class="type_list_box">
                <tbody>
                    <!-- 기본 탭의 내용 -->
                </tbody>
            </table>
        </div>
        <div class="tab_content" id="detail" style="display: none;">
            <!-- 신상 탭 내용 -->
            <table class="type_list_box">
                <tbody>
                    <!-- 신상 탭의 내용 -->
                </tbody>
            </table>
        </div>
		<!-- 이력 탭 내용 -->
		<div class="tab-content" id="historyTab" style="display: none;">
		    <table>
		        <tr>
		            <th>시작일</th>
		            <th>종료일</th>
		            <th>회사명</th>
		            <th>비고</th>
		        </tr>
		        <c:forEach var="history" items="${employeeHistory}">
		            <tr>
		                <td>${history.startDate} </td>
		                <td>${history.endDate}</td>
		                <td>${history.organizationName}</td>
		                <td>${history.remarks}</td>
		            </tr>
		        </c:forEach>
		    </table>
		</div>
		<!-- 학력 탭 내용 -->
		<div class="tab-content" id="workHistoryTab" style="display: none;">
		    <table>
		        <tr>
		            <th>입학일</th>
		            <th>졸업일</th>
		            <th>학교명</th>
		            <th>비고</th>
		        </tr>
		        <c:choose>
		            <c:when test="${empty workHistory}">
		                <tr>
		                    <td colspan="4">학력 정보가 없습니다.</td>
		                </tr>
		            </c:when>
		            <c:otherwise>
		                <c:forEach var="history" items="${workHistory}">
		                    <tr>
		                        <td>${history.startDate}</td>
		                        <td>${history.endDate}</td>
		                        <td>${history.organizationName}</td>
		                        <td>${history.remarks}</td>
		                    </tr>
		                </c:forEach>
		            </c:otherwise>
		        </c:choose>
		    </table>
		</div>
            	<div class="subPs2 tab-content" id="departmentChangeLogTab" style="display: none;">
					<table>	
				            <tr>
				                <th>입학일</th>
				                <th>졸업일</th>
				                <th>학교명</th>
				                <th>비고</th>
				            </tr>
				            <tr>
				                <td colspan=""></td>
				                <td colspan=""></td>
				                <td colspan=""></td>
				                <td colspan=""></td>
				            </tr>
				        </table>

			
            </div>
    </div>
    <div class="tool_bar">
        <span class="btn_wrap">
            <span class="ic_classic ic_close" id="foldTab" style="display:none"></span>
            <span class="ic_classic ic_open" id="unfoldTab"></span>
        </span>
    </div>
</div>

		


</body>
<script>
$(".tab").click(function() {
    // 모든 탭 컨텐츠를 숨김
    $(".tab-content").hide();
    // 클릭한 탭의 데이터 연결
    var tabId = $(this).attr("data-tab");
    $("#" + tabId + "Tab").show(); // 해당하는 컨텐츠만 보이도록 함
});
</script>
</html>