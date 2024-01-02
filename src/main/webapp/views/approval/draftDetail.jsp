<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value='/resource/richtexteditor/rte_theme_default.css'/>">
<!-- <link rel="stylesheet" href="<c:url value='/resource/richtexteditor/runtime/richtexteditor_content.css'/>"> -->
<!-- <link rel="stylesheet" href="<c:url value='/resource/css/approval/jquery.timepicker.css'/>"> -->
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
    height: 93%;
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
    height: 83%;
    top: 20%;
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

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/plugins/all_plugins.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/rte.js'/>"></script>
<!-- <script type="text/javascript" src="<c:url value='/resource/js/approval/jquery.timepicker.min.js'/>"></script> -->


<div id="container">
<div class="modal fade" id="opinion" tabindex="-1" role="dialog"
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
					<textarea name="opinion" class="form-control" oninput="this.setCustomValidity('')" maxlength="500" placeholder="500자까지 작성 가능" style="height: 180px;"></textarea>
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
		        <td style="width: 50%; font-size:10px;">${list.name}</td>
		    </tr>
		    <tr>
		        <td style="width: 50%;">${list.draftDate}</td>
		    </tr>
		</table>
	</div>



<br/>

<c:if test="${list.formTitle eq '업무기안서'}">
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
	    <th>참조자</th>
	    <c:forEach items="${agrRef}" var="ref">
	    <c:if test="${ref.category eq '참조'}">
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
			<td colspan="2" style="height:40%;">${list.content}</td>
	</tr>
</table>

</c:if>

<c:if test="${list.formTitle eq '휴가신청서'}">
<table id="attendanceDraftContent">
	<tr>
		<th>휴가 종류</th>
		<td colspan="2">${vac.category}</td>
	</tr>
	<tr>
		<th>잔여 연차</th>
		<td></td>
	</tr>
	<tr>
	    <th>사용 날짜</th>
	    <td> <div class="dateSelect"><input type="date" name="start" id="startFac" class="form-control mb-2" value="${vac.vacationStartDate}" readonly>
							    <select class="timeSelect" name="startTime" readonly>
									  <option value="00:00">00:00</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
									</select>
							    
							    <p>&nbsp;~&nbsp;</p>
							    <input type="date" name="end" id="endFac"  class="form-control mb-2" value="${vac.vacationEndDate}">
							    <select class="timeSelect" name="endTime">
									<option value="00:00">00:00</option><option value="09:00">09:00</option><option value="09:30">09:30</option><option value="10:00">10:00</option><option value="10:30">10:30</option><option value="11:00">11:00</option><option value="11:30">11:30</option><option value="12:00">12:00</option><option value="12:30">12:30</option><option value="13:00">13:00</option> <option value="13:30">13:30</option><option value="14:00">14:00</option><option value="14:30">14:30</option><option value="15:00">15:00</option><option value="15:30">15:30</option><option value="16:00">16:00</option> <option value="17:00">17:00</option><option value="17:30">17:30</option><option value="18:00">18:00</option>
								</select></div></td>
	</tr>
	<tr>
		<th>총 사용일</th>
		<td>${vac.usageTime}</td>
	</tr>
	<tr>
		<th>사유</th>
		<td colspan="2"><textarea  name="content" id="textarea" placeholder="*필수입력" readonly>${vac.vacationReason}</textarea></td>
	</tr>
</table>
</c:if>

<c:if test="${list.formTitle eq '휴직원' or list.formTitle eq '복직원'}">
<table id="leaveDraftContent">
	<tr>
		<th>휴직 기간</th>
			<td>${lv.leaveStartDate}<p>~</p>${lv.leaveEndDate}</td>
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
<input type="button" value="취소" onclick="location.href='waitingList.go'"/>
<input type="button" value="반려" data-toggle="modal" data-target="#opinion"/>
<input type="button" value="결재" data-toggle="modal" data-target="#opinion"/>
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
				
			</tr>	
			<tr>
			<td></td>
			<td colspan=3><c:if test="${lL.opinion ne '-'}"><input type="text" readonly class="form-control" value="${lL.opinion}" style="height:18px;"></c:if></td>
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
   
    
});

/* var myLine = $("#approvalLine").find('input[name="employeeID"]').filter(function() {
    return $(this).val() === loginId;
});
myLine.css('background-color', '#86B0F3'); */

function updateModalContent(action) {
    var modalTitle, modalButtonText;

    if (action === 'approve') {
        modalTitle = '결재하기';
        modalButtonText = '결재';
        console.log($('input[name="empId"]').index());
    } else if (action === 'reject') {
        modalTitle = '반려하기';
        modalButtonText = '반려';
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
	}else{
		var msg = "반려하시겠습니까?";
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

var order;
 $(document).ready(function () {
     $.ajax({
         url: "drawSign",
         type: "GET",
         data:{'loginId':loginId, 'idx':idx},
         success: function (data) {
        	 var signList = data.signList;
        	 signList.forEach(function(item,idx){
        		 approvalSignature(item);
        	 });
        	 var order = data.order.approvalOrder;
        	 $('#order').val(order);
             
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
    
    $("<td rowspan='3' style='width: 20px;'>결재<input type='hidden' class='empID' value='" + item.employeeID + "'></td><td style='width: 38%; font-size:13px; padding: 0;'><input type='hidden' class='empID' value='" + item.employeeID + "'>" +item.rankName+ "</td>").insertAfter(frLastTd);
    $("<td style='width: 38%; font-size:10px;'><input type='hidden' class='empID' value='" +item.employeeID + "'>" +item.name + "</td>").insertAfter(scLastTd);
    $("<td style='width: 38%;'><input type='hidden' name='order' class='approvalOrder' value='" + item.approvalOrder + "'><input type='hidden'>"+item.approvalDate+"</td>").insertAfter(lastTd);
}

 </script>
</body>
</html>