<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<!-- <link rel="stylesheet" href="resource/css/common.css" type="text/css"> -->
</head>
<body>
	<table>
		<tr>
			<th>유형</th>
			<th>문서양식</th>
		</tr>
		<!-- 내용 -->
		<c:forEach items="${list}" var="form">
		<tr>
			<td>${form.category}</td>
			<td><a href="detail?titleID=${form.titleID}">${form.titleID}</a></td>
		</tr>	
		</c:forEach>
	</table>
	
</body>
<script></script>
</html>