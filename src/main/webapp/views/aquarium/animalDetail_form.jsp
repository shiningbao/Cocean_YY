<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Cocean</title>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<!-- 담당자 지정 jstree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<style>
	.animalContent{
		position: absolute;
		top: 80px;
	}
	.animalDetail{
		width: 90%;
		min-width: 900px;
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
//console.log(nickname);

getContents('base');


function getContents(con){
	$.ajax({
		type:'post',
		url:"detail.ajax",
		data:{'animalID':animalID, 'con':con},
		dataType:'text',
		success:function(data){
			drawContent(data);
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

function drawContent(data){
	var content = jQuery('<div>').html(data);
	$('.drawContent').html('');
	$('.drawContent').html(content);
}

function drawStatus(status){
	var statusNickname = '('+status + ')   ' + nickname;
	$('#nick').html(statusNickname);
}

// 일지,계획 달 변경 시 다시 그리기
function monthchange(){
	var month = $('input[name="month"]').val();
	console.log(month);

	$.ajax({
		type:'post',
		url:"detail.ajax.month",
		data:{'animalID':animalID, 'con':con, 'month':month},
		dataType:'text',
		success:function(data){
			//console.log(data);
			drawContent(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

// 일지,계획 작성
function logplanWriteDo(content,status){
	//var employeeID = '${userInfo.employeeID}';
	var data = {};
	//data.employeeID = employeeID;
	data.manageCategory = con;
	data.coceanCategory = 'animal';
	data.idx = animalID;
	data.content = content;
	data.status = status;
	$.ajax({
		type:'post',
		url:'logplanWrite.go',
		data:data,
		dataType:'JSON',
		success:function(data){
			drawStatus(status);
			getContents(data.con);
		},
		error:function(e){
			console.log(e);
		}
	});
}

// 일지,계획 수정


// function logplanUpdateGo(e){
// 	$tr = $(e).closest('th');
// 	var employeeID = $tr.prev().attr('id');
// 	var employeeInfo = $tr.prev().text();
// 	$updateTarget = $(e).closest('table');
// 	var $code = $updateTarget.find('th').eq(2);
// 	var id = $code.attr('id');
// 	console.log(id);
// 	var code = $code.html();
// 	aassdd = code;
// 	var con = '<tr><th>'+employeeInfo+'<button onclick="logplanUpdateDo(this)">수정 완료</button>';
// 	con += '<button onclick="logplanCancle(\''+id+'\')">취소</button></th></tr>';
// 	con += '<tr><th><div id=\"'+id+'\"></div></th></tr>';
// 	$updateTarget.html(con);
// 	var $summer = $('#'+id);
// 	console.log($summer);
// 	$summer.summernote({
// 		height: 180, width: 700,
// 		minHeight: 150,
// 		maxHeight:500,
// 		focus: true,
// 		toolbar:['picture']
// 	});
// 	$summer.summernote('code', code);
// }

function logplanUpdateGo(e,id){
	
	var con = '<tr><th><button onclick="logplanUpdateDo(this)">수정 완료</button>';
	con += '<button onclick="logplanCancle()">취소</button><p>이미 작성된 내용은 수정 불가능하지만 추가 가능</p></th></tr>';
	con += '<tr><th><div id=\"'+id+'\"></div></th></tr>';
	$('#log_'+id).html(con);
	var $summer = $('#'+id);
	$summer.summernote({
		height: 180, width: 700,
		minHeight: 150,
		maxHeight:500,
		focus: true,
		toolbar:['picture']
	});
}

function logoplanUpdateDo(){
	
	
	
	
}

function logplanCancle(id){
	console.log(id);
	$summer =	$('#'+id);

	$('#'+id).summernote('destroy');
	getContents(con);
}








</script>
</html>













