<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">

<div id="animalDetailLog">
	<div style="display: flex">
	<h4>친구들 기록</h4>
	<input class="form-control" type="month" name="month" value="${month}" onchange="monthchange()" style="width:200px"/>
	</div>
	<br/>
	
	<div>
		<table>
			<tr>
				<th>
					${userInfo.departmentName} ${userInfo.name}
					상태:
					<select id="status">
						<option value="정상">정상</option>
						<option value="질병">질병</option>
						<option value="격리">격리</option>
						<option value="폐사">폐사</option>
					</select>
					<input type="button" name="logWrite" value="등록" onclick="logplanWrite()"/>
				</th>
			</tr>
			<tr>
				<th><div id="summernote"></div></th>
			</tr>
		</table>
	</div>
	<div>
		<c:forEach items="${content}" var="item" varStatus="st">
			<div style="border:1px solid black">
				<table>
					<tr>
						<th id="${item.employeeID}">${item.departmentName} ${item.name}</th>
						<th>
							<div>${item.creationDate}</div>
							<button onclick="logplanUpdateGo(this,${item.logID})">수정</button>
							<button onclick="logplanDel('${item.logID}')">삭제</button>
						</th>
					</tr>
					<tbody>
						<tr>
							<th>
								${item.content}
								<div id="log_${item.logID}"></div>
							</th>
							<th>
								상태: ${item.status}
							</th>
						</tr>
					</tbody>
				</table>
			</div>
		</c:forEach>
	</div>
</div>
<script>	
logplanStart();


</script>