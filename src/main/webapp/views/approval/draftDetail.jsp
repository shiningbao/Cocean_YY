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

#approvalSignature{
	margin-left : 20px;
}

#approvalSignature td{
	text-align: center;
}

#workDraftContent{
	width : 50%;
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



</style>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>	

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/plugins/all_plugins.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/rte.js'/>"></script>
<!-- <script type="text/javascript" src="<c:url value='/resource/js/approval/jquery.timepicker.min.js'/>"></script> -->

<c:forEach items="${list}" var="list">
<div id="container">
<div id="detailInfo" style="display: flex;">
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
		        <td rowspan="3" style="width: 20px; ">상신</td>
		        <td style="width: 80px; font-size:13px; padding : 0;">${draft.rankName}</td>
		    </tr>
		    <tr>
		        <td style="width: 80px; font-size:10px; vertical-align: bottom;">${draft.name}</td>
		    </tr>
		    <tr>
		        <td style="width: 80px;"></td>
		    </tr>
		</table>
	</div>
</div>	


<br/>

<%-- <c:if test="${title eq '업무기안서'}"> --%>
<table id="workDraftContent">
	<tr>
		<th>제목</th>
			<td>${list.title}</td>
		</tr>
		<tr>
			<td colspan="2">${list.content}</td>
	</tr>
</table>
</c:forEach>
<%-- </c:if> --%>

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
<input type="button" value="결재" onclick="save(true)"/>
<input type="button" value="반려" onclick="save(false)"/>
<input type="button" value="취소"/>









<script>


</script>
</body>
</html>