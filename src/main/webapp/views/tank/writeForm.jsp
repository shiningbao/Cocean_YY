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
    



    .formTable{
    	width: 100%;
    	height: 100%;
    	text-align: center;
    	border: 2px solid #dedede;
    }
    


</style>
</head>
<body>
	<c:import url="/side" />
	<div class="container-fluid contentField">
	
		<div class="row">	
			<div class="d-sm-flex align-items-center justify-content-between mb-6" style="padding-top: 15px;">
			<h1 class="h3 mb-0 text-gray-800">신규 하우스 등록</h1>
		</div>
	</div>

<div class="row">
<div class="container">
	<form action="tankWrite.do" method="post" id="tankForm" onsubmit="return submitForm(this);" style="padding-top: 5%;display: flex;justify-content: space-evenly;">

			<div class="card mb-auto" style="width: 45%;">
			
			<div class="input-group mb-4" >
				<div class="input-group-prepend">
					<span class="input-group-text">하우스 이름</span>
				</div>
				<input type="text" class="form-control" name="tankName" required />
			</div>

			<div class="input-group mb-4">
				<div class="input-group-prepend">
					<label class="input-group-text" for="branch">지점</label>
				</div>
				<select class="custom-select" id="branch" name="branchID" required>
				<option value="" selected disabled>지점 선택</option>
				<c:forEach items="${branchList}" var="item">
				<option value="${item.branchID}">${item.branchName}</option>
				</c:forEach>
				</select>
			</div>
			
			<div class="input-group mb-4" >
				<div class="input-group-prepend">
					<span class="input-group-text">배치구역</span>
				</div>
				<input type="text" class="form-control" name="area" required maxlength="30"/>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">하우스 용량</span>
			  </div>
			  <input type="text" class="form-control" name="capacity" required maxlength="10">
			  <div class="input-group-append">
			    <span class="input-group-text">L</span>
			  </div>
			</div>
			
			<div class="input-group mb-4">
				<div class="input-group-prepend">
					<label class="input-group-text" for="categoryID">하우스 타입</label>
				</div>
				<select class="custom-select" id="category" name="categoryID" required>
				<option value="" selected disabled>타입 선택</option>
				<option value="1">해수</option>
				<option value="2">담수</option>
				<option value="3">반수생</option>
				<option value="4">육상</option>
				</select>
			</div>
			
			<div class="input-group mb-4">
				<div class="input-group-prepend">
					<label class="input-group-text" for="flooringNo">바닥재 타입</label>
				</div>
				<select class="custom-select" id="flooring" name="flooringNo" required>
						<option value="" selected disabled>타입 선택</option>
						<option value="탱크">탱크</option>
						<option value="모래">모래</option>
						<option value="산호사">산호사</option>
						<option value="소일">소일</option>
						<option value="자갈">자갈</option>
				</select>
			</div>
			
						<div class="input-group mb-0">
				<div class="input-group-prepend">
					<label class="input-group-text" for="filterType">여과기 타입</label>
				</div>
				<select class="custom-select" id="filter" name="filterType" required>
				<option value="" selected disabled>타입 선택</option>
						<option value="측면 여과기">측면 여과기</option>
						<option value="저면 여과기">저면 여과기</option>
						<option value="상면 여과기">상면 여과기</option>
						<option value="해당 없음">해당 없음</option>
				</select>
			</div>		
</div>

<div class="card mb-auto" style="width: 45%;">
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">수온</span>
			  </div>
			  <input type="text" class="form-control"  required name="mercury" maxlength="7" placeholder="기준치 입력">
			  <div class="input-group-append">
			    <span class="input-group-text">°C</span>
			  </div>
			</div>

			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">수위</span>
			  </div>
			  <input type="text" class="form-control" required name="waterLevel" maxlength="7" placeholder="기준치 입력">
			  <div class="input-group-append">
			    <span class="input-group-text">%</span>
			  </div>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">염분</span>
			  </div>
			  <input type="text" class="form-control" required name="salinity" maxlength="7" placeholder="기준치 입력">
			  <div class="input-group-append">
			    <span class="input-group-text">‰</span>
			  </div>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">pH</span>
			  </div>
			  <input type="text" class="form-control" required name="pH" maxlength="7" placeholder="기준치 입력">
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">DO</span>
			  </div>
			  <input type="text" class="form-control" required name="dO" maxlength="7" placeholder="기준치 입력">
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">질산염</span>
			  </div>
			  <input type="text" class="form-control" required name="nitrates" maxlength="7" placeholder="기준치 입력">
			  <div class="input-group-append">
			    <span class="input-group-text">ppm</span>
			  </div>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">아질산염</span>
			  </div>
			  <input type="text" class="form-control" required name="nitrites" maxlength="7" placeholder="기준치 입력">
			  <div class="input-group-append">
			    <span class="input-group-text">ppm</span>
			  </div>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">암모니아</span>
			  </div>
			  <input type="text" class="form-control" required name="ammonia" maxlength="7" placeholder="기준치 입력">
			  <div class="input-group-append">
			    <span class="input-group-text">ppm</span>
			  </div>
			</div>	
			
						<div class="input-group mb-0">
			  <div class="input-group-prepend">
			    <span class="input-group-text">인산염</span>
			  </div>
			  <input type="text" class="form-control" required name="phosphates" maxlength="7" placeholder="기준치 입력">
			  <div class="input-group-append">
			    <span class="input-group-text">ppm</span>
			  </div>
			</div>
			
</div>	
</div>
	</div>
		</div>
		
	<div class="row" style="display: flex; justify-content: flex-end; margin-right: 12%;
    margin-top: 5%;">
	<button type="button" class="btn btn-secondary" onclick="location.href='list.go'" style="margin-right: 5px;">취소</button>
	<button type="submit" class="btn btn-primary" id="confirmStart">저장</button>
	</div>
	</form>
		<c:import url="/footer" />
	</div>
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