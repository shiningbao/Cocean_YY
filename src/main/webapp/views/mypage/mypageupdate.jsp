<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<style>
.update {
    border: 2px solid #020715; /* 테두리의 두께와 색상 설정 */
    padding: 10px; /* 테두리와 내용 사이의 간격 설정 */
    width: 300px; /* 테두리가 포함된 div 요소의 너비 설정 */
    margin: 0 auto; /* 가운데 정렬을 위한 margin 설정 */
  }

</style>


</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>
<!--  
<form action="/mypage/pwUpdate" method="post" id="pwUpdateForm" name="pwUpdateForm">
                       <input type="hidden" id="memberId" name="memberId" value="${login.memberId}">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
                <div class="form-group">
                    <input type="password" name="memberPw" id="memberPw" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" name="memberPw1" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" name="memberPw2" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
                </div>
                <button type="button" id="pwUpdate" name="pwUpdate" class="btn btn-primary">수정</button> <a href="mypage/mypage" class="btn btn-default">취소</a>
            </div>
        </div>
    </div>
    </form>
 -->
 
   
 <form action="changePw" method="post" name="mypage=form">
 
 <div class="update">
 <h2 class="pwupadte">비밀번호 수정 </h2>
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


	</div>
	<!--  
		<input type="button" onclick="location.href='./mypageback'" value="이전"/>
	-->	
		<button type="submit" id="info-update-btn">수정</button>
	</div>

	</form>
    
    
    
    
    
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
	         checkPw.css("color", "green");
	      } else {
	         checkPw.html("비밀번호가 불일치합니다.");
	         checkPw.css("color", "red");
	      }
	   } else {
	      checkPw.html(""); 
	   }
	});



/*
$('.pw').keyup(function(){
   let pass1 =$("#password_1").val();
   let pass2 =$("#password_2").val();
   
   if(pass1 != "" || pass2 !=""){
      if(pass1 == pass2){
         $("#checkPw").html("비밀번호가 일치합니다.");
         $("#checkPw").attr("color","green");
      }else{
         $("#checkPw").html("비밀번호가 불일치합니다.");
         $("#checkPw").attr("color","red");
      }
   }
})*/


/*
$(document).ready(function(){
	
	$("#pwUpdate").on("click", function(){
		if($("#memberPw").val==""){
			alert("현재 비밀번호를 입력해주세요");
			$("#memberPw").focus();
			return false
		}
		if($("#memberPw1").val==""){
			alert("변경비밀번호을를 입력해주세요");
			$("#memberPw1").focus();
			return false
		}
		if($("#memberPw2").val==""){
			alert("변경비밀번호를 입력해주세요");
			$("#memberPw2").focus();
			return false
		}
		if ($("#memberPw").val() != $("#memberPw2").val()) {
			alert("변경비밀번호가 일치하지 않습니다.");
			$("#memberPw2").focus();
			 
		
		$.ajax({
			url : "pwCheck",
			type : "POST",
			dataType : "json",
			data : $("#pwUpdateForm").serializeArray(),
			success: function(data){
				
				if(data==0){
					alert("패스워드가 틀렸습니다.");
					return;
				}else{
					if(confirm("변경하시겠습니까?")){
						$("#pwUpdateForm").submit();
					}
					
				}
			}
		})
		
	});
	
		
	
})*/





</script>
</html>