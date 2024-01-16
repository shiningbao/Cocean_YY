<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코션하우스</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

.abTable{
	border: 1px solid #dedede;
	border-collapse: collapse;
	width: 100%;
    text-align: center;
    height: 100%;
}

.abTable th,td{
	border: 1px solid #dedede;
	border-collapse: collapse;
}
#abHead{
	background-color: #E9ECEF;
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
						<div class="barItem" onclick="location.href='detail.go?tankID=${tankID}'">하우스정보</div>
						<div style="color: #ffffff;">하우스 기록</div>
						<div class="barItem" onclick="location.href='housePlan.go?tankID=${tankID}'">관리 계획</div>
					</div>
				</div>
			</div>
			
			<div class="row" style="margin-top: 3%; margin-left: 1px; display: flex;justify-content: space-between;">
			<input class="form-control" type="month" name="curDate" id="currentDate" value="" onchange="getRecord()" style="width:200px">
			<button class="btn btn-danger" style="width: 20%; margin-right: 1%;" data-toggle="modal" data-target="#abnomalRecord">이상기록</button>
			</div>

			<div class="row" style="width: 100%; height:80vh; margin-left: 1px;">
			
				<div class="card shadow mb-4" style="width: 100%; height: 90vh; margin-top: 3%; overflow: auto;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold">월간 기록 [최대/최소/평균]</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: center; table-layout: fixed;">
							<thead>
							<tr>							
							<th style="width: 8%;">날짜</th>
							<th style="width: 13%;">수온</th>
							<th style="width: 13%;">수위</th>
							<th style="width: 13%;">염도</th>
							<th style="width: 13%;">pH</th>
							<th style="width: 13%;">Do</th>
							<th style="width: 13%;">질산염</th>
							<th style="width: 13%;">아질산염</th>
							<th style="width: 13%;">암모니아</th>
							<th style="width: 13%;">인산염</th>
							</tr>
							</thead>
							<tbody id="recordTable">

							</tbody>
							
							</table>
							</div>
							</div>		
						</div>
					</div>
				</div>
				
	<div class="modal fade" id="abnomalRecord" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">이상기록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <table class="abTable">
				<thead id="abHead">
				<tr>
					<th scope="col" style="width: 25%;">발생 날짜</th>
					<th scope="col">발생 기록</th>
				</tr>
			</thead>
			<tbody id=abList>

			</tbody>
		</table>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              </div>
          </div>
        </div>
     	</div>
     	</div>
				
				
				<c:import url="/footer" />
			</div>
	</body>
<script>
	$('#currentDate').val(new Date().toISOString().slice(0, 7));
	// console.log(new Date().toISOString().slice(0, 7));
	// console.log(${tankID});
	
	
	let curDate = $('#currentDate').val();
	let tankID = ${tankID};
	getRecord(curDate,tankID);

	
	
	
	function getRecord(curDate,tankID){
		tankID = ${tankID};
		curDate = $('#currentDate').val();
		curDate += '-01';
		getAbNomal(curDate,tankID);
		$.ajax({
			url: 'getRecord.ajax',
			method: 'GET',
			data: {'tankID':tankID, 'curDate':curDate},
			dataType: 'JSON',
			success: function(data){
				if(data.length >= 1){
				drawList(data);					
				}else{
					var text = '';
					text += '<tr>';
					text += '<td colspan="10">기록이 존재하지 않습니다.</td>';
					text += '</tr>';
					$('#recordTable').empty();
					$('#recordTable').append(text);
				}
				
			},
			error: function(e){
				console.log(e);
			}
		})
	}
	
	function getAbNomal(curDate, tankID){
		
		$.ajax({
			url: 'getAbNomal.ajax',
			method: 'GET',
			data: {'tankID':tankID, 'curDate':curDate},
			dataType: 'JSON',
			success: function(data){
				if(data.length >= 1){
				drawModal(data);					
				}else{
					var none = '';
					none += '<tr>';
					none += '<td colspan="2">기록이 존재하지 않습니다.</td>';
					none += '</tr>';
					$('#abList').empty();
					$('#abList').append(none);
				}
			},
			error: function(e){
				console.log(e);
			}
		})
	}
	
	function drawModal(data){
		var index = '';
		
		data.forEach(function(item){
			index += '<tr>';
			index += '<td>' + item.creationDate.substring(5,16).replace("T", "&nbsp;&nbsp;") + '</td>';
			index += '<td>' + item.content + '</td>';
			index += '</tr>';
		});
		$('#abList').empty();
		$('#abList').append(index);
	}
	
	
	function drawList(data){
		var content = '';
		
		data.forEach(function(list){
			content += '<tr>';
			content += '<td>'+ list.recordDate.substring(8, 10) + '일' +'</td>';
			content += '<td>'+ list.maxMer +'/'+ list.minMer +'/'+ list.avgMer +'</td>';
			content += '<td>'+ list.maxWater +'/'+ list.minWater +'/'+ list.avgWater +'</td>';
			content += '<td>'+ list.maxSal +'/'+ list.minSal +'/'+ list.avgSal +'</td>';
			content += '<td>'+ list.maxPh +'/'+ list.minPh +'/'+ list.avgPh +'</td>';
			content += '<td>'+ list.maxDo +'/'+ list.minDo +'/'+ list.avgDo +'</td>';
			content += '<td>'+ list.maxNita +'/'+ list.minNita +'/'+ list.avgNita +'</td>';
			content += '<td>'+ list.maxNiti +'/'+ list.minNiti +'/'+ list.avgNiti +'</td>';
			content += '<td>'+ list.maxAm +'/'+ list.minAm +'/'+ list.avgAm +'</td>';
			content += '<td>'+ list.maxPhos +'/'+ list.minPhos +'/'+ list.avgPhos +'</td>';
			content += '</tr>';
		});
		$('#recordTable').empty();
		$('#recordTable').append(content);
		
	}
	
	
	

	
	
	
	
</script>
</html>