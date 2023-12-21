<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>
	<div>
		<h3>상품 등록</h3>
		<p>상품명<input type="text" id="" placeholder="상품명을 입력해주세요"></p>
		<p>가격<input type="text" id="" placeholder="가격을 입력해주세요"></p>
		<p>지점명<input type="text" id="" placeholder="지점명을 입력해주세요"></p>
		<p>사진<input type="text" id="" placeholder="상품명을 입력해주세요"></p>
		<input type="file" name="files" multiple="multiple">
	</div>
</body>
</html>