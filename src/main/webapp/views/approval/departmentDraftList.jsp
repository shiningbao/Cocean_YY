<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>

#dpTableHead{
	background-color: #86B0F3;
	text-align: center;
}



#dpList{
	text-align:center;
}



@media screen and (max-width: 1457px) {
	#search {
		top: 23%;
	}
	#search button {
		width: 233px;
	}
	#search input {
		margin-bottom: 5px;
	}
}
</style>
</head>
<body>
<c:import url="/side"/>
<div class="container-fluid contentField">
	
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<div class="hTitle">
	<h1 class="h3 mb-0 text-gray-800">부서함</h1>
	</div>
</div>
	
	<div class="card shadow mb-4">
	
	<nav class="navbar navbar float-right" id="search">
            <form class="form-inline">
              <input class="form-control mr-sm-2" type="search" placeholder="제목/기안자" aria-label="Search">
              <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">검색</button>
            </form>
    </nav>
		
	<div id=dpTable>
	<table class="table table-hover">
		<thead id="dpTableHead">
		<tr>
			<th scope="col">완료일</th>
			<th scope="col">유형</th>
			<th scope="col">제목</th>
			<th scope="col">기안자</th>
		</tr>
		
		<tbody id=dpList>
		<c:forEach items="${list}" var="list">
		<tr>
			<td scope="row">${list.approvalDate}</td>
			<td>${list.formCategory}</td>
			<td> 
				<c:choose>
	                <c:when test="${list.title == null}">
	                    <a href="draftDetail.go?idx=${list.idx}&employeeID=${list.employeeID}&hTitle=department">${list.formTitle}</a>
	                </c:when>
	                <c:when test="${list.title == ''}">
	                    <a href="draftDetail.go?idx=${list.idx}&employeeID=${list.employeeID}&hTitle=department">${list.formTitle}</a>
	                </c:when>
	                <c:otherwise>
	                    <a href="draftDetail.go?idx=${list.idx}&employeeID=${list.employeeID}&hTitle=department">${list.title}</a>
	                </c:otherwise>
	            	</c:choose>
            </td>
            <td>${list.name}</td>
		</tr>	
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	</div>

<c:import url="/footer"/>	
</body>
<script>
resizeWidth();

    /* $("#category").change(function () {
        var selectedCategory = $(this).val();
        var keyword = $("input[name='keyword']").val();
        console.log(selectedCategory);
        filterList(selectedCategory, keyword);
    });

    function filterList(category, keyword) {
        if (category === "전체") {
            $("table tr").show();
        } else {
            $("table tr:gt(0)").hide();
            $("table tr").filter(function () {
            	 var categoryMatch = $(this).find("td:first").text() === category;
                 var keywordMatch = $(this).find("td:last").text().includes(keyword);
                 return categoryMatch && keywordMatch;
            }).show();
        }
    } */



</script>
</html>