<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Cocean</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.animalDetail{
		width: 900px;
		margin: 0 auto;
		border: 1px solid black;
	}
</style>
</head>
<body>
	<c:import url="/side"/>
	<div class="animalContent">
		<h1>코션친구들</h1>
		<div class="animalDetail">
			<h2 id="nick">${nickname}</h2>
			<ul style="display: flex;">
				<li style="margin-right: 40px" id="base">기본 정보</li>
				<li style="margin-right: 40px" id="log">일지</li>
				<li style="margin-right: 40px" id="plan">계획</li>
			</ul>
			
			<div class="drawContent"></div>
		</div>
	</div>
</body>
<script>

resizeWidth();
window.addEventListener('resize',resizeWidth);
function resizeWidth(){
	var winWidth = window.innerWidth;
	//console.log(winWidth);
	var sideWidth = $('nav').outerWidth();
	//console.log(sideWidth);
	var contentWidth = winWidth-sideWidth;
	$('.animalContent').css({'width':contentWidth, 'margin-left':sideWidth});
}

var animalID = '${animalID}';
var nickname = '${nickname}';
var con;
console.log(nickname);

getContents('base');

function getContents(con){
	$.ajax({
		type:'post',
		url:"detail.ajax",
		data:{'animalID':animalID, 'con':con},
		dataType:'text',
		success:function(data){
			console.log(data);
			drawContent(data, con);
		},
		error:function(e){
			console.log(e);
		}
	});
}

$('li').on('click',function(){
	con = this.id;
	getContents(con);
});


function drawContent(data, con){
	var html = jQuery('<div>').html(data);
	var view = '';
	$('.drawContent').html('');
	switch (con) {
		case 'base':
			view += html.find('#animalDetailBase').html();
			break;
		case 'log':
			view += html.find('#animalDetailLog').html();
			break;
		case 'plan':
			view += html.find('#animalDetailPlan').html();
			break;
	}
	$('.drawContent').html(view);
}

function logplanWrite(){
	var month = $('input[name="month"]').val();
	console.log(month);
	var content = $('textarea[name="content"]').val();
	var manageCategory = con;
	var status = '-';
	if(con == 'log'){
		status = $('select[name="status"]').val();
	}
	var data = {};
	data.idx = animalID;
	data.content = content;
	data.manageCategory = manageCategory;
	data.status = status;
	data.coceanCategory = 'animal';
	console.log(data);
	$.ajax({
		type:'post',
		url:'logplanWrite.go',
		data:data,
		dataType:'JSON',
		success:function(data){
			getContents(con);
		},
		error:function(e){
			console.log(e);
		}		
	});	
}

function monthchange(){
	var month = $('input[name="month"]').val();
	console.log(month);

	$.ajax({
		type:'post',
		url:"detail.ajax.month",
		data:{'animalID':animalID, 'con':con, 'month':month},
		dataType:'text',
		success:function(data){
			console.log(data);
			drawContent(data, con);
		},
		error:function(e){
			console.log(e);
		}
	});

	


	
	
	
}

</script>
</html>