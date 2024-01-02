<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Cocean</title>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<!-- 담당자 지정 jstree -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

<script src="<c:url value='/resource/summernote/summernote-lite.js'/>"></script>
<script src="<c:url value='/resource/summernote/lang/summernote-ko-KR.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resource/summernote/summernote-lite.css'/>">

<style>
	.animalContent{
		position: absolute;
		top: 80px;
	}
	.animalDetail{
		width: 90%;
		margin: 0 auto;
	}
	
	.topBar {
		width: 100%;
		height: 60px;
/* 		left: 22%; */
/* 		position: absolute; */
		background-color: #86B0F3;
		display: flex;
		
		justify-content: space-evenly;
	}
	.topBar div{
		
		width: 33%;
		height: 100%;
		position: relative;
		text-align: center;
		font-size: 21px;
		padding-top: 14px;
		cursor: default;
	}
	.barItem:hover{
		cursor: pointer;
		background-color: #2F80ED;
		padding-top: 13px;
	}
	.imgChange:hover{
		cursor: pointer;
	}

</style>
</head>
<body>
	<c:import url="/side"/>
	<div class="animalContent">
		<h1>코션친구들</h1>
		<div class="animalDetail">
			
			<div class="topBar">
				<div class="barItem" id="base">친구들 정보</div>
				<div class="barItem" id="log">친구들 기록</div>
				<div class="barItem" id="plan">관리 계획</div>
			</div>
			<h2 class="animalTilte"></h2>
			
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
	$('.animalDetail').css({'width':contentWidth*0.9, 'margin':'0 auto'});

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

$('.barItem').on('click',function(){
	con = this.id;
	getContents(con);
});

function drawContent(data){
	var content = jQuery('<div>').html(data);
	$('.drawContent').html('');
	$('.drawContent').html(content);
}
var titleName;
function createTitle(status,nickname,commonName){
	titleName = '('+status + ') (' + nickname+') ('+commonName+')';
	drawTitle();
}

function drawTitle(){
	$('.animalTilte').html(titleName);
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

function logplanStart(){
	$('#summernote').summernote({
		height: 200, width: 700,
		maxHeight: 200,
		minHeight: 200,
		focus: true,
		toolbar:['picture']
	});
}


// 일지,계획 작성

function logplanWrite(){
	var status = $('#status').val();
	var content = $('#summernote').summernote('code');
	if(con.length > (2*1024*1024)){
		alert('컨텐츠의 크기가 큽니다. 이미지 갯수나 크기를 줄여주세요');
	}else{
		logplanWriteDo(content,status);
	}

}

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


//일지,계획 수정

function logplanUpdateGo(e,id){
	
	// 수정, 삭제 버튼 디스플레이 논 해야 함
	
	var con = '<tr><th><button onclick="logplanUpdateDo(this)">수정 완료</button>';
	con += '<button onclick="logplanCancle(\''+id+'\')">취소</button>';
	con += '<p>※ 이미 작성된 내용과 상태를 수정 불가능하지만 추가 가능</p></th></tr>';
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

/* 일지 수정 시 기존 내용 수정 가능한 경우

	function logplanUpdateGo(e){
		$tr = $(e).closest('th');
		var employeeID = $tr.prev().attr('id');
		var employeeInfo = $tr.prev().text();
		$updateTarget = $(e).closest('table');
		var $code = $updateTarget.find('th').eq(2);
		var id = $code.attr('id');
		console.log(id);
		var code = $code.html();
		aassdd = code;
		var con = '<tr><th>'+employeeInfo+'<button onclick="logplanUpdateDo(this)">수정 완료</button>';
		con += '<button onclick="logplanCancle(\''+id+'\')">취소</button></th></tr>';
		con += '<tr><th><div id=\"'+id+'\"></div></th></tr>';
		$updateTarget.html(con);
		var $summer = $('#'+id);
		console.log($summer);
		$summer.summernote({
			height: 180, width: 700,
			minHeight: 150,
			maxHeight:500,
			focus: true,
			toolbar:['picture']
		});
		$summer.summernote('code', code);
	}
*/

function logoplanUpdateDo(){
	// 수정 완료 눌렀을 때
	// 아작스 요청 해야 함
	
}

function logplanCancle(id){
	console.log(id);
	
	// 수정, 삭제 버튼 디스플레이 블럭 해야 함

	$('#'+id).summernote('destroy');
	$('#log_'+id).html('');
}


// 삭제
function logplanDel(id){
	console.log(id);
	$.ajax({
		type:'post',
		url:'logplanDel',
		data:{'logID':id},
		dataType:'JSON',
		success:function(data){
			
			alert(data.msg);
			getContents(con);
		},
	    error: function(xhr, status, error) {
	        console.log(xhr.responseText); // 에러 응답을 콘솔에 출력
	        // 추가적인 에러 처리 로직
	    }
	});
}




</script>
</html>













