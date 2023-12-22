<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<form action="outsidejoins" method="post">
     <table>
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
             <th colspan="2">
                 <input type="submit" value="저장" />
                 <input type="button" name ="del" id="del" value="삭제" onclick="return check()"/>
             </th>
         </tr>
     </table>
 </form>
</body>
<script>


</script>
</html>