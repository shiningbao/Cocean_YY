writeDraftForm

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script src="<c:url value='/resource/summernote/summernote-lite.js'/>"></script>
<script src="<c:url value='/resource/summernote/lang/summernote-ko-KR.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resource/summernote/summernote-lite.css'/>">


<style>
table,th,td{
		border : 1px solid black;
		border-collapse : collapse;
		padding : 5px 10px;
}

.di-td-1{
	width:86px;
}

input[type="text"]{
	width : 100%;
}

button{
	margin : 5px 0;
}

#approvalSignature{
	margin-left : 20px;
	margin-bottom : 20px;
}

#approvalSignature td{
	text-align: center;
}

#agrSignature {
	margin-bottom : 20px;
}


#agrSignature td{
	text-align: center;
}

#workDraftContent{
	width : 50%;
}

#attendanceDraftContent{
	width : 100%;
}

#leaveDraftContent{
	width : 100%;
}

#leaveDraftContent th{
	text-align : center;
}

#attendanceDraftContent th{
	text-align : center;
}

#draftInfoTop{
	width : 840.8px;
}

#approvalLine{
	font-size : 10px;
	border-spacing : 10px 10px;
	
}

#approvalLine, #approvalLine th, #approvalLine td {
  border: none;
}

#agreeTable, #agreeTable tr, #agreeTable td{
	border:none;
}

#refTable, #refTable tr, #refTable td{
	border:none;
}

#textarea{
	width : 100%;
	height: 200px;
	resize: none;
}

.modal-content{
	width:133% !important;
	height:100%;
	overflow-y: auto;
}

.show {
	display:block;

}

#contentLine{
	margin: 14px;
    padding: 6% 2% 2% 2%;
    border: 5px solid #e8e8e8;
    width: 60%;
    height: 93%;
    position: absolute;
    left: 17%;
    top: 17%;
}

#bottom{
	position: absolute;
    left: 19%;
    bottom: -29%;
    width:59%;
}

#rightContainer{
	display: flex;
    flex-direction: column;
    width: 22%;
    position: absolute;
    right: 0%;
    top: 19%;
}

#formTitle{
	position: absolute;
    width: 40%;
    text-align: center;
    top: 2%;
    font-size: 41px;
    right: 29%;
}

.topTitle{
	position: absolute;
    width: 50%;
    top: 12%;
    font-size: 30px;
    left: 18%;
}


.dateSelect {
	display:flex;
	height:40px;
}

.signApp{
	float:right;
}

#approvalSignature{
	float:right;
}


#agrSignature{
	float:left;
}
.signAgr{
	float:left;
}

.input-file-button{
    padding: 3px 10px;
    background-color: #2e59d9;
    border-radius: 4px;
    color: white;
    cursor: pointer;
    width: 83px;
}

.delete{
	cursor:pointer;
}

th {
    background-color: #ededed;
}

.orderNum{
	background-color: white;
}

.order{
	background-color: white;
}

.addApprovalLine{
	width:20px;
	height:20px;

}

.delete{
	width:15px;
	height:15px;
}
</style>
</head>
<body>
<c:import url="/side"/>
<div class="container-fluid contentField">

<div class="modal fade" id="lineModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">결재라인 설정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<div class="row">
					<div class="col-md-6" style="border-right:1px solid #EDEDED">
					<div id="employeeList">
					<jsp:include page="../approval/organization.jsp"></jsp:include>
					</div>
				</div>
				
				<div class="col-md-6">
				<div id="line">
				</div>
				</div>
				</div>
				</div>
				<div class="modal-footer">
				 <button class="btn btn-primary" onclick="saveApprovalLine()" data-dismiss="modal">저장</button>
				</div>
			</div>
		</div>
	</div>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<div class="topTitle">
	<h1 class="h3 mb-0 text-gray-800">기안서 작성</h1>
	</div>
</div>
<div id="contentLine">
<div id="formTitle">${form.formTitle}</div>
<div id="approvalSignature"><!-- 결재 서명 그려지는부분 --></div>
<div id="agrSignature"><!-- 합의 서명 그려지는부분 --></div>	
<br/>
<div id="draftInfoTop" style="display: flex;">
<input type="hidden" value="${form.titleID}" name=titleID>
		<table id="draftInfo">
			<tr>
			    <th>상신자</th>
			    <td>${draftInfo.name}</td>
			    <td rowspan="3" class="di-td-1"></td>
			</tr>
			<tr>
			    <th>소속부서</th>
			    <td>${draftInfo.hqName}/${draftInfo.departmentName}</td>
			</tr>
			<tr>
			    <th>상신일</th>
			    <td>${date}</td>
			</tr>
		</table>
		</div>

<br/>
<!-- <form action="writeDraft.do" method="post" enctype="multipart/form-data"> -->
<c:if test="${form.formTitle eq '업무기안서'}">
<div class="wdContent">
<table id="workDraftContent">
	
		<!-- <tr>
		    <th>합의자</th>
		    <td><table id="agreeTable"><tr><td></td></tr></table></td>
		</tr> -->
		<tr>
		    <th>참조자</th>
		    <td><table id="refTable" style="border:none;"><tr><td></td></tr></table></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" placeholder="*제목을 입력해주세요."></td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="summernote"></div>
			<!-- 작성글은 div 에 담겨지는데, div는 서버로 전송이 불가능 -->
			<input type="hidden" name="content" value=""/>
		</td>
	</tr>
</table>
</div>
</c:if>

<c:if test="${form.formTitle eq '휴가신청서'}">
<table id="attendanceDraftContent">
	<tr>
	    <th>참조자</th>
	    <td><table id="refTable" style="border:none;"><tr><td></td></tr></table></td>
	</tr>
	<tr>
		<th>휴가 종류</th>
			<td colspan="2"><select id="vacationCategory" name="vacationCategory"> 
					  <option value="연차" selected="selected">연차</option>
					  <option value="반차">반차</option>
					  <option value="병가">병가</option>
					  <option value="공가">공가</option>
					  <option value="경조사">경조사</option>
					</select>
			</td>
	</tr>
	<tr>
	    <th>잔여 연차</th>
	    <td id="remain" contentEditable="false" style="background-color:#ededed;">${draftInfo.remainingAnnualLeave}일</td>
	</tr>
	
	<tr>
	    <th>사용 날짜</th>
	    <td> <div class="dateSelect"><input type="date" name="start" id="startFac" class="form-control mb-2"><p>&nbsp;~&nbsp;</p><input type="date" name="end" id="endFac"  class="form-control mb-2">
	    		<div class="ampm" style="display:none; margin-left:10px; font-size:12px; margin-top:10px;"><input type="radio" name="time" value="오전반차" checked/>오전<input type="radio" name="time" value="오후반차" />오후</div>
	    		</div>
		</td>
	</tr>
	<tr>
		<th>총 사용일</th>
		<td id="total" style="background-color:lightgray;"></td>
	</tr>
	<tr>
		<th>사유</th>
		<td colspan="2"><textarea  name="content" id="textarea" placeholder="*필수입력"></textarea></td>
	</tr>
</table>
</c:if>

<c:if test="${form.formTitle eq '휴직원' or form.formTitle eq '복직원'}">
<table id="leaveDraftContent">
	<tr>
	    <th>참조자</th>
	    <td><table id="refTable" style="border:none;"><tr><td></td></tr></table></td>
	</tr>
	<tr>
		<th>휴직 기간</th>
			<td><input type="date" name="startDate">~<input type="date" name="endDate"></td>
		</tr>
	<tr>
		<th>사유</th>
		<td colspan="2"><textarea  name="content" id="textarea" placeholder="*필수입력"></textarea></td>
	</tr>
</table>
</c:if>


<br/>
<label class="input-file-button" for="input-file">
 파일첨부
</label>
<input type="file" id="input-file" style="display:none;"/>
<br/>


</div>
<div id="bottom">
<div id="isPublic">
<input type="radio" name="publicStatus" value=0 checked/>비공개
<input type="radio" name="publicStatus" value=1 />공개
</div>
<div style="font-size:12px; color:gray;" id="publicDesc">
*공개 설정시 모든 임직원이 열람 가능합니다.
<br/>
*비공개 설정시 결재라인에 있는 사람만 열람 가능합니다.

</div>
<br/>
<input type="hidden" name="tempSave" value="0"/>
<div id="render">
<div id="btnRemove">
<input type="button" class="btn btn-secondary"  value="취소" onclick="location.href='formList.go'"/>
<input style="float:right" class="btn btn-primary" type="button" id="write" value="등록" onclick="save(${data.idx})"/>
<input style="float:right" class="btn btn-primary" type="button" id="tempSave" value="임시저장" onclick="tempSave(${data.idx})"/>
</div>
</div>
</div>

<div id="rightContainer">
<div class="card shadow" style="margin-left:10px;">
	<div class="lineContent" style="padding: 10px 15px;"><span style="margin: 0px; font-size: 13px; width: 270px;">결재라인</span>
    <img src="<c:url value='/resource/img/addButton.png'/>" class="addApprovalLine" alt="라인 추가 아이콘" onclick="remainedEmpID()" data-toggle="modal" data-target="#lineModal" style="margin-left: auto; cursor: pointer;"><!-- <a href="#" class="addApprovalLine" onclick="remainedEmpID()" "></a> -->
	<hr/>
		<table id="approvalLine">
			<tr>
				<th class="img-profile rounded-circle"></th>
				<td>상신</td>
				<td>${draftInfo.hqName}/${draftInfo.departmentName}</td>
				<td>${draftInfo.rankName}</td>
				<td>${draftInfo.name}</td>
			</tr>
		</table>
	</div>
	</div>
	</div>
</div>



<!-- </form> -->




<c:import url="/footer"/>	
</body>
<script>


	var textArea = $('#textarea').text();
	var startDate;
	var endDate;
	 $('input[name="startDate"]').on('change', function() {
		 startDate=$(this).val();
	        console.log(startDate);
	    });
	 $('input[name="endDate"]').on('change', function() {
		 endDate=$(this).val();
	    });

	// 휴가신청서 시간 부분
	
	 $('#startFac, #endFac').on('change', function () {
        calculateDays();
    });
	 
function calculateDays() {
    var startDay = $('#startFac').val();
    var endDay = $('#endFac').val();
    console.log(startDay);

    if (startDay && endDay) {
        var startDayTime = new Date(startDay).getTime();
        var endDayTime = new Date(endDay).getTime();
        var timeCal = endDayTime - startDayTime;
        var daysCal = Math.ceil(timeCal / (1000 * 3600 * 24));

        
        var remainingDays = parseInt($('#remain').text());
        if (daysCal + 1 > remainingDays) {
            $('#total').text('잔여 연차를 초과하였습니다.').css('color', 'red');
        }else{
        	$('#total').text(daysCal+1 + '일').css('color', 'black');
        }
    }
}

 $('select[name="vacationCategory"]').on('change', function() {
    var selectedOption = $(this).val();
    console.log("선택옵션: " + selectedOption);

    if (selectedOption === "반차") {
        $('#endFac').prev('p').hide();
        $('#endFac').hide();
        $('#total').closest('tr').hide();
        $('.ampm').show();
        $('#startFac').css('width','85%');
        $('#remain').closest('tr').show();
    } else if(selectedOption === "연차"){
        $('#endFac').prev('p').show();
        $('#endFac').show();
        $('.ampm').hide();
        $('#total').closest('tr').show();
        $('#remain').closest('tr').show();
        $('#total').closest('tr').show();
    }else if(selectedOption === "병가" || "공가" || "경조사"){
		 $('#remain').closest('tr').hide();
         $('#total').closest('tr').hide();
         $('#endFac').prev('p').show();
         $('#endFac').show();
         $('.ampm').hide();
    }
});
 

	
	 /* $('input[name="start"]').on('change', function() {
	        var start=$(this).val();
	        // console.log(start);
	        usageTime();
	    });
	 $('input[name="end"]').on('change', function() {
	        var end=$(this).val();
	        usageTime();
	    });
	 
	$('select[name="startTime"]').on('change', function() {
        var startTime=$(this).val();
        usageTime();
        // console.log(startTime);
    });
	 
	$('select[name="endTime"]').on('change', function() {
        var endTime=$(this).val();
        // console.log($('select[name="startTime"]').val());
        usageTime();
    });
	
	function usageTime(){
		var start = $('input[name="start"]').val();
        var startTime = $('select[name="startTime"]').val();
        var end = $('input[name="end"]').val();
        var endTime = $('select[name="endTime"]').val();
		$.ajax({
	        url: "/Cocean/approval/calculateUsageTime",
	        method: "POST",
	        data:{
	        	start:start,
	        	startTime:startTime,
	        	end:end,
	        	endTime:endTime
	        },
        	success:function(usageTime){
        		// console.log(usageTime);
        		$('#usageTime').text(usageTime.usageTime);
        	},
        	error:function(e){
        		console.log(e);
        	}
	    	});
	}
	  */
	 
	function remainedEmpID() {
	    remLine = [];
		// console.log($("#summernote").summernote('code'));
	    if ($("#approvalLine tbody tr .employeeID").length > 0) {
	        $("#approvalLine tbody tr .employeeID").each(function () {
	            remLine.push($(this).val());
	        });
	    } else if ($("#refTable .employeeID").length > 0) {
	        $("#refTable .employeeID").each(function () {
	            remLine.push($(this).val());
	        });
	    } else {
	        // console.log("없음");
	    }
	    console.log("remLine:", remLine);
	    getRemainedEmpID(remLine);
	}
	
	function getEmployeeID(employeeID,nodeText){
		console.log(employeeID);
	}


	$('#summernote').summernote({
		height: 200, width: 825,
		maxHeight: 200,
		minHeight: 200,
		focus: true
	});

	
	/* function saveCf(isTemp) {
	    if (isTemp) {
	    	save(isTemp);
	        alert('저장되었습니다.');
	    } else {
	        if (confirm("등록하시겠습니까?")) {
	            save(isTemp);
	        }
	    }
	} */
	
	var order;
	$("#approvalLine tbody tr").each(function (index) {
	    order = index + 1;
	});
	
	var idx;
	
	//기안 등록
	function save(idx) {
	   if(confirm("등록하시겠습니까?")){
		var title = $('input[name="title"]').val(); // 업무기안서
		var titleID = $('input[name="titleID"]').val(); // 양식titleID
		var lastOrder = parseInt($("#approvalLine tbody tr:last .order").val()); // 결재라인의 마지막 순서
		var lastLine = [];
		
		console.log("마지막순서:"+lastOrder);
	    var formData = new FormData();

	    var filesInput = $('input[name="files"]')[0];
	    var files = filesInput.files;
	    // console.log(files.length);
	    // console.log(filesInput);
	    if (files.length === 0) {
	        formData.append('files', null);
	    }else{
	    for (var i = 0; i < files.length; i++) {
	        formData.append('files', files[i]);
	    }
	    }
	    
	    formData.append('titleID',titleID);
	    formData.append('lastOrder',lastOrder);
	    formData.append('publicStatus', $('input[name="publicStatus"]:checked').val());
	    if ("${form.formTitle}" === "업무기안서") {
	    	var content = $("#summernote").summernote('code') // 업무기안서
	        formData.append('content', content);
	    	formData.append('title',title);
	    } else if ("${form.formTitle}" === "휴직원" || "${form.formTitle}" === "복직원") {
	    	var textArea = $('#textarea').val();
	        formData.append('startDate', startDate);
	        formData.append('endDate', endDate);
	        formData.append('textArea', textArea);
	    } else if("${form.formTitle}"==="휴가신청서"){
	    	var start = $('input[name="start"]').val();
	        var startTime = $('select[name="startTime"]').val();
	        var end = $('input[name="end"]').val();
	        var endTime = $('select[name="endTime"]').val();
	        var vacationCategory =$('#vacationCategory').val();
	    	var total= $('#total').text().replace(/\D/g, ''); // 문자 빼기('일')
	    	if(vacationCategory=='반차'){
	    		total=0.5;
	    		if($('input[value="오전반차"]:checked')){
	    			vacationCategory=$('input[value="오전반차"]:checked').val();
	    		}else{
	    			vacationCategory=$('input[value="오후반차"]:checked').val();
	    		}
	    	}
	        var textArea = $('#textarea').val();
	        console.log(total);
	    	formData.append('startDate', start);
	    	formData.append('endDate', end);
	    	formData.append('vacationCategory', vacationCategory);
	    	formData.append('textArea', textArea);
	    	formData.append('total', total);

	    }
    	// console.log(lastLine);
	    
	    $("#approvalLine tbody tr").each(function (index) {
	        var order = $(this).find('.order').val(); // 각자의 순서
	        var employeeID = $(this).find('.employeeID').val(); // 결재자,합의자,참조자
	        var category = $(this).find('.category').text();
	        console.log("순서:"+order);
		
	        if (employeeID !== undefined && category == '결재') {
	            lastLine.push({
	                employeeID: employeeID,
	                order: order,
	                category: '결재'
	            });
	        }
	    });

	    $("#approvalLine tbody tr").each(function (index) {
	    	 var order = $(this).find('.order').val(); // 각자의 순서
		     var employeeID = $(this).find('.employeeID').val();
		     var category = $(this).find('.category').text();
		     
	        if (employeeID !== undefined && category == '합의') {
	            lastLine.push({
	                employeeID: employeeID,
	                order: order,
	                category: '합의'
	            });
	        }
	    }); 

	    $("#refTable .employeeID").each(function (index) {
	        var employeeID = $(this).val();

	        if (employeeID !== undefined) {
	            lastLine.push({
	                employeeID: employeeID,
	                order: null,
	                category:'참조'
	            });
	        }
	    });

	    formData.append('lastLine', JSON.stringify(lastLine));
	        formData.append('tempSave', 0); // 0이면 임시저장안한거
	        if ("${form.formTitle}" === "업무기안서"){
	        if (!content.trim() && !title.trim()) {
		        alert("제목과 내용을 입력해주세요!");
		    } else if (!title.trim()) {
		        alert("제목을 입력해주세요!");
		    } else if (!content.trim()) {
		        alert("내용을 입력해주세요!");
		    } 
	        }
	        if (lastLine.length === 0) {
		        alert("결재라인을 지정해주세요.");
		        return;
		    }
	    
	    	
	   
	    if("${form.formTitle}" === "휴가신청서"){
	    	if(vacationCategory=="오전반차"||vacationCategory=="오후반차"){
	    		if(start ===''){
	        		alert("날짜를 선택해주세요!");
	        		return;
	        	}
        		
        }else{
        	if (start === '' || end ==='') {
                alert("날짜를 전부 선택해주세요!");
                return;
            }else if($('#total').text()=='잔여 연차를 초과하였습니다.'){
            	alert("잔여 연차를 확인해주세요!");
            	return;
            }
        }
	    }
	    if(idx!==undefined){
	    	formData.append("idx",idx);
	    }
	    
	        $.ajax({
		        url: "/Cocean/approval/writeDraft.do",
		        method: "POST",
		        processData: false,
		        contentType: false,
		        data: formData,
		        cache: false,
		        success: function (data) {
		            console.log(data);
		            location.href = './myDraftList.go';
		
		        },
		        error: function (e) {
		            console.error(e);
		        }
		    	});
	    
	   }
	   return;
	}
	
	
	
	// 임시저장
	function tempSave(idx) {
			alert('저장되었습니다.');
			console.log(idx);
			var title = $('input[name="title"]').val(); // 업무기안서
			var titleID = $('input[name="titleID"]').val(); // 양식titleID
			var lastOrder = $("#approvalLine tbody tr:last th").text(); // 결재라인의 마지막 순서
			var lastLine = [];
			
		    var formData = new FormData();

		    var filesInput = $('input[name="files"]')[0];
		    var files = filesInput.files;
		   //  console.log(files.length);
		   //  console.log(filesInput);
		    if (files.length === 0) {
		        formData.append('files', null);
		    }else{
		    for (var i = 0; i < files.length; i++) {
		        formData.append('files', files[i]);
		    }
		    }
		    
		    formData.append('titleID',titleID);
		    formData.append('lastOrder',lastOrder);
		    formData.append('publicStatus', $('input[name="publicStatus"]:checked').val());
		    if ("${form.formTitle}" === "업무기안서") {
		    	var content = $("#summernote").summernote('code');// 업무기안서
		        formData.append('content', content);
		    	formData.append('title',title);
		    } else if ("${form.formTitle}" === "휴직원" || "${form.formTitle}" === "복직원") {
		    	var textArea = $('#textarea').val();
		        formData.append('startDate', startDate);
		        formData.append('endDate', endDate);
		        formData.append('textArea', textArea);
		    } else if("${form.formTitle}"==="휴가신청서"){
		    	var start = $('input[name="start"]').val();
		        var startTime = $('select[name="startTime"]').val();
		        var end = $('input[name="end"]').val();
		        var endTime = $('select[name="endTime"]').val();
		        var vacationCategory =$('select[name="vacationCategory"]').val();
		    	var total= $('#total').text().replace(/\D/g, ''); // 문자 빼기('일')
		    	if(vacationCategory=='반차'){
		    		total=0.5;
		    		if($('input[value="오전반차"]:checked')){
		    			vacationCategory=$('input[value="오전반차"]:checked').val();
		    		}else{
		    			vacationCategory=$('input[value="오후반차"]:checked').val();
		    		}
		    	}
		        var textArea = $('#textarea').val();
		        console.log(total);
		    	formData.append('startDate', start);
		    	formData.append('endDate', end);
		    	formData.append('vacationCategory', vacationCategory);
		    	formData.append('textArea', textArea);
		    	formData.append('total', total);
				console.log("아오:"+vacationCategory);
		    }
	    
		    $("#approvalLine tbody tr").each(function (index) {
		        var order = $(this).find('.order').text(); // 각자의 순서
		        var employeeID = $(this).find('.employeeID').val(); // 결재자,합의자,참조자
		        var category = $(this).find('.category').text();
		        
			
		        if (employeeID !== undefined && category == '결재') {
		            lastLine.push({
		                employeeID: employeeID,
		                order: order,
		                category: '결재'
		            });
		        }
		    });

		    $("#approvalLine tbody tr").each(function (index) {
		    	 var order = $(this).find('.order').text(); // 각자의 순서
			     var employeeID = $(this).find('.employeeID').val();
			     var category = $(this).find('.category').text();
			     
		        if (employeeID !== undefined && category == '합의') {
		            lastLine.push({
		                employeeID: employeeID,
		                order: order,
		                category: '합의'
		            });
		        }
		    }); 

		    $("#refTable .employeeID").each(function (index) {
		        var employeeID = $(this).val();

		        if (employeeID !== undefined) {
		            lastLine.push({
		                employeeID: employeeID,
		                order: null,
		                category:'참조'
		            });
		        }
		    });

		    formData.append('lastLine', JSON.stringify(lastLine));
		    formData.append('tempSave', 1); 
		    if(idx!==undefined){
		    	console.log("이미 임시저장한거있음:idx="+idx);
		    	formData.append("idx",idx);
		    	$.ajax({
			        url: "/Cocean/approval/writeDraft.do",
			        method: "POST",
			        processData: false,
			        contentType: false,
			        data: formData,
			        cache: false,
			        success: function (data) {
			            console.log(data);
			        },
			        error: function (e) {
			            console.error(e);
			        }
			    	});
		    }else{
	        $.ajax({
		        url: "/Cocean/approval/writeDraft.do",
		        method: "POST",
		        processData: false,
		        contentType: false,
		        data: formData,
		        cache: false,
		        success: function (data) {
		            console.log(data.idx);
		            var idx=data.idx;
		            changeBtn(idx);
		        },
		        error: function (e) {
		            console.error(e);
		        }
		    	});
		    }

		}
	
	 function changeBtn(idx) {
        $('#btnRemove').remove();
        renderBtn(idx);
	
     }
	 
 	 function renderBtn(idx) {
         let el = `
             <div id="btnRemove">
	    		 <input type="button" class="btn btn-secondery"value="취소" onclick="location.href='formList.go'"/>
	   			 <input type="button" class="btn btn-primary" style="float:right" onclick="save(` + idx + `)" value="등록"/>
	             <input type="button" class="btn btn-primary" style="float:right" onclick="tempSave(` + idx + `)" value="임시저장"/>
             </div>
     `;
         $('#render').append(el);
         console.log("생성된 idx:"+idx);
     }

	
	
     function getApprovalLine(lineData){
 		// console.log(lineData);
 		 for (var i = 0; i < lineData.length; i++) {
              addLineToTable(lineData[i]);
          }
 	}
     
     function addLineToTable(lineData) {    	 
		    var appTable = $("#approvalLine");
		    // var agrTable = $("#agreeTable");
		    var refTable = $("#refTable");
		    var signTable = $("#approvalSignature");
		    var agrSign = $("#agrSignature");
		    if (lineData.category == "결재" || lineData.category == "합의") {
		        var row = $("<tr>");
		        if(lineData.category=="결재" || lineData.category== "합의")
		        	row.append("<th class='img-profile rounded-circle'><input type='hidden' name='order' class='order' value='" + (appTable.find("tr").length + 1) + "'></th>");
		      /*   
		        if(lineData.category == "합의"&&appTable.find("tr:last .category").text() == "합의"){
		        	row.append("<td class='img-profile rounded-circle'><input type='hidden' class='order' value=''></td>");
		        } */
		        row.append("<td class='category'>" + lineData.category + "</td>");
		        if (lineData.hqName == '' && lineData.departmentName == '') {
		            row.append("<td>" + lineData.rank + lineData.name + "</td>");
		            row.append('<img src="<c:url value='/resource/img/cancel.png'/>" class="delete" alt="삭제 아이콘">');
		        } 
		        else {
		            row.append("<td>" + lineData.hqName + "/" + lineData.departmentName + "</td>");
		            row.append("<td>" + lineData.rank + "</td>");
		            row.append("<td>" + lineData.name + "</td>");
		            row.append('<img src="<c:url value='/resource/img/cancel.png'/>" class="delete" alt="삭제 아이콘">');
		        }
		        row.append("<input type='hidden' class='employeeID' value='" + lineData.employeeID + "'>");
		        appTable.append(row);
		        updateRowNumbers();
		        // console.log(lineData.employeeID);

		        // signatureTable   
		        if(lineData.category =="결재"&&appTable.find(".category:contains('결재')").length==1){
			        var content=
			        "<table class='signApp'>"+
						"<tr>"+
					        "<td rowspan='3' style='width: 20px; background-color:#ededed;'>"+"결재"+"<input type='hidden' class='empID' value='" + lineData.employeeID + "'></td>"+
					        "<td style='width: 80px; font-size:13px; padding : 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'>"+lineData.positionName+"\u00A0"+lineData.name+"</td>"+
					    "</tr>"+
					    "<tr>"+
					        "<td style='width: 80px; font-size:10px; vertical-align: bottom;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'></td>"+
					    "</tr>"+
					    "<tr>"+
					        "<td style='width: 80px; background-color:#ededed;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'></td>"+
					    "</tr>"+
					"</table>"
					signTable.append(content);
					
		        }else if(lineData.category =="결재"&&row.find(".order").html() != 2){
			        var frLastTd=$('.signApp:last tr:first td:last');
			        var scLastTd=$('.signApp:last tr:odd td:last');
			        var lastTd=$('.signApp:last td:last');
			        
			        $("<td rowspan='3' style='width: 20px; background-color:#ededed;'>결재<input type='hidden' class='empID' value='" + lineData.employeeID + "'></td><td style='width: 80px; font-size:13px; padding: 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'>" +lineData.positionName+"\u00A0"+lineData.name+ "</td>").insertAfter(frLastTd);
			        $("<td style='width: 80px; font-size:10px; vertical-align: bottom;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'></td>").insertAfter(scLastTd);
			        $("<td style='width: 80px; background-color:#ededed;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'><input type='hidden'></td>").insertAfter(lastTd);
		        	}else if (lineData.category == "합의"&&appTable.find(".category:contains('합의')").length==1) {
		        		  var content =
		        			  "<table class='agrSign'>"+
								"<tr>"+
							        "<td rowspan='3' style='width: 20px; background-color:#ededed;' >"+"합의"+"<input type='hidden' class='empID' value='" + lineData.employeeID + "'></td>"+
							        "<td style='width: 80px; font-size:13px; padding : 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'>"+lineData.positionName+"\u00A0"+lineData.name+"</td>"+
							    "</tr>"+
							    "<tr>"+
							        "<td style='width: 80px; font-size:10px; vertical-align: bottom;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'></td>"+
							    "</tr>"+
							    "<tr>"+
							        "<td style='width: 80px; background-color:#ededed;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'></td>"+
							    "</tr>"+
							"</table>"
							agrSign.append(content);
		        	
		                } else if(appTable.find(".category:contains('합의')").length>1){
		                	 var frLastTd=$('.agrSign:last tr:first td:last');
		 			        var scLastTd=$('.agrSign:last tr:odd td:last');
		 			        var lastTd=$('.agrSign:last td:last');
		 			        
		 			        $("<td rowspan='3' style='width: 20px; background-color:#ededed;'>합의<input type='hidden' class='empID' value='" + lineData.employeeID + "'></td><td style='width: 80px; font-size:13px; padding: 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'>" +lineData.positionName+"\u00A0"+lineData.name+ "</td>").insertAfter(frLastTd);
		 			        $("<td style='width: 80px; font-size:10px; vertical-align: bottom;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'></td>").insertAfter(scLastTd);
		 			        $("<td style='width: 80px; background-color:#ededed;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'><input type='hidden'></td>").insertAfter(lastTd);
		                  
		                }
		        	
		    }else if(lineData.category == "참조"){
		        row = $("<tr>");

		        if (lineData.hqName == '' && lineData.departmentName == '') {
		            row = $("<td>" + lineData.rank + lineData.name + "</td>");
		            row.append(row);
		            row.append('<img src="<c:url value='/resource/img/cancel.png'/>" class="delete" alt="삭제 아이콘">');
		        } else {
		            row = $("<td>" + lineData.hqName + "/" + lineData.departmentName + lineData.rank + lineData.name + "</td>");
		            row.append(row);
		            row.append('<img src="<c:url value='/resource/img/cancel.png'/>" class="delete" alt="삭제 아이콘">');
		        }
		        row.append("<input type='hidden' class='employeeID' value='" + lineData.employeeID + "'>");
		        refTable.append(row);
		        // console.log(lineData.employeeID);
		    }
		    
		    $(document).on('click', '.delete', function() {
			    var element = $(this);
			    var row = element.closest('tr')
			    var cell = element.closest('td');
			    var table = row.closest('table');
			    if (table.attr('id') === 'approvalLine') {
			        row.remove();
			        updateRowNumbers('#approvalLine');
			        var delEmpID = row.find('.employeeID').val();
			        // console.log($('#approvalSignature .empID[value="' + delEmpID + '"]').parent());
			        // 찾은 INPUT에 가까운 TD 지우기
			      	$('#approvalSignature .empID[value="' + delEmpID + '"]').parent().remove();
			      	$('#agrSignature .empID[value="' + delEmpID + '"]').parent().remove();
			        
			        
			    } else {
			        cell.remove();
			    }
			});	
				
		    SendAddedLineData(lineData);
		    
		}
	  
	 
	 function SendAddedLineData(lineData){
	    	getAddedLineData(lineData);
	    }
	 
	
	 
		// 결재 순서 업데이트
		function updateRowNumbers(tableId) {
		    $(tableId + ' tbody tr').each(function(index) {
		    	 var row = $(this);
		         var orderInput = row.find('.order');
		         orderInput.val(index + 1);
		    });
		}  
		

		
		/* function updateRowNumbers(tableId) {
		    var rows = $(tableId + ' tbody tr');

		    rows.each(function(index) {
		        var currentRow = $(this);
		        var currentCategory = currentRow.find('.category').text();
		        console.log(currentRow.html());

		        // Check if the current row has '결재' category
		        if (currentCategory === '결재') {
		            var prevRow = rows.eq(index - 1);
		            var prevPrevRow = rows.eq(index - 2);

		            // Check if the previous row has '합의' category and the row before the previous one has an index greater than or equal to 2
		            if (prevRow.length && prevRow.find('.category').text() === '합의' && prevPrevRow.length && prevPrevRow.index() >= 2) {
		                currentRow.find('.order').text(prevPrevRow.index() + 2);
		            } else {
		                currentRow.find('.order').text(index + 1);
		            }
		        } else {
		            currentRow.find('.order').text(index + 1);
		        }
		    });
		}
		 */
		
		
		
		 // 결재라인 추가한거 취소
		
</script>

</html>