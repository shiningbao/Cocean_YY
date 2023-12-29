<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cocean/하우스 등록</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>

    button {
    	    width: 100px;
    }
    #hTitle {
	width: 150px;
	height: 50px;
	left: 400px; 
	position: absolute;
	top: 120px;
}

#hTitle a {
	font-size: 22px;
}

    .btnGroup{
    position: absolute;
    top: 90%;
    left: 85%;
    }
    .formTable{
    	position: absolute;
    	top: 170px;
    	left: 300px;
    	width: 80%;
    	height: 60%;
    	table-layout:fixed;
    	text-align: center;
    	border: 2px solid #dedede;
    	display : table;
		margin-left : auto;
		margin-right : auto;
		border-radius: 5%;
    }
    th{
    	width: 130px;
    	height: 30px;
    	padding-right: 20px;
    	font-size: 17px;
    }
    td{
    	width: 170px;
    	height: 30px;	
    	padding-right: 10px;
    }
    input, select{
    	position: relative;
    	width: 100%;
    	padding: 1%;
    	height: 35%;
    	border-radius: 5px;
    	border: 3px solid #86B0F3;
    }

</style>
</head>
<body>
	<jsp:include page="../side.jsp"></jsp:include>
		<div id="hTitle">
		<a>${map.tankName}</a>
	</div>
	<form action="tankSet.do" method="post" id="tankForm" onsubmit="return submitForm(this);">
	<table class="formTable">
	
	<tr>
		<th class="th_one">하우스 이름</th>
		<td>
			<input type="text" name="tankName" value="${map.tankName}" required/>
		</td>
		<th>하우스 분류</th>
		<td>
			<select id="category" name="categoryID" required>
				<option value="1" <c:if test="${map.categoryID == 1}">selected</c:if>>해수</option>
				<option value="2" <c:if test="${map.categoryID == 2}">selected</c:if>>담수</option>
				<option value="3" <c:if test="${map.categoryID == 3}">selected</c:if>>반수생</option>
				<option value="4" <c:if test="${map.categoryID == 4}">selected</c:if>>육상</option>
			</select>
		</td>
		<th>지점</th>
		<td>
			<select id="branch" name="branchID" required>
			<option id="myBranch" value="${map.branchID}" selected disabled>지점명</option>
			<c:forEach items="${branchList}" var="item">
				<option value="${item.branchID}">${item.branchName}</option>
			</c:forEach>

			</select>
		</td>
		<th>하우스 용량</th>
		<td>
			<input type="text" name="capacity" required maxlength="10" value="${map.capacity}" placeholder="리터 단위 입력"/>
		</td>
		
		<tr>
		<th>배치구역</th>
		<td>
			<input type="text" name="area" required maxlength="30" value="${map.area}"/>
		</td>
				<th>바닥재</th>
				<td>
					<select id="flooring" name="flooringNo" required>
						
						<option value="탱크" <c:if test="${map.flooring eq '탱크'}">selected</c:if>>탱크</option>
						<option value="모래" <c:if test="${map.flooring eq '모래'}">selected</c:if>>모래</option>
						<option value="산호사" <c:if test="${map.flooring eq '산호사'}">selected</c:if>>산호사</option>
						<option value="소일" <c:if test="${map.flooring eq '소일'}">selected</c:if>>소일</option>
						<option value="자갈" <c:if test="${map.flooring eq '자갈'}">selected</c:if>>자갈</option>
				</select>
				</td>
				<th>여과기</th>
				<td>
					<select id="filter" name="filterType" required>
						<option value="측면 여과기" <c:if test="${map.filter eq '측면 여과기'}">selected</c:if>>측면 여과기</option>
						<option value="저면 여과기" <c:if test="${map.filter eq '저면 여과기'}">selected</c:if>>저면 여과기</option>
						<option value="상면 여과기" <c:if test="${map.filter eq '상면 여과기'}">selected</c:if>>상면 여과기</option>
						<option value="해당 없음" <c:if test="${map.filter eq '해당 없음'}">selected</c:if>>해당 없음</option>
				</select>
				</td>
				<th>수온</th>
				<td>
					<input type="text" required name="mercury" maxlength="7" value="${map.mercury}"/>
				</td>
			</tr>
			
			<tr>
				<th>수위</th>
				<td>
					<input type="text" required name="waterLevel" maxlength="7" value="${map.waterLevel}"/>
				</td>

				<th>염분</th>
				<td>
					<input type="text" required name="salinity" maxlength="7" value="${map.salinity}"/>
				</td>

				<th>ph</th>
				<td>
					<input type="text" required name="pH" maxlength="7" value="${map.pH}"/>
				</td>
				<th>DO</th>
				<td>
					<input type="text" required name="dO" maxlength="7" value="${map.dO}"/>
				</td>
			</tr>
			<tr>
				<th>질산염</th>
				<td>
					<input type="text" required name="nitrates" maxlength="7" value="${map.nitrates}"/>
				</td>

				<th>아질산염</th>
				<td>
					<input type="text" required name="nitrites" maxlength="7" value="${map.nitrites}"/>
				</td>

				<th>암모니아</th>
				<td>
					<input type="text" required name="ammonia" maxlength="7" value="${map.ammonia}"/>
				</td>

				<th>인산염</th>
				<td>
					<input type="text" required name="phosphates" maxlength="7" value="${map.phosphates}"/>
				</td>
			</tr>

		</table>
	<div class="btnGroup">
	<button type="button" class="btn btn-secondary" onclick="location.href='list.go'">취소</button>
	<button type="submit" class="btn btn-primary" id="confirmStart">등록</button>
	</div>
	</form>
</body>
<script>

var branchNo = ${map.branchID};
if(branchNo == 1){
	$('#myBranch').html('가산점');
}else{
	$('#myBranch').html('제주점');
}


function submitForm(form){
	swal({
		title: "새로운 하우스를 등록하시겠습니까?",
		text: "",
		icon: "info",
		buttons: ["취소","등록"],
	})
	.then((isOkey) => {
		if (isOkey) {
			swal('등록이 완료되었습니다.','','success')
			.then((isOkey) => {
				if(isOkey){
			form.submit();					
				}
			})
		}
	});
	return false;
}

</script>

</html>