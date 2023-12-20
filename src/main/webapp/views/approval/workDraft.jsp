<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resource/richtexteditor/rte_theme_default.css'/>">

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script type="text/javascript" src="<c:url value='/resource/richtexteditor/rte.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/plugins/all_plugins.js'/>"></script>
<style>
table,th,td{
		border : 1px solid black;
		border-collapse : collapse;
		padding : 5px 10px;
}

table{
	width : 500px;
}

input[type="text"]{
	width : 100%;
}

button{
	margin : 5px 0;
}
</style>
</head>
<body>
	<c:forEach items="${draftInfo}" var="draft">
		<table>
			<tr>
			    <th>기안자</th>
			    <td>${draft.name}</td>
			</tr>
			<tr>
			    <th>소속부서</th>
			    <td>${draft.departmentName}</td>
			</tr>
			<tr>
			    <th>기안일</th>
			    <td>${draft.workDate}</td>
			</tr>
		</table>
	</c:forEach>
	<br/>
<form action="writeDraft.do" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<th>제목</th>
			<td><input type="text" name="title" placeholder="*제목을 입력해주세요."></td>
		</tr>
		<tr>
		    <th>합의</th>
		    <td></td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="rich_editor"></div>
			<!-- 작성글은 div 에 담겨지는데, div는 서버로 전송이 불가능 -->
			<input type="hidden" name="content" value=""/>
		</td>
	</tr>
</table>
<br/>
<input type="file" name="files" multiple="multiple"/>
<br/>
<input type="radio" name="publicStatus" value=0 checked/>공개
<input type="radio" name="publicStatus" value=1 />비공개
<br/>
<input type="button" value="임시저장" onclick="save()"/>
<input type="button" value="등록" onclick="save()"/>
<input type="button" value="취소"/>
</form>
</body>
<script>
	var config = {}
	config.editorResizeMode = "none";
	var editor = new RichTextEditor("#rich_editor", config);

	function save(){
		var content = editor.getHTMLCode(); // <div id="rich_editor"></div> 이 태그와 태그 사이에 html 내용을 content에 담는다.
		$('input[name="content"]').val(content);
		console.log(content.length/1024/1024+'MB');
		if(content.length > (2*1024*1024)){
		 alert('컨텐츠의 크기가 너무 큽니다. 이미지의 갯수나 크기를 줄여주세요!');
		}else{
		 $('form').submit();
		} 
	 }
	
</script>
</html>