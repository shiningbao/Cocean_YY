<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">

<div id="animalDetailLog">
	<h2>LOG</h2>
	<input type="month" name="month" value="${month}" onchange="monthchange()"/>
	<input type="file"/>
	<input type="button" name="logWrite" value="등록" onclick="logplanWrite()"/>
	<select name="status">
		<option value="정상">정상</option>
		<option value="질병">질병</option>
		<option value="격리">격리</option>
		<option value="폐사">폐사</option>
	</select>
	<div>
		<table>
			<tr>
				<th>${userInfo.name}</th>
			</tr>
			<tr>
				<th><textarea name="content"></textarea></th>
			</tr>
		</table>
	</div>
	<div>
		<c:forEach items="${log}" var="item">
			<div>
				<button>수정</button>
				<button>삭제</button>
				<table>
					<tr>
						<th>${item.departmentName} ${item.name}</th>
						<th>${item.creationDate}</th>
					</tr>
					<tr>
						<th colspan="2">${item.content} / 상태: ${item.status}</th>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
</div>
<script>





</script>