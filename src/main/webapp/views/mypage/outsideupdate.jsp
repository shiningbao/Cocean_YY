<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>

<table>
         <tr>
             <!--공백문자-->
             <th>이&nbsp;&nbsp;&nbsp;&nbsp;름</th>
             <th>
                 <input type="text" name="name" placeholder="이름을 입력해주세요." value="${sessionScope.userInfo.name}"/>
             </th>
         </tr>
         <tr>
             <th>직책</th>
             <th>
                 <input type="text" name="positionLevel" placeholder="직책을 입력해주세요." />
             </th>
         </tr>
         <tr>
             <th>부서</th>
             <th>
                 <input type="text" name="departmentName"placeholder="부서를 입력해주세요." "/>
             </th>
         </tr>
          <tr>
             <th>직급</th>
             <th>
                 <input type="text" name="rankLevel" placeholder="직급을 입력해주세요." />
             </th>
         </tr>
          <tr>
             <th>전화번호</th>
             <th>
                 <input type="text" name="phoneNumber" placeholder="전화번호를 입력해주세요." value="${sessionScope.userInfo.phoneNumber}"/>
             </th>
         </tr>
    
         <tr>
             <th colspan="2">
                 <input type="submit" value="수정" />
             </th> 
     </table>
      
        
</body>
<script>





</script>
</html>