<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
table,th,td{
		border : 1px solid black;
		border-collapse : collapse;
		padding : 5px 10px;
}

table{
	width : 500px;
}

input[type="text"]{
	width : 100%;
}

button{
	margin : 5px 0;
}
</style>
</head>
<body>
	<table>
		<tr>
			<th>기안자</th>
			<td>${draftInfo.name}</td>
		</tr>
		<tr>
			<th>소속부서</th>
			<td>${draftInfo.departmentName}</td>
		</tr>
		<tr>
			<th>기안일</th>
			<td>${draftInfo.workDate}</td>
		</tr>
	</table>

</body>
<script>

</script>
</html>