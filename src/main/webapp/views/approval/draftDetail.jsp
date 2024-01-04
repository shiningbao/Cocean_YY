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

button{
	margin : 5px 0;
}

#approvalLine{
	font-size : 10px;
	
}

#approvalLine, #approvalLine th, #approvalLine td {
  border: none;
}

#approvalSignature{
	margin-left : 20px;
	width : 44%;
}

#approvalSignature td{
	text-align: center;
}

#workDraftContent{
	width : 99%;
}

#attendanceDraftContent{
	width : 50%;
}

#leaveDraftContent{
	width : 50%;
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

</style>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>	

<div id="container">
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
<div class="topTitle">
<h2>결재</h2>
</div>
<div id="contentLine">
<div id="contentContainer">
<div id="formTitle">${list.formTitle}</div>
<div id="detailInfoTop" style="display: flex;">
		<table id="detailInfo">
			<tr>
			    <th>상신자</th>
			    <td>${list.name}</td>
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
		
		<table id="approvalSignature">
			 <tr>
		        <td rowspan="3" style="width: 10%; ">상신</td>
		        <td style="width: 50%; font-size:13px; padding : 0;">${list.rankName}</td>
		    </tr>
		    <tr>
		        <td style="width: 50%; font-size:10px;"> <img src="/photo/cocean/signature/${sign.serverFileName}" width="40" height="40" class="signatureImg">${list.name}</td>
		    </tr>
		    <tr>
		        <td style="width: 50%;">${list.draftDate}</td>
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
		<th>제목</th>
			<td>${list.title}</td>
		</tr>
		<tr>
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
	<tr>
		<th>잔여 연차</th>
		<td>${vac.remainingAnnualLeave}</td>
	</tr>
	<tr>
	    <th>사용 날짜</th>
	    <td><input type="date" name="start" id="startFac" class="form-control mb-2" value="${vac.vacationStartDate}" readonly>~<input type="date" name="end" id="endFac"  class="form-control mb-2" value="${vac.vacationEndDate}" readonly>
							  
	</tr>
	<tr>
		<th>총 사용일</th>
		<td>${vac.usageTime}</td>
	</tr>
	<tr>
		<th>사유</th>
		<td colspan="2">${vac.vacationReason}</td>
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
<input type="button" value="취소" style="display:none;" onclick="location.href='waitingList.go'"/>
</c:if>
<c:if test="${category eq '합의' && hTitle eq 'waiting'}">
	<input type="button" value="취소" onclick="location.href='waitingList.go'"/>
    <input type="button" value="합의" data-toggle="modal" data-target="#opinionWrite"/>
    <input type="button" value="거부" data-toggle="modal" data-target="#opinionWrite"/>
</c:if>
<c:if test="${category ne '합의' && hTitle eq 'waiting'}">
	<input type="button" value="취소" onclick="location.href='waitingList.go'"/>
    <input type="button" value="결재" data-toggle="modal" data-target="#opinionWrite"/>
    <input type="button" value="반려" data-toggle="modal" data-target="#opinionWrite"/>
</c:if>
</div>
<div id="rightContainer">
	<div style="padding: 0px 30px;"><span style="margin: 0px; font-size: 13px; width: 270px;">결재정보</span>
	<hr/>
		<table id="approvalLine">
			<tr>
				<td>상신</td>
				<td>${list.hqName}/${list.departmentName}</td>
				<td>${list.rankName}</td>
				<td>${list.name}</td>
			</tr>
			<c:forEach items="${lineList}" var="lL">
			<tr>
				<td>${lL.category}</td>
				<td>${lL.hqName}/${lL.departmentName}</td>
				<td>${lL.rankName}</td>
				<td>${lL.name}<input type="hidden" name="employeeID" value="${lL.employeeID}"></td>
				<c:if test="${not empty lL.opinion and lL.opinion ne '-'}">
    			<td><input type="button" value="의견" onclick="openOpinion('${lL.opinion}')" data-toggle="modal" data-target="#opinion"/></td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
	</div>
	</div>
</div>	







<script>

$('input[value="결재"]').click(function () {
    updateModalContent('approve');
    $('#approvalAction').val('결재');
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
});

$('input[value="반려"]').click(function () {
    updateModalContent('reject');
    $('#approvalAction').val('반려'); 
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    
});

$('input[value="합의"]').click(function () {
    updateModalContent('agreement');
    $('#approvalAction').val('합의');
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
});

$('input[value="거부"]').click(function () {
    updateModalContent('rejection');
    $('#approvalAction').val('거부'); 
    $('#lastOrder').val($('#approvalLine tr:last').index()+1);
    
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

$('.modal-footer button[type="submit"]').click(function(){
	if($('.modal-footer button[type="submit"]').text()=='결재'){
		var msg = "결재하시겠습니까?";
		    if (window.confirm(msg)) {
		        $('form').submit();
		    } else {
		    	return;
	    }
	}else if($('.modal-footer button[type="submit"]').text()=='반려'){
		var msg = "반려하시겠습니까?";
		    if (window.confirm(msg)) {
		        $('form').submit();
		    } else {
		    	return;
	    }
	}else if($('.modal-footer button[type="submit"]').text()=='합의'){
		var msg = "합의하시겠습니까?";
	    if (window.confirm(msg)) {
	        $('form').submit();
	    } else {
	    	return;
    }
	}else if($('.modal-footer button[type="submit"]').text()=='거부'){
		var msg = "거부하시겠습니까?";
	    if (window.confirm(msg)) {
	        $('form').submit();
	    } else {
	    	return;
    }
	}
});

var loginId = $('input[name="loginId"]').val()
var idx = $('input[name="idx"]').val()
// console.log(loginId);
// console.log(idx); 

 $(function () {
	var order;
     $.ajax({
         url: "drawSign",
         type: "GET",
         data:{'loginId':loginId, 'idx':idx},
         success: function (data) {
        	 var signList = data.signList;
        	 signList.forEach(function(item,idx){
        		 approvalSignature(item);
        	 });
        	 var approvalOrder = data.order.approvalOrder;
             $('#order').val(approvalOrder);
             
             console.log(approvalOrder);
             
         },
         error: function (e) {
             console.log(e);
         }
     });
 });
 
function approvalSignature(item){
	
	var frLastTd=$('#approvalSignature tr:first td:last');
    var scLastTd=$('#approvalSignature tr:odd td:last');
    var lastTd=$('#approvalSignature td:last');
    if (item.rankName=='-') {
    	 $("<td rowspan='3' style='width: 20px;'>결재<input type='hidden' class='empID' value='" + item.employeeID + "'></td><td style='width: 38%; font-size:13px; padding: 0;'><input type='hidden' class='empID' value='" + item.employeeID + "'></td>").insertAfter(frLastTd);
    }else{
    	 $("<td rowspan='3' style='width: 20px;'>결재<input type='hidden' class='empID' value='" + item.employeeID + "'></td><td style='width: 38%; font-size:13px; padding: 0;'><input type='hidden' class='empID' value='" + item.employeeID + "'>" + item.rankName + "</td>").insertAfter(frLastTd);
    }
   
    if (item.approvalStatus !== "대기" && item.approvalStatus !== "미대기") {
    	if(item.approvalStatus == "결재" || item.approvalStatus == "합의"){
	    $("<td style='width: 38%; font-size:10px;'><input type='hidden' class='empID' value='" +item.employeeID + "'><img src='/photo/cocean/signature/${sign.serverFileName}' width='40' height='40' class='signatureImg'>" +item.name + "</td>").insertAfter(scLastTd);
        $("<td style='width: 38%;'><input type='hidden' name='order' class='approvalOrder' value='" + item.approvalOrder + "'><input type='hidden'>" + item.approvalDate + "</td>").insertAfter(lastTd);
    	}else if(item.approvalStatus =="반려" || item.approvalStatus =="거부"){
    		$("<td style='width: 38%; font-size:10px;'><input type='hidden' class='empID' value='" + item.employeeID + "'>" + item.name + "</td>").insertAfter(scLastTd);
    	        $("<td style='width: 38%; color:red;'><input type='hidden' name='order' class='approvalOrder' value='" + item.approvalOrder + "'><input type='hidden'>" + item.approvalDate + "</td>").insertAfter(lastTd);
    	}
    }
}

 </script>
</body>
</html>