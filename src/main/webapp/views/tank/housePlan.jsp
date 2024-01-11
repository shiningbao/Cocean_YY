<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cocean/관리계획</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
.topBar {
	width: 100%;
	height: 60px;
	left: 130px;
	background-color: #86B0F3;
	display: flex;
	justify-content: space-evenly;
}

.topBar div {
	width: 100%;
	height: 100%;
	position: relative;
	text-align: center;
	font-size: 21px;
	padding-top: 14px;
	cursor: default;
}

.barItem:hover {
	cursor: pointer;
	background-color: #2F80ED;
	padding-top: 13px;
}
</style>
</head>
<body>
	<c:import url="/side" />
	<div class="container-fluid contentField">
		<div class="container">

			<div class="row">
				<div class="col-md">
					<div class="topBar">
						<div class="barItem"
							onclick="location.href='detail.go?tankID=${tankID}'">하우스정보</div>
						<div class="barItem"onclick="location.href='houseLog.go?tankID=${tankID}'">하우스기록</div>
						<div style="color: #ffffff;">관리 계획</div>
					</div>
				</div>
			</div>



			<div class="row" style="margin-top: 3%; margin-left: 1px;">
			<form id="planFrm" style="display: flex; align-items: center;">
				<input class="form-control" type="month" name="curDate" onchange="getPlan()" id="currentDate" value="" style="width: 200px">
				
			    <div class="col-auto my-1">
			      <select class="custom-select mr-sm-2" id="planStatus" name="planStatus" onchange="getPlan()">
			        <option value="" selected>전체</option>
			        <option value="진행">진행</option>
			        <option value="완료">완료</option>
			      </select>
			    </div>
				</form>
				<div style="width: 71%;">
				<button class="btn btn-primary" style="width: 12%; height: 42px; margin-top: 2px; float: right;" data-toggle="modal" data-target="#housePlanModal">추가</button>
				</div>
			</div>

<div id="plan">



</div>







    <div class="modal fade" id="housePlanModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">하우스 관리 계획</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="newPlan"> <!-- 입력폼 -->
              <div class="form-group">
                <label>담당자</label>
                <input type="text" id="manager" value="${sessionScope.userInfo.name}" readonly class="form-control">
                <input type="hidden" id="empolyeeID" name="empolyeeID" value="${sessionScope.userInfo.employeeID}">
                <input type="hidden"  name="tankID" value="${tankID}">
              </div>
              <div class="form-group">
                <label>내용</label>
                <textarea type="text" class="form-control" name="content" id="content"  value="" required oninvalid="this.setCustomValidity('관리 계획을 작성해 주세요.')" oninput="this.setCustomValidity('')" maxlength="500" placeholder="500자까지 작성 가능" style="height: 180px;"></textarea>
              </div>
              <div class="form-row">
                <label>작성 날짜</label>
                <input class="form-control" id="planDate"readonly name="planDate" type="text" value="">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="button" onclick="addPlan()" class="btn btn-primary" >저장</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    
    




		</div>
</div>
</body>
<script>
$('#currentDate').val(new Date().toISOString().slice(0, 7));

let curDate = $('#currentDate').val();
let tankID = ${tankID};
let planStat = $('#planStatus').val();
getPlan(curDate,tankID,planStat);


$('#planDate').val(new Date().toISOString().substring(0, 10).toString());
// 모달창 작성자 자동 입력





	
	
	function getPlan(curDate,tankID,planStat){
		tankID = ${tankID};
		curDate = $('#currentDate').val();
		curDate += '-01';
		planStat = $('#planStatus').val();
		
		$.ajax({
			url: 'getPlan.ajax',
			method: 'POST',
			data: {'tankID':tankID, 'curDate':curDate, 'planStat':planStat},
			dataType: 'JSON',
			success: function(data){
				console.log(data);
				drawPlan(data);
			},
			error: function(e){
				console.log(e);
			}
			
		})
	}
	
	function drawPlan(data){
		var index = '';
		data.forEach(function(list){
		index += '<div class="row" style="margin-top: 5%; width: 100%;  margin: 5px 0 0 1px;">';
		index += '<div class="card mb-8 border-left-primary" style="width: 100%;">';
		index += '<div class="card-header">';
		index += '<span class="'+(list.status == "진행" ? "badge badge-warning":"badge badge-success") +'">'+list.status+'</span> ';
		index += '<a>'+list.creationDate.substring(5,16).replace("T", "&nbsp;&nbsp;등록시간&nbsp;&nbsp;")+'</a>';
		index += '<div style="float: right;">'
		index += '<a href="javascript:void(0);" onclick="donePlan(this);" style="margin-right: 5px;" class="btn btn-success btn-circle" log="'+ list.logID +'">';
		index += '<i class="fas fa-check"></i></a>';
		index += '<a href="javascript:void(0);" onclick="removePlan(this);" class="btn btn-danger btn-circle" log="'+ list.logID +'"><i class="fas fa-trash"></i></a>';
		index += '</div></div>';
		index += '<div class="card-body">';
		index += '<p class="card-text">'+list.content+'</p>';
		index += '</div></div></div>';

	});
		$('#plan').empty();
		$('#plan').append(index);
	}



function addPlan(){
	var params = $('#newPlan').serialize();
	
	var chk = $('#content').val();
	if(chk != ''){
		$.ajax({
			url: 'addPlan.ajax',
			method: 'POST',
			data: params,
			dataType: 'JSON',
			success: function(data){
				
			},
			error: function(e){
				console.log(e);
			}
		})
		$('#housePlanModal').modal('hide');
		$('#content').val('');
		getPlan();
	}else{
		swal('내용을 입력하세요.','','warning');
	}
}

function removePlan(obj){
	var logID = $(obj).attr('log');
	
	$.ajax({
		url: 'removePlan.ajax',
		method: 'GET',
		data: {'logID':logID},
		dataType: 'JSON',
		success: function(e){
			if(e > 0){
			swal('삭제 되었습니다.','','success');
			getPlan();				
			}
		},
		error: function(e){
			console.log(e);
		}
	})
}

function donePlan(obj){
	var logID = $(obj).attr('log');
	
	$.ajax({
		url: 'donePlan.ajax',
		method: 'GET',
		data: {'logID':logID},
		dataType: 'JSON',
		success: function(e){
		if(e > 0){
			swal('완료 처리 되었습니다.','','success');
			getPlan();				
			}
		},
		error: function(e){
			console.log(e);
		}
	})
	
}
	
	




</script>
</html>