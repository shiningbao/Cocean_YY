<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resource/richtexteditor/rte_theme_default.css'/>">
<link href='<c:url value="/resource/css/approval/jquery.timepicker.min.css"/>' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script type="text/javascript" src="<c:url value='/resource/richtexteditor/rte.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/plugins/all_plugins.js'/>"></script>
<script src='<c:url value="/resource/js/approval/jquery.timepicker.min.js"/>'></script>
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


#draftInfoTop{
	width : 840.8px;
}

#approvalLine{
	font-size : 10px;
}
#approvalLine, #approvalLine th, #approvalLine td {
  border: none;
}

</style>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>	

<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">조직도</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="">
						<!-- 입력폼 -->
						<div class="form-group">
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:forEach items="${draftInfo}" var="draft">
<div id="container" style="display: flex;">
<div id="draftInfoTop" style="display: flex;">
		<table id="draftInfo">
			<tr>
			    <th>상신자</th>
			    <td>${draft.name}</td>
			</tr>
			<tr>
			    <th>소속부서</th>
			    <td>${draft.departmentName}</td>
			</tr>
			<tr>
			    <th>상신일</th>
			    <td>${draft.workDate}</td>
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
	

<div style="padding: 0px 30px; "><h6 style="margin:0px; display: flex; padding:10px 0px 0px 0px; font-size:13px;">결재라인<input type="text" name="employeeSearch" placeholder="이름/부서/직급" style="width:70%; font-size:12px; margin:0px 0px 0px 13px;" onclick="openModal()"></h6>
<hr/>
<table id="approvalLine">
		<tr>
			<th>1</th>
			<td>상신</td>
			<td>${draft.departmentName}</td>
			<td>${draft.rankName}</td>
			<td>${draft.name}</td>
			</tr>
	</table>
	</div>
</div>	
	
</c:forEach>



<br/>
<form action="writeDraft.do" method="post" enctype="multipart/form-data">
<c:if test="${title eq '업무기안서'}">
<table id="workDraftContent">
	<tr>
		<th>제목</th>
			<td><input type="text" name="title" placeholder="*제목을 입력해주세요."></td>
		</tr>
		<tr>
		    <th>합의</th>
		    <td></td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="rich_editor"></div>
			<!-- 작성글은 div 에 담겨지는데, div는 서버로 전송이 불가능 -->
			<input type="hidden" name="content" value=""/>
		</td>
	</tr>
</table>
</c:if>

<c:if test="${title eq '휴가신청서'}">
<table id="attendanceDraftContent">
	<tr>
		<th>휴가 종류</th>
			<td colspan="3"><select id="vacationCategory" name="vacationCategory">
					  <option value="연차" selected="selected">연차</option>
					  <option value="반차">반차</option>
					  <option value="조퇴">조퇴</option>
					  <option value="지각">지각</option>
					  <option value="병가">병가</option>
					  <option value="경조사">경조사</option>
					</select>
			</td>
		</tr>
	<tr>
	    <th>사용 시간</th>
	    <td colspan="2"><input type="date" name="startDate">~<input type="date" name="endDate"></td>
	    <td>사용 시간</td>
	</tr>
	<tr>
		<th>사유</th>
		<td colspan="3">
			<div id="rich_editor"></div>
			<!-- 작성글은 div 에 담겨지는데, div는 서버로 전송이 불가능 -->
			<input type="hidden" name="content" value=""/>
		</td>
	</tr>
</table>
</c:if>







<br/>
<input type="file" name="files" multiple="multiple"/>
<br/>
<input type="radio" name="publicStatus" value=0 checked/>공개
<input type="radio" name="publicStatus" value=1 />비공개
<div style="font-size:12px; color:gray;">
*공개 설정시 모든 임직원이 열람 가능합니다.
<br/>
*비공개 설정시 결재라인에 있는 사람만 열람 가능합니다.
</div>
<br/>
<input type="hidden" name="tempSave" value="0"/>
<input type="button" value="임시저장" onclick="save(true)"/>
<input type="button" value="등록" onclick="save(false)"/>
<input type="button" value="취소"/>
</form>
</body>
<script>
	function openModal() {
	    $('#modal').modal('show');
	}
	var config = {}
	config.editorResizeMode = "none";
	var editor = new RichTextEditor("#rich_editor", config);

	function save(isTemp){
		var content = editor.getHTMLCode(); // <div id="rich_editor"></div> 이 태그와 태그 사이에 html 내용을 content에 담는다.
		$('input[name="content"]').val(content);
		 if (isTemp) {
		        $('input[name="tempSave"]').val(1);
		    } else {
		        $('input[name="tempSave"]').val(0);
		    }
		console.log(content.length/1024/1024+'MB');
		if(content.length > (2*1024*1024)){
		 alert('컨텐츠의 크기가 너무 큽니다. 이미지의 갯수나 크기를 줄여주세요!');
		}else{
		 $('form').submit();
		} 
	 }
	
</script>
</html>