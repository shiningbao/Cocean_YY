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
	
	<main>
		<div class="content">
	
			<div class="hTitle">
				<a>코션친구들 수정</a>
			</div>
	<div class="animalContent">

		<div class="row">
			<div class="col-md-6 m-auto">
				<form action="update.do" method="post" enctype="multipart/form-data" onsubmit="return writeSubmit()">
					<table class="table">
						<colgroup>
							<col style="width:30%">
							<col style="width:70%">
						</colgroup>
						<tr>
							<th class="text-center align-middle" scope="col">분류</th>
							<td>
								<input type="text" class="form-control" name="animalID" style="display: none;" value="${content.animalID}" readonly/>
								<input type="text" class="form-control" id="taxo" value="${content.taxonomy}" readonly/>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">학명</th>
							<td>
								<input type="text" class="form-control" name="speciesID" style="display: none;" value="${content.speciesID}" readonly/>
								<input type="text" class="form-control" name="classificationCode" style="display: none;" value="${content.classificationCode}" readonly/>
								<input type="text" class="form-control" id="scien" value="${content.scientificName}" readonly/>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">국명</th>
							<td><input type="text" class="form-control" id="common" value="${content.commonName}" readonly/></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">애칭</th>
							<td><input type="text" class="form-control" name="nickname"value="${content.nickname}" required/></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">코션하우스</th>
							<td>
								<input type="text" class="form-control" name="branchID" style="display: none;" value="${content.branchID}" readonly/>
								<select class="form-control" name="tankID" id="tankID">
									<c:forEach items="${tankList}" var="item" varStatus="idx">
										<option value="${item.tankID}">${item.tankName}</option>
									</c:forEach>
								</select>
								<input type="text" class="form-control" id="tankName" name="tankName" value="${item.tankName}" style="display: none;" readonly/>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">마리 수</th>
							<td><input type="text" class="form-control" name="individual" value="${content.individual}" required/></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">태어난 날</th>
							<td><input type="date" class="form-control" pattern="\d{4}-\d{2}-\d{2}" name="birthDate" value="${content.birthDate}"/></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">들어온 날</th>
							<td><input type="date" class="form-control" pattern="\d{4}-\d{2}-\d{2}" name="entryDate" value="${content.entryDate}"/></td>
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
							<td><textarea class="form-control" name="details" required>${content.details}</textarea></td>
						</tr>
						<tr>
							<th class="text-center align-middle" scope="col">사진</th>
							<td><input type="file" class="form-control" name="files" multiple="multiple" required/></td>
						</tr>
					</table>
					
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="button" class="btn btn-secondary mr-2" onclick="animaList()">취소</button>
						<button type="submit" class="btn btn-primary mr-2">수정</button>
					</div>
				</form>
			</div>
		</div>
		
		<c:import url="/animal/classifi"/>

	</div>
	</div>
	</main>
</body>

<script>

$('select[name="status"]').val('${content.status}').prop("selected",true);
$('select[name="tankID"]').val('${content.tankID}').prop("selected",true);

// 분류체계 모달 관련
function drawClassifi(sp,ta,cl,sc,co){
	$('input[name="speciesID"]').val(sp);
	$('#taxo').val(ta);
	$('input[name="classificationCode"]').val(cl);
	$('#scien').val(sc);
	$('#common').val(co);	
}

resizeWidth();


function getClassifi(){
	$("#classifiModal").modal('show');
}

$('#tankID').on('change',function(){
	var tankName = $('#tankID option:checked').text();
	$('#tankName').val(tankName);
	console.log($('input[name="tankName"]').val());
});

function writeSubmit(){
	var result = false;
	if($('#taxo').val() != ''){
		result = true;
	}else{
		$("#classifiModal").modal('show');
	}
	return result;
}

function animaList(){
	location.href = "list.go"
}

</script>


</html>









