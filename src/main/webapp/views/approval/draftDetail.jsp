<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
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

input[type="text"]{
	width : 100%;
}

input[type="date"]{
	width : 30%;
}

button{
	margin : 5px 0;
}

#approvalLine{
	font-size : 10px;
	
}

.di-td-1{
	width:86px;
}

#approvalLine, #approvalLine th, #approvalLine td {
  border: none;
}

#approvalSignature{
	float:right;
	margin-left : 20px;
	margin-bottom : 20px;
}
	



#agrSignature{
	float:left;
}

#approvalSignature td{
	text-align: center;
}

#workDraftContent{
	width : 100%;
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

#detailInfoTop{
	width : 840.8px;
}

.topTitle{
	position: absolute;
    width: 50%;
    top: 12%;
    font-size: 30px;
    left: 18%;
}

#contentLine{
	margin: 14px;
    padding: 6% 2% 2% 2%;
    border: 5px solid #e8e8e8;
    width: 60%;
    height: 100%;
    position: absolute;
    left: 17%;
    top: 17%;
}

#formTitle{
	position: absolute;
    width: 40%;
    text-align: center;
    top: -18%;
    font-size: 41px;
    right: 29%;
}

#bottom{
	position: absolute;
    left: 19%;
    bottom: -29%;
}

#rightContainer{
	display: flex;
    flex-direction: column;
    width: 22%;
    position: absolute;
    right: 0%;
    top: 19%;
}

#contentContainer{
	position: absolute;
    width: 94%;
    height: 70%;
    top: 16%;
}

#approvalLine, #approvalLine th, #approvalLine td {
  border: none;
}

.modal-content{
	width: 94%;
    height: 53%;
	/* overflow-y: auto; */
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

.appOpinion{
	background: #fa5a5a;
	color: #FFF;
  	border-radius: 5px;
  	transition: all 0.2s ;
  	border:none;
}

.rejOpinion{
	background: #86b0f3;
	color: #FFF;
  	border-radius: 5px;
  	transition: all 0.2s ;
  	border:none;
}

 #startFac, #endFac {
        display: inline-block;
        margin-right: 10px;
    }

</style>
</head>
<body>
<c:import url="/side"/>

<div class="container-fluid contentField">

<div class="modal fade" id="opinionWrite" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<form action="approval.do" method="post"><!-- 입력폼 -->
	              <div class="form-group">
					<textarea name="opinionWrite" class="form-control" oninput="this.setCustomValidity('')" maxlength="500" placeholder="500자까지 작성 가능" style="height: 180px;"></textarea>
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                <button type="submit" class="btn btn-primary"></button>
	              </div>
	                <input type="hidden" value="${loginId}" name="loginId">
					<input type="hidden" value="${list.idx}" name="idx">
					<input type="hidden" id="approvalAction" name="action" value="">
					<input type="hidden" id="lastOrder" name="lastOrder" value="">
					<input type="hidden" id="order" name="order" value="">
					<input type="hidden" value="${vac.remainingAnnualLeave}" name="ral" value="">
					<input type="hidden" value="${vac.usageTime}" name="usageTime" value="">
					<input type="hidden" value="${vac.category}" name="vacationCategory" value="">
                </form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="opinion" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">의견</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
	              <div class="form-group">
	              <textarea name="opinion" id="opinionText" class="form-control" oninput="this.setCustomValidity('')" maxlength="500" placeholder="500자까지 작성 가능" style="height: 180px;" readonly></textarea>
	              </div>
				</div>
			</div>
		</div>
	</div>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<div class="topTitle">
	<h1 class="h3 mb-0 text-gray-800">결재</h1>
	</div>
</div>
<div id="contentLine">
<div id="contentContainer">
<div id="formTitle">${list.formTitle}</div>
<div id="approvalSignature"><!-- 결재 서명 그려지는부분 --></div>
<!-- <div id="agrSignature">합의 서명 그려지는부분</div>	 -->
<br/>
<div id="detailInfoTop" style="display: flex;">
	<table id="detailInfo">
		<tr>
		    <th>상신자</th>
		    <td>${list.name}</td>
		     <td rowspan="3" class="di-td-1"><img src="/photo/cocean/signature/${sign.serverFileName}" width="40" height="40" class="signatureImg"></td>
		</tr>
		<tr>
		    <th>소속부서</th>
		    <td>${list.hqName}/${list.departmentName}</td>
		</tr>
		<tr>
		    <th>상신일</th>
		    <td>${list.draftDate}</td>
		</tr>
	</table>
</div>



<br/>

<c:if test="${list.formTitle eq '업무기안서'}">
<div id="workDraft">
<table id="workDraftContent">
	
	<%-- <tr>
	    <th>합의자</th>
	    <c:forEach items="${agrRef}" var="agr">
	    <c:if test="${agr.category eq '합의'}">
	    <td>
	    <label>${agr.hqName}</label>
	    <label>${agr.departmentName}</label>
	    <label>${agr.rankName}</label>
	    <label>${agr.name}</label>
	    </td>
	    </c:if>
	    </c:forEach>
	</tr> --%>
	<tr>
	    <c:forEach items="${agrRef}" var="ref">
	    <c:if test="${ref.category eq '참조'}">
	    <th>참조자</th>
	    <td>
	    <label>${ref.hqName}</label>
	    <label>${ref.departmentName}</label>
	    <label>${ref.rankName}</label>
	    <label>${ref.name}</label>
	    </td>
	    </c:if>
	    </c:forEach>
	</tr>
	<tr>
		<th style="width: 82.25px; text-align: center;">제목</th>
			<td>${list.title}</td>
		</tr>
		<tr style="height:340px;">
			<td colspan="2">${list.content}</td>
	</tr>
</table>
</div>
</c:if>

<c:if test="${list.formTitle eq '휴가신청서'}">
<table id="attendanceDraftContent">
	<tr>
		<th>휴가 종류</th>
		<td colspan="2">${vac.category}</td>
	</tr>
	<c:if test="${hTitle eq 'waiting'}">
	<tr>
		<th>잔여 연차</th>
		<td style="background-color:#ededed;">${vac.remainingAnnualLeave}일</td>
	</tr>
	</c:if>
	<tr>
	    <th>사용 날짜</th>
	    <td><input type="date" name="start" id="startFac" class="form-control mb-2" value="${vac.vacationStartDate}" readonly><c:if test="${vac.category ne '반차'}">~<input type="date" name="end" id="endFac"  class="form-control mb-2" value="${vac.vacationEndDate}" readonly></c:if>
							  
	</tr>
	<tr>
		<th>총 사용일</th>
		<td>${vac.usageTime}일</td>
	</tr>
	<tr>
		<th>사유</th>
		<td colspan="2" style="height:300px;" >${vac.vacationReason}</td>
	</tr>
</table>
</c:if>

<c:if test="${list.formTitle eq '휴직원' or list.formTitle eq '복직원'}">
<table id="leaveDraftContent">
	<tr>
		<th>휴직 기간</th>
			<td><input type="date" class="form-control mb-2" name="startDate" value="${lv.leaveStartDate}" readonly><p>~</p><input type="date" name="endDate" class="form-control mb-2" value="${lv.leaveEndDate}" readonly></td>
		</tr>
	<tr>
		<th>사유</th>
		<td colspan="2">${lv.leaveReason}</td>
	</tr>
</table>
</c:if>
<br/>
<label>첨부파일 : 
<c:choose>
        <c:when test="${not empty fileList}">
            <c:forEach items="${fileList}" var="file">
                <a href="download.do?file=${file.serverFileName}">${file.oriFileName}<br/></a>
            </c:forEach>
        </c:when>
        <c:otherwise>
            없음
        </c:otherwise>
    </c:choose>
</label>
</div>
</div>
<div id="bottom">

<c:if test="${hTitle ne 'waiting'}">
<input type="button" class="btn btn-secondary" value="취소" style="display:none;" onclick="location.href='waitingList.go'"/>
</c:if>
<c:if test="${category eq '합의' && hTitle eq 'waiting'}">
	<input type="button" class="btn btn-secondary" value="취소" onclick="location.href='waitingList.go'"/>
    <input type="button" class="btn btn-primary" value="합의" data-toggle="modal" data-target="#opinionWrite"/>
    <input type="button" class="btn btn-primary" value="거부" data-toggle="modal" data-target="#opinionWrite"/>
</c:if>
<c:if test="${category ne '합의' && hTitle eq 'waiting'}">
	<input type="button" class="btn btn-secondary" value="취소" onclick="location.href='waitingList.go'"/>
    <input type="button" class="btn btn-primary" value="결재" data-toggle="modal" data-target="#opinionWrite"/>
    <input type="button" class="btn btn-primary" value="반려" data-toggle="modal" data-target="#opinionWrite"/>
</c:if>
</div>
<div id="rightContainer">
	<div class="card shadow" style="margin-left:10px;">
	<div style="padding: 10px 15px;"><span style="margin: 0px; font-size: 13px; width: 270px;">결재정보</span>
	<hr/>
		<table id="approvalLine">
			<tr>
				<th class="img-profile rounded-circle"></th>
				<td>상신</td>
				<td>${list.hqName}/${list.departmentName}</td>
				<td>${list.rankName}</td>
				<td>${list.name}</td>
			</tr>
			<c:forEach items="${lineList}" var="lL">
    <tr>
        <th class="img-profile rounded-circle"></th>
        <td>${lL.category}</td>
        <td>${lL.hqName}/${lL.departmentName}</td>
        <td>${lL.rankName}<input type='hidden' id='order' value=''></td>
        <td>${lL.name}<input type="hidden" name="employeeID" value="${lL.employeeID}"></td>
        <c:if test="${not empty lL.opinion and lL.opinion ne '-'}">
            <td>
                <c:choose>
                    <c:when test="${lL.approvalStatus == '거부' or lL.approvalStatus == '반려'}">
                        <input type="button" class="appOpinion" value="${lL.approvalStatus}" onclick="openOpinion('${lL.opinion}')" data-toggle="modal" data-target="#opinion">
                    </c:when>
                    <c:otherwise>
                        <input type="button" class="rejOpinion" value="${lL.approvalStatus}" onclick="openOpinion('${lL.opinion}')" data-toggle="modal" data-target="#opinion">
                    </c:otherwise>
                </c:choose>
            </td>
        </c:if>
    </tr>
</c:forEach>
		</table>
	</div>
	</div>
	</div>
</div>	

<%-- <c:import url="/footer"/>	 --%>
</body>
<script>

$('input[value="결재"]').click(function () {
    updateModalContent('approve');
    $('#approvalAction').val('결재');
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    $('#order').val($('#approvalLine tr:last').index()+1);
});

$('input[value="반려"]').click(function () {
    updateModalContent('reject');
    $('#approvalAction').val('반려'); 
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    $('#order').val($('#approvalLine tr:last').index()+1);
});

$('input[value="합의"]').click(function () {
    updateModalContent('agreement');
    $('#approvalAction').val('합의');
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    $('#order').val($('#approvalLine tr:last').index()+1);
});

$('input[value="거부"]').click(function () {
    updateModalContent('rejection');
    $('#approvalAction').val('거부'); 
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    $('#order').val($('#approvalLine tr:last').index()+1);
    
});

$('#summernote').summernote({
	height: 200, width: 700,
	maxHeight: 200,
	minHeight: 200,
	
});
$('#summernote').summernote('disable');


function openOpinion(opinion) {
    $('#opinionText').val(opinion);
}

function updateModalContent(action) {
    var modalTitle, modalButtonText;

    if (action === 'approve') {
        modalTitle = '결재하기';
        modalButtonText = '결재';
        // console.log($('input[name="empId"]').index());
    } else if (action === 'reject') {
        modalTitle = '반려하기';
        modalButtonText = '반려';
    } else if (action === 'agreement'){
    	modalTitle = '합의하기';
    	modalButtonText = '합의'
    } else if (action ==='rejection'){
    	modalTitle = '거부하기';
    	modalButtonText = '거부';
    }
    $('.modal-title').text(modalTitle);
    $('.modal-footer button[type="submit"]').text(modalButtonText);
    
}
$('.modal-footer button[type="submit"]').click(function () {
    var buttonText = $(this).text();
    
    var msg = "";
    switch (buttonText) {
        case '결재':
            msg = "결재하시겠습니까?";
            break;
        case '반려':
            msg = "반려하시겠습니까?";
            break;
        case '합의':
            msg = "합의하시겠습니까?";
            break;
        case '거부':
            msg = "거부하시겠습니까?";
            break;
        default:
            break;
    }

    if (msg) {
        var confirmed = confirm(msg);

        if (confirmed) {
            $('form').submit();
        }
    }
});
var loginId = $('input[name="loginId"]').val()
var idx = $('input[name="idx"]').val()
// console.log(loginId);
// console.log(idx); 

 $(function () {

     $.ajax({
         url: "drawSign",
         type: "GET",
         data:{'loginId':loginId, 'idx':idx},
         success: function (data) {
        	 var signList = data.signList;
        	 console.log(signList);
        	  if (signList.length > 0) {
                      var firstItem = signList[0];
                      approvalSignature(firstItem);
                  for (var i = 1; i < signList.length; i++) {
                	  var addItem = signList[i];
                      appSign(addItem);
                      // console.log(addItem.category);
                  }
        	  }
        	 var order = signList.approvalOrder;
             $('#order').val(order);
             
             
         },
         error: function (e) {
             console.log(e);
         }
     });
 });
 
 function approvalSignature(firstItem){
	 var signTable = $("#approvalSignature");
	console.log(firstItem.approvalStatus);
		var content=
	        "<table class='signApp'>"+
				"<tr>"+
			        "<td rowspan='3' style='width: 20px;  height:90px; background-color:#ededed;'>"+firstItem.category+"<input type='hidden' class='empID' value='" + firstItem.employeeID + "'></td>"+
			        "<td style='width: 80px; font-size:10px; padding : 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + firstItem.employeeID + "'>"+firstItem.positionName+"\u00A0"+firstItem.name+"</td>"+
			    "</tr>"+
			    "<tr>"+
			    "<td style='width: 80px; font-size:10px; vertical-align: bottom;'><input type='hidden' class='empID' value='" + firstItem.employeeID + "'>" +
		        (firstItem.approvalStatus != "대기" && firstItem.approvalStatus != "미대기" ?
		            "<img src='/photo/cocean/signature/${sign.serverFileName}' width='40' height='40' class='signatureImg'>" : "") +
		        "</td>"+
			    "</tr>"+
			    "<tr>" +
			    "<td style='width: 80px; font-size:8px; background-color:#ededed;" +
			    (firstItem.approvalStatus == "반려" || firstItem.approvalStatus == "거부" ? " color:red;'>" + (firstItem.approvalDate ? firstItem.approvalDate + " (거부)" : "") + "</td>" :
			    "'>" + (firstItem.approvalDate ? firstItem.approvalDate + " (반려)" : "") + "</td>") +
			    "</tr>"
			"</table>"
	
	signTable.append(content);
	
 }
 

/* function appSign(addItem) {
    var frLastTd = $('#approvalSignature tr:first td:last');
    var scLastTd = $('#approvalSignature tr:odd td:last');
    var lastTd = $('#approvalSignature td:last');

    $("<td rowspan='3' style='width: 20px; background-color:#ededed;'>"+addItem.category+"<input type='hidden' class='empID' value='" + addItem.employeeID + "'></td><td style='width: 38%; font-size:13px; padding: 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>"+addItem.positionName+"\u00A0"+addItem.name+"</td>").insertAfter(frLastTd);
    $("<td style='width: 38%; font-size:10px;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'><img src='/photo/cocean/signature/${sign.serverFileName}' width='40' height='40' class='signatureImg'></td>").insertAfter(scLastTd);
    $("<td style='width: 38%; background-color:#ededed;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>"+addItem.approvalDate+"</td>").insertAfter(lastTd);
}
 */

/* function approvalSignature(addItem){
	var agrTable = $('#agrSignature');
	if(addItem.category=="합의"){
		var content =
			  "<table class='agrSign'>"+
				"<tr>"+
			        "<td rowspan='3' style='width: 20px; background-color:#ededed;' >"+"합의"+"<input type='hidden' class='empID' value='" + addItem.employeeID + "'></td>"+
			        "<td style='width: 80px; font-size:13px; padding : 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>"+addItem.positionName+"\u00A0"+addItem.name+"</td>"+
			    "</tr>"+
			    "<tr>"+
			        "<td style='width: 80px; font-size:10px; vertical-align: bottom;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'></td>"+
			    "</tr>"+
			    "<tr>"+
			        "<td style='width: 80px; background-color:#ededed;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'></td>"+
			    "</tr>"+
			"</table>"
			agrTable.append(content);
	}
} */


function appSign(addItem) {
    var frLastTd = $('#approvalSignature tr:first td:last');
    var scLastTd = $('#approvalSignature tr:odd td:last');
    var lastTd = $('#approvalSignature td:last');

    $("<td rowspan='3' style='width: 20px; background-color:#ededed;'>" + addItem.category + "<input type='hidden' class='empID' value='" + addItem.employeeID + "'></td><td style='width: 80px; font-size:10px; padding: 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>" + addItem.positionName + "\u00A0" + addItem.name + "</td>").insertAfter(frLastTd);
    
    if (addItem.approvalStatus != "대기" && addItem.approvalStatus != "미대기") {
        $("<td style='width: 80px; font-size:10px;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'><img src='/photo/cocean/signature/${sign.serverFileName}' width='40' height='40' class='signatureImg'></td>").insertAfter(scLastTd);
    }
    
    if (addItem.approvalStatus == "반려" || addItem.approvalStatus == "거부") {
        $("<td style='width: 80px; background-color:#ededed; font-size:8px; color:red;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>" + addItem.approvalDate + " (" + addItem.approvalStatus + ")</td>").insertAfter(lastTd);
    } else if (addItem.approvalStatus == "결재" || addItem.approvalStatus == "합의") {
        $("<td style='width: 80px; background-color:#ededed; font-size:8px;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>" + addItem.approvalDate + "</td>").insertAfter(lastTd);
    }
}

 </script>

</html>