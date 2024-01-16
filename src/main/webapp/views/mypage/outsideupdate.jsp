<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
    
  #addressupdate {
        width: 30%; 
        margin: 0 auto; 
        border-collapse: collapse;
    }

    #addressupdate th,
    #addressupdate td {
        height: 70px;
        padding: 10px; 
 
    }
 
   #addressupdate input{
   	width:350px;
   }
    
   
</style>
</head>
<body>

<c:import url="/side" />

<div class="container-fluid contentField"> 
<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">주소록 수정</h1>
	</div>  

<div class="card shadow p-3"> 
<form action="outaddressupdate" method="post" id="out">
<input type="hidden" name="addressNumber" value="${outaddress.addressNumber}"/>
<table id="addressupdate">

         <tr>
             <!--공백문자-->
             <th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
             <th>
                 <input type="text" name="name" placeholder="이름을 입력해주세요." value="${outaddress.name}"/>
             </th>
         </tr>
          <tr>
             <th>전화번호</th>
             <th>
                 <input type="text" name="phoneNumber" id="phoneNumberup" placeholder="전화번호를 입력해주세요." onblur="validatePhoneNumber(this)" value="${outaddress.phoneNumber}"/>
             </th>
         </tr>
          <tr>
             <th>회사명</th>
             <th>
                 <input type="text" name="CompanyName" placeholder="회사명을 입력해주세요." value="${outaddress.companyName}"/>
             </th>
         </tr>
         <tr>
             <th>직급</th>
             <th>
                 <input type="text" name="rankLevel" placeholder="직급을 입력해주세요."  value="${outaddress.rankLevel}"/>
             </th>
         </tr>
         <tr>
             <th>직책</th>
             <th>
                 <input type="text" name="positionLevel" placeholder="직책을 입력해주세요." value="${outaddress.positionLevel}" />
             </th>
         </tr>
         <tr>
             <th>부서</th>
             <th>
                 <input type="text" name="departmentName"placeholder="부서를 입력해주세요." value="${outaddress.departmentName}" />
             </th>
         </tr>
          
         
    
         <tr>

             <th colspan="2"> 
             <div class="update-con" style="text-align: center;">
								<button type="button" id="info-del-btn"
									class="btn btn-outline-primary" onclick="location.href='./list'" value="취소">취소</button>
								<button type="submit" id="info-update-btn"
									class="btn btn-primary">수정</button>
							</div>
   				</th>
     </table>
 </form>     
  </div>
        </div>
        
</body>
<script>

var msg = "${msg}";
if(msg != ""){
   swal(msg,'','success');
}
function validatePhoneNumber() {
    // 입력된 값에 '-'가 포함되어 있는지 확인
    var input = document.getElementById("phoneNumberup");
    
    console.log("Input value:", input.value);

    if (input.value.indexOf('-') === -1) {
        swal("숫자와 '-'(하이픈)를 포함해서 입력해주세요.", "", "error");
        // 입력 값이 유효하지 않으면 값을 비워줄 수도 있습니다.
        input.value = "";
    }
}


</script>
</html>