<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

</style>
</head>
<body>
<c:import url="/side"/>
	<div class="container-fluid contentField">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">코션친구들</h1>
		</div>
		
		<div class="card shadow mb-2">
			<nav class="navbar navbar" id="search">
		    	<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input" type="checkbox" checked="checked" value="all" id="option1">전체
					</label>
				</div>
		    	<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input" type="checkbox" value="${userInfo.employeeID}" id="option2">담당친구들
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-status" type="checkbox" checked="checked" value="정상" id="option3">정상
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-status" type="checkbox" checked="checked" value="질병" id="option4">질병
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-status" type="checkbox" checked="checked" value="격리" id="option5">격리
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-status" type="checkbox" value="폐사" id="option6">폐사
					</label>
				</div>
	
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-classifi" type="checkbox" checked="checked" value="In" id="option7">무척추
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-classifi" type="checkbox" checked="checked" value="Ma" id="option8">포유류
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-classifi" type="checkbox" checked="checked" value="Re" id="option9">파충류
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-classifi" type="checkbox" checked="checked" value="Av" id="option10">조류
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-classifi" type="checkbox" checked="checked" value="Fi" id="option11">어류
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-classifi" type="checkbox" checked="checked" value="Am" id="option12">양서류
					</label>
				</div>
				<div class="form-check form-check-inline">
					<label class="form-check-label">
						<input class="form-check-input animal-classifi" type="checkbox" checked="checked" value="Ch" id="option13">미삭
					</label>
				</div>
			
	   			<div class="input-group">
					<input type="text" id="searchName" class="form-control bg-light border-0 small" placeholder="Search for…" aria-label="Search" aria-describedby="basic-addon2">
					<div class="input-group-append">
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm"></i>
						</button>
					</div>
				</div>
				
		    </nav>
		</div>
		
		<div class="card shadow mb-4">
			<div class="drawList"></div>
			<div class="card-body">
			<button  type="button" class="btn btn-primary float-right" id="write">등록</button>
			<a href="write.go" class="btn btn-primary float-right">등록</a>
			</div>
		</div>
		
	</div>




	<c:import url="/footer"/>
</body>

<script>

	var msg = "${msg}";
	if(msg != ""){
		swal({
			title: msg,
			button: '확인'
		});
	}
	
	$('#write').on('click',function(){
		location.href='write.go';
	});
	
	showList()
	
	// 전체 체크 시 친구들 빼고 다 체크
	$('#option1').on('change',function(){
		if(this.checked){
			$('input[type="checkbox"]').prop('checked', true);
			$('#option2').prop('checked', false);
		}else{
			$('input[type="checkbox"]').prop('checked', false);
			$('#option2').prop('checked', true);
		}
	});
	
	function showList(){
		var inchargeEmployeeID = ($('#option2').prop('checked')) ? '${userInfo.employeeID}' : 0;
		var statusValues = [];
		var classifiValues = [];
		var searchName = $('#searchName').val();
		$('.animal-status:checked').each(function() {
			statusValues.push($(this).val());
		});
		$('.animal-classifi:checked').each(function() {
			classifiValues.push($(this).val());
		});
		if(statusValues == '' || classifiValues == ''){
			swal({
				title: '조건을 선택해 주세요',
				button: '확인'
			});
		}else{
			var formData = new FormData();
			formData.append("inchargeEmployeeID", inchargeEmployeeID);
			formData.append("statusValues", statusValues);
			formData.append("classifiValues", classifiValues);
			formData.append("searchName", searchName);
			$.ajax({
				type:'post',
				url:'list.do',
				data: formData,
				dataType:'text',
				contentType: false,
			    processData: false,
				success:function(data){
					//console.log(data);
					drawList(data);
				},
				error:function(e){console.log(e);}
			});
		}
	}
	
	function drawList(data){
		var content = jQuery('<div>').html(data);
		$('.drawList').html('');
		$('.drawList').html(content);		
	}
	
</script>




</html>