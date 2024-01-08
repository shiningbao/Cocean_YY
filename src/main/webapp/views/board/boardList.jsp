<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<c:import url="/side"/>
	<div class="container-fluid contentField">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">${bt}</h1>
		</div>
		<button onclick="location.href='write.go'">글쓰기</button>
		<table>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${list_pin}" var="item">
				<tr>
					<td>공지</td>
					<td><a href="detail?boardID=${item.boardID}">${item.title}</a></td>
					<td>${item.name}</td>
					<td>${item.creationDate}</td>
				</tr>
			</c:forEach>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.boardID}</td>
					<td><a href="detail?boardID=${item.boardID}">${item.title}</a></td>
					<td>${item.name}</td>
					<td>${item.creationDate}</td>
				</tr>
			</c:forEach>
		
		
		</table>
	</div>
</body>

<script>
	var msg = "${msg}";
	if(msg != ""){
		swal({
			title: msg,
			button: '확인'
		});
	}

</script>
</html>