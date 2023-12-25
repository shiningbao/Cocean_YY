<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 

<div id="animalDetailBase">
	<div class="animalImg" style="width: 400px; height: 500px;">
		<div class="mainImgDiv">
			<div class="imgButton"></div>
			<div class="mainImg" style="width: 300px; height: 200px; background-color: red"></div>
			<div class="imgButton"></div>
		</div>
		<div class="subImgDiv" style="width: 100%; height: 100px;">
			<div class="subImg">
				<img alt="" src="/photo/cocean/animal/1703417309246.jpg" width="100px" height="100px">
			</div>
			<div class="subImg">
				<img alt="" src="/photo/cocean/animal/1703417309246.jpg" width="100px" height="100px">
			</div>
			<div class="subImg">
				<img alt="" src="/photo/cocean/animal/1703417309246.jpg" width="100px" height="100px">
			</div>
		</div>
	</div>
<%-- 		<c:forEach items="${image}" var="item"> --%>
<%-- 			<img alt="${item.serverFileName}" src="/photo/cocean/animal/${item.serverFileName}" width="200px" height="200px"> --%>
<%-- 		</c:forEach> --%>
	<div class="animalBase">
		<table style="width:100%">
			<colgroup>
				<col style="width:30%">
				<col style="width:70%">
			</colgroup>
			<tr>
				<th>코션친구들코드</th>
				<td>${base.animalCode}</td>
			</tr>
			<tr>
				<th>분류</th>
				<td>${base.taxonomy}</td>
			</tr>
			<tr>
				<th>학명</th>
				<td>${base.scientificName}</td>
			</tr>
			<tr>
				<th>국명</th>
				<td>${base.commonName}</td>
				
			<tr>
				<th>지점</th>
				<td>${base.branchID}</td>
			</tr>
			<tr>
				<th>코션하우스</th>
				<td>${base.tankID}</td>
			</tr>
			<tr>
				<th>마리 수</th>
				<td>${base.individual}</td>
			</tr>
			<tr>
				<th>태어난 날</th>
				<td>${base.birthDate}</td>
			</tr>
			<tr>
				<th>들어온 날</th>
				<td>${base.entryDate}</td>
			</tr>
			<tr>
				<th>세부 정보</th>
				<td>${base.details}</td>
			</tr>
			<tr>
				<th>담당자</th>
				<td>
					<button id="inchargeAdd()">담당자 지정</button><br/>
					<c:if test="${incharge eq null}">담당자 없음</c:if>
					<c:forEach items="${incharge}" var="ic" >${ic}</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	<div>${incharge}</div>
	<script>
		$('.subImg').css({'margin':'1px auto', 'display':'inline'});
		
// 		function(){
// 			$.ajax({
				
// 			});
// 		}
	</script>
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