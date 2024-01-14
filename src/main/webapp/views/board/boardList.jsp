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
			<h1 class="h3 mb-0 text-gray-800">${bt}
			</h1>
		</div>
		<div class="d-flex">
			<div class="form-inline ml-auto mb-2">
				<select id="searchCategory" class="form-control mr-2">
					<option value="title">제목</option>
					<c:if test="${bt ne '익명게시판'}">
						<option value="name">작성자</option>
					</c:if>
				</select>
				<input id="search" type="text" class="form-control mr-2"/>
				<button class="btn btn-outline-primary" onclick="searchGo()">검색</button>
			</div>
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
					<c:if test="${empty list}">
						<tr>
							<td colspan="4">게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${list}" var="item">
						<tr>
							<td>
								<c:if test="${item.isPinned eq 1}">공지</c:if>
								<c:if test="${item.isPinned ne 1}">${item.boardID}</c:if>
							</td>
							<td onclick="detailGo(${item.boardID})"><a href="detail?boardID=${item.boardID}">${item.title}</a></td>
							<td>${item.name}</td>
							<td>${item.creationDate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>

	
			<div class="row text-center mx-0">
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
					<button class="btn btn-primary float-right" onclick="location.href='write.go'">글작성</button>
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
		//console.log(no);
		//console.log(location.href);
		var href = location.href;
		if(href.length != 0){
			href = href.slice(0, -1) + no;
		}
		location.href = href;
	})
	
	function searchGo(){
		var searchCategory = $('#searchCategory').val();
		var search = $('#search').val();
		if(search != ''){
			location.href='list?searchCategory='+searchCategory+'&search='+search+'&page=1';		
		}else{
			swal({
				title: '검색어를 입력해주세요',
				button: '확인'
			});
		}
	}
	
	

</script>
</html>