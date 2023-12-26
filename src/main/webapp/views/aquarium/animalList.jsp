<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
<c:import url="/side"/>
<h1>ANIMAL LIST</h1>
담당자 <input type="text" name="personnel"/>
국명/애칭 <input type="text" name="search"/><br/>
<input type="checkbox" name="all"/>전체
<button id="search">검색</button>
<br/><br/><br/>
<button id="write">등록</button>

<table>
	<tr>
		<th>ID</th>
		<th>애칭</th>
		<th>국명</th>
		<th>분류</th>
		<th>상태</th>
	</tr>
	<c:forEach items="${list}" var="item">
		<tr>
		<td><a href="detail.go?animalID=${item.getAnimalID()}&nickname=${item.getNickname()}">${item.getAnimalID()}</a></td>
		<td>${item.getNickname()}</td>
		<td>${item.getCommonName()}</td>
		<td>${item.getClassificationCode()}</td>
		<td>${item.getStatus()}</td>
		</tr>
	</c:forEach>
</table>
</body>

<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
	$('#write').on('click',function(){
		location.href='write.go';
	});




</script>




</html>