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
		<p>글쓰기</p>
		<p>제목</p>
		<form action="write.do" method="post">
		<input type="text" name="title"/>
		<p>상단 고정</p>
		<input type="checkbox" name="isPinned" value="1"/>
		<input type="hidden" name="content" value=""/>
		</form>
		<div id="summernote"></div>
		<button type="button" onclick="save()">작성</button>
	</div>
</body>
<script>
	
	$('#summernote').summernote({
		height: 200, width: 700,
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