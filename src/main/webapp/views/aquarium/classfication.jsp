<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
<h1>CLASSFICATION</h1>

<input type="text" id="keyword"/>
<button id="search" onclick="classficationSearch()">검색</button>
<table>
	<thead>
		<tr>
			<th>분류</th>
			<th>학명</th>
			<th>국명</th>
		</tr>
	</thead>
	<tbody id="con">
	</tbody>
</table>
</body>
<script>
function classficationSearch(){
	var keyword = $('#keyword').val();
	$.ajax({
		type:'get',
		url:'classficationSearch',
		data:{'keyword':keyword},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drowList(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drowList(list){
	list.forEach(item){
		$('#con').val('');
		var content = '<tr><th>0</th><th>1</th><th>2</th></tr>';
		$('#con').val(content);
	}
}















</script>













</html>















