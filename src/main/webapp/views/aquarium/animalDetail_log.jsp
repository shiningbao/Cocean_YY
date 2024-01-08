<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">

<div id="animalDetailLog">
	<div class="card shadow col-8 mx-auto">
		<input class="form-control m-2" type="month" name="month" value="${month}" onchange="monthchange()" style="width:200px"/>

		<h5>친구들 ${category} 작성</h5>
		<div>
			${userInfo.departmentName} ${userInfo.name}
		</div>
		<div class="float-right">
			현재 상태:
				<select id="status">
					<option value="정상">정상</option>
					<option value="질병">질병</option>
					<option value="격리">격리</option>
					<option value="폐사">폐사</option>
				</select>
		</div>
			<input type="button" name="logWrite" value="등록" onclick="logplanWrite()"/>
			<div id="summernote"></div>
	
		<br/>
	
		<div>
			<c:forEach items="${content}" var="item" varStatus="st">
				<div style="border:1px solid black">	
					<div id="${item.employeeID}">${item.departmentName} ${item.name}</div>
					<div>${item.creationDate}</div>
					<button onclick="logplanUpdateGo(this,${item.logID})">수정</button>
					<button onclick="logplanDel('${item.logID}')">삭제</button>
					${item.content}
					상태: ${item.status}
					<div id="log_${item.logID}"></div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>	
logplanStart();


</script>