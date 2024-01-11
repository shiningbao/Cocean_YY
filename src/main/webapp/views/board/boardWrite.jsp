<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="<c:url value='/resource/summernote/summernote-lite.js'/>"></script>
<script src="<c:url value='/resource/summernote/lang/summernote-ko-KR.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resource/summernote/summernote-lite.css'/>">




</head>
<body>
	<c:import url="/side"/>
	<div class="container-fluid contentField">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">${bt}</h1>
		</div>
		<div class="card shadow p-3">
			<form action="write.do" method="post">
			<div class="form-check form-check-inline">
				<h4 class="mr-4">글작성</h4>
				<c:if test="${bt ne '익명게시판'}">
					<label class="form-check-label">
						게시글 상단 고정  
						<input type="checkbox" name="isPinned" class="form-check-input ml-2" value="1"/>
					</label>
				</c:if>
			</div>
			
			<div class="d-inline">
				<h5>제목</h5>
				<input type="text" name="title" class="form-control float-right" style="width: 100%"  required/>
			</div>
			
			<input type="hidden" name="content" class="form-control" value=""/>
			</form>
			<div class="mt-3">
				<div id="summernote"></div>
			</div>
			<div class="d-inline mt-2">
				<button class="btn btn-primary float-right ml-2" type="button" onclick="save()">작성</button>
				<button class="btn btn-secondary float-right ml-2" type="button" onclick="location.href='list?searchCategory=&search=&page=1'">취소</button>
			</div>
		</div>
	</div>
	<c:import url="/footer"/>
</body>
<script>
	$('#details').trigger('input');
	$('#summernote').summernote({
		height: 200,
		maxHeight: 200,
		minHeight: 200,
		focus: false,
		//toolbar:['picture']
	});
	

	function save(){
		var content = $('#summernote').summernote('code');
		$('input[name="content"]').val(content);
		if(content.length > (2*1024*1024)){
			swal({
				title : '컨텐츠의 크기가 큽니다. 이미지 갯수나 크기를 줄여주세요',
				button: '확인'
			});
		}else if(!$('form')[0].checkValidity()){
			swal({
				title : '제목 또는 내용을 입력해주세요',
				button: '확인'
			});			
		}else{
			swal({
				title:'게시글을 작성하시겠습니까?',
				icon:'info',
				buttons:['취소','확인']
			}).then((isOkey) => {
				if(isOkey){
					$('form').submit();	
				}
			});
        }
		
	}


</script>
</html>