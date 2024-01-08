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

#refTableHead{
	background-color: #86B0F3;
	text-align:center;
}

#refList{
	text-align: center;
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
	<h1 class="h3 mb-0 text-gray-800">참조/열람함</h1>
	</div>
</div>
<div class="card shadow mb-4">

	 <nav class="navbar navbar float-right" id="search">
        <form class="form-inline">
          <input id="keyword" class="form-control mr-sm-2" type="search" placeholder="제목/기안자" aria-label="Search">
          <button class="btn btn-outline-primary my-2 my-sm-0" type="button" onclick="refSearch()">검색</button>
        </form>
     </nav>
		
	<div id="refTable">
		<table class="table table-hover">
		<thead id="refTableHead">
		<tr>
			<th scope="col">기안일</th>
			<th scope="col">유형</th>
			<th scope="col">제목</th>
			<th scope="col">상태</th>
		</tr>
		</thead>
		
		<tbody id=refList>
		<c:forEach items="${ref}" var="ref">
		<tr>
			<td>${ref.draftDate}</td>
			<td>${ref.category}</td>
			<td> 
				<c:choose>
	                <c:when test="${ref.title == null}">
	                    <a href="draftDetail.go?idx=${ref.idx}&employeeID=${ref.employeeID}">${ref.formTitle}</a>
	                </c:when>
	                <c:when test="${ref.title == ''}">
	                    <a href="draftDetail.go?idx=${ref.idx}&employeeID=${ref.employeeID}">${ref.formTitle}</a>
	                </c:when>
	                <c:otherwise>
	                    <a href="draftDetail.go?idx=${ref.idx}&employeeID=${ref.employeeID}">${ref.title}</a>
	                </c:otherwise>
	            	</c:choose>
            </td>
			<td>${ref.draftStatus}</td>
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
function refSearch() {
	var keyword = $('#keyword').val();
	$.ajax({
		type : 'get',
		url : 'refSearch',
		data : {
			'keyword' : keyword
		},
		dataType : 'JSON',
		success : function(data) {
			console.log(data.refList);
			drawRefList(data.refList);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function drawRefList(refList) {
	var content='';
	refList.forEach(function(item,idx){
		  	content += '<tr>';
		  	content += '<td scope="row">'+item.draftDate+'</td>';
		  	content += '<td>'+item.category+'</td>';
			if(item.title==null){
				content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '">' + item.formTitle + '</a></td>';
		  	}else if(item.title==''){
		  		content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '">' + item.formTitle + '</a></td>';
		  	}else{
		  		content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '">' + item.title + '</a></td>';
		  	}
	        content += '<td>'+item.draftStatus+'</td>';
			content += '</tr>';
	});
	$('#refList').empty();
	$('#refList').append(content);
	
}

</script>
</html>