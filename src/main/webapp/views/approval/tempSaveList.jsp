<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>

#saveTableHead{
	background-color: #86B0F3;
	text-align: center;
}

#saveList{
	text-align:center;
}

#search{
	float: right;
	width: 450px;
}

#removeSave button{
	width: 233px;
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
<% 
   Date myDate = new Date();
   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
   String formattedDate = dateFormat.format(myDate);
	%>	
<c:import url="/side"/>

<div class="container-fluid contentField">

<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<div class="hTitle">
	<h1 class="h3 mb-0 text-gray-800">임시저장함</h1>
	</div>
</div>
<div class="card shadow mb-4" style="margin-top:15px;">
			
			<div class="row">
			<nav class="navbar navbar" id="search">
            <button type="button" id="removeSave" class="btn btn-primary">삭제</button>	
	           <form class="form-inline">
	             <input class="form-control mr-sm-2" type="search" placeholder="문서양식을 입력하세요." aria-label="Search">
	             <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">검색</button>
	           </form>
          </nav>
          </div>
         
	
	

	<div id="saveTable">
	<table class="table table-hover">
		<thead id="saveTableHead">
		<tr>
			<td><input class="form-check-input" type="checkbox" value="" id="option1"></td>
			<th scope="col">임시저장일</th>
			<th scope="col">유형</th>
			<th scope="col">제목</th>
			<th scope="col">상태</th>
		</tr>
		</thead>
		
		<tbody id=saveList>
		<c:forEach items="${save}" var="save">
		<tr>
			<td><input class="form-check-input" type="checkbox" value="" id="option2" name="chk"></td>
			<td scope="row">${save.draftDate}</td>
			<td>${save.formCategory}</td>
			<td> 
				<c:choose>
	                <c:when test="${save.title == null}">
	                    <a href="tempSaveForm.go?idx=${save.idx}&employeeID=${save.employeeID}&date=<%= formattedDate %>">${save.formTitle}</a>
	                </c:when>
	                <c:when test="${save.title == ''}">
	                    <a href="tempSaveForm.go?idx=${save.idx}&employeeID=${save.employeeID}&date=<%= formattedDate %>">${save.formTitle}</a>
	                </c:when>
	                <c:otherwise>
	                    <a href="tempSaveForm.go?idx=${save.idx}&employeeID=${save.employeeID}&date=<%= formattedDate %>">${save.title}</a>
	                </c:otherwise>
	            	</c:choose>
            </td>
			<td>${save.draftStatus}</td>
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

$(document).ready(function() {
	$("#option1").click(function() {
		if($("#option1").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});
	
	$("input[name=chk]").click(function() {
		var total = $("input[name=chk]").length;
		var checked = $("input[name=chk]:checked").length;
		
		if(total != checked) $("#option1").prop("checked", false);
		else $("#option1").prop("checked", true); 
	});
});




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