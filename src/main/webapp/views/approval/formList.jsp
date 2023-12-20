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
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>	
	
	<select id="category" name="formCategory">
	  <option value="유형" selected="selected">유형</option>
	  <option value="일반">일반</option>
	  <option value="근태">근태</option>
	  <option value="인사">인사</option>
	</select>

	<form action="searchList.do" method="POST">
		<input type="text" name="keyword" placeholder="문서양식을 검색하세요"/>
		<button>검색</button>
	</form>
		
	<table>
		<tr>
			<th>유형</th>
			<th>문서양식</th>
		</tr>
		<c:forEach items="${list}" var="form">
		<tr>
			<td>${form.category}</td>
			<td><a href="writeDraft.go?title=${form.title}">${form.title}</a></td>
		</tr>	
		</c:forEach>
	</table>
	
</body>
<script>

    $("#category").change(function () {
        var selectedCategory = $(this).val();
        console.log(selectedCategory);
        filterList(selectedCategory);
    });

    function filterList(category) {
        if (category === "유형") {
            $("table tr").show();
        } else {
            $("table tr:gt(0)").hide();
            $("table tr").filter(function () {
                return $(this).find("td:first").text() === category;
            }).show();
        }
    }

</script>
</html>