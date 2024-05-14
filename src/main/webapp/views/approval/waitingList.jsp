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
	
	.pagination{
		justify-content: center;
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
	
		<div class="search d-flex flex-column">
        	<form class="form-inline ml-auto" action="waitingList.go" method="get" id="frm">
	          	<input type="hidden" name="startNum" value="1" id="startNum">
	          	<input type="hidden" name="pageNum" value="" id="pageNum">
	          	<input id="keyword" class="form-control mr-sm-2" type="search" placeholder="제목/기안자" aria-label="Search">
	          	<button class="btn btn-outline-primary my-2 my-sm-0" type="button" onclick="waitingSearch()">검색</button>
          	</form>
   		</div>
	
		<div class="card shadow mb-4">
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
							<td>
								<span class="waitingSpan" style="
								    background-color: #f16e84;
								    border: 1px solid #f16e84;
								    display: inline-block;
								    padding: 4px;
								    text-align: center;
								    color: #fff;
								    border-radius: 2px;
								    letter-spacing: -1px;
								    height: 22px;
								    width: 40px;
								    font-size: 12px;
								    vertical-align: middle;">${list.approvalStatus}
								</span>
							</td>
							<td>${list.name}</td>
						</tr>	
					</c:forEach>
					</tbody>
				</table>
				<c:if test="${empty list}">
					<div class="text-center my-3"  style="color:gray; font-weight:bold;">-- 문서가 없습니다. --</div>
				</c:if>
			</div><!-- waitingTable 끝 -->
		</div><!-- card shadow mb-4 끝 -->

		<div><!-- 페이징 -->
			<ul class="pagination" id="paging">
			<c:if test="${pager.pageNum > 1}">
				<li class="page-item">
					<div class="p" data-list-pn="${pager.pageNum-1}">
						<a class="page-link" data-list-pn="${pager.pageNum-1}">&laquo;</a>
					</div>
				</li>
			</c:if>
			<c:forEach begin="1" end="${pager.totalCount}" var="i">
				<li class="${pager.pageNum == i ? "page-item active" : "page-item"}">
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
		</div><!-- 페이징 끝 -->

	</div><!-- container-fluid contentField 끝 -->

</body>
<script>
	$(".p").click(function() {
		const n= $(this).attr("data-list-pn");
		$("#pageNum").val(n);
		$('#frm').submit();
				
	});

	$('.p').click(function(){ // 페이징 처리 클릭 이벤트	
		const no = $(this).attr("data-list-pn");
		$("#pageNum").val(no);
		$('#frm').submit();
	})
	
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