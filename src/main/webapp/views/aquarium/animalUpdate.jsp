<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

	.animalWriteContent{
	}
	.animalWriteTable{
		margin: 0 auto;
	}
	
	.animalWriteTable table,
	.animalWriteTable tr,
	.animalWriteTable th,
	.animalWriteTable td{
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
		font-size: 25px;
	}
	.animalWriteTable td *{
		width: 100%;
		height: 40px;
		margin: 10px 0;
	}
	
	
	
</style>

</head>
<body>
	<c:import url="/side"/>
	<div class="animalWriteContent">
		<h1>ANIMAL WRITE</h1>
		<div class="animalWriteTable">
			<form action="write.do" method="post" enctype="multipart/form-data">
				<table style="width:100%">
					<colgroup>
						<col style="width:30%">
						<col style="width:70%">
					</colgroup>
					<tr>
						<th>분류</th>
						<td>
							<input type="text" id="taxo" onclick="getClassifi()" style="background-color:#DEDEDE" value="${content.taxonomy}" readonly/>
						</td>
					</tr>
					<tr>
						<th>학명</th>
						<td>
							<input type="text" name="speciesID" style="display: none;" value="${speciesID.taxonomy}" readonly/>
							<input type="text" name="classificationCode" style="display: none;" value="${content.classificationCode}" readonly/>
							<input type="text" id="scien" onclick="getClassifi()" style="background-color:#DEDEDE" value="${content.scientificName}" readonly/>
						</td>
					</tr>
					<tr>
						<th>국명</th>
						<td><input type="text" id="common" onclick="getClassifi()" style="background-color:#DEDEDE" value="${content.commonName}" readonly/></td>
					</tr>
					<tr>
						<th>애칭</th>
						<td><input type="text" name="nickname"value="${content.nickname}" /></td>
					</tr>
					<tr>
						<th>코션하우스</th>
						<td>
							<input type="text" name="branchID" style="display: none;" value="${content.branchID}" readonly/>
							<select name="tankID">
								<c:forEach items="${tankList}" var="item">
									<option value="${item.tankID}">${item.tankName}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>마리 수</th>
						<td><input type="text" name="individual" value="${content.individual}"/></td>
					</tr>
					<tr>
						<th>태어난 날</th>
						<td><input type="date" pattern="\d{4}-\d{2}-\d{2}" name="birthDate" value="${content.birthDate}"/></td>
					</tr>
					<tr>
						<th>들어온 날</th>
						<td><input type="date" pattern="\d{4}-\d{2}-\d{2}" name="entryDate" value="${content.entryDate}"/></td>
					</tr>
					<tr>
						<th>상태</th>
						<td>
							<select name="status">
								<option value="정상">정상</option>
								<option value="질병">질병</option>
								<option value="격리">격리</option>
								<option value="폐기">폐기</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>세부 정보</th>
						<td><textarea name="details">${content.details}</textarea></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input type="file" name="files" multiple="multiple"/></td>
					</tr>
					<tr>
						<th colspan="2">
							<button type="button">취소</button>
							<button type="submit">수정</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
		

		<c:import url="/animal/classifi"/>

	</div>
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

window.addEventListener('resize',resizeWidth);

function resizeWidth(){
	var winWidth = window.innerWidth;
	//console.log(winWidth);
	var sideWidth = $('nav').outerWidth();
	//console.log(sideWidth);
	var contentWidth = winWidth-sideWidth;
	var contentTableWidth = Math.floor(contentWidth*0.7);
	$('.animalWriteContent').css({'width':contentWidth, 'margin-left':sideWidth});
	$('.animalWriteTable').css({'width':contentTableWidth});
	$('#classifiCon').css({'width':contentTableWidth*0.7});
}

function getClassifi(){
	$("#classifiModal").modal('show');
}

</script>


</html>









