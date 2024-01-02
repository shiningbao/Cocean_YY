<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<style>

	textarea {
		height: 8em;
		border: none;
		resize: none;
	}
		
</style>

</head>
<body>
	<c:import url="/side"/>
	<div class="animalContent">
		<h1>ANIMAL WRITE</h1>
		<div class="row">
			<div class="col-md-6 m-auto">
				<form action="write.do" method="post" enctype="multipart/form-data" onsubmit="return writeSubmit()">
					<table class="table">
						<colgroup>
							<col style="width:30%">
							<col style="width:70%">
						</colgroup>
						<tr>
							<th class="text-center align-middle" scope="col">분류</th>
							<td>
								<input type="text" class="form-control" id="taxo" onclick="getClassifi()" placeholder="클릭하여 분류군을 선택해 주세요." readonly/>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">학명</th>
							<td>
								<input type="text" class="form-control" name="speciesID" style="display: none;" readonly/>
								<input type="text" class="form-control" name="classificationCode" style="display: none;" readonly/>
								<input type="text" class="form-control" id="scien" onclick="getClassifi()" placeholder="클릭하여 학명을 선택해 주세요." readonly/>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">국명</th>
							<td><input type="text" class="form-control" id="common" onclick="getClassifi()" placeholder="클릭하여 국명을 선택해 주세요." readonly/></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">애칭</th>
							<td><input type="text" class="form-control" name="nickname" required/></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">코션하우스</th>
							<td>
								<input type="text" class="form-control" name="branchID" value="1" style="display: none;" readonly/>
								<select class="form-control" name="tankID">
									<c:forEach items="${tankList}" var="item">
										<option value="${item.tankID}">${item.tankName}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">마리 수</th>
							<td><input type="text" class="form-control" name="individual" id="individual" required/></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">태어난 날</th>
							<td><input type="date" class="form-control" pattern="\d{4}-\d{2}-\d{2}" name="birthDate"/></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">들어온 날</th>
							<td><input type="date" class="form-control" pattern="\d{4}-\d{2}-\d{2}" name="entryDate"/></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">상태</th>
							<td>
								<select class="form-control" name="status">
									<option value="정상">정상</option>
									<option value="질병">질병</option>
									<option value="격리">격리</option>
									<option value="폐사">폐사</option>
								</select>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">세부 정보</th>
							<td><textarea class="form-control" name="details" required></textarea></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">사진</th>
							<td><input type="file" class="form-control" name="files" multiple="multiple" required/></td>
						</tr>
					</table>
					
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="button" class="btn btn-secondary mr-2" onclick="animaList()">이전</button>
						<button type="submit" class="btn btn-primary mr-2">등록</button>
					</div>
				</form>
			</div>
		</div>
		<c:import url="/animal/classifi"/>

	</div>
</body>
<script>


// 분류체계 모달 관련
function drawClassifi(sp,ta,cl,sc,co){
	$('input[name="speciesID"]').val(sp);
	$('#taxo').val(ta);
	$('input[name="classificationCode"]').val(cl);
	$('#scien').val(sc);
	$('#common').val(co);	
}

// date 기본값 지정 : 오늘 날짜
$('input[type="date"]').val(new Date().toISOString().substring(0, 10));

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

function getClassifi(){
	$("#classifiModal").modal('show');
}


function animaList(){
	location.href = "list.go"
}

function writeSubmit(){
	var result = false;
	if($('#taxo').val() != ''){
		result = true;
	}else{
		$("#classifiModal").modal('show');
	}
	return result;
}


</script>


</html>









