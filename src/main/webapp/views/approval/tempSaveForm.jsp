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

<%-- <script src="<c:url value='/resource/summernote/summernote-lite.js'/>"></script> --%>
<%-- <script src="<c:url value='/resource/summernote/lang/summernote-ko-KR.js'/>"></script> --%>
<%-- <link rel="stylesheet" href="<c:url value='/resource/summernote/summernote-lite.css'/>"> --%>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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
   border-spacing : 10px 10px;
   width: 100%;
   
}

#approvalLine, #approvalLine th, #approvalLine td {
  border: none;
  padding : 0px;
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
    padding: 4% 2% 2% 2%;
    border: 5px solid #e8e8e8;
    width: 73%;
    height: 145%;
}

#bottom{
    width:74%;
    margin-left : 2%;
}

#rightContainer{
    flex-direction: column;
    width: 22%;
    float:right;
    margin: 5% 2%;
}

#formTitle{
    text-align: center;
    font-size: 41px;
    font-family:Dotum;
    margin-bottom: 17px;
}

.topTitle{
    width: 50%;
    font-size: 30px;
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

.deletee{
   width:15px;
   height:15px;
   cursor:pointer;
}


.delete{
   width:15px;
   height:15px;
   cursor:pointer;
}

 .appStatus{
    text-decoration: underline;
    text-decoration-thickness: 3px;
    text-decoration-color: #4480e9;
    }
    
      .delArea{
      margin: 53% 15% 6% -46%;
       padding: 0px 5px;
       width: 25px;
    }
    
    #draftInfo tr, #draftInfo th, #draftInfo td{
           font-family: Dotum;
    }
    
    #workDraftContent tr, #workDraftContent th, #workDraftContent td{
       font-family:Dotum;
    }
    
     #attendanceDraftContent tr, #attendanceDraftContent th, #attendanceDraftContent td{
       font-family:Dotum;
    }
    
     #leaveDraftContent tr, #leaveDraftContent th, #leaveDraftContent td{
       font-family:Dotum;
    }
    
     #approvalSignature tr, #approvalSignature th, #approvalSignature td{
       font-family:Dotum;
       font-weight:bold;
    }

     .newBox{
   background-color: #cfdff0;
    border: 1px solid #9fc2e8;
    display: inline-block;
    padding-left: 5px;
    padding-right: 5px;
    margin-right: 10px;
    padding-top: 0px;
    margin-top: 1px;
    text-align: center;
    border-radius: 11px;
    letter-spacing: 0px;
    height: 26px;
    }

    
</style>
</head>
<body>
<c:import url="/side"/>

<div class="container-fluid contentField">
	<!-- 결재라인 설정 모달 -->
	<div class="modal fade" id="lineModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
				   <!-- 모달창 제목 -->
				   <h5 class="modal-title">결재라인 설정</h5>
				   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				      <span aria-hidden="true">&times;</span>
				   </button>
				</div>
				
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6" style="border-right:1px solid #EDEDED">
							<div id="employeeList">
							<!-- 조직도 -->
							<c:import url="/approval/appOrganization/1"/>
							</div>
						</div>				
						<div class="col-md-6">
							<div id="line">
							<!-- 라인 추가하면 그려지는 부분 -->
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
	<!-- 모달창에서 라인 추가하면 그려지는 부분 -->
	<div id="rightContainer">
		<div class="card shadow" style="width: 354px;padding: 1%;">
			<div class="lineContent" style="padding: 10px 6px;">
				<span style="margin: 0px; font-size: 17px; width: 270px; font-weight : normal;">결재라인</span>
				<img src="<c:url value='/resource/img/addButton.png'/>" class="addApprovalLine" alt="라인 추가 아이콘" onclick="remainedEmpID()" data-toggle="modal" data-target="#lineModal" style="margin-left: auto; cursor: pointer;">
				<hr/>
				<table id="approvalLine"  style="font-size:14px;">
					<tr style="text-align: center;">
						<!-- 로그인 유저 정보 그려지는 부분 -->
						<th style="background-color:white;"><img src='/photo/cocean/profile/${list.serverFileName}' class="img-profile rounded-circle" style="width:40px; height:40px "></th>
						<td style="width: 15%; padding:0px;"><span class="appStatus" style="font-weight : bold;">상신</span></td>
						<td style="width: 40%;">${list.hqName}/${list.departmentName}</td>
						<td style="width: 20%; padding:0px;">${list.positionName}</td>
						<td style="width: 20%;">${list.name}</td>
					</tr>
					<!-- 모달창에서 결재라인에 추가한 직원의 정보가 그려지는 부분 -->
					<c:forEach items="${lineList}" var="lL">
					<tr style="text-align: center;">
						<th style="background-color:white;">
						<c:choose>
						<c:when test="${lL.serverFileName != null}">
						<img src="/photo/cocean/profile/${lL.serverFileName}" class="img-profile rounded-circle" style="width:40px; margin-top:10px; height:40px">
						</c:when>
						<c:otherwise>
						<img src="/Cocean/resource/img/undraw_profile.svg" class="img-profile rounded-circle" style="width:40px; margin-top:10px; height:40px">
						</c:otherwise>
						</c:choose>
						</th>
						<td style="width: 15%; padding:0px;"><span class="appStatus" style="font-weight : bold;">${lL.category}</span></td>
						<td style="width: 40%;">${lL.hqName}/${lL.departmentName}</td>
						<td style="width: 20%; padding:0px;">${lL.positionName}<input type="hidden" name="order" class="order" value="${lL.approvalOrder}"></td>
						<td style="width: 20%;">${lL.name}<input type="hidden" class="employeeID" value="${lL.employeeID}"><img src="<c:url value='/resource/img/cancel.png'/>" class="deletee" alt="삭제 아이콘"></td>
					</tr>   
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<div class="topTitle">
			<h1 class="h3 mb-0 text-gray-800">기안서 작성</h1>
		</div>
	</div>
	
	<div id="contentLine">
		<div id="formTitle">${list.formTitle}</div>
		<div id="draftInfoTop" style="display: flex;">
			<input type="hidden" value="${list.titleID}" name=titleID>
			<table id="draftInfo">
			<!-- 로그인한 유저의 정보 -->
				<tr>
				    <th>상신자</th>
				    <td>${list.name}</td>
				    <td rowspan="3" class="di-td-1"></td>
				</tr>
				<tr>
				    <th>소속부서</th>
				    <td>${list.hqName}/${list.departmentName}</td>
				</tr>
				<tr>
				    <th>상신일</th>
				    <td>${date}</td>
				</tr>
			</table>		      
			<div id="approvalSignature">
			</div>		   
		</div>
	<input type="hidden" value="${list.employeeID}" name="loginId">
	<input type="hidden" value="${list.idx}" name="idx">
	<input type="hidden" id="order" name="order" value="">
	
	<br/>
	<!-- <form action="writeDraft.do" method="post" enctype="multipart/form-data"> -->
	<c:if test="${list.formTitle eq '업무기안서'}">
	<table id="workDraftContent">
	   
	      <tr>
	          <th>참조자</th>
	          <td><table id="refTable" style="border:none;">
	          <c:forEach items="${agrRef}" var="ref">
	          <c:if test="${ref.category eq '참조'}">
	          <tr>
	          <td>
	          <span class="box" style="background-color: #cfdff0;
	       border: 1px solid #9fc2e8;
	       display: inline-block;
	       padding-left: 5px;
	       padding-right: 5px;
	       text-align: center;
	       border-radius: 11px;
	       letter-spacing: 0px;
	       height: 21px;
	       vertical-align: middle;">
	          <label>${ref.hqName}</label>
	          <label>${ref.departmentName}</label>
	          <label>${ref.positionName}</label>
	          <label>${ref.name}</label><img src="<c:url value='/resource/img/cancel.png'/>" class="deletee" alt="삭제 아이콘">
	           <input type="hidden" name="refEmpId" value="${ref.employeeID }">
	           </span>
	          </td>
	          </tr>
	          </c:if>
	          </c:forEach>
	          </table>
	          </td>
	      </tr>
	      <tr>
	      <th>제목</th>
	         <td><input type="text" name="title" placeholder="*제목을 입력해주세요." value="${list.title}"></td>
	      </tr>
	      <tr>
	         <td colspan="2">
	            <div id="summernote">${list.content}</div>
	         <!-- 작성글은 div 에 담겨지는데, div는 서버로 전송이 불가능 -->
	         <input type="hidden" name="content" value=""/>
	      </td>
	   </tr>
	</table>
	
	</c:if>
	
	<c:if test="${list.formTitle eq '휴가신청서'}">
	<table id="attendanceDraftContent">
	   <tr>
	       <th>참조자</th>
	       <td>
	       <c:forEach items="${agrRef}" var="ref">
	       <c:if test="${ref.category eq '참조'}">
	       <table id="refTable" style="border:none;">
	       <tr>
	       <td>
	       <label>${ref.hqName}</label>
	       <label>${ref.departmentName}</label>
	       <label>${ref.positionName}</label>
	       <label>${ref.name}</label><img src="<c:url value='/resource/img/cancel.png'/>" class="deletee" alt="삭제 아이콘">
	       </td>
	       </tr>
	       </table>
	       </c:if>
	       </c:forEach>
	       </td>
	   </tr>
	   <tr>
	      <th>휴가 종류</th>
	         <td colspan="2">
	         <select id="vacationCategory" name="vacationCategory" onchange="reason()">
	        <option value="연차" ${'연차' eq vac.category ? 'selected="selected"' : ''}>연차</option>
	        <option value="반차" ${'반차' eq vac.category ? 'selected="selected"' : ''}>반차</option>
	        <option value="병가" ${'병가' eq vac.category ? 'selected="selected"' : ''}>병가</option>
	        <option value="공가" ${'공가' eq vac.category ? 'selected="selected"' : ''}>공가</option>
	        <option value="경조사" ${'경조사' eq vac.category ? 'selected="selected"' : ''}>경조사</option>
	    </select>
	         </td>
	   </tr>
	   <tr>
	       <th>잔여 연차</th>
	      <td id="remain" contentEditable="false" style="background-color:#ededed;">${vac.remainingAnnualLeave}일</td>
	   </tr>
	   <tr>
	       <th>사용 날짜</th>
	      <td> 
	          <div class="dateSelect"><input type="date" name="start" id="startFac" class="form-control mb-2" value="${vac.vacationStartDate}"><p>&nbsp;~&nbsp;</p><input type="date" name="end" id="endFac"  class="form-control mb-2" value="${vac.vacationEndDate}">
	          <div class="ampm" style="display:none; margin-left:10px; font-size:12px; margin-top:10px;"><input type="radio" name="time" value="오전반차" checked/>오전<input type="radio" name="time" value="오후반차" />오후</div>
	          </div>
	       </td>
	   </tr>
	   <tr>
	      <th>총 사용일</th>
	      <td id="total" style="background-color:lightgray;"></td>
	   </tr>
	   <tr id="reason" style="display: none;">
	      <th>사유</th>
	      <td colspan="2"><textarea  name="content" id="textarea" placeholder="*필수입력">${vac.vacationReason}</textarea></td>
	   </tr>
	</table>
	</c:if>
	
	
	<c:if test="${list.formTitle eq '휴직원' or form.formTitle eq '복직원'}">
	<table id="leaveDraftContent">
	   <tr>
	       <th>참조자</th>
	       <td>
	       <c:forEach items="${agrRef}" var="ref">
	       <c:if test="${ref.category eq '참조'}">
	       <table id="refTable" style="border:none;">
	       <tr>
	       <td>
	       <label>${ref.hqName}</label>
	       <label>${ref.departmentName}</label>
	       <label>${ref.positionName}</label>
	       <label>${ref.name}</label><img src="<c:url value='/resource/img/cancel.png'/>" class="deletee" alt="삭제 아이콘">
	       </td>
	       </tr>
	       </table>
	       </c:if>
	       </c:forEach>
	       </td>
	   </tr>
	   <tr>
	      <th>휴직 기간</th>
	         <td><input type="date" name="startDate" value="${lv.leaveStartDate}">~<input type="date" name="endDate" value="${lv.leaveEndDate}"></td>
	      </tr>
	   <tr>
	      <th>사유</th>
	      <td colspan="2"><textarea  name="content" id="textarea" placeholder="*필수입력" >${lv.leaveReason}</textarea></td>
	   </tr>
	</table>
	</c:if>
	
	
	<br/>
	<label class="input-file-button" for="input-file">
	 파일첨부
	</label>
	<input type="file" id="input-file" name="uploadFile" style="display:none;" multiple onchange="displayFileList(this)"/>
	<br/>
	<div id="fileList">
		<c:forEach items="${fileList}" var="file">
	    <a href="download.do?file=${file.serverFileName}">${file.oriFileName}</a><img src="/Cocean/resource/img/cancel.png" class="deletee" alt="삭제 아이콘"><br/>
	    </c:forEach>
	</div>
	
	
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
<div id="render" style="margin-right:2.5%; margin-left: -1%;">
<input type="button" class="btn btn-secondary" value="취소" onclick="confirmSave()"/>
<input type="button" style="float:right"class="btn btn-primary" id="write" value="등록" onclick="save(${list.idx})"/>
<input type="button" style="float:right; margin-right:10px;"class="btn btn-primary" id="tempSave" value="임시저장" onclick="tempSave(${list.idx})"/>
</div>

</div>


</div>



<!-- </form> -->



<c:import url="/footer"/>
</body>
<script>


function displayFileList(input) {
	var fileList = document.getElementById('fileList');
    var files = input.files; 

    for (var i = 0; i < files.length; i++) {
        var fileItem = document.createElement('div');
        fileItem.textContent = files[i].name;

        var deleteIcon = document.createElement('img');
        deleteIcon.src = "/Cocean/resource/img/cancel.png";
        deleteIcon.classList.add('delete');
        deleteIcon.alt = "삭제 아이콘";

        deleteIcon.addEventListener('click', function() {
            this.parentNode.remove();
        });

        fileItem.appendChild(deleteIcon);
        fileList.appendChild(fileItem);
    }
}

function reason() {
    var vacationCategory = document.getElementById('vacationCategory');
    var reason = document.getElementById('reason');

    var selectedValue = vacationCategory.value;

    if (selectedValue === '경조사' || selectedValue === '병가' || selectedValue === '공가') {
        reason.style.display = '';
    } else{
        reason.style.display = 'none';
    }
}

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
 
   var loginId = $('input[name="loginId"]').val()
   var idx = $('input[name="idx"]').val()
 
 $(function () {
     $.ajax({
         url: "drawSign",
         type: "GET",
         data:{'loginId':loginId, 'idx':idx},
         success: function (data) {
            var signList = data.signList;
            // console.log(signList);
            // console.log(signList.length);
             if (signList.length>0) {
                  var firstItem = signList[0];
                  approvalSignature(firstItem);
                  for (var i = 1; i < signList.length; i++) {
                     var addItem = signList[i];
                      appSign(addItem);
                }
             }
            var order = data.approvalOrder;
            $('#order').val(order);
            console.log(data);
         },
         error: function (e) {
             console.log(e);
         }
     });
 });
   
    
   function remainedEmpID() {
       remLine = [];
       refLine = [];
      // console.log($("#summernote").summernote('code'));
       if ($("#approvalLine tbody tr .employeeID").length > 0) {
           $("#approvalLine tbody tr .employeeID").each(function () {
               remLine.push($(this).val());
           });
       } else if ($("#refTable .employeeID").length > 0) {
           $("#refTable .employeeID").each(function () {
              refLine.push($(this).val());
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
      height: 500, width: 825,
      maxHeight: 500,
      minHeight: 200,
      focus: true
   });

   var order;
   $("#approvalLine tbody tr").each(function (index) {
       order = index + 1;
   });
   
   var idx;
   
   //기안 등록
   function save(idx) {
      
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
       if ("${list.formTitle}" === "업무기안서") {
          var content = $("#summernote").summernote('code') // 업무기안서
           formData.append('content', content);
          formData.append('title',title);
       } else if ("${list.formTitle}" === "휴직원" || "${list.formTitle}" === "복직원") {
          var textArea = $('#textarea').val();
           formData.append('startDate', startDate);
           formData.append('endDate', endDate);
           formData.append('textArea', textArea);
       } else if("${list.formTitle}"==="휴가신청서"){
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
           var category = $(this).find('.appStatus').text();
           console.log("순서!!:"+order);
           console.log("결재자:"+employeeID);
         console.log("")
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
           var category = $(this).find('.appStatus').text();
           
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
       
       $('input[name="refEmpId"]').each(function (index) {
           var employeeID = $(this).val();

           if (employeeID !== undefined) {
               lastLine.push({
                   employeeID: employeeID,
                   order: null,
                   category: '참조'
               });
           }
       });
       console.log( $('input[name="refEmpId"]').val());

       formData.append('lastLine', JSON.stringify(lastLine));
           formData.append('tempSave', 0); // 0이면 임시저장안한거
           if ("${list.formTitle}" === "업무기안서"){
              if (content.trim() === '<p><br></p>' && !title.trim()) {
                 swal('제목과 내용을 입력해주세요!','','warning');
                 return;
             } else if (!title.trim()) {
                 swal('제목을 입력해주세요!','','warning');
                 return;
             } else if (content.trim() === '<p><br></p>') {
                 swal('내용을 입력해주세요!','','warning');
                 return;
             } 
              }
              if (lastLine.length === 0) {
                  swal('결재라인을 지정해주세요!','','warning');
                 return;
             }
       
          
      

             if("${list.formTitle}" === "휴가신청서"){
                if(vacationCategory=="오전반차"||vacationCategory=="오후반차"){
                   if(start ===''){
                       swal('날짜를 선택해주세요!','','warning');
                       return;
                    }
                    
              }else{
                 if (start === '' || end ==='') {
                     swal('날짜를 전부 선택해주세요!','','warning');
                      return;
                  }else if($('#total').text()=='잔여 연차를 초과하였습니다.'){
                      swal('잔여 연차를 확인해주세요!','','warning');
                     return;
                  }
              }
             }
       if(idx!==undefined){
          formData.append("idx",idx);
       }
       
       swal({
         title: "등록하시겠습니까?",
         text:"",
         icon:"info",
         buttons:["취소","확인"]
      })
      .then((isOkey) => {
         if(isOkey){
            swal('등록이 완료 되었습니다.','','success')
            .then((isOkey)=>{
               if(isOkey){
               
                       $.ajax({
                          url: "<c:url value='/approval/writeDraft.do'/>",
                          method: "POST",
                          processData: false,
                          contentType: false,
                          data: formData,
                          cache: false,
                          success: function (data) {
                              // console.log(data);
                              location.href = './myDraftList.go';
                  
                          },
                          error: function (e) {
                              console.error(e);
                          }
                         });
                  
               }
            })
         }
      });
       
   
   }
   
   
   
   // 임시저장
   function tempSave(idx) {
      swal('저장되었습니다.','','success');
         console.log(idx);
         var title = $('input[name="title"]').val(); // 업무기안서
         var titleID = $('input[name="titleID"]').val(); // 양식titleID
         var lastOrder = $('#approvalLine input[name="order"]:last').val(); // 결재라인의 마지막 순서
         var lastLine = [];
         
         var formData = new FormData();

          var filesInput = $("input[name='uploadFile']");
		  var files = filesInput[0].files;
		  console.log(files);
		    for (var i = 0; i < files.length; i++) {
		        if (fileList.includes(files[i].name)) {
		            formData.append('files', files[i]);
		        }
		    }
          
          formData.append('titleID',titleID);
          formData.append('lastOrder',lastOrder);
          formData.append('publicStatus', $('input[name="publicStatus"]:checked').val());
          if ("${list.formTitle}" === "업무기안서") {
             var content = $("#summernote").summernote('code');// 업무기안서
              formData.append('content', content);
             formData.append('title',title);
          } else if ("${list.formTitle}" === "휴직원" || "${list.formTitle}" === "복직원") {
             var textArea = $('#textarea').val();
              formData.append('startDate', startDate);
              formData.append('endDate', endDate);
              formData.append('textArea', textArea);
          } else if("${list.formTitle}"==="휴가신청서"){
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
          }
       
          $("#approvalLine tbody tr").each(function (index) {
              var order = $(this).find('input[name="order"]').val(); // 각자의 순서
              var employeeID = $(this).find('.employeeID').val(); // 결재자,합의자,참조자
              var category = $(this).find('.appStatus').text();
             
         
              if (employeeID !== undefined && category == '결재') {
                  lastLine.push({
                      employeeID: employeeID,
                      order: order,
                      category: '결재'
                  });
              }
          });
          $("#approvalLine tbody tr").each(function (index) {
              var order =$(this).find('input[name="order"]').val(); // 각자의 순서
              var employeeID = $(this).find('.employeeID').val();
              var category = $(this).find('.appStatus').text();
              
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
          formData.append("idx",idx);
          
              $.ajax({
                 url: "<c:url value='/approval/writeDraft.do'/>",
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
       
      }
   
   function confirmSave() {
        
      swal({
         title:"변경사항이 저장되지 않을 수 있습니다. 그래도 나가시겠습니까?",
         text:"",
         icon:"warning",
         buttons:["취소","확인"]
      })
      .then((isOkey)=>{
         if(isOkey){
             location.href = './tempSaveList.go';
         }
      })
      
   }
         
   
   function getApprovalLine(lineData) {
        console.log(lineData);
        console.log(remLine);
       for (var i = 0; i < lineData.length; i++) { // 오른쪽 결재라인창에 그려지는거
           addLineToTable(lineData[i]);
       }
       $('#line').empty();
      
        if (lineData[0].category == '참조' && lineData.length > 1) {
           if(remLine.length==0){
           var firstItem;
           for (var i = 0; i < lineData.length; i++) {
               if (lineData[i].category !== '참조') {
                   firstItem = lineData[i];
                  break;
               }
           }
           approvalSignature(firstItem);
          for (var i = lineData.indexOf(firstItem)+1; i < lineData.length; i++) {
               var addItem = lineData[i];
               appSign(addItem);
              console.log(addItem.category);
         }
           
           }else{
              for (var i = 0; i < lineData.length; i++) {
                   if (lineData[i].category !== '참조') {
                       firstItem = lineData[i];
                        break;
                   }
              }
          for (var i = lineData.indexOf(firstItem); i < lineData.length; i++) {
                var addItem = lineData[i];
                appSign(addItem);
          }
           }
        }else if(lineData[0].category!=='참조'&&lineData.length>1){
             var firstItem = lineData[0];
             if(remLine.length==0){
             approvalSignature(firstItem);
             for (var i = 1; i < lineData.length; i++) {
                 var addItem = lineData[i];
                 appSign(addItem);
           }             
             }else{
               for (var i = 0; i < lineData.length; i++) {
                     var addItem = lineData[i];
                     appSign(addItem);
               }           
             }
        }else if(lineData[0].category!=='참조'&&lineData.length==1){
            console.log(remLine.length);
            var firstItem=lineData[0];
            if(remLine.length==0){
               approvalSignature(firstItem);
            }else{
            for (var i = 0; i < lineData.length; i++) {
                  var addItem = lineData[i];
                  appSign(addItem);
            }
            }
          }
        } 
     
     function addLineToTable(lineData) {       
          var appTable = $("#approvalLine");
          // var agrTable = $("#agreeTable");
          var refTable = $("#refTable");
          var signTable = $("#approvalSignature");

          // var agrSign = $("#agrSignature");
          if (lineData.category == "결재" || lineData.category == "합의") {
              var row = $("<tr style='text-align:center;'>");
              if(lineData.photo!=='null'){
                 row.append("<th style='background-color:white;'><img src='/photo/cocean/profile/" + lineData.photo + "' style='width:40px; margin-top:10px; height:40px' class='img-profile rounded-circle'></th>");
                 }else if(lineData.photo=='null'){
                    row.append("<th style='background-color:white;'><img src='/Cocean/resource/img/undraw_profile.svg' style='width:40px; height:40px' class='img-profile rounded-circle'></th>");
                 }
            /*   
              if(lineData.category == "합의"&&appTable.find("tr:last .category").text() == "합의"){
                 row.append("<td class='img-profile rounded-circle'><input type='hidden' class='order' value=''></td>");
              } */
              row.append("<td class='appStatus' style='width:15%;'>" +"<span style='font-weight : bold; text-decoration: underline; text-decoration-thickness: 3px; text-decoration-color: #4480e9;'>"+ lineData.category + "</span>"+"</td>");
              if (lineData.hqName == '' && lineData.departmentName == '') {
                 row.append("<td style='width:65%;' colspan='2'>" + lineData.positionName + "</td>");
                  row.append("<td style='width:20%'>" + lineData.name + "</td>");
                  row.append("<div class='delArea'>"+'<img src="/Cocean/resource/img/cancel.png" class="delete" alt="삭제 아이콘">'+"</div>");
              } 
              else {
                  row.append("<td style='width:40%;'>" + lineData.hqName + "/" + lineData.departmentName + "</td>");
                  row.append("<td style='width:20%;'>" + lineData.rank + "</td>");
                  row.append("<td style='width:20%;'>" + lineData.name + "</td>");
                  row.append("<div class='delArea'>"+'<img src="/Cocean/resource/img/cancel.png" class="delete" alt="삭제 아이콘">'+"</div>");
              }
              row.append("<input type='hidden' class='employeeID' value='" + lineData.employeeID + "'>");
              row.append("<input type='hidden' name='order' class='order' value='" + (appTable.find("tr").length + 1) + "'>");
              appTable.append(row);
              updateRowNumbers();
           
          }else if(lineData.category == "참조"){
              row = $("<tr>");

              if (lineData.hqName == '' && lineData.departmentName == '') {
                  row = $("<td>" + lineData.rank +'\u00A0'+ lineData.name + "</td>");
                  row.append(row);
                  row.append("<div class='delRef' style='width:20px; float:right;'>"+'<img src="/Cocean/resource/img/cancel.png" class="delete" alt="삭제 아이콘">'+"</div>");
              } else {
                  row = $("<td>" + lineData.hqName + "/" + lineData.departmentName +'\u00A0'+ lineData.positionName +'\u00A0'+ lineData.name + "</td>");
                  row.append(row);
                  row.append("<div class='delRef' style='width:20px; float:right;'>"+'<img src="/Cocean/resource/img/cancel.png" class="delete" alt="삭제 아이콘">'+"</div>");
              }
              row.append("<input type='hidden' class='employeeID' value='" + lineData.employeeID + "'>");
              // refTable.append(row);
              var span = $("<span class='newBox'></span>").append(row);
              refTable.append(span);
              console.log(lineData.employeeID);
          }
          
          $(document).on('click', '.delete', function() {
             var element = $(this);
             var row = element.closest('tr')
             var cell = element.closest('td');
             var table = row.closest('table');
             var span = element.closest('.newBox');
             if (table.attr('id') === 'approvalLine') {
                 row.remove();
                 updateRowNumbers('#approvalLine');
                 var delEmpID = row.find('.employeeID').val();
                 // console.log($('#approvalSignature .empID[value="' + delEmpID + '"]').parent());
                 // 찾은 INPUT에 가까운 TD 지우기
                  $('#approvalSignature .empID[value="' + delEmpID + '"]').parent().remove();

                 
                 
             } else {
                 cell.remove();
                 span.remove();
             }
         });   
            
          SendAddedLineData(lineData);
          
      }
     
      function approvalSignature(firstItem){
          var signTable = $("#approvalSignature");
         
            var content=
                 "<table class='signApp'>"+
                  "<tr>"+
                       "<td rowspan='3' style='width: 20px; height:90px; background-color:#ededed;'>"+firstItem.category+"<input type='hidden' class='empID' value='" + firstItem.employeeID + "'></td>"+
                       "<td style='width: 80px; font-size:10px; padding : 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + firstItem.employeeID + "'>"+firstItem.positionName+"\u00A0"+firstItem.name+"</td>"+
                   "</tr>"+
                   "<tr>"+
                   "<td style='width: 80px; font-size:10px; vertical-align: bottom; height: 70px;'><input type='hidden' class='empID' value='" + firstItem.employeeID + "'>"+
                    "</td>"
                   "</tr>"+
                    "<tr><td style='width: 80px; font-size:8px; background-color:#ededed;'></tr>"+
               "</table>"
         
         signTable.append(content);
         
       }
      
      function approvalSignature(lineData){
          var signTable = $("#approvalSignature");
         
            var content=
                 "<table class='signApp'>"+
                  "<tr>"+
                       "<td rowspan='3' style='width: 20px; height:90px; background-color:#ededed;'>"+lineData.category+"<input type='hidden' class='empID' value='" + lineData.employeeID + "'></td>"+
                       "<td style='width: 80px; font-size:10px; padding : 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'>"+lineData.positionName+"\u00A0"+lineData.name+"</td>"+
                   "</tr>"+
                   "<tr>"+
                   "<td style='width: 80px; font-size:10px; vertical-align: bottom; height: 70px;'><input type='hidden' class='empID' value='" + lineData.employeeID + "'>"+
                    "</td>"
                   "</tr>"+
                    "<tr><td style='width: 80px; font-size:8px; background-color:#ededed;'></tr>"+
               "</table>"
         
                    if(lineData.category!=='참조'){
                     signTable.append(content);
                  }
         
       }
      
      function appSign(addItem) {
          var frLastTd = $('#approvalSignature table.signApp:last tr:first td:last');
          var scLastTd = $('#approvalSignature tr:odd td:last');
          var lastTd = $('#approvalSignature td:last');
           
          if (addItem.category !== '참조') {
               $("<td rowspan='3' style='width: 20px; height:90px; background-color:#ededed;'>" + addItem.category + "<input type='hidden' class='empID' value='" + addItem.employeeID + "'></td><td style='width: 80px; font-size:10px; padding: 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>" + addItem.positionName + "\u00A0" + addItem.name + "</td>").insertAfter(frLastTd);
               $("<td style='width: 80px; font-size:10px; vertical-align: bottom; height: 70px;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'></td>").insertAfter(scLastTd);
           }
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
      
       $(document).on('click', '.deletee', function() {
             var element = $(this);
             var row = element.closest('tr')
             var cell = element.closest('td');
             var table = row.closest('table');
             var fileItem = $(this).prev();
             var fileList = $(this).closest('#fileList');
             
             if (table.attr('id') === 'approvalLine') {
                 row.remove();
                 updateRowNumbers('#approvalLine');
                 var delEmpID = row.find('.employeeID').val();
                 // console.log($('#approvalSignature .empID[value="' + delEmpID + '"]').parent());
                 // 찾은 INPUT에 가까운 TD 지우기
                  $('#approvalSignature .empID[value="' + delEmpID + '"]').parent().remove();
             } else {
                 cell.remove();
                 fileItem.remove();
                 $(this).remove();
             }
             if (fileList.children('br').length > 0) {
                 fileList.empty();
             }
         });   

   
      
</script>

</html>