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
		 table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
    button {
    	    width: 100px;
    }
</style>
</head>
<body>
	<jsp:include page="../side.jsp"></jsp:include>
	<form action="tankWrite.do" method="post" id="tankForm" onsubmit="return submitForm(this);">
	<table>
	<tr>
		<th>하우스 이름</th>
		<td>
			<input type="text" name="tankName" required/>
		</td>
	</tr>
	<tr>
		<th>하우스 분류</th>
		<td>
			<select id="category" name="categoryID" required>
				<option value="" selected disabled>수조 타입</option>
				<option value="1">해수</option>
				<option value="2">담수</option>
				<option value="3">반수생</option>
				<option value="4">육상</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>지점</th>
		<td>
			<select id="branch" name="branchID" required>
			<option value="" selected disabled>지점명</option>
			<c:forEach items="${branchList}" var="item">
				<option value="${item.branchID}">${item.branchName}</option>
			</c:forEach>

			</select>
		</td>
	</tr>
		<tr>
		<th>하우스 용량</th>
		<td>
			<input type="text" name="capacity" required maxlength="10" placeholder="리터 단위 입력"/>
		</td>
	</tr>
		<tr>
		<th>배치구역</th>
		<td>
			<input type="text" name="area" required maxlength="30" placeholder=""/>
		</td>
	</tr>
			<tr>
				<th>바닥재</th>
				<td>
					<select id="flooring" name="flooringNo" required>
						<option value="" selected disabled>바닥재 타입</option>
						<option value="탱크">탱크</option>
						<option value="모래">모래</option>
						<option value="산호사">산호사</option>
						<option value="소일">소일</option>
						<option value="자갈">자갈</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>여과기</th>
				<td>
					<select id="filter" name="filterType" required>
						<option value="" selected disabled>여과기 타입</option>
						<option value="측면 여과기">측면 여과기</option>
						<option value="저면 여과기">저면 여과기</option>
						<option value="상면 여과기">상면 여과기</option>
						<option value="해당 없음">해당 없음</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>수온</th>
				<td>
					<input type="text" required name="mercury" maxlength="7" placeholder="기준치 입력"/>
				</td>
			</tr>
			<tr>
				<th>수위</th>
				<td>
					<input type="text" required name="waterLevel" maxlength="7" placeholder="기준치 입력"/>
				</td>
			</tr>
			<tr>
				<th>염분</th>
				<td>
					<input type="text" required name="salinity" maxlength="7" placeholder="기준치 입력"/>
				</td>
			</tr>
			<tr>
				<th>ph</th>
				<td>
					<input type="text" required name="pH" maxlength="7" placeholder="기준치 입력"/>
				</td>
			</tr>
			<tr>
				<th>DO</th>
				<td>
					<input type="text" required name="dO" maxlength="7" placeholder="기준치 입력"/>
				</td>
			</tr>
			<tr>
				<th>질산염</th>
				<td>
					<input type="text" required name="nitrates" maxlength="7" placeholder="기준치 입력"/>
				</td>
			</tr>
			<tr>
				<th>아질산염</th>
				<td>
					<input type="text" required name="nitrites" maxlength="7" placeholder="기준치 입력"/>
				</td>
			</tr>
			<tr>
				<th>암모니아</th>
				<td>
					<input type="text" required name="ammonia" maxlength="7" placeholder="기준치 입력"/>
				</td>
			</tr>
			<tr>
				<th>인산염</th>
				<td>
					<input type="text" required name="phosphates" maxlength="7" placeholder="기준치 입력"/>
				</td>
			</tr>


		</table>
	<button type="button" class="btn btn-secondary" onclick="location.href='list.go'">취소</button>
	<button type="submit" class="btn btn-primary" id="confirmStart">등록</button>
	</form>
</body>
<script>

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