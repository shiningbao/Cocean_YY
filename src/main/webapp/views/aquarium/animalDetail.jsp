<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
<h1>ANIMAL DETAIL</h1>
<table>
	<tr>
		<th>speciesID</th>
		<th>${dto.speciesID}</th>
	</tr>
	<tr>
		<th>tankID</th>
		<th>${dto.tankID}</th>
	</tr>
	<tr>
		<th>classificationCode</th>
		<th>${dto.classificationCode}</th>
	</tr>
	<tr>
		<th>codeNumber</th>
		<th>${dto.codeNumber}</th>
	</tr>
	<tr>
		<th>individual</th>
		<th>${dto.individual}</th>
	</tr>
	<tr>
		<th>status</th>
		<th>${dto.status}</th>
	</tr>
	<tr>
		<th>personnel</th>
		<th>
			<c:forEach items="${personnel}" var="pe" >
				${pe.hqName} / ${pe.departmentName} / ${pe.name}<br/>
			</c:forEach>
		</th>
	</tr>

</table>







</body>
<script>



</script>
</html>