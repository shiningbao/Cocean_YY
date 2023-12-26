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

#draftInfoTop{
	width : 840.8px;
}

#approvalLine{
	font-size : 10px;
}

#approvalLine, #approvalLine th, #approvalLine td {
  border: none;
}

#textarea{
	width : 100%;
	height: 200px;
	resize: none;
}

#reference, #reference th, #reference td {
  border: none;
}

#reference{
	font-size : 10px;
}
.dropdown-content {
    display: none;
    width: 290px;
    height: 300px;
    font-size: 15px;
    background-color: white;
    position: absolute;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    overflow-y: auto;
}

.modal-content{
	width:135%;
	height:100%;
	overflow-y: auto;
}

.show {
	display:block;

}

</style>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>	

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/plugins/all_plugins.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/rte.js'/>"></script>
<!-- <script type="text/javascript" src="<c:url value='/resource/js/approval/jquery.timepicker.min.js'/>"></script> -->

<div class="modal fade" id="lineModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">라인설정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<jsp:include page="../approval/organization.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>

	<c:forEach items="${draftInfo}" var="draft">
<div id="container">
<div id="draftInfoTop" style="display: flex;">
		<table id="draftInfo">
			<tr>
			    <th>상신자</th>
			    <td>${draft.name}</td>
			</tr>
			<tr>
			    <th>소속부서</th>
			    <td>${draft.hqName}/${draft.departmentName}</td>
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
</div>	
	<div style="display: flex; flex-direction: column; width: 22%; float: right;">
	<div style="padding: 0px 30px;"><span style="margin: 0px; font-size: 13px; width: 270px;">결재라인</span>
    <a href="#" class="addApprovalLine" data-toggle="modal" data-target="#lineModal" style="margin-left: auto; font-size: 30px; cursor: pointer; font-weight: bold; position: absolute; top: 157px; right:35px;">+</a>
	<div id="myDropdown" class="dropdown-content">

  	</div>
	<hr/>
		<table id="approvalLine">
			<tr>
				<th>1</th>
				<td>상신</td>
				<td>${draft.hqName}/${draft.departmentName}</td>
				<td>${draft.rankName}</td>
				<td>${draft.name}</td>
			</tr>
		</table>
	</div>
	<div style="padding: 50px 30px; "><span style="margin:0px; font-size:13px; width:56px;">참조자</span>
	 <a href="#" class="addRef" data-toggle="modal" data-target="#lineModal" style="margin-left: auto; font-size: 30px; cursor: pointer; font-weight: bold; position: absolute; top: 282px; right:35px;">+</a>
	<div id="myDropdown2" class="dropdown-content">
  	</div>
	<hr/>
	<table id="reference">
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
		    <td id="agreement"></td>
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
</c:if>


<br/>
<input type="file" name="files" multiple="multiple"/>
<br/>
<input type="radio" name="publicStatus" value=0 />공개
<input type="radio" name="publicStatus" value=1 checked/>비공개
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








<script>
	/* 
	$("#time1").timepicker({	
		step: 30,       
		timeFormat: "H:i"

	}); 
	*/
	
	function getEmployeeID(employeeID){
		console.log(employeeID);
	}
	
	function getApprovalLine(lineData){
		console.log(lineData);
		 for (var i = 0; i < lineData.length; i++) {
             console.log("Category:", lineData[i].category);
             console.log("HQ:", lineData[i].hqName);
             console.log("dpName:"+lineData[i].departmentName);
             console.log("Rank:", lineData[i].rank);
             console.log("Name:", lineData[i].name);
             
             addLineToTable(lineData[i]);
         }
	}

	const handleResizeHeight = () => {
	    textarea.current.style.height = 'auto'; //height 초기화
	    textarea.current.style.height = textarea.current.scrollHeight + 'px';
	};

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

	/*  $(document).ready(function () {
         $.ajax({
             url: "getData.do",
             type: "GET",
             success: function (data) {
            	 var lineData = data.lineData;
                 console.log(lineData);
                     for (var i = 0; i < lineData.length; i++) {
                         console.log("Category:", lineData[i].category);
                         console.log("HQ:", lineData[i].hqName);
                         console.log("dpName:"+lineData[i].departmentName);
                         console.log("Rank:", lineData[i].rank);
                         console.log("Name:", lineData[i].name);
                         
                         addLineToTable(lineData[i]);
                     }
             },
             error: function (e) {
                 console.log(e);
             }
         });
     }); */

	 function addLineToTable(lineData) {
		    var table = $("#approvalLine");
		    if (lineData.category == "결재") {
		        var row = $("<tr>");
		        row.append("<th scope='row'>" + (table.find("tr").length + 1) + "</th>");
		        row.append("<td>" + lineData.category + "</td>");
		        if (lineData.hqName == '' && lineData.departmentName == '') {
		            row.append("<td>" + lineData.rank + lineData.name + "</td>");
		            row.append('<label class="cancel">'+'x'+'</label>');
		        } else {
		            row.append("<td>" + lineData.hqName + "/" + lineData.departmentName + "</td>");
		            row.append("<td>" + lineData.rank + "</td>");
		            row.append("<td>" + lineData.name + "</td>");
		            row.append('<label class="cancel">'+'x'+'</label>');
		        }
		        table.append(row);
		    } else if (lineData.category == "합의") {
		        var existingValue = $("#agreement").text();
		        if (existingValue) {
		            existingValue += ", ";
		        }
		        if (lineData.hqName == '' && lineData.departmentName == '') {
		            existingValue += lineData.rank + lineData.name;
		            existingValue += '<label class="canceled">x</label>'
		        } else {
		            existingValue += lineData.hqName + "/" + lineData.departmentName + lineData.rank + lineData.name;
		            existingValue += '<label class="canceled">x</label>'
		        }
		        $("#agreement").html(existingValue);
		    } else {
		        var referenceTable = $("#reference");
		        var row = $("<tr>");
		        if (lineData.hqName == '' && lineData.departmentName == '') {
		            row.append("<td>" + lineData.rank + lineData.name + "</td>");
		            row.append('<label class="cancel">'+'x'+'</label>');
		        } else {
		            row.append("<td>" + lineData.hqName + "/" + lineData.departmentName + "</td>");
		            row.append("<td>" + lineData.rank + "</td>");
		            row.append("<td>" + lineData.name + "</td>");
		            row.append('<label class="cancel">'+'x'+'</label>');
		        }
		        referenceTable.append(row);
		    }
		    
		}
	 
	 $(document).on('click', '.cancel', function() {
		   
		    $(this).closest('tr').remove();
		    
		});
	
	 
</script>
</body>
</html>