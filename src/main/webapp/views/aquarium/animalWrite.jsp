<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


</head>
<body>
<h1>Animal Write</h1>
<form action="write.do" method="post" >
<table>
	<tr>
		<th>분류</th>
		<td><input type="text" name="3" readonly/></td>
	</tr>
	<tr>
		<th>학명</th>
		<td><input type="text" name="a" readonly/></td>
	</tr>
	<tr>
		<th>국명</th>
		<td><input type="text" name="s" readonly/></td>
	</tr>
	<tr>
		<th>애칭</th>
		<td><input type="text" name="d"/></td>
	</tr>
	<tr>
		<th>코션하우스</th>
		<td><input type="text" name="f"/></td>
	</tr>
	<tr>
		<th>마리 수</th>
		<td><input type="text" name="g"/></td>
	</tr>
	<tr>
		<th>태어난 날</th>
		<td><input type="text" name="h"/></td>
	</tr>
	<tr>
		<th>들어온 날</th>
		<td><input type="text" name="z"/></td>
	</tr>
	<tr>
		<th>상태</th>
		<td><input type="text" name="x"/></td>
	</tr>
	<tr>
		<th>세부 정보</th>
		<td><input type="text" name="c"/></td>
	</tr>
	<tr>
		<th>사진</th>
		<td><input type="text" name="t"/></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit">등록</button>
		</th>
	</tr>
</table>
</form>
<button onclick=classfication()>분류창</button>
<button onclick=aa()>분류창</button>
</body>
<script>

// 분류체계 새창 띄우기
var win;
function classfication(){
	var url = 'classficationPopup';
	var winName = '코션친구들 분류군 선택';
	var popStyle = 'width = 500px, height = 500px, top = 100px, left = 200px,';
	win = window.open(url, winName,popStyle);
}

function aa(){
	win.close();
}



</script>
</html>




