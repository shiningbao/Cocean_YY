<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>주소록 상세보기</title>
<style>
 table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
    
    
    
    .detail-out {
        width: 400px; /* 테이블 전체의 너비를 설정 */
        margin: auto; /* 가운데 정렬 */
       
    }

    .detail-out th, .detail-out td {
        padding: 10px; /* 테이블 셀의 안쪽 여백 설정 */
         height: 60px; /* 행의 높이 설정 */
    }

    .detail-out input {
        width: 100%; /* 입력란의 너비를 100%로 설정 */
        box-sizing: border-box; /* 너비에 padding과 border를 포함시킴 */
    }

    .detail-out input[type="submit"],
    .detail-out input[type="button"] {
        width: auto; /* 저장 및 리스트 버튼의 너비를 자동으로 설정 */
    }
    
    .detail-container{
    display: flex;
        justify-content: center;
        align-items: center;
        height: 80%; 
        margin-right:100px;    
    }
    
    
</style>
</head>
<body>

<c:import url="/side" />
	<div class="container-fluid contentField">  
	
 <div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">주소록 상세보기</h1>
	</div>  
 
 <div class="card shadow p-3"> 
 <div class="detail-container">  
 <table class="detail-out">

       <tr>
             <th>이름</th>
             <!--inaddress는 내가 백단에서 이름 지정한걸 가지고 와서 사용한다  -->
             <td>${outaddress.name}</td>
         </tr>
         <tr>
             <th>직급</th>
             <td>${outaddress.rankLevel}</td>
         </tr>
         <tr>
             <th>직책</th>
             <td>${outaddress.positionLevel}</td>
         </tr>
         <tr>
             <th>부서</th>
            <td>${outaddress.departmentName}</td> 
         </tr>
         <tr>
             <th>전화번호</th>
             <td>${outaddress.phoneNumber}</td>
         </tr>
   <!--  
         <tr>
             <th colspan="2">
                  <input type="button" onclick="location.href='./outsideupdate?addressNumber=${outaddress.addressNumber}'" value="수정"/>   
                 <input type="button" onclick="location.href='./list'" value="리스트"/>
             </th>
         </tr>
         -->
          <tr>
             <th colspan="2" style="text-align: center;">
                 <input class="btn btn-outline-primary detailCancleBtn" id="list" onclick="location.href='./list'" value="리스트" style="width:70px;"/>
				 <button type="submit" id="update" class="btn btn-primary" onclick="location.href='./outsideupdate?addressNumber=${outaddress.addressNumber}'" >수정</button>
             </th>
         </tr>
     </table>
     </div>
</div>
</div>
</body>
</html>