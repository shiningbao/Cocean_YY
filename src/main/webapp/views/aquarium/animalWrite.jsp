<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


</head>
<body>
<h1>Animal Write</h1>
<form action="write.do" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<th>분류</th>
		<td>
			<input type="text" name="speciesID" style="display: none;" readonly/>
			<input type="text" name="classificationCode" style="display: none;" readonly/>
			<input type="text" id="taxo" readonly/>
		</td>
	</tr>
	<tr>
		<th>학명</th>
		<td><input type="text" id="scien" readonly/></td>
	</tr>
	<tr>
		<th>국명</th>
		<td><input type="text" id="common" readonly/></td>
	</tr>
	<tr>
		<th>애칭</th>
		<td><input type="text" name="nickname"/></td>
	</tr>
	<tr>
		<th>코션하우스</th>
		<td>
			<input type="text" name="branchID" value="1" style="display: none;" readonly/>
			<select name="tankID">
			
				<c:forEach items="${tankList}" var="item">
					<option value="${item}">${item}</option>
				</c:forEach>
			 
			</select>
			
		</td>
	</tr>
	<tr>
		<th>마리 수</th>
		<td><input type="text" name="individual"/></td>
	</tr>
	<tr>
		<th>태어난 날</th>
		<td><input type="date" pattern="\d{4}-\d{2}-\d{2}" name="birthDate"/></td>
	</tr>
	<tr>
		<th>들어온 날</th>
		<td><input type="date" pattern="\d{4}-\d{2}-\d{2}" name="entryDate"/></td>
	</tr>
	<tr>
		<th>상태</th>
		<td>
			<select name="status">
				<option value="정상">정상</option>
				<option value="질병">질병</option>
				<option value="격리">격리</option>
				<option value="폐기">폐기</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>세부 정보</th>
		<td><textarea name="details"></textarea></td>
	</tr>
	<tr>
		<th>사진</th>
		<td><input type="file" name="files" multiple="multiple"/></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit">등록</button>
		</th>
	</tr>
</table>
</form>
<button onclick=classfication()>분류창</button>
<button onclick=aa()>분류창</button>
</body>
<script>

// 분류체계 새창 띄우기
var win;
function classfication(){
	var url = 'classficationPopup';
	var winName = '코션친구들 분류군 선택';
	var popStyle = 'width = 500px, height = 500px, top = 100px, left = 200px,';
	win = open(url, "_blank",popStyle);
}

// 분류체계 자동 입력
function setClassfication(id,t,s,c){
	console.log(id);
	$('input[name="speciesID"]').val(id);
	$('#taxo').val(t);
	$('#scien').val(s);
	$('#common').val(c);
	var $classfi = $('input[name="classificationCode"]');
	switch (t) {
		case "무척추동물류":
			$classfi.val("In");
			break;
		case "미삭동물":
			$classfi.val("Ch");
			break;
		case "양서류":
			$classfi.val("Am");
			break;
		case "어류":
			$classfi.val("Fi");
			break;
		case "조류":
			$classfi.val("Av");
			break;
		case "파충류":
			$classfi.val("Re");
			break;
		case "포유류":
			$classfi.val("Ma");
			break;
	}
	
	
}

// date 기본값 지정 : 오늘 날짜
$('input[type="date"]').val(new Date().toISOString().substring(0, 10));





</script>


</html>









