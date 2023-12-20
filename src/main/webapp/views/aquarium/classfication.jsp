<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
<h1>CLASSFICATION</h1>

<input type="text" id="keyword"/>
<button id="search" onclick="classficationSearch()">검색</button>
<table>
	<tr>
		<th>분류</th>
		<th>학명</th>
		<th>국명</th>
	</tr>
	<c:forEach items="list" var="item">
	<tr>
		<td>${item}</td>
		<td>${item}</td>
		<td>${item}</td>
	</tr>
	</c:forEach>


</table>
</body>
<script>
function classficationSearch(){
	var keyword = $('#keyword').val();
	$.ajax({
		type:'get',
		url:'classficationSearch',
		data:{'keyword':keyword},
		dataType:'JSON',
		success:function(data){
			console.log(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}





</script>
</html>