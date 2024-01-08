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
#waitingTableHead{
	background-color: #86B0F3;
	text-align: center;
}

#waitingList{
	text-align: center;
}

#search {
	float: right;
	width: 326px;
	display:flex;
	
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

</style>
</head>
<body>
	<c:import url="/side"/>
	<div class="container-fluid contentField">
	
	<div class="d-sm-flex align-items-center justify-content-between mb-6" style="padding-top: 15px;">
	<div class="hTitle">
		<h1 class="h3 mb-0 text-gray-800">결재대기함</h1>
	</div>
	</div>
	
	<div class="row">
	<nav class="navbar navbar" id="search">
          <form class="form-inline">
            <input id="keyword" class="form-control mr-sm-2" type="search" placeholder="제목/기안자" aria-label="Search">
            <button class="btn btn-outline-primary my-2 my-sm-0" type="button" onclick="waitingSearch()">검색</button>
          </form>
    </nav>
    </div>
	
<div class="card shadow mb-4" style="margin-top:15px;">
	<div id="waitingTable">
		<table class="table table-hover">
			<thead id="waitingTableHead">
			<tr>
				<th scope="col">기안일</th>
				<th scope="col">유형</th>
				<th scope="col">제목</th>
				<th scope="col">상태</th>
				<th scope="col">기안자</th>
			</tr>
		</thead>
		
		<tbody id=waitingList>
		<c:forEach items="${list}" var="list">
		<tr>
			<td scope="row">${list.draftDate}</td>
			<td>${list.category}</td>
			<td>
				<c:choose>
					<c:when test="${list.title == null}">
					<a href="draftDetail.go?idx=${list.idx}&employeeID=${list.id}&category=${list.category}&hTitle=waiting">${list.formTitle}</a>
					</c:when>
					<c:otherwise>
			        <a href="draftDetail.go?idx=${list.idx}&employeeID=${list.id}&category=${list.category}&hTitle=waiting">${list.title}</a>
			        </c:otherwise>
				</c:choose>
			</td>
			<td>${list.approvalStatus}</td>
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
function waitingSearch() {
	var keyword = $('#keyword').val();
	$.ajax({
		type : 'get',
		url : 'waitingSearch',
		data : {
			'keyword' : keyword
		},
		dataType : 'JSON',
		success : function(data) {
			console.log(data.sList);
			drawSlist(data.sList);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function drawSlist(sList) {
	var content='';
	sList.forEach(function(item,idx){
		  	content += '<tr>';
		  	content += '<td scope="row">'+item.draftDate+'</td>';
		  	content += '<td>'+item.category+'</td>';
		  	if(item.title==null){
		  		content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '&category=' + item.category + '&hTitle=waiting">' + item.formTitle + '</a></td>'
		  	}else{
		  		content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '&category=' + item.category + '&hTitle=waiting">' + item.title + '</a></td>'
		  	}
	        content += '<td>'+item.approvalStatus+'</td>';
	        content += '<td>'+item.name+'</td>';
			content += '</tr>';
	});
	$('#waitingList').empty();
	$('#waitingList').append(content);
	
}
</script>
</html>