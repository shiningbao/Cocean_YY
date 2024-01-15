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
			<div id="animalTitle" class="mb-2">
				<span id="animalStatus" class="badge mr-1" style="font-size: 1.4rem">${title.status}</span>
				<span style="font-size: 1.8rem; font-weight: 600">${title.nickname}</span>
				<span style="font-size: 1.3rem">&nbsp${title.commonName}-${title.animalCode} </span>
			</div>
			<div class="detailBar">
				<div class="detailBar_item" id="base" onclick="detailPage('base')">친구들 정보</div>
				<div class="detailBar_item" id="log" onclick="detailPage('log')">친구들 기록</div>
				<div class="detailBar_item" id="plan" onclick="detailPage('plan')">관리 계획</div>
			</div>
			
			<br/>
			
			<div class="card shadow pt-4 p-2 mx-2">
				<input class="form-control mx-2" type="month" name="month" value="${month}" onchange="monthchange()" style="width:200px"/>
<!-- 				<br/> -->
				<c:forEach items="${incharge}" var="item">
					<c:if test="${item.employeeID eq userInfo.employeeID}">
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
							<div id="summernote"></div>
						</div>
					</c:if>
				</c:forEach>
				<hr>
				<div id="logplanBody">
					<c:if test="${empty content}">
					<div class="card mb-4">
						<div class="text-center my-3">-- 작성된 내용이 없습니다 --</div>
					</div>
					</c:if>
					<c:forEach items="${content}" var="item" varStatus="st">
						<div class="status card mb-2">
							<div class="card-header">
								<span class="badge">${item.status}</span>
								${item.departmentName}_${item.name} / ${item.creationDate}
								<c:if test="${item.employeeID eq userInfo.employeeID}">
									<div class="float-right">
										<!-- 계획 완료 변경 -->
									<c:if test="${category eq 'plan'}">
										<a class="btn btn-success btn-circle mr-1" onclick="aa(this,${item.logID})">
											<i class="fas fa-check text-white"></i>
										</a>
									</c:if>
										<!-- 수정 -->
										<a class="btn btn-warning btn-circle mr-1" onclick="logplanUpdateGo(this,${item.logID})">
											<i class="fi fi-sr-pencil text-white"></i>
										</a>
										<!-- 삭제 -->
										<a class="btn btn-danger btn-circle mr-1" onclick="logplanDel('${item.logID}')">
											<i class="fas fa-trash text-white"></i>
										</a>
									</div>
								</c:if>		
							</div>
							<div class="card-body pb-1">
								<div class="card-text logcontent">${item.content}</div>
								<div id="log_${item.logID}"></div>
							</div>
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
	
	if($('#logPlanWriteForm').length > 0){
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
	}
	
	function monthchange(){
		var month = $('input[name="month"]').val();
		console.log(month);
		location.href='detailLogPlan?animalID='+${animalID}+'&category=log&month='+month+'&page=1';
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
				data.status = '진행';
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
	
	
	function logplanUpdateGo(e,logID){
		
		var $find = $(e).parent().parent().parent();
		console.log($find);
		var content = $find.find('.logcontent').first().html();
		$find.find('.logcontent').first().html('');
		
		var $updateSummerNote = $find.find('#log_'+logID);
		$updateSummerNote.summernote({
			height: 60,
			maxHeight: 500,
			minHeight: 40,
			focus: true,
			toolbar:['picture']
		});
		$updateSummerNote.summernote('code',content);
		
		var insertButton = '<div clss="d-inline my-2">';
		insertButton += '<button class="btn btn-primary btn-sm float-right my-2" onclick="logplanUpdateDo(this,'+logID+')">수정 완료</button>';
		insertButton += '<button class="btn btn-secondary btn-sm float-right mr-2 my-2" onclick="location.href = location.href">취소</button>';
		insertButton += '</div>';
		$find.find('.card-body').first().append(insertButton);
		$('#logplanBody').find('.btn-circle').css({'display':'none'});
	}
	
	
	function logplanUpdateDo(e,logID){
		var logplanUpdateContent = $('#log_'+logID).summernote('code');
		console.log(logplanUpdateContent);
		
		$.ajax({
			type:'post',
			url:'logplanUpdate.Do',
			data:{'logID':logID, 'logplanUpdateContent':logplanUpdateContent},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				swal({
					title: data.msg,
					button: '확인'
				}).then((isOkey) => {
					if(isOkey){
						location.href = location.href;
					}
				});
			},
			error:function(e){
				console.log(e);
			}
		});	
	}
	
	$('.status').each(function(index, element){
		var status = $(element).find('span').first().html();
		if(status == '정상' || status == '완료'){
			$(element).addClass('border-left-success');
			$(element).find('span').addClass('badge-success');
		}else if(status == '질병' || status == '진행'){
			$(element).addClass('border-left-warning');
			$(element).find('span').addClass('badge-warning');
		}else if(status == '격리'){
			$(element).addClass('border-left-danger');
			$(element).find('span').addClass('badge-danger');
		}else if(status == '폐사'){
			$(element).addClass('border-left-dark');
			$(element).find('span').addClass('badge-dark');
		}
	})
	
	var animalStatus = $('#animalStatus').html();
	if(animalStatus == '정상'){
		$('#animalStatus').addClass('badge-success');
	}else if(animalStatus == '질병'){
		$('#animalStatus').addClass('badge-warning');
	}else if(animalStatus == '격리'){
		$('#animalStatus').addClass('badge-danger');
	}else if(animalStatus == '폐사'){
		$('#animalStatus').addClass('badge-dark');
	}
	
	

</script>






</html>