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


</style>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>	

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/plugins/all_plugins.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/rte.js'/>"></script>
<!-- <script type="text/javascript" src="<c:url value='/resource/js/approval/jquery.timepicker.min.js'/>"></script> -->


<div id="container">
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
	
	<tr>
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
	</tr>
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

<%-- <c:if test="${title eq '휴가신청서'}">
<table id="attendanceDraftContent">
	<tr>
		<th>휴가 종류</th>
			<td colspan="2"><select id="vacationCategory" name="vacationCategory">
					  <option value="연차" selected="selected">연차</option>
					  <option value="반차">반차</option>
					  <option value="조퇴">조퇴</option>
					  <option value="지각">지각</option>
					  <option value="병가">병가</option>
					  <option value="공가">공가</option>
					  <option value="경조사">경조사</option>
					</select>
			</td>
		</tr>
	<tr>
	    <th>사용 날짜</th>
	    <td><input type="date" name="startDate">~<input type="date" name="endDate"></td>
	</tr>
	<tr>
		<th>사용 시간</th>
		<td><input type="text"></td>
	</tr>
	<tr>
		<th>사유</th>
		<td colspan="2"><textarea  name="content" id="textarea" placeholder="*필수입력"></textarea></td>
	</tr>
</table>
</c:if>

<c:if test="${title eq '휴직원' or title eq '복직원'}">
<table id="leaveDraftContent">
	<tr>
		<th>휴직 기간</th>
			<td><input type="date" name="startDate">~<input type="date" name="endDate"></td>
		</tr>
	<tr>
		<th>사유</th>
		<td colspan="2"><textarea  name="content" id="textarea" placeholder="*필수입력"></textarea></td>
	</tr>
</table>
</c:if> --%>
<br/>
<label>첨부파일 : <c:forEach items="${fileList}" var="file"><a href="download.do?file=${file.serverFileName}">${file.oriFileName}</a></c:forEach></label>
</div>
</div>
<div id="bottom">
<input type="button" value="결재" onclick="save(true)"/>
<input type="button" value="반려" onclick="save(false)"/>
<input type="button" value="취소"/>
</div>
<div id="rightContainer">
	<div style="padding: 0px 30px;"><span style="margin: 0px; font-size: 13px; width: 270px;">결재라인</span>
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
				<td>결재</td>
				<td>${lL.hqName}/${lL.departmentName}</td>
				<td>${lL.rankName}</td>
				<td>${lL.name}</td>
			</tr>	
			</c:forEach>
		</table>
	</div>
	</div>
</div>	
<input type="hidden" value="${loginId}" name="loginId">
<input type="hidden" value="${list.idx}" name="idx">






<script>
var loginId = $('input[name="loginId"]').val()
var idx = $('input[name="idx"]').val()
console.log(loginId);
console.log(idx); 

 
 
 $(document).ready(function () {
     $.ajax({
         url: "drawSign",
         type: "GET",
         data:{'loginId':loginId,'idx':idx},
         success: function (data) {
        	 var signList = data.signList;
        	 signList.forEach(function(item,idx){
        		 approvalSignature(item);
        	 });
             
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
    $("<td style='width: 38%;'><input type='hidden' class='empID' value='" + item.employeeID + "'><input type='hidden'></td>").insertAfter(lastTd);
}
 </script>
</body>
</html>