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
<jsp:include page="../side.jsp"></jsp:include>
<form action="join.do" method="post">
	<table>
		<tr>
			<th>사번</th>
			<td>
				<input type="text" name="employeeID"/>
			</td>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name"/>
			</td>
		</tr>
		<tr>
			<th>지점</th>
			<td>
				<select id ="branchSelect">

				</select>
			</td>
		</tr>
		<tr>
			<th>본부</th>
			<td>
				<select id ="deSelect">

				</select>
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
					<option value="6">-</option>
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
				<select id="selectStatus" name="status">
					<option value="재직">재직</option>
					<option value="휴직">휴직</option>
					<option value="퇴사">퇴사</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>입사일</th>
			<td>
				<input type="date" name="joinDate"/>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="phoneNumber" placeholder="일단 010-0000-0000 으로해봐용"/>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<input type="text" name="address"/>
			</td>
		</tr>
		<tr>
			<th>잔여연차</th>
			<td>
				<input type="text" name="remainingAnnualLeave"placeholder="일단 15로 입력 해봐용"/>
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
var departmentSelect = $('#departmentSelect');
var resSelect = $('#resSelect');
var branchSelect = $('#branchSelect');

function onBranchSelectChange() {
    console.log('지점 선택시 본부항목 변경!!!!!!!!!!!!!!!!!');
    var branchID = $('#branchSelect').val();
    console.log(branchID);
    $.ajax({
        url: 'getBranchID.do',
        method: 'GET',
        data: { branchID: branchID },
        success: function(data) {
            console.log(data);
            $('#deSelect').empty();
            data.forEach(function(option, index) {
                var value = branchID == 2 ? index + 4 : index + 1;
                $('#deSelect').append($('<option>', {
                    value: value,
                    text: option
                }))
            });

            if (branchID == 1) {
                $('#deSelect').val('1').trigger('change');
            } else {
                $('#deSelect').val('4').trigger('change');
            }

            console.log($('#branchSelect').val());
        },
        error: function(e) {
            console.log(e);
        }
    });
}

function onDeSelectChange() {
    console.log('본부 선택시 부서항목 변경!!!!!!!!!!!!');
    departmentSelect.empty();
    var hqID = $('#deSelect').val();
    console.log(hqID);
    $.ajax({
        url: 'getHqID.do',
        data: { hqID: hqID },
        success: function(data) {
            console.log(data);
            data.forEach(function(option, index) {
                departmentSelect.append($('<option>', {
                    value: index + 1,
                    text: option
                }))
            })
            $('#departmentSelect').val('1').trigger('change');
        },
        error: function(e) {
            console.log(e);
        }
    });
}

function onDepartmentSelect() {
    console.log('부서 선택시 담당 변경!!!!!!!!!!!!');
    resSelect.empty();
    var departmentText = $('#departmentSelect option:selected').text()
    console.log(departmentText);
    $.ajax({
        url: 'getDepartmentText.do',
        data: { departmentText: departmentText },
        success: function(data) {
            console.log(data);
            data.forEach(function(option, index) {
                $('#resSelect').append($('<option>', {
                    value: index + 1,
                    text: option
                }))
            });
        },
        error: function(e) {
            console.log(e);
        }
    });
}

$(document).ready(function() {
    $('#branchSelect').change(function() {
        onBranchSelectChange();
        console.log('지점변경!!!');
    });

    $('#deSelect').off('change').on('change', function() {
        console.log('본부변경!!!');
        onDeSelectChange();
        console.log($('#deSelect').val());
    });

    $('#departmentSelect').change(function() {
        console.log('부서변경!!!');
        onDepartmentSelect();
    });

    $.ajax({
        url: 'getBranch.do',
        success: function(data) {
            console.log(data);
            data.forEach(function(option, index) {
                $('#branchSelect').append($('<option>', {
                    value: index + 1,
                    text: option
                }))
            });
            $('#branchSelect').val('1').trigger('change');
        },
        error: function(e) {
            console.log(e);
        }
    });

    departmentSelect.empty();
    resSelect.empty();
    $('#deSelect').empty();
});
		
</script>
</html>