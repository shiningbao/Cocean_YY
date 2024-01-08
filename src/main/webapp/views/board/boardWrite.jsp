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
			<h4>글작성</h4>
			<form action="write.do" method="post">
			<div class="form-check form-check-inline">
				<label class="form-check-label">
					공지글 등록  
					<input type="checkbox" name="isPinned" class="form-check-input ml-2" value="1"/>
				</label>
			</div>
			
			<div class="d-inline">
				<h5>제목</h5>
				<input type="text" name="title" class="form-control float-right" style="width: 100%"/>
			</div>
			
			<input type="hidden" name="content" class="form-control" value=""/>
			</form>
			<div class="mt-3">
				<div id="summernote"></div>
			</div>
			<div class="d-inline mt-2">
				<button class="float-right ml-2" type="button" onclick="save()">작성</button>
				<button class="float-right ml-2" type="button" onclick="location.href='list'">취소</button>
			</div>
		</div>
	</div>
</body>
<script>
	
	$('#summernote').summernote({
		height: 200,
		maxHeight: 200,
		minHeight: 200,
		focus: false,
		//toolbar:['picture']
	});
	

	function save(){
		var content = $('#summernote').summernote('code');
		if(content.length > (2*1024*1024)){
			swal({
				title : '컨텐츠의 크기가 큽니다. 이미지 갯수나 크기를 줄여주세요',
				button: '확인'
			});
		}else{
			$('input[name="content"]').val(content);
			$('form').submit();
		
            

        }
		
	}


</script>
</html>