<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    font-size: 10px;
    position: absolute;
    padding: 0px 0px 0px 10px;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.dropdown-content label{
	padding: 5px 10px 0px 0px;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content div:hover {
	background-color: #237deb;

}

.show {display:block;}

</style>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>	
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/plugins/all_plugins.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/richtexteditor/rte.js'/>"></script>
<!-- <script type="text/javascript" src="<c:url value='/resource/js/approval/jquery.timepicker.min.js'/>"></script> -->
	
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
	<div style="padding: 0px 30px;"><h6 style="margin:0px; display: flex; padding:10px 0px 0px 0px; font-size:13px;">결재라인<input type="text" class="employeeSearch" id="employeeSearch" name="employeeSearch" placeholder="이름/부서/직급" style="width:70%; font-size:12px; margin:0px 0px 0px 13px;" onclick="dropdown()"></h6>
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
	<div style="padding: 0px 30px; "><h6 style="margin:0px; display: flex; padding:10px 0px 0px 0px; font-size:13px;">참조자<input type="text" class="employeeSearch" id="employeeSearchSec" name="employeeSearch" placeholder="이름/부서/직급" style="width:70%; font-size:12px; margin:0px 0px 0px 25px;" onclick="dropdownSec()"></h6>
	<div id="myDropdown2" class="dropdown-content">
  	</div>
	<hr/>
	<table id="reference">
		<tr>
			<td>본부/부서</td>
			<td>직급</td>
			<td>참조자 이름</td>
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

</body>






<script>
	/* $("#time1").timepicker({	
		step: 30,            //시간간격 : 30분	
		timeFormat: "H:i"    //시간:분 으로표시	

	}); */
	
	function dropdown() {
	    document.getElementById("myDropdown").classList.toggle("show");
	}
	function dropdownSec() {
	    document.getElementById("myDropdown2").classList.toggle("show");
	}

	window.onclick = function (event) {
		var isSelectClicked = event.target.tagName.toLowerCase() === 'select';
		 
	    if (!event.target.matches('#employeeSearch')) {
	        var dropdown1 = document.getElementById("myDropdown");
	        if (dropdown1.classList.contains('show')) {
	            dropdown1.classList.remove('show');
	        }
	    }

	    if (!event.target.matches('#employeeSearchSec')) {
	        var dropdown2 = document.getElementById("myDropdown2");
	        if (dropdown2.classList.contains('show')) {
	            dropdown2.classList.remove('show');
	        }
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
	
	$.ajax({
	      type:'get', 
	      url:'employeeList', 
	      data:{}, 
	      dataType:'JSON', 
	      success:function(data){
	         console.log(data);
	        	 var content='';
	        	 var contents='';
	        	 
	        	 for(var i=0; i<data.size; i++){	  
	        		 content += '<div class=oneRow>';
	        		 content += '<select class="category" name="approvalCategory" style="width: 46px; font-size: 10px;"><option value="결재" selected="selected">결재</option><option value="합의">합의</option></select>'
	        		 content += '<label style="padding:0px 10px 0px 10px;">'+data.list[i].hqName+'/'+data.list[i].departmentName+'</label>';
	        		 content += '<label>'+data.list[i].rankName+'</label>';
	        		 content += '<label>'+data.list[i].name+'</label>'+'<br/>';
	        		 content += '</div>';
	        	 }
	        	 $('#myDropdown').append(content);
	        	 
	        	 for(var i=0; i<data.size; i++){	  
	        		 contents += '<div class=oneRow>';
	        		 contents += '<label style="padding:0px 10px 0px 10px;">'+data.list[i].hqName+'/'+data.list[i].departmentName+'</label>';
	        		 contents += '<label>'+data.list[i].rankName+'</label>';
	        		 contents += '<label>'+data.list[i].name+'</label>'+'<br/>';
	        		 contents += '</div>';
	        	 }
	        	 $('#myDropdown2').append(contents);
	        	 
	        	 $('.category').on('click', function (event) {
	        		    event.stopPropagation();
	        		});

	      },
	      error:function(e){
	         console.log(e);
	      } 
	   });
	
	$(document).on('click', '.oneRow', function (event) {
	    var labels = $(this).find('label');
	    var selectValue = $(this).find('.category').val();
	    labels.each(function () {        
	    	var values = [];
	        
	    });
	    console.log(selectValue);
	    if ($(event.target).is('label')) {
	        if(confirm('추가하시겠습니까?')){
	        	$('#approvalLine').append('<tr><td>' + selectValue + '</td><td>'+ hqName+'/'+departmentName+'</td><td>'+name+'</td></tr>');
	        }else{
	        	console.log('취소');
	        }
	    }
	   
	    
	});
	
</script>
</html>