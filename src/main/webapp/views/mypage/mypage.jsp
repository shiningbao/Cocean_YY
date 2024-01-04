<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
#tank_head {
	background-color: #86B0F3;
}

#tank_table {
	width: 72%;
	height: 80%;
	text-align: center;
	position: absolute;
	top: 255px;
	left: 400px;
}

/*
    .list_box {
        margin: 200px auto; 
        width: 80%; 
        text-align: center; 
        vertical-align: middle; 
    }

    .list_box th,
    .list_box td {
        text-align: center;
        padding: 10px; 
    }



 .remain-full {
        border: 1px solid #ccc; 
        padding: 10px; 
        margin-bottom: 20px; 
        width: 80%;
        text-align: center; 
    }

    .remain-full th,
    .remain-full td {
        border: 1px solid #ccc; 
        padding: 8px; 
    }

*/
/*주 내용*/
.list_box {
    border-collapse: collapse;
    width: 70%;
    margin: 0 auto;
}

.list_box th, .list_box td {
    padding: 15px;
    text-align: left;
    border: 1px solid #000; /* Set the border color to black (#000) */
}

.profile_image {
    vertical-align: top;
}

.img_profile {
    display: inline-block;
    width: 150px;
    height: 150px;
    text-align: center;
}

  .img_profile img {
    width: 100%;
    height: 100%;
    border-radius: 50%; /* 이미지를 동그랗게 만듭니다. */
  }









/*연찯,반차*/
#Synthesis {
	margin-left: 430px;
	margin-top: 50px;
	text-align: center;
}

#Synthesis .Synthesiscount {
    float: left;
    text-align: center;
    margin: 5px;
    border: 1px solid #86B0F3;
    border-radius: 50%; /* 50%로 설정하여 동그랗게 만듭니다 */
    width: 300px; /* 너비를 조절하려는 값으로 변경하세요 */
    height: 100px; /* 높이를 조절하려는 값으로 변경하세요 */
    padding: 20px; /* 안쪽 여백을 조절하려는 값으로 변경하세요 */
}

.Synthesiscount div {
    padding-top: 30px; /* 내부 div의 여백을 조절하려는 값으로 변경하세요 */
}

  #thumbnail_image {
     width: 180px; /* 이미지의 너비를 조절 */
    height: 180px; /* 이미지의 높이를 조절 */
    /* border-radius: 50%; */ /* 동그랗게 만드는 스타일 제거 */
    margin-left: -30px; /* 왼쪽으로 이동하는 마진을 조절 */
  }

/*수정버튼*/
 #buttonContainer {
    /* text-align: center; */ /* 가운데 정렬 스타일 제거 */
    margin-top: 50px; /* 위 여백을 더 조절 */
  }

  #usermody {
    padding: 10px 20px; /* 버튼 내부 여백을 작게 조절 */
    font-size: 14px; /* 버튼 텍스트 크기를 작게 조절 */
    background-color: #86B0F3; /* 하늘색 배경색 */
    color: white; /* 글자색을 조절 */
    border: none; /* 테두리를 없앰 */
    border-radius: 5px; /* 둥근 테두리를 생성 */
    cursor: pointer; /* 커서 스타일을 변경하여 클릭 가능함을 나타냄 */
    margin-top: 20px; /* 아래로 이동 */
    margin-right: 50px; /* 오른쪽으로 이동 */
  }

  #usermody:hover {
    background-color: #5F9EA0; /* 호버 시 배경색을 조절 */
  }
</style>
</head>
<body>

<jsp:include page="../side.jsp"></jsp:include>


<!--  
    <c:url value=''/>
    -->
 

<div id="title">
		<a>내 정보</a>
	</div>
	        <div id="buttonContainer">
  <input type="button" id="usermody" OnClick="location.href ='./mypageupdate'" value="수정">
</div>
	
	
	<div class="content">
			<div class="wrap_info_content" style="margin-top: 10%;">
				<div class="wrap_header">
					<div class="wrap_photo"></div>
	</div>
			</div>
	<c:forEach var='mypage' items="${list}">

		 <table class="list_box">
            <tr>
                <td class="profile_image" rowspan="4">
                    <span class="img_profile">
                       <label class="photo" for="fileInput" style="width: 10%;">
                        <c:choose>
                            <c:when test="${mypage.profileImage != null}">
                                <img src="/photo/cocean/personnel/${mypage.profileImage}" id="thumbnail_image" alt="프로필 사진">
                            </c:when>
                            <c:otherwise>
                                <img src="/Cocean/resource/img/psProfile.jpg" id="thumbnail_image" alt="프로필 사진">
                            </c:otherwise>
                        </c:choose>
				    </label>
                    </span>
                </td>
                
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
                <td class="email_txt">${mypage.positionName} / ${mypage.rankName }</td>
                <th class="mobile">휴대번호</th>
                <td class="mobile_txt last">${mypage.phoneNumber }</td>
            </tr>
            <tr>
                <th class="rank">담당</th>
                <td class="rank_txt">${mypage.responsibility }</td>
                <th class="address">주소</th>
                <td class="address_txt ">${mypage.address }</td>
                
            </tr>
 
    </table>
 <div id="Synthesis">
			<div class="Synthesiscount">
				남은 연차 
				<div id="count_1">${mypage.remainingAnnualLeave}</div>
			</div>

			<div class="Synthesiscount">
				사용 연차 일수
				<div id="count_2"></div>
			</div>

			<div class="Synthesiscount">
				사용 반차 시간
				<div id="count_3"></div>
			</div>
		</div>
 
 
 
 
   
    </c:forEach>





        
        
        
        
    
</body>
<script>






</script>
</html>