<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
</style>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>
<form>
	<table>
	<tr>
	    <th>상품번호</th>
	    <td>${list.productID}</td>
  	</tr>
    <tr>
        <th>상품명</th>
        <td>${list.productName}</td>
    </tr>
    <tr>
        <th>가격</th>
        <td>${list.price}</td>
    </tr>
    <tr>
        <th>카테고리</th>
        <td>${list.category}</td>
    </tr>
    <tr>
        <th>사진</th>
        <td><img src="/Users/chajaeho/Desktop/upload/cocean/product/${list.serverFileName}" ></td>
    </tr>

</table>
<button type="button" class="btn btn-secondary" onclick="location.href='storeList.go'">이전</button>
<!-- 삭제해야함 








-->
<c:if test="${list.branchID >1}">
<button type="button" class="btn btn-primary" onclick="location.href='branchProductDelete.do?productID=${list.productID}&branchID=${list.branchID}'">삭제</button>

<%-- <button type="button" class="btn btn-primary" onclick="location.href=${list.productID}, ${list.branchID})">삭제</button> --%>
</c:if>
</form>
</body>
</html>