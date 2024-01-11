<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<style>

.update {
 border: 2px solid #020715;
    padding: 20px; /* Increased padding for better spacing */
    width: 400px; /* Adjust the width as needed */
    margin: 50px auto 50px auto; /* Adjust the top, bottom, left, and right margins as needed */
    position: absolute;
    top: 45%;
    left: 55%;
    transform: translate(-50%, -50%);
}
 
 
.mypage-row label {
    display: block;
    margin-bottom: 8px;
}

.mypage-row input {
    width: 100%;
    padding: 8px;
    margin-bottom: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
} 
 
 
.button-container {
    display: flex;
    gap: 10px;
    justify-content: center; /* 가로 정렬을 가운데로 설정합니다. */
    margin-top: 20px; /* 필요에 따라 상단 여백을 조절할 수 있습니다. */
}

</style>


</head>
<body>

<c:import url="/side" />

<div class="container-fluid contentField"> 

<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">비밀번호 수정</h1>
	</div>  



 <form action="changePw" method="post" name="mypage=form">

 <div class="update">

		<div class="mypage-row">
			<label>현재 비밀번호</label>
			<input type="password" name="currentPw" id="currentPw"  maxlength="20"/> 
		</div>
		<div class="mypage-row">
			<label>새 비밀번호</label>
			<input type="password" name="newPw" id="password_1" class="pw" maxlength="20"/> 
		</div>
		<div class="mypage-row">
    <label>새 비밀번호 확인</label>
    <input type="password" name="newPwConfirm" id="password_2" class="pw" maxlength="20"/>
	
	<th colspan="2" id="pwCh">
           <font id="checkPw" size ="2"></font>          
       </th>


	</div >
	<div class="button-container">
		<!--  
		 <button class="btn btn-outline-primary detailCancleBtn" id="cancel" onclick="location.href='./mypageback'">취소</button>
		-->
		<button type="submit" id="info-update-btn" class="btn btn-primary">수정</button>
	</div>
	</div>

	</form>
    
    </div>
  
   
    
</body>

<script>
var msg = "${msg}";
if(msg != ""){
   alert(msg);
}



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