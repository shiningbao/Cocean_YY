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
	font-weight: normal;
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
    width: 40px;
    font-size: 12px;
    vertical-align: middle;
 }

 .spanWaiting{
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
    width: 40px;
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
	<h1 class="h3 mb-0 text-gray-800">나의 결재함</h1>
	</div>
</div>

		 <div class="search d-flex flex-column">
            <form class="form-inline ml-auto" action="myApprovalList.go" method="get" id="frm">
            <input type="hidden" name="startNum" value="1" id="startNum">
            <input type="hidden" name="pageNum" value="" id="pageNum">
              <input id="keyword" class="form-control mr-sm-2" type="search" placeholder="문서양식을 입력하세요." aria-label="Search">
              <button class="btn btn-outline-primary my-2 my-sm-0" type="button" onclick="myAppSearch()">검색</button>
            </form>
       	</div>
          
<div class="card shadow mb-4">
	<div id="comTable">
	<table class="table table-hover">
		<thead id="comTableHead">
		<tr>
			<th scope="col">기안일</th>
			<th scope="col">완료일</th>
			<th scope="col">양식</th>
			<th scope="col">유형</th>
			<th scope="col">제목</th>
			<th scope="col">기안자</th>
			<th scope="col">진행 상태</th>
		</tr>
		
		<c:forEach items="${com}" var="com">
		<c:if test="${com.approvalStatus ne '미대기' && com.approvalStatus ne '대기'}">
		<tbody id=comList>
		<tr>
		<td scope="row">${com.draftDate}</td>
		<c:if test="${com.draftStatus eq '완료'}">
			<td>${com.approvalDate}</td>
		</c:if>
		<c:if test="${com.draftStatus ne '완료'}">
			<td></td>
		</c:if>
			<td>${com.formTitle}</td>
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
            <td>${com.name}</td>
			<td><c:if test="${com.draftStatus eq '대기'}"><span class="spanWaiting">${com.draftStatus}</span></c:if>
					<c:if test="${com.draftStatus eq '진행중'}"><span class="spanIng">${com.draftStatus}</span></c:if>
					<c:if test="${com.draftStatus eq '완료'}"><span class="spanCom">${com.draftStatus}</span></c:if>
			</td>
		</tr>	
		</tbody>
		</c:if>
		</c:forEach>
	</table>
	<c:if test="${empty com}">
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

function myAppSearch() {
	var keyword = $('#keyword').val();
	$.ajax({
		type : 'get',
		url : 'myAppSearch',
		data : {
			'keyword' : keyword
		},
		dataType : 'JSON',
		success : function(data) {
			console.log(data.myAppList);
			drawMyAppList(data.myAppList);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function drawMyAppList(myAppList) {
	var content='';
	myAppList.forEach(function(item,idx){
		if(item.approvalStatus!=='미대기'&&item.approvalStatus!=='대기'){
		  	content += '<tr>';
		  	content += '<td scope="row">'+item.draftDate+'</td>';
		  	if(item.draftStatus == '완료'){
		  	content += '<td>'+item.approvalDate+'</td>';
		  	}
		  	content += '<td>'+item.formTitle+'</td>';
		  	content += '<td>'+item.category+'</td>';
			if(item.title==null){
				content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '">' + item.formTitle + '</a></td>';
		  	}else if(item.title==''){
		  		content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '">' + item.formTitle + '</a></td>';
		  	}else{
		  		content += '<td>' + '<a href="draftDetail.go?idx=' + item.idx + '&employeeID=' + item.id + '">' + item.title + '</a></td>';
		  	}
	        content += '<td>'+item.name+'</td>';
	        content += '<td>'+item.draftStatus+'</td>';
			content += '</tr>';
		}
	});
	$('#comList').empty();
	$('#comList').append(content);
	
}
</script>
</html>