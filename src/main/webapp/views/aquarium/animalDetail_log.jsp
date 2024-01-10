<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Cocean</title>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script src="<c:url value='/resource/summernote/summernote-lite.js'/>"></script>
<script src="<c:url value='/resource/summernote/lang/summernote-ko-KR.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resource/summernote/summernote-lite.css'/>">

<style>
	 .detailBar { 
	    width: 100%;
	    height: 60px;
	    left: 130px;
	 	background-color: #86B0F3; 
	 	display: flex; 
		
	 	justify-content: space-evenly; 
	 } 
	 .detailBar div{ 
		
	 	width: 100%; 
	 	height: 100%; 
	 	position: relative; 
	 	text-align: center; 
	 	font-size: 21px; 
	 	padding-top: 14px; 
	 	cursor: default; 
	 } 
	
	.detailBar_item:hover{
		cursor: pointer;
		background-color: #2F80ED;
		padding-top: 13px;
	}
</style>


</head>

<body>
	<c:import url="/side"/>
	<div class="container-fluid contentField">
	
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">코션친구들</h1>
		</div>
		
		<div class="col-12 mx-auto">
			<div><h4>${title.status} / ${title.nickname} / ${title.commonName} / ${title.animalCode}</h4></div>
			<div class="detailBar">
				<div class="detailBar_item" id="base" onclick="detailPage('base')">친구들 정보</div>
				<div class="detailBar_item" id="log" onclick="detailPage('log')">친구들 기록</div>
				<div class="detailBar_item" id="plan" onclick="detailPage('plan')">관리 계획</div>
			</div>
			
			<br/>
			
			<div class="card shadow pt-4 p-2 mx-2">
				<input class="form-control mx-2" type="month" name="month" value="${month}" onchange="monthchange()" style="width:200px"/>
				<br/>
				<div id="logPlanWriteForm">
					<h5>
						<c:if test="${category eq 'log'}">
							친구들 기록 작성
						</c:if>
						<c:if test="${category eq 'plan'}">
							친구들 관리 계획 작성
						</c:if>
					</h5>
					<div class="row">
						<div class="col-md-6 align-items-center">
							${userInfo.departmentName} ${userInfo.name}
						</div>
						<div class="col-md-6 d-flex  mb-2 justify-content-end align-items-center">
						<c:if test="${category eq 'log'}">
						<div class="float-rigth">현재 상태:</div>

							<select id="status" class="form-control mx-2" style="width: 200px">
								<option value="정상">정상</option>
								<option value="질병">질병</option>
								<option value="격리">격리</option>
								<option value="폐사">폐사</option>
							</select>

							</c:if>
							<button class="btn btn-primary mr-1 ml-2"
								type="button" name="logWrite" onclick="logplanWrite()">등록</button>
						</div>
					</div>
				</div>
					<div id="summernote"></div>

				<hr>
				<div>
					<c:if test="${empty content}">
					<div class="card p-2">작성된 내용이 없습니다</div>
					</c:if>
					<c:forEach items="${content}" var="item" varStatus="st">
						<div class="card p-2">
							<div class="d-inline">
								<div class="float-left" id="${item.employeeID}">
									${item.departmentName}_${item.name} / ${item.creationDate}
								</div>
								<button class="btn btn-outline-primary btn-sm mr-1 ml-1 float-right" onclick="logplanUpdateGo(this,${item.logID})">수정</button>
								<button class="btn btn-outline-primary btn-sm mr-1 ml-1 float-right" onclick="logplanDel('${item.logID}')">삭제</button>
								<div class="float-right">상태: ${item.status}</div>
							</div>
							<div class="mt-1 pl-2">${item.content}</div>
								
								<div id="log_${item.logID}"></div>
						</div>
					</c:forEach>
				</div>
			</div>
			
		</div>

	</div>
	<c:import url="/footer"></c:import>
</body>
<script>	
	var category = '${category}';
	
	var msg = "${msg}";
	if(msg != ""){
		swal({
			title: msg,
			button: '확인'
		});
	}

	function detailPage(c){
		var month = getMonth();
		var rink;
		if(c == 'base'){
			rink = 'detailBase?animalID=${animalID}';
		}else{
			rink = 'detailLogPlan?animalID=${animalID}&category='+c+'&month='+month;
		}
		console.log(rink);
		location.href=rink;
	}
	
	function getMonth(){
		var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
		return year + '-' + month;
	}
	
	if($('input[name="month"]').val() != getMonth()){
		$('#logPlanWriteForm').css({'display':'none'});
	}else{
		$('#summernote').summernote({
			height: 200,
			maxHeight: 500,
			minHeight: 200,
			focus: true,
			toolbar:['picture']
		});
	}

	function monthchange(){
		var month = $('input[name="month"]').val();
		console.log(month);
		location.href='detailLogPlan?animalID='+${animalID}+'&category=log&month='+month;
	}
	
	function logplanWrite(){
		var content = $('#summernote').summernote('code');
		if(content.length > (2*1024*1024)){
			swal({
				title : '컨텐츠의 크기가 큽니다. 이미지 갯수나 크기를 줄여주세요',
				button: '확인'
			});
		}else{
			var data = {};
			//data.employeeID = employeeID;
			data.manageCategory = '${category}';
			data.coceanCategory = 'animal';
			data.idx = '${animalID}';
			data.content = content;
			if(category == 'log'){
				data.status = $('#status').val();	
			}else{
				data.status = '-';
			}
			$.ajax({
				type:'post',
				url:'logplanWrite.go',
				data:data,
				dataType:'JSON',
				success:function(data){
					console.log(data);
					location.href = location.href;
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	}
			
	// 일지계획 삭제
	function logplanDel(id){
		console.log(id);
		swal({
			title:'삭제하시겠습니까?',
			icon:'error',
			buttons:['취소','삭제']
		}).then((isOkey) => {
			if(isOkey){
				$.ajax({
					type:'post',
					url:'logplanDel',
					data:{'logID':id},
					dataType:'JSON',
					success:function(data){
						swal({
							title: data.msg,
							button: '확인'
						}).then((isOkey2) => {
							if(isOkey2){
								location.href = location.href;								
							}
						});
					},
				    error: function(e) {
				        console.log(e);
				    }
				});	
			}
		});
	}
	
	
	function logplanUpdateGo(e,${item.logID}){
		
	}
	
	
	
	
	
	
	
	
	
	

</script>






</html>