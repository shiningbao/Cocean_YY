<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>

<div>
	<table>
		<tr>
			<th>애칭</th>
			<th>국명</th>
			<th>인덱스</th>
			<th>이미지</th>
		</tr>
		<c:forEach items="${list}" var="item">
			<tr onclick="detailGo(${item.animalID},${item.nickname})">
			<th><a href="<c:url value='detail.go?animalID=${item.animalID}&nickname=${item.nickname}'/>">${item.nickname}</a></th>
			<th><a href="<c:url value='detail.go?animalID=${item.animalID}&nickname=${item.nickname}'/>">${item.commonName}</a></th>
			<th><a href="<c:url value='detail.go?animalID=${item.animalID}&nickname=${item.nickname}'/>">${item.animalCode}</a></th>
			<th><a href="<c:url value='detail.go?animalID=${item.animalID}&nickname=${item.nickname}'/>">${item.serverFileName}</a></th>
			</tr>
		</c:forEach>
	
	</table>



</div>




</body>
<script>
function detailGo(animalID, nickname){
	
}
</script>
</html>