<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
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
		<div class="mypage-row">
			<label>현재 비밀번호</label>
			<input type="password" name="currentPw" id="currentPw" maxlength="20"/> 
		</div>
		<div class="mypage-row">
			<label>새 비밀번호</label>
			<input type="password" name="newPw" maxlength="20"/> 
		</div>
		<div class="mypage-row">
			<label>새 비밀번호 확인</label>
			<input type="password" name="newPwConfirm" maxlength="20"/> 
		</div>
		<input type="button" onclick="location.href='./list'" value="리스트"/>
		<button id="info-update-btn">수정</button>
	</form>
    
    

    
</body>

<script>
var msg = "${msg}";
if(msg != ""){
   alert(msg);
}





/*type="text/javascript" 신경 안써도됨*/
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
		});
		}
	});
	
		
	
});
*/

</script>
</html>