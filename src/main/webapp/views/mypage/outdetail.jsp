<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>주소록 상세보기</title>
<style>

</style>
</head>
<body>

 <table>

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
   
         <tr>
             <th colspan="2">
           		 <input type="button" onclick="location.href='./outsideupdate?addressNumber=${outaddress.addressNumber}'" value="주소록 수정ㄴ"/>	
             </th>
         </tr>
     </table>

</body>
</html>