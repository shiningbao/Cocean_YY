<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	#checkBox {
		display: flex;
		justify-content: space-around;
		width: 90%;
		height: 20%;
		font-size: 13px;
		top: 100px;
		left: 5%;
		align-items: flex-start;
		padding-top: 45px;
		position: absolute;
	}
	
	#box1 {
		position: absolute;
		height: 50px;
		padding-right: 450px;
		z-index: 9999;
	}
	
	#box2 {
		position: absolute;
		margin-top: 60px;
		z-index: 9999;
		padding-right: 450px;
	}
	#search {
		padding-left: 700px;
	}
	
	label {
		padding-right: 25px;
		padding-left: 10px;
	}
	
	#search{
	    padding-left: 755px;
	    margin-top: 15px;
	    position: absolute;
	}
	
	#search input{
		z-index: 99999;
		
	}
</style>
</head>
<body>
<c:import url="/side"/>
<h1>ANIMAL LIST</h1>


<div id="checkBox">
    <div id="box1">
	    <div class="form-check form-check-inline">
	        <input class="form-check-input" type="checkbox" value="all" id="option1">
	        <label class="form-check-label" for="option1">전체</label>
	    </div>
	    <div class="form-check form-check-inline">
	        <input class="form-check-input" type="checkbox" value="${userInfo.employeeID}" id="option2">
	        <label class="form-check-label" for="option2">담당친구들</label>
	    </div>
		<div id="status">
		    <div class="form-check form-check-inline">
		        <input class="form-check-input" type="checkbox" value="정상" id="option3">
		        <label class="form-check-label" for="option3">정상</label>
		    </div>
		    <div class="form-check form-check-inline">
		        <input class="form-check-input" type="checkbox" value="질병" id="option4">
		        <label class="form-check-label" for="option4">질병</label>
		    </div>
		    <div class="form-check form-check-inline">
		        <input class="form-check-input" type="checkbox" value="격리" id="option5">
		        <label class="form-check-label" for="option5">격리</label>
		    </div>
		    <div class="form-check form-check-inline">
		        <input class="form-check-input" type="checkbox" value="폐기" id="option6">
		        <label class="form-check-label" for="option6">폐기</label>
		    </div>
	    </div>
    </div>
    <div id="box2">
	    <div class="form-check form-check-inline">
	        <input class="form-check-input" type="checkbox" value="option7" id="option7">
	        <label class="form-check-label" for="option7">무척추</label>
	    </div>
	    <div class="form-check form-check-inline">
	        <input class="form-check-input" type="checkbox" value="option8" id="option8">
	        <label class="form-check-label" for="option8">미삭</label>
	    </div>
	    <div class="form-check form-check-inline">
	        <input class="form-check-input" type="checkbox" value="option9" id="option9">
	        <label class="form-check-label" for="option9">어류</label>
	    </div>
	    <div class="form-check form-check-inline">
	        <input class="form-check-input" type="checkbox" value="option10" id="option10">
	        <label class="form-check-label" for="option10">조류</label>
	    </div>
	    <div class="form-check form-check-inline">
	        <input class="form-check-input" type="checkbox" value="option11" id="option11">
	        <label class="form-check-label" for="option11">파충류</label>
	    </div>
	    <div class="form-check form-check-inline">
	        <input class="form-check-input" type="checkbox" value="option12" id="option12">
	        <label class="form-check-label" for="option12">포유류</label>
	    </div>
    </div>


    <nav class="navbar navbar" id="search">
<!--     <input class="form-control mr-sm-2" type="search" placeholder="담당자명을 입력하세요." aria-label="Search"> -->
    <button class="btn btn-outline-primary my-2 my-sm-0" type="button" onclick="showList()">검색</button>
    </nav>
</div>



<!-- 
<table>
	<tr>
		<th>ID</th>
		<th>애칭</th>
		<th>국명</th>
		<th>분류</th>
		<th>상태</th>
	</tr>
	<c:forEach items="${list}" var="item">
		<tr>
		<td><a href="detail.go?animalID=${item.getAnimalID()}&nickname=${item.getNickname()}">${item.getAnimalID()}</a></td>
		<td>${item.getNickname()}</td>
		<td>${item.getCommonName()}</td>
		<td>${item.getClassificationCode()}</td>
		<td>${item.getStatus()}</td>
		</tr>
	</c:forEach>
</table>
 -->
</body>

<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
	$('#write').on('click',function(){
		location.href='write.go';
	});
	
	// 전체 체크 시 친구들 빼고 다 체크
	$('#option1').on('change',function(){
		if(this.checked){
			$('input[type="checkbox"]').prop('checked', true);
		}else{
			$('input[type="checkbox"]').prop('checked', false);
		}
	});
	
	function showList(){
		var inchargeEmployeeID = ($('#option2').prop('checked')) ? '${userInfo.employeeID}' : '';
		var statusValues = [];
		var classifiValues = [];
		$('#status').find('input[type="checkbox"]:checked').each(function() {
			statusValues.push($(this).val());
		});
		$('#box2').find('input[type="checkbox"]:checked').each(function() {
			classifiValues.push($(this).val());
		});
		if(statusValues == '' || classifiValues == ''){
			alert('선택 필요');
		}else{
			var data = {};
			data.inchargeEmployeeID = inchargeEmployeeID;
			data.statusValues = statusValues;
			data.classifiValues = classifiValues;
			console.log(data);
			$.ajax({
				type:'post',
				url:'',
				contentType:'application/json; charset=utf-8',
				data:JSON.stringify(data),
				dataType:'JSON',
				success:function(data){
					console.log(data);
				},
				error:function(e){console.log(e);}
			});
		}
	}
	


</script>




</html>