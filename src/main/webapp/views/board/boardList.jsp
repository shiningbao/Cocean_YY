<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
 .minHight{
 	min-height: 556px;
 }

</style>
</head>
<body>
	<c:import url="/side"/>
	<div class="container-fluid contentField">
		
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">${bt}</h1>
		</div>
		
		<div class="card shadow p-3">
			<div class="minHight">
				<table class="table table-hover">
					<colgroup>
						<col width="20%">
						<col width="40%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">글 번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tr>
					<c:forEach items="${list_pin}" var="item">
						<tr>
							<td>공지</td>
							<td onclick="detailGo(${item.boardID})"><a href="detail?boardID=${item.boardID}">${item.title}</a></td>
							<td>${item.name}</td>
							<td>${item.creationDate}</td>
						</tr>
					</c:forEach>
					<c:forEach items="${list}" var="item">
						<tr>
							<td>${item.boardID}</td>
							<td onclick="detailGo(${item.boardID})"><a href="detail?boardID=${item.boardID}">${item.title}</a></td>
							<td>${item.name}</td>
							<td>${item.creationDate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>

	
			<div class="row text-center">
			<!-- 페이징 처리 -->
			<div class="mx-auto">
			  <ul class="pagination" id="paging">
			  <c:if test="${pager.pageNum > 1}">
			    <li class="page-item">
			  <div class="p" data-list-pn="${pager.pageNum-1}">
			      <a class="page-link" data-list-pn="${pager.pageNum-1}">&laquo;</a>
			    </div>
			    </li>
			    </c:if>
			    	<c:forEach begin="1" end="${pager.totalCount}" var="i">
			    	 <li class="${pager.pageNum == i ? 'page-item active':'page-item'}">
			      		<div class="p" data-list-pn="${i}"><a class="page-link" data-list-pn="${i}">${i}</a></div>
			    	</li>
					</c:forEach>
				
				<c:if test="${pager.pageNum < pager.totalCount}">
				<li class="page-item">
				<div class="p" data-list-pn="${pager.pageNum+1}">
			      <a class="page-link" >&raquo;</a>
			      </div>
			    </li>
			    </c:if>
				  </ul>
			</div>
			
			<div class="text-right">
				<button class="btn btn-primary btn-sm float-right" onclick="location.href='write.go'">글작성</button>
			</div>
			
			</div>
			
		</div>
	
	
	</div>
	<c:import url="/footer"/>
</body>

<script>
	var msg = "${msg}";
	if(msg != ""){
		swal({
			title: msg,
			button: '확인'
		});
	}
	
	function detailGo(boardID){
		location.href="detail?boardID="+boardID;
	}
	
	
	$('.p').click(function(){
		
		const no = $(this).attr("data-list-pn");
		//alert(no);
		console.log(no);
		$("#pageNum").val(no);
		location.href='list?page='+no+'&search=';
	})
	
	
	

</script>
</html>