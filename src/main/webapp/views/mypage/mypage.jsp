<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<main>
	

		<div id="mypage">
			<table>
				<tr>
					<td>이름</td>
					<td id="name"></td>
				</tr>
				<tr>
					<td>사번</td>
					<td id="employeleeID"></td>
				</tr>
				<tr>
					<td>직급</td>
					<td id="rankID"></td>
				</tr>
				
				<tr>
					<td>부서</td>
					<td id="departmentID"></td>
				</tr>
				<tr>
					<td>직책</td>
					<td id="positionID"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td id="phoneNumber"></td>
				</tr>				
		</div>


		<div id="attendanceDraft">
			<div class="residue">
				잔여 연차 일수
				<div id="count_1"></div>
			</div>

			<div class="Annual">
				연차 일수
				<div id="count_2"></div>
			</div>

			<div class="Banchacha">
				반차 일수
				<div id="count_3"></div>
			</div>
			</table>
		
	</main>
	</form>
        
</body>
<script>

 
var name;
var employeleeID;
var rankID;
var departmentID;
var positionID;
var phoneNumber;


var residue;
var Annual;
var Banchacha;


function myPageInfo(){
	console.log("유저 정보")
	$.ajax({
		type: 'post',
		url: 'mypage/myInfo.ajax',
		data: {},
		dataType: 'json',
		success: function(data) {
			console.log(data.myInfo);
		data.myInfo.forEach(function(item, idx) { //idx는 인덱스를 뜻한다
			name = item.name;
			employeleeID = item.employeleeID;
			rankID = item.rankID;
			departmentID = item.departmentID;
			positionID = item.positionID;
			phoneNumber = item.phoneNumber;
		});
			$('#name').html(name);	
			$('#employeleeID').html(employeleeID);	
			$('#rankID').html(rankID);	
			$('#departmentID').html(departmentID);	
			$('#positionID').html(positionID);	
			$('#phoneNumber').html(phoneNumber);
			
			residue = data.attendanceDraft.residue;
			Annual = data.attendanceDraft.Annual;
			Banchacha = data.attendanceDraft.Banchacha;
			$('#count_1').html(residue);
			$('#count_2').html(Annual);
			$('#count_3').html(Banchacha);
			
		},
		error: function(e){
			console.log(e);
		}
	});
	
}
</script>
</html>