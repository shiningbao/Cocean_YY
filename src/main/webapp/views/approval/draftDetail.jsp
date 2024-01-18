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
    width: 50%;
    font-size: 30px;

}

#contentLine{
	margin: 14px;
    padding: 4% 2% 2% 2%;
    border: 5px solid #e8e8e8;
    width: 73%;
    height: 137%;
}

#formTitle{
  text-align: center;
  font-size: 41px;
  font-family:Dotum;
}

#bottom{
 width:74%;
}

#rightContainer{
	flex-direction: column;
    width: 22%;
    float:right;
    margin: 5% 2%;
}
/* 
#contentContainer{
	position: absolute;
    width: 94%;
    height: 70%;
    top: 16%;
}
 */
 
 #approvalLine{
	border-spacing : 10px 10px;
	width: 100%;
	
}
 
#approvalLine, #approvalLine th, #approvalLine td {
  border: none;
  padding : 0px;
}

#approvalLine td{
	padding : 3px;
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
    
    .appStatus{
    text-decoration: underline;
    text-decoration-thickness: 3px;
    text-decoration-color: #4480e9;
    }
    
     #detailInfo tr, #detailInfo th, #detailInfo td{
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
    
    .box{
	   	background-color: #cfdff0;
	    border: 1px solid #9fc2e8;
	    display: inline-block;
	    padding-left: 5px;
	    padding-right: 5px;
	    text-align: center;
	    border-radius: 11px;
	    letter-spacing: 0px;
	    height: 21px;
	    vertical-align: middle;
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
	                <button type="button" class="btn btn-primary"></button>
	              </div>
	                <input type="hidden" value="${loginId}" name="loginId">
					<input type="hidden" value="${list.idx}" name="idx">
					<input type="hidden" id="approvalAction" name="action" value="">
					<input type="hidden" id="lastOrder" name="lastOrder" value="">
					<input type="hidden" id="order" name="approvalOrder" value="">
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
	
	<div id="rightContainer">
	<div class="card shadow" style="width: 354px;padding: 3%;">
	<div style="padding: 10px 12px;"><span class="approvalInfo" style="margin: 0px; font-size: 17px; width: 270px; font-weight : normal;">결재정보</span>
	<hr/>
		<table id="approvalLine" style="font-size:14px;">
			<tr style="text-align: center;">
				<th style="background-color:white;"><img src='/photo/cocean/profile/${list.serverFileName}' class="img-profile rounded-circle" style="width:40px; height:40px"></th>
				<td style="width: 15%;"><span class="appStatus" style="font-weight : bold;">상신</span></td>
				<td style="width: 40%; font-size:12px;">${list.hqName}/${list.departmentName}</td>
				<td style="width: 20%;">${list.positionName}</td>
				<td style="width: 20%;">${list.name}</td>
			</tr>
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
        <td style="width: 15%;"><span class="appStatus" style="font-weight : bold;">${lL.category}</span></td>
        <td style="width: 40%; font-size:12px;">${lL.hqName}/${lL.departmentName}</td>
        <td style="width: 20%;">${lL.positionName}<input type='hidden' id='order' value=''></td>
        <td style="width: 20%;">${lL.name}<input type="hidden" name="employeeID" value="${lL.employeeID}"></td>
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
	
<div class="d-sm-flex align-items-center justify-content-between mb-4">
	<div class="topTitle">
	<h1 class="h3 mb-0 text-gray-800">결재</h1>
	</div>
</div>
<div id="contentLine">
<div id="contentContainer">
<div id="formTitle">${list.formTitle}</div>
<br/>
<div id="detailInfoTop" style="display: flex;">
	<table id="detailInfo">
		<tr>
		    <th>상신자</th>
		    <td>${list.name}</td>
		     <td rowspan="3" class="di-td-1"><img src="/photo/cocean/signature/${sign.serverFileName}" width="60px;" height="60px;" class="signatureImg"></td>
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
	<div id="approvalSignature"><!-- 결재 서명 그려지는부분 --></div>
</div>



<br/>

<c:if test="${list.formTitle eq '업무기안서'}">
<div id="workDraft">
<table id="workDraftContent">
    <tr>
        <th style="text-align:center;">참조자</th>
        
        <td>
            <c:forEach items="${agrRef}" var="ref">
                <c:if test="${ref.category eq '참조'}">
                <span class="box">
                    <label>${ref.hqName}</label>
                    <label>${ref.departmentName}</label>
                    <label>${ref.positionName}</label>
                    <label>${ref.name}</label>
                </span>
                </c:if>
            </c:forEach>
        </td>
    </tr>
    <tr>
        <th style="width: 82.25px; text-align: center;">제목</th>
        <td>${list.title}</td>
    </tr>
    <tr style="height:340px;">
        <th style="width: 82.25px; text-align: center;">내용</th>
        <td>${list.content}</td>
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
	    <td><input type="date" name="start" id="startFac" class="form-control mb-2" style="margin-top: 10px; text-align: center;" value="${vac.vacationStartDate}" readonly><c:if test="${vac.category ne '오전반차' and vac.category ne '오후반차'}">~<input type="date" name="end" id="endFac"  class="form-control mb-2" style="margin-left: 10px; text-align: center;" value="${vac.vacationEndDate}" readonly></c:if>
							  
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
    <input type="button" class="btn btn-primary"  style="float:right;" value="합의" data-toggle="modal" data-target="#opinionWrite"/>
    <input type="button" class="btn btn-primary"  style="float:right; margin-right:10px;" value="거부" data-toggle="modal" data-target="#opinionWrite"/>
</c:if>
<c:if test="${category ne '합의' && hTitle eq 'waiting'}">
	<input type="button" class="btn btn-secondary" value="취소" onclick="location.href='waitingList.go'"/>
    <input type="button" class="btn btn-primary"  style="float:right;" value="결재" data-toggle="modal" data-target="#opinionWrite"/>
    <input type="button" class="btn btn-primary"  style="float:right; margin-right:10px;" value="반려" data-toggle="modal" data-target="#opinionWrite"/>
</c:if>
</div>


</div>	

<c:import url="/footer"/>
</body>
<script>

$('input[value="결재"]').click(function () {
    updateModalContent('approve');
    $('#approvalAction').val('결재');
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    // $('#order').val($('#approvalLine tr:last').index()+1);
});

$('input[value="반려"]').click(function () {
    updateModalContent('reject');
    $('#approvalAction').val('반려'); 
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    // $('#order').val($('#approvalLine tr:last').index()+1);
});

$('input[value="합의"]').click(function () {
    updateModalContent('agreement');
    $('#approvalAction').val('합의');
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    // $('#order').val($('#approvalLine tr:last').index()+1);
    console.log("합의");
});

$('input[value="거부"]').click(function () {
    updateModalContent('rejection');
    $('#approvalAction').val('거부'); 
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    // $('#order').val($('#approvalLine tr:last').index()+1);
    
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
    $('.modal-footer button[class="btn btn-primary"]').text(modalButtonText);
    
}

$('.modal-footer button[class="btn btn-primary"]').click(function () {
    var buttonText = $(this).text();
    console.log(buttonText);
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
        swal({
            title: msg,
            icon: "info",
            buttons: ["취소", "확인"]
        })
         .then((isOkey) => {
            if (isOkey) {           	
            		$('form').submit();      
            }
            else {
                event.preventDefault();
            }
        }); 
    }
 
});

var loginId = $('input[name="loginId"]').val()
var idx = $('input[name="idx"]').val()
 var hTitle = "${hTitle}";
// console.log(loginId);
// console.log(idx); 

 $(function () {

     $.ajax({
         url: "drawSign",
         type: "GET",
         data:{'loginId':loginId, 'idx':idx},
         success: function (data) {
        	 var signList = data.signList;
        	  if (signList.length > 0) {
                      var firstItem = signList[0];
                      approvalSignature(firstItem);
                  for (var i = 1; i < signList.length; i++) {
                	  var addItem = signList[i];
                      appSign(addItem);
                      // console.log(addItem.category);
                  }
        	  }
        	  if(hTitle=='waiting'){
        	  var order = data.order.approvalOrder;
        	  console.log(order);
        	  $('#order').val(order);
        	  }
         },
         error: function (e) {
             console.log(e);
         }
     });
 });
 
 function approvalSignature(firstItem){
	 var signTable = $("#approvalSignature");
	console.log(firstItem.approvalDate);
	var content =
	    "<table class='signApp'>" +
	    "<tr>" +
	    "<td rowspan='3' style='width: 20px; height:90px; background-color:#ededed; font-weight:bold;'>" + firstItem.category + "<input type='hidden' class='empID' value='" + firstItem.employeeID + "'></td>" +
	    "<td style='width: 80px; font-size:10px; padding : 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + firstItem.employeeID + "'>" + firstItem.positionName + "\u00A0" + firstItem.name + "</td>" +
	    "</tr>" +
	    "<tr>" +
	    "<td style='width: 80px; font-size:10px; height: 70px;'><input type='hidden' class='empID' value='" + firstItem.employeeID + "'>" +
	    (firstItem.approvalStatus !== "대기" && firstItem.approvalStatus !== "미대기" && firstItem.approvalStatus !== "대기취소"?
	    	"<img src='/photo/cocean/signature/" + firstItem.serverFileName + "' width='40' height='40' class='signatureImg'>" : "") +
	    "</td>" +
	    "</tr>";

	if (firstItem.approvalDate !== null) {
	    content +=
	    	"<tr>" +
	    	"<td style='width: 80px; font-size:8px; background-color:#ededed;" +
	    	(firstItem.approvalStatus == "반려" ? " color:red;'>" + (firstItem.approvalDate ? firstItem.approvalDate + " (반려)" : "") + "</td>" :
	    	(firstItem.approvalStatus == "거부" ? " color:red;'>" + (firstItem.approvalDate ? firstItem.approvalDate + " (거부)" : "") + "</td>" :
	    	(firstItem.approvalStatus == "결재" ? " color:black;'>" + (firstItem.approvalDate ? firstItem.approvalDate + " (결재)" : "") + "</td>" :
	    	(firstItem.approvalStatus == "합의" ? " color:black;'>" + (firstItem.approvalDate ? firstItem.approvalDate + " (합의)" : "") + "</td>" :
	    	"'>" + (firstItem.approvalDate ? firstItem.approvalDate : "") + "</td>")))) +
	    	"</tr>";
	}

	content += "</table>";

	
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

    $("<td rowspan='3' style='width: 20px; background-color:#ededed; font-weight:bold;'>" + addItem.category + "<input type='hidden' class='empID' value='" + addItem.employeeID + "'></td><td style='width: 80px; font-size:10px; padding: 0; background-color:#ededed;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>" + addItem.positionName + "\u00A0" + addItem.name + "</td>").insertAfter(frLastTd);
    
    if (addItem.approvalStatus != "대기" && addItem.approvalStatus != "미대기" && addItem.approvalStatus != "대기취소") {
        $("<td style='width: 80px; font-size:10px; '><input type='hidden' class='empID' value='" + addItem.employeeID + "'><img src='/photo/cocean/signature/" + addItem.serverFileName + "' width='40' height='40' class='signatureImg'></td>").insertAfter(scLastTd);
    }
    
    if (addItem.approvalStatus == "반려") {
        $("<td style='width: 80px; background-color:#ededed; font-size:8px; color:red;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>" + addItem.approvalDate + " (반려)</td>").insertAfter(lastTd);
    } else if (addItem.approvalStatus == "결재") {
        $("<td style='width: 80px; background-color:#ededed; font-size:8px;'><input type='hidden' class='empID' value='" + addItem.employeeID + "' >" + addItem.approvalDate + " (결재)</td>").insertAfter(lastTd);
    } else if (addItem.approvalStatus == "거부") {
        $("<td style='width: 80px; background-color:#ededed; font-size:8px; color:red;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>" + addItem.approvalDate + " (거부)</td>").insertAfter(lastTd);
    } else if (addItem.approvalStatus == "합의") {
        $("<td style='width: 80px; background-color:#ededed; font-size:8px;'><input type='hidden' class='empID' value='" + addItem.employeeID + "'>" + addItem.approvalDate + " (합의)</td>").insertAfter(lastTd);
    }
}

 </script>

</html>