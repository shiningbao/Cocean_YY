<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>


/*주 내용*/
.list_box {
    border-collapse: collapse;
    width: 80%;
    height: 300px;
    margin: 0 auto;
    margin-top:-60px;
}

.list_box th, .list_box td {
    padding: 15px;
    text-align: left;
    border: 1px solid #000; 
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

  #thumbnail_image {
     width: 250px; 
    height: 250px; 
    margin-left: -30px; 
    margin-top:15px;
  }



#usermody{
	position: absolute;
    top: 70px;
    right: 0;
    left:1352px;
    margin-right: 50px;
    width: 100px;
    height: 40px;
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
			<div class="wrap_info_content" style="margin-top: 10%;">
				<div class="wrap_header">
					<div class="wrap_photo"></div>
	</div>
			</div>
	
		
		<button type="button" id="usermody" class="btn btn-primary" OnClick="location.href ='./mypageupdate'">수정</button>	
		
		 <table class="list_box">
            <tr>
               <td class="profile_image" rowspan="4" style="width: 10%"><span
							class="img_profile"> <label class="photo" for="fileInput"> 
								<label class="photo" for="fileInput">
								<c:choose>
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
                
                <th class="name" >이름</th>
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
				<td class="rank_txt">${mypage.responName }</td>
                <th class="address">주소</th>
                <td class="address_txt ">${mypage.address }</td>
               
            </tr>
 
    </table>

   

 <div id="Synthesis">
			<div class="Synthesiscount">
				발생한 연차
				<div id="count_1">${getEmployeeAnnual.value}일</div>
			</div>

			<div class="Synthesiscount">
				잔여 연차 일수
				<div id="count_2">${mypage.remainingAnnualLeave}일</div>
			</div>

			<div class="Synthesiscount">
				사용 연차
				<div id="count_3">${getEmployeeAnnual.value - mypage.remainingAnnualLeave}일</div>
			</div>
		</div>



</div> 

  </div>      
    
        
   </div>     
    
</body>
<script>






</script>
</html>