<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div id="animalDetailBase">
	<div>${base}</div>
	<div>${image}</div>
	<div>${incharge}</div>
</div>


<div id="animalDetailLog">
	<h2>LOG</h2>
	<input type="month" name="month" value="${month}" onchange="monthchange()"/>
	<input type="file"/>
	<input type="button" name="logWrite" value="등록" onclick="logplanWrite()"/>
	<select name="status">
		<option value="정상">정상</option>
		<option value="질병">질병</option>
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
						<th colspan="2">${item.content} 상태: ${item.status}</th>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
	
	
</div>


<div id="animalDetailPlan">
	<h2>PLAN</h2>
	<input type="month" name="month"/>
	<input type="button" name="logWrite">
	<input type="file"/>
	<div>
		<table>
			<tr>
				<th>소속 + 이름</th>
			</tr>
			<tr>
				<th><textarea name="c"></textarea></th>
			</tr>
		</table>
	</div>
	<div>
		<c:forEach items="${plan}" var="item">
			<div>
				<button>수정</button>
				<button>삭제</button>
				<table>
					<tr>
						<th>소속 + 이름</th>
						<th>작성일</th>
					</tr>
					<tr>
						<th colspan="2">${item.content}</th>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
</div>

</body>
<script>
</script>
</html>