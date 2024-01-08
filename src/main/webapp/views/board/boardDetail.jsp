<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.resizeAuto {
		resize: none;
		overflow-y: hidden;
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
			<div class="d-inline">
				<div class="float-left">
					<h3>${detail.title}</h3>
				</div>
				<div class="float-right">
					<c:if test="${prevNext.prev ne null}">
					<button onclick="location.href='detail?boardID=${prevNext.prev}'">이전글</button>
					</c:if>
				
					<c:if test="${prevNext.next ne null}">
					<button onclick="location.href='detail?boardID=${prevNext.next}'">다음글</button>
					</c:if>
				</div>
			</div>
			
			<p>
				<c:if test="${bt ne '익명게시판'}">
					${detail.name} / 
				</c:if>
				${detail.creationDate}
			</p>
			
			<hr>
			
			<div style="min-height:250px"> 
				${detail.content}
			</div>
			
			<hr>
			
			<div>
			<h5>댓글</h5>
			<textarea class="form-control resizeAuto"></textarea>
			</div>
			<div>
				<button class="float-right ml-2">삭제</button>
				<button class="float-right ml-2">수정</button>
				<button class="float-right ml-2">목록</button>
			</div>
		
		</div>
		

	</div>
</body>
<script>
$('.resizeAuto').on('input', function () {
    this.style.height = 'auto';
    this.style.height = (this.scrollHeight) + 'px';
  });


</script>
</html>