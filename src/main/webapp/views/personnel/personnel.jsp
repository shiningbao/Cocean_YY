<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	 table, th, td{
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
</style>
</head>
<body>
<form action="join.go" method="post">
	<table>
		<tr>
			<th>사번</th>
			<td>
				<input type="text"/>
			</td>
		<tr>
			<th>이름</th>
			<td>
				<input type="text"/>
			</td>
		</tr>
		<tr>
			<th>부서</th>
			<td>
				 <select id="departmentSelect" name="departmentID">
					 <!-- 선택된 중분류에 따라 옵션이 동적으로 추가 -->
				 </select>
			</td>
		</tr>
		<tr>
			<th>담당</th>
			<td>
				<select id="resSelect" name="responsibility">
					 <!-- 선택된 중분류에 따라 옵션이 동적으로 추가 -->
				 </select>
			</td>
		</tr>
		<tr>
			<th>직급</th>
			<td>
				<select id="selectRankID" name="rankID">
					<option value="1">계약직</option>
					<option value="2">주임</option>
					<option value="3">선임</option>
					<option value="4">책임</option>
					<option value="5">수석</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>직책</th>
			<td>
				<select id="selectPositionID" name="positionID">
					<option value="1">팀원</option>
					<option value="2">팀장</option>
					<option value="3">본부장</option>
					<option value="4">관장</option>
					<option value="5">대표이사</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>상태</th>
			<td>
				<input type="text"/>
			</td>
		</tr>
		<tr>
			<th>입사일</th>
			<td>
				<input type="date"/>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text"/>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text"/>
			</td>
		</tr>
		<tr>
			<th>잔여연차</th>
			<td>
				<input type="text"/>
			</td>
		</tr>
		<tr>
             <th colspan="2">
                 <input type="submit" value="회원가입"/>
             </th>
         </tr>
		
				
	</table>
</form>
</body>
<script>
 	var departmentID = $('#departmentSelect');
	$.ajax({
		url:'getTeams.do',
		method:'GET',
		success:function(data){
			console.log(data);
			data.forEach(function(option){
				departmentID.append($('<option>',{
					value:option.departmentName,
					text:option.departmentName
				}))
			})
		},
		error:function(e){
			console.log(e);
		}
	});
</script>
</html>