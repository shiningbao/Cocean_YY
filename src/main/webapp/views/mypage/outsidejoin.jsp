<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
    table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
    
    
      .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 80%; 
        margin-right:140px;
        
    }

    form {
        width: 300px; 
    }

    table {
        width: 100%;
    }
    
    
     .addressjoin {
        width: 450px; /* 테이블 전체의 너비를 설정 */
        margin: auto; /* 가운데 정렬 */
       
    }

    .addressjoin th, .addressjoin td {
        padding: 10px; /* 테이블 셀의 안쪽 여백 설정 */
         height: 60px; /* 행의 높이 설정 */
    }

    .addressjoin input {
        width: 100%; /* 입력란의 너비를 100%로 설정 */
        box-sizing: border-box; /* 너비에 padding과 border를 포함시킴 */
    }

    .addressjoin input[type="submit"],
    .addressjoin input[type="button"] {
        width: auto; /* 저장 및 리스트 버튼의 너비를 자동으로 설정 */
    }
  
</style>
</head>
<body>

<c:import url="/side" />



    <!-- div 건들지 말기 -->
<div class="container-fluid contentField"> 

<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">주소록 추가</h1>
	</div>  
<div class="form-container"> 
<form action="outsidejoins" method="post">
     <table class="addressjoin ">
         <tr>
             <!--공백문자-->
             <th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
             <th>
                 <input type="text" name="name" placeholder="이름을 입력해주세요."/>
             </th>
         </tr>
         <tr>
             <th>직책</th>
             <th>
                 <input type="text" name="positionLevel" placeholder="직책을 입력해주세요."/>
             </th>
         </tr>
         <tr>
             <th>부서</th>
             <th>
                 <input type="text" name="departmentName"placeholder="부서를 입력해주세요."/>
             </th>
         </tr>
          <tr>
             <th>직급</th>
             <th>
                 <input type="text" name="rankLevel" placeholder="직급을 입력해주세요."/>
             </th>
         </tr>
          <tr>
             <th>전화번호</th>
             <th>
                 <input type="text" name="phoneNumber" placeholder="전화번호를 입력해주세요."/>
             </th>
         </tr>
    
         <tr>
             <th colspan="2" style="text-align: center;">
                 <input class="btn btn-outline-primary detailCancleBtn" id="list" onclick="location.href='./list'" value="리스트" type="button"style="width:70px;"/>
				 <button type="submit" id="save" class="btn btn-primary">저장</button>
             </th>
         </tr>
     </table>
 </form>
</div>
 </div>
</body>
<script>


</script>
</html>