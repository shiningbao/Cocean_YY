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
	<tr>
		<th colspan="4">
			<button onclick="sendVal()">확인</button>
			<button onclick="window.close()">취소</button>
		</th>
	</tr>
</table>
</body>
<script>

var speciesID;
var taxo;
var scien;
var common;

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
	var content = '';
	$('#con').html('');
	list.forEach(function(item){
		var value = "\'"+item.speciesID+"','"+item.taxonomy+"','"+item.scientificName+"','"+item.commonName+"\'";
		content += '<tr onclick="clickList(this,'+value+')" ondblclick="sendVal()">';
		content += '<th>'+item.taxonomy+'</th>';
		content += '<th>'+item.scientificName+'</th>';
		content += '<th>'+item.commonName+'</th>';
		content += '</tr>';
	});
	$('#con').html(content);
}

function clickList(e,id,t,s,c){
	var list = $(e).siblings();
	for (var i = 0; i < list.length; i++) {
		list[i].style.backgroundColor = 'white';
	};
	$(e).css({'background-color' : 'grey'});
	speciesID = id;
	taxo = t;
	scien = s;
	common = c;
}

function sendVal(){
	if(speciesID != null){
		window.opener.setClassfication(speciesID,taxo,scien,common);
		window.close();
	}else{
		alert('동물 분류를 선택해 주세요.');
	}
}

</script>













</html>















