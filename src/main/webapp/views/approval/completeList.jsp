<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>

#comTableHead{
	background-color: #86B0F3;
	text-align: center;
}

#comList{
	text-align: center;
}

#search input {
	z-index: 2;
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
<jsp:include page="../side.jsp"></jsp:include>	
<main>
	<div class="content">
		<div class="hTitle">
			<a>완료함</a>
		</div>

	<!-- <form action="searchList.do" method="POST">
	<select id="category" name="formCategory">
	  <option value="전체" selected="selected">전체</option>
	  <option value="일반">일반</option>
	  <option value="근태">근태</option>
	  <option value="인사">인사</option>
	</select>

		<input type="search" name="keyword" placeholder="제목"/>
		<button class="btn btn-primary">검색</button>
	</form>
		 -->
		 <nav class="navbar navbar float-right" id="search">
            <form class="form-inline">
              <input class="form-control mr-sm-2" type="search" placeholder="문서양식을 입력하세요." aria-label="Search">
              <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">검색</button>
            </form>
          </nav>
		 
	<div id="comTable">
	<table class="table table-hover">
		<thead id="comTableHead">
		<tr>
			<th scope="col">완료일</th>
			<th scope="col">유형</th>
			<th scope="col">제목</th>
			<th scope="col">상태</th>
		</tr>
		
		<tbody id=comList>
		<c:forEach items="${com}" var="com">
		<tr>
			<td scope="row">${com.approvalDate}</td>
			<td>${com.category}</td>
			<td> 
				<c:choose>
	                <c:when test="${com.title == null}">
	                    <a href="draftDetail.go?idx=${com.idx}&employeeID=${com.employeeID}">${com.formTitle}</a>
	                </c:when>
	                <c:when test="${com.title == ''}">
	                    <a href="draftDetail.go?idx=${com.idx}&employeeID=${com.employeeID}">${com.formTitle}</a>
	                </c:when>
	                <c:otherwise>
	                    <a href="draftDetail.go?idx=${com.idx}&employeeID=${com.employeeID}">${com.title}</a>
	                </c:otherwise>
	            	</c:choose>
            </td>
			<td>${com.approvalStatus}</td>
		</tr>	
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
</main>
</body>
<script>
resizeWidth();
	
    $("#category").change(function () {
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
    }

</script>
</html>