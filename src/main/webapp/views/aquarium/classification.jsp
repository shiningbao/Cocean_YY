<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.classifiDiv{
		width: 95%;
		margin: 10px auto;
		overflow-y : auto;
		height: 350px;
	}
	.classifiTable{
		width: 100%;
	}
	.classifiTable thead{
		position: sticky;
		top: 0px;
		background-color: grey;
		
	}
	.classifiTable *{
		font-size: 17px;
		text-align: center;
	}
</style>
</head>
<body>
<h1>CLASSFICATION</h1>

<input type="text" id="keyword"/>
<button id="search" onclick="classficationSearch()">검색</button>
<div class="classifiDiv">
	<table class="classifiTable">
		<colgroup>
			<col style="width:27%">
			<col style="width:45%">
			<col style="width:28%">
		</colgroup>
		<thead>
			<tr>
				<th>분류</th>
				<th>학명</th>
				<th>국명</th>
			</tr>
		</thead>
		<tbody id="classifiList">
		</tbody>
	</table>
</div>
<button onclick="sendVal()">확인</button>
<button onclick="noneClassifi()">취소</button>
</body>
<script>

var speciesID_click;
var taxo_click;
var scien_click;
var common_click;

var speciesID;
var taxo;
var scien;
var common;
var classifi;
 
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
	$('#classifiList').html('');
	list.forEach(function(item){
		var value = "\'"+item.speciesID+"','"+item.taxonomy+"','"+item.scientificName+"','"+item.commonName+"\'";
		content += '<tr onclick="clickList(this,'+value+')" ondblclick="sendVal()">';
		content += '<th>'+item.taxonomy+'</th>';
		content += '<th>'+item.scientificName+'</th>';
		content += '<th>'+item.commonName+'</th>';
		content += '</tr>';
	});
	$('#classifiList').html(content);
}

function clickList(e,id,t,s,c){
	var list = $(e).siblings();
	for (var i = 0; i < list.length; i++) {
		list[i].style.backgroundColor = 'white';
	};
	$(e).css({'background-color' : 'grey'});
	speciesID_click = id;
	taxo_click = t;
	scien_click = s;
	common_click = c;
}

function sendVal(){
	if(speciesID_click != null){
		switch (taxo) {
			case "무척추동물류":
				classifi = "In";
				break;
			case "미삭동물":
				classifi = "Ch";
				break;
			case "양서류":
				classifi = "Am";
				break;
			case "어류":
				classifi = "Fi";
				break;
			case "조류":
				classifi = "Av";
				break;
			case "파충류":
				classifi = "Re";
				break;
			case "포유류":
				classifi = "Ma";
				break;
		}
		speciesID = speciesID_click;
		taxo = taxo_click;
		scien = scien_click;
		common = common_click;
		drawClassifi();
	}else{
		alert('동물 분류를 선택해 주세요.');
	}
}

</script>













</html>















