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
	
		<div class="row" style="flex-direction: column;">	
			<div class="d-sm-flex align-items-center justify-content-between mb-6" style="padding-top: 15px;">
			<h1 class="h3 mb-0 text-gray-800">${map.tankName} 수정</h1>
		</div>
			<h5 style="margin-top: 1%;">${map.branchName} / 담당자: ${map.emName}</h5>
	</div>	
	
	
	<div class="row">
	<div class="container">
	<form action="tankSet.do" method="post" id="tankForm" onsubmit="return submitForm(this);" style="padding-top: 5%;display: flex;justify-content: space-evenly;">
		<input type="text" style="display:none;" name="tankID" value="${map.tankID}"/>
			<div class="card mb-auto" style="width: 45%;">
			
			<div class="input-group mb-4" >
				<div class="input-group-prepend">
					<span class="input-group-text">하우스 이름</span>
				</div>
				<input type="text" class="form-control" name="tankName" value="${map.tankName}" required />
			</div>

			<div class="input-group mb-4">
				<div class="input-group-prepend">
					<label class="input-group-text" for="categoryID">하우스 타입</label>
				</div>
				<select class="custom-select" id="category" name="categoryID" required>
				<option value="1" <c:if test="${map.categoryID == 1}">selected</c:if>>해수</option>
				<option value="2" <c:if test="${map.categoryID == 2}">selected</c:if>>담수</option>
				<option value="3" <c:if test="${map.categoryID == 3}">selected</c:if>>반수생</option>
				<option value="4" <c:if test="${map.categoryID == 4}">selected</c:if>>육상</option>
				</select>
			</div>

			<div class="input-group mb-4">
				<div class="input-group-prepend">
					<label class="input-group-text" for="status">하우스 상태</label>
				</div>
				<select class="custom-select" id="status" name="status" required>
			<option id="myBranch" value="정상" <c:if test="${map.tankStatus eq '정상'}">selected</c:if>>정상</option>
			<option id="myBranch" value="이상" <c:if test="${map.tankStatus eq '이상'}">selected</c:if>>이상</option>
			<option id="myBranch" value="폐쇄" <c:if test="${map.tankStatus eq '폐쇄'}">selected</c:if>>폐쇄</option>
				</select>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">하우스 용량</span>
			  </div>
			  <input type="text" class="form-control" name="capacity" required maxlength="10" value="${map.capacity}">
			  <div class="input-group-append">
			    <span class="input-group-text">L</span>
			  </div>
			</div>			
			
			<div class="input-group mb-4" >
				<div class="input-group-prepend">
					<span class="input-group-text">배치구역</span>
				</div>
				<input type="text" class="form-control" name="area" required maxlength="30" value="${map.area}"/>
			</div>
						
			<div class="input-group mb-4">
				<div class="input-group-prepend">
					<label class="input-group-text" for="flooringNo">바닥재 타입</label>
				</div>
				<select class="custom-select" id="flooring" name="flooringNo" required>
						<option value="탱크" <c:if test="${map.flooring eq '탱크'}">selected</c:if>>탱크</option>
						<option value="모래" <c:if test="${map.flooring eq '모래'}">selected</c:if>>모래</option>
						<option value="산호사" <c:if test="${map.flooring eq '산호사'}">selected</c:if>>산호사</option>
						<option value="소일" <c:if test="${map.flooring eq '소일'}">selected</c:if>>소일</option>
						<option value="자갈" <c:if test="${map.flooring eq '자갈'}">selected</c:if>>자갈</option>
				</select>
			</div>
			
				<div class="input-group mb-0">
				<div class="input-group-prepend">
					<label class="input-group-text" for="filterType">여과기 타입</label>
				</div>
				<select class="custom-select" id="filter" name="filterType" required>
						<option value="측면 여과기" <c:if test="${map.filter eq '측면 여과기'}">selected</c:if>>측면 여과기</option>
						<option value="저면 여과기" <c:if test="${map.filter eq '저면 여과기'}">selected</c:if>>저면 여과기</option>
						<option value="상면 여과기" <c:if test="${map.filter eq '상면 여과기'}">selected</c:if>>상면 여과기</option>
						<option value="해당 없음" <c:if test="${map.filter eq '해당 없음'}">selected</c:if>>해당 없음</option>
				</select>
			</div>		
</div>

<div class="card mb-auto" style="width: 45%;">
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">수온</span>
			  </div>
			  <input type="text" class="form-control"  required name="mercury" maxlength="7" value="${map.mercury}">
			  <div class="input-group-append">
			    <span class="input-group-text">°C</span>
			  </div>
			</div>

			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">수위</span>
			  </div>
			  <input type="text" class="form-control" required name="waterLevel" maxlength="7" value="${map.waterLevel}">
			  <div class="input-group-append">
			    <span class="input-group-text">%</span>
			  </div>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">염분</span>
			  </div>
			  <input type="text" class="form-control" required name="salinity" maxlength="7" value="${map.salinity}">
			  <div class="input-group-append">
			    <span class="input-group-text">‰</span>
			  </div>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">pH</span>
			  </div>
			  <input type="text" class="form-control" required name="pH" maxlength="7" value="${map.pH}">
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">DO</span>
			  </div>
			  <input type="text" class="form-control" required name="dO" maxlength="7" value="${map.dO}">
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">질산염</span>
			  </div>
			  <input type="text" class="form-control" required name="nitrates" maxlength="7"  value="${map.nitrates}">
			  <div class="input-group-append">
			    <span class="input-group-text">ppm</span>
			  </div>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">아질산염</span>
			  </div>
			  <input type="text" class="form-control" required name="nitrites" maxlength="7" value="${map.nitrites}">
			  <div class="input-group-append">
			    <span class="input-group-text">ppm</span>
			  </div>
			</div>
			
			<div class="input-group mb-4">
			  <div class="input-group-prepend">
			    <span class="input-group-text">암모니아</span>
			  </div>
			  <input type="text" class="form-control" required name="ammonia" maxlength="7" value="${map.ammonia}">
			  <div class="input-group-append">
			    <span class="input-group-text">ppm</span>
			  </div>
			</div>	
			
			<div class="input-group mb-0">
			  <div class="input-group-prepend">
			    <span class="input-group-text">인산염</span>
			  </div>
			  <input type="text" class="form-control" required name="phosphates" maxlength="7" value="${map.phosphates}">
			  <div class="input-group-append">
			    <span class="input-group-text">ppm</span>
			  </div>
			</div>
			
</div>	
</div>	
	
	</div>
	<div class="row" style="display: flex; justify-content: flex-end; margin-right: 13%; margin-top: 5%;">
	<div class="btnGroup">
	<button type="button" class="btn btn-secondary" onclick="location.href='detail.go?tankID=${map.tankID}'">취소</button>
	<button type="submit" class="btn btn-primary" id="confirmStart">저장</button>
	</div>
	</div>
	</form>
	
	
	<c:import url="/footer" />
	</div>
</body>
<script>



var name = ${map.tankName};

function submitForm(form){
	swal({
		title: name+"하우스를 수정하시겠습니까?",
		text: "수정된 내용은 하우스에 즉시 반영됩니다.",
		icon: "warning",
		buttons: ["취소","수정"],
	})
	.then((isOkey) => {
		if (isOkey) {
			swal('수정이 완료되었습니다.','','success')
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