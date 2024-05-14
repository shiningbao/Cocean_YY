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
	
	.removeSave{
		width:30px;
		height:30px;
		cursor:pointer;
	}
	
	.tempStatus{
		background-color: #b3d3f6;
	    border: 1px solid #b3d3f6;
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
	
	.pagination{
		justify-content: center;
	}
</style>
</head>

<body>
	<c:import url="/side"/>
	
	<% 
	   Date myDate = new Date();
	   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   String formattedDate = dateFormat.format(myDate);
	%>	

	<div class="container-fluid contentField">
	
		<div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-top: 15px;">
			<div class="hTitle">
			<h1 class="h3 mb-0 text-gray-800">임시저장함</h1>
			</div>
		</div>
	
		<div class="row">
			<div class="col-md-6 d-flex flex-column align-self-end">
				<img src="<c:url value='/resource/img/trashbin.png'/>" class="removeSave" alt="삭제 아이콘" onclick="removeSave()">
			</div>
		    <div class="col-md-6 text-right d-flex flex-column">
				<form class="form-inline ml-auto mb-auto" action="tempSaveList.go" method="get" id="frm">
					<input type="hidden" name="startNum" value="1" id="startNum">
					<input type="hidden" name="pageNum" value="" id="pageNum">
					<input class="form-control mr-sm-2" type="search" placeholder="제목/유형" aria-label="Search">
					<button class="btn btn-outline-primary my-2 my-sm-0" type="submit">검색</button>
				</form>		    
		   	</div>
		</div>
	     
		<div class="card shadow mb-4" style="margin-top:15px;">	         
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
						<td>${save.formCategory}<input type="hidden" name="titleID" value="${save.titleID}" id="titleID"></td>
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
						<td><span class="tempStatus">임시저장</span><input type="hidden" name="idx" value="${save.idx}" id="idx"></td>
					</tr>	
					</c:forEach>
					</tbody>
				</table>
				<c:if test="${empty save}">
					<div class="text-center my-3"  style="color:gray; font-weight:bold;">-- 문서가 없습니다. --</div>
				</c:if>
			</div><!-- saveTable 끝 -->
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


//페이징 처리 클릭 이벤트
$('.p').click(function(){
	
	const no = $(this).attr("data-list-pn");
	$("#pageNum").val(no);
	$('#frm').submit();
})

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
		console.log(total);
	});
});

function removeSave() {
    var checkedSave = $("input[name=chk]:checked");

    if (checkedSave.length > 0) {
        swal({
            title: "삭제하시겠습니까?",
            text: "",
            icon: "warning",
            buttons: ["취소", "확인"]
        }).then((isOkey) => {
            if (isOkey) {
                var selectedSave = [];

                checkedSave.each(function () {
                    selectedSave.push({
                        idx: $(this).closest("tr").find("input[name=idx]").val(),
                        titleID: $(this).closest("tr").find("input[name=titleID]").val()
                    });
                });

                console.log(selectedSave);

                $.ajax({
                    type: 'POST',
                    url: 'removeSave',
                    data: {'removeList': JSON.stringify(selectedSave)},
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        location.reload();
                    },
                    error: function (e) {
                        console.error(e);
                    }
                });
            }
        });
    } else {
        swal('삭제할 문서를 선택해주세요!', '', 'warning');
    }
}
</script>
</html>