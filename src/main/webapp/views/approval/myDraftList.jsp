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
#myTableHead{
	background-color: #86B0F3;
	text-align: center;
}

#myList{
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

.mySpan{
	background-color: #f16e84;
    border: 1px solid #f16e84;
    display: inline-block;
    padding: 4px;
    text-align: center;
    color: #fff;
    border-radius: 2px;
    letter-spacing: -1px;
    height: 22px;
    width: 45px;
    font-size: 12px;
    vertical-align: middle;
}
 .spanIng{
  	background-color: #64a6eb;
    border: 1px solid #64a6eb;
    display: inline-block;
    padding: 4px;
    text-align: center;
    color: #fff;
    border-radius: 2px;
    letter-spacing: -1px;
    height: 22px;
    width: 45px;
    font-size: 12px;
    vertical-align: middle;
 }
 
  .spanCom{
  	background-color: #63e67b;
    border: 1px solid #63e67b;
    display: inline-block;
    padding: 4px;
    text-align: center;
    color: #fff;
    border-radius: 2px;
    letter-spacing: -1px;
    height: 22px;
    width: 45px;
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
	<h1 class="h3 mb-0 text-gray-800">나의 기안함</h1>
	</div>
</div>

		<div class="search d-flex flex-column">
            <form class="form-inline ml-auto" action="myDraftList.go" method="get" id="frm">
              <input id="keyword" class="form-control mr-sm-2" type="search" placeholder="제목" aria-label="Search">
              <input type="hidden" name="startNum" value="1" id="startNum">
              <input type="hidden" name="pageNum" value="" id="pageNum">
              <button class="btn btn-outline-primary my-2 my-sm-0" type="button" onclick="mySearch()">검색</button>
            </form>
 		</div>

<div class="card shadow mb-4">
          
	<div id="myTable">
	<table class="table table-hover">
		<thead id="myTableHead">
		<tr>
			<th>기안일</th>
			<th>유형</th>
			<th>제목</th>
			<th>진행 상태</th>
		</tr>
		</thead>
		
		<tbody id=myList>
		<c:forEach items="${my}" var="my">
		<tr>
			<td>${my.draftDate}</td>
			<td>${my.formCategory}</td>
			<td> 
				<c:choose>
	                <c:when test="${my.title == null}">
	                    <a href="draftDetail.go?idx=${my.idx}&employeeID=${employeeID}">${my.formTitle}</a>
	                </c:when>
	                <c:when test="${my.title == ''}">
	                    <a href="draftDetail.go?idx=${my.idx}&employeeID=${employeeID}">${my.formTitle}</a>
	                </c:when>
	                <c:otherwise>
	                    <a href="draftDetail.go?idx=${my.idx}&employeeID=${employeeID}">${my.title}</a>
	                </c:otherwise>
	            	</c:choose>
            </td>
			<td><c:if test="${my.draftStatus eq '대기'}"><span class="mySpan">${my.draftStatus}</span></c:if>
					<c:if test="${my.draftStatus eq '진행중'}"><span class="spanIng">${my.draftStatus}</span></c:if>
					<c:if test="${my.draftStatus eq '완료'}"><span class="spanCom">${my.draftStatus}</span></c:if>
			</td>
		</tr>	
		</c:forEach>
		</tbody>
	</table>
	<c:if test="${empty my}">
			<div class="text-center my-3"  style="color:gray; font-weight:bold;">-- 문서가 없습니다. --</div>
	</c:if>
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

function mySearch() {
	var keyword = $('#keyword').val();
	$.ajax({
		type : 'get',
		url : 'mySearch',
		data : {
			'keyword' : keyword
		},
		dataType : 'JSON',
		success : function(data) {
			console.log(data.myList);
			drawMyList(data.myList);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function drawMyList(myList) {
	var content='';
	myList.forEach(function(item,idx){
		  	content += '<tr>';
		  	content += '<td scope="row">'+item.draftDate+'</td>';
		  	content += '<td>'+item.formCategory+'</td>';
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
	$('#myList').empty();
	$('#myList').append(content);
	
}

</script>
</html>