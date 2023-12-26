<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">

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