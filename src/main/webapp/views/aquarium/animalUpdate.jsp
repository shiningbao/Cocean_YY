<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.resizeAuto {
		resize: none;
		overflow-y: hidden;
	}
</style>

</head>
<body>
	<c:import url="/side"/>
	<div class="container-fluid contentField">
	
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">코션친구들 수정</h1>
		</div>
		
		<div>
			<form action="update.do" method="post" enctype="multipart/form-data" onsubmit="return writeSubmit()">
				<div class="card shadow col-md-12 m-auto p-2">
					<table class="table">
						<colgroup>
							<col style="width:25%">
							<col style="width:75%">
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
								<select class="form-control" id="tank">
									<c:forEach items="${tankList}" var="item" varStatus="idx">
										<option value="${idx.index}">${item.branchName} - ${item.tankName}</option>
									</c:forEach>
								</select>
								<input type="text" class="form-control" id="branchID" name="branchID" style="display: none;" value="${content.branchID}" readonly/>
								<input type="text" class="form-control" id="tankID" name="tankID" value="${content.tankID}" style="display: none;" readonly/>
								<input type="text" class="form-control" id="tankName" name="tankName" value="${content.tankName}" style="display: none;" readonly/>
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
							<td><textarea class="form-control resizeAuto" id="details" name="details" oninput="resizeAuto(this)" required>${content.details}</textarea></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<th class="text-center align-middle" scope="col">사진</th> -->
<!-- 							<td><input type="file" class="form-control" name="files" multiple="multiple" required/></td> -->
<!-- 						</tr> -->
						<tr>
							<td colspan="2">
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="button" class="btn btn-secondary mr-2" onclick="animaList()">취소</button>
									<button type="submit" class="btn btn-primary mr-2">수정</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>	
	<c:import url="/animal/classifi"/>
	<c:import url="/footer"/>
</body>

<script>

var branchIDList = [];
var tankIDList = [];
var tankNameList = [];
var index;
<c:forEach items="${tankList}" var="item" varStatus="idx">
	branchIDList.push('${item.branchID}');
	tankIDList.push('${item.tankID}');
	tankNameList.push('${item.tankName}');
	if('${item.tankID}' =='${content.tankID}'){
		index = '${idx.index}';
	}
</c:forEach>
$('select[name="status"]').val('${content.status}').prop("selected",true);
$('#tank').val(index).prop("selected",true);
$('#details').trigger('input');

$('#tank').on('change',function(){
	var i = $('#tank').val();
	//console.log(branchIDList[i]);
	//console.log(tankIDList[i])
	//console.log(tankNameList[i]);
	$('#branchID').val(branchIDList[i]);
	$('#tankID').val(tankIDList[i]);
	$('#tankName').val(tankNameList[i]);
});


// 분류체계 모달 관련
function drawClassifi(sp,ta,cl,sc,co){
	$('input[name="speciesID"]').val(sp);
	$('#taxo').val(ta);
	$('input[name="classificationCode"]').val(cl);
	$('#scien').val(sc);
	$('#common').val(co);	
}

function getClassifi(){
	$("#classifiModal").modal('show');
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

function animaList(){
	location.href = "list.go"
}

function resizeAuto(e){
	e.style.height = 'auto';
	e.style.height = (e.scrollHeight) + 'px';
}

</script>


</html>









