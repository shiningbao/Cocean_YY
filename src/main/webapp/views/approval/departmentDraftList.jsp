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

.rStatus{
	background-color: #e33d6e87;
    border: #e33d6e87;
    display: inline-block;
    padding: 4px;
    text-align: center;
    color: #fff;
    border-radius: 2px;
    letter-spacing: -1px;
    height: 19px;
    font-size: 12px;
    vertical-align: middle;
}

.aStatus{
	background-color: #61a8dba6;
    border: #61a8dba6;
    display: inline-block;
    padding: 4px;
    text-align: center;
    color: #fff;
    border-radius: 2px;
    letter-spacing: -1px;
    height: 19px;
    font-size: 12px;
    vertical-align: middle;
}
</style>
</head>
<body>
<c:import url="/side"/>
<div class="container-fluid contentField">
	
<div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-top: 15px;">
	<div class="hTitle">
	<h1 class="h3 mb-0 text-gray-800">부서함</h1>
	</div>
</div>
	
		<div class="search d-flex flex-column">
            <form class="form-inline ml-auto" action="department.go" method="get" id="frm">
            <input type="hidden" name="startNum" value="1" id="startNum">
            <input type="hidden" name="pageNum" value="" id="pageNum">
              <input id="keyword" class="form-control mr-sm-2" type="search" placeholder="제목/기안자" aria-label="Search">
              <button class="btn btn-outline-primary my-2 my-sm-0" type="button" onclick="dpSearch()">검색</button>
            </form>
    	</div>
    
	<div class="card shadow mb-4">
	<div id=dpTable>
	<table class="table table-hover">
		<thead id="dpTableHead">
		<tr>
			<th scope="col">완료일</th>
			<th scope="col">유형</th>
			<th scope="col">제목</th>
			<th scope="col">기안자</th>
			<th scope="col">결재상태</th>
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
            <c:choose> 
            <c:when test="${list.approvalStatus eq'반려'}">
            <td><span class="rStatus">${list.approvalStatus}</span></td>
            </c:when>
            <c:when test="${list.approvalStatus eq'결재'}">
            <td><span class="aStatus">${list.approvalStatus}</span></td>
            </c:when>
            <c:otherwise>
            <td></td>
            </c:otherwise>
            </c:choose>
            
		</tr>	
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	
	<!-- 페이징 처리 -->
<div>
  <ul class="pagination" id="paging">
  <c:if test="${pager.pageNum > 1}">
    <li class="page-item">
  <div class="p" data-list-pn="${pager.pageNum-1}">
      <a class="page-link" data-list-pn="${pager.pageNum-1}">&laquo;</a>
    </div>
    </li>
    </c:if>
    	<c:forEach begin="1" end="${pager.totalCount}" var="i">
    	 <li class="${pager.pageNum == i ? "page-item active":"page-item"}">
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

	</div>

<c:import url="/footer"/>	
</body>
<script>

$(".p").click(function() {
	const n= $(this).attr("data-list-pn");
	$("#pageNum").val(n);
	$('#frm').submit();
			
});


//페이징 처리 클릭 이벤트
$('.p').click(function(){
	
	const no = $(this).attr("data-list-pn");
	$("#pageNum").val(no);
	$('#frm').submit();
})

function dpSearch() {
	var keyword = $('#keyword').val();
	$.ajax({
		type : 'get',
		url : 'dpSearch',
		data : {
			'keyword' : keyword
		},
		dataType : 'JSON',
		success : function(data) {
			console.log(data.dList);
			drawDlist(data.dList);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function drawDlist(dList) {
	var content='';
	dList.forEach(function(item,idx){
		  	content += '<tr>';
		  	content += '<td scope="row">'+item.approvalDate+'</td>';
		  	content += '<td>'+item.formCategory+'</td>';
		  	if(item.title==null){
		  		content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '&hTitle=department">' + item.formTitle + '</a></td>'
		  	}else if(item.title==''){
		  		content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '&hTitle=department">' + item.formTitle + '</a></td>'
		  	}else{
		  		content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '&hTitle=department">' + item.title + '</a></td>'
		  	}
	        content += '<td>'+item.name+'</td>';
			content += '</tr>';
	});
	$('#dpList').empty();
	$('#dpList').append(content);
	
}


</script>
</html>