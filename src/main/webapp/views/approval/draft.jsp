<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resource/richtexteditor/rte_theme_default.css'/>">

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script type="text/javascript" src="<c:url value='/resource/richtexteditor/rte.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/plugins/all_plugins.js'/>"></script>
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
	<c:forEach items="${draftInfo}" var="draft">
		<table>
			<tr>
			    <th>기안자</th>
			    <td>${draft.name}</td>
			</tr>
			<tr>
			    <th>소속부서</th>
			    <td>${draft.departmentName}</td>
			</tr>
			<tr>
			    <th>기안일</th>
			    <td>${draft.workDate}</td>
			</tr>
		</table>
	</c:forEach>
	<br/>
<table>
	<tr>
		<th>제목</th>
			<td></td>
		</tr>
		<tr>
		    <th>합의</th>
		    <td></td>
		</tr>
		<tr>
			<td colspan="2"></td>
	</tr>
</table>
</body>
<script>
	
</script>
</html>