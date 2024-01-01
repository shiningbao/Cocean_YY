<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">


<style>
 .photo  {
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .photo img {
        width: 150px;
        height: 150px;
        border-radius: 50%; /* 이미지를 동그랗게 처리하는 CSS */
    }
    .photo2{
    
    }
    .photo2 img {
        width: 100px;
        height: 100px;
    }

        .file-icon {
        width:40px;
        height:40px;
        transform: translate(-100%, 100%);
        font-size: 24px;
        color: #379cff;
        cursor: pointer;
        border-radius: 50%;
            background-color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
    }
      .file-icon2 {
        width:40px;
        height:40px;
        transform: translate(180%, -80%);
        font-size: 24px;
        color: #379cff;
        cursor: pointer;
        border-radius: 50%;
            background-color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
    }
    

    #fileInput ,#fileSignatureInput{
        display: none;
    }
    .form-control{
    	margin-bottom: 12px !important;
    }
    .psSelect {
    /* form-control 클래스 스타일 */
    margin-bottom:12px;
    height:38px;
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
.modal-content{
	width: 800px;
}
.regibtn{
	float: right;
}
.desc{
	color: #96b6d3;
}
tbody tr {
        margin-bottom: 10px; /* 각 tr 요소 사이에 10px의 여백을 주겠습니다. */
    }
</style>
</head>
<body>
<form action="join.do" method="post" id="joinForm" enctype="multipart/form-data">

		<div class="wrap_info_content">
		    <div class="wrap_header">
		        <div class="wrap_photo">
		            <label class="photo" for="fileInput">
		                <img src="/Cocean/resource/img/psProfile.jpg" id="thumbnail_image" alt="프로필 사진">
		                <span class="file-icon"><i class="fas fa-pencil-alt"></i></span>
		            </label>
		            <input type="file" name="file" id="fileInput" title="등록" style="height:inherit;">
		            
		        </div>
		        <div class="wrap_info" style="text-align: center;">
		            <span class="desc">※ 사진은 자동으로 150x150 사이즈로 적용됩니다.</span>
		        </div>
		    </div>
		</div>

	<table style="width: 100%;">
    <tr>
        <td style="width: 50%; vertical-align: top;">
            <div class="left-content">
                <table style="width: 100%;">
                    <!-- 좌측 컨텐츠 -->
                    <tr>
                        <th>사번</th>
                        <td>
                            <input type="text" name="employeeID" class="form-control mb-2" id="employeeID"placeholder="ex)230000 연도숫자4개" required/>
                             <div id="duplicateMsg" style="display: none; color: red;">사번이 중복됩니다.</div>
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>
                            <input type="text" name="name" pattern="[가-힣]*" title="한글만 입력하세요." class="form-control mb-2" required/>
                        </td>
                    </tr>
                    <!-- 중략 -->
                    <tr>
                        <th>직책</th>
                        <td>
                            <select id="selectPositionID" name="positionID" class="psSelect">
                                <option value="1">팀원</option>
                                <option value="2">팀장</option>
                                <option value="3">본부장</option>
                                <option value="4">관장</option>
                                <option value="5">대표이사</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>직급</th>
                        <td>
                            <select id="selectRankID" name="rankID" class="psSelect">
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
                        <th>주소</th>
                        <td>
                            <input type="text" name="address" class="form-control mb-2" required/>
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>
                            <input type="text" name="phoneNumber" class="form-control mb-2"placeholder="010-0000-0000"  pattern="\d{3}-\d{4}-\d{4}" title="전화번호 형식인 010-0000-0000으로 입력하세요."required/>
                        </td>
                    </tr>
                    <!-- 중략 -->
                </table>
            </div>
        </td>
        <td style="width: 50%; vertical-align: top;">
            <div class="right-content">
                <table style="width: 100%;">
                    <!-- 우측 컨텐츠 -->
                    <tr>
                        <th>지점</th>
                        <td>
                            <select id="branchSelect" class="psSelect"></select>
                        </td>
                    </tr>
                    <tr>
                        <th>본부</th>
                        <td>
                            <select id="deSelect" class="psSelect"></select>
                        </td>
                    </tr>
                    <tr>
                        <th>부서</th>
                        <td>
                             <select id="departmentSelect" name="departmentID" class="psSelect">
                                 <!-- 선택된 중분류에 따라 옵션이 동적으로 추가 -->
                             </select>
                        </td>
                    </tr>
                    <tr>
                        <th>담당</th>
                        <td>
                            <select id="resSelect" name="responsibility" class="psSelect">
                                 <!-- 선택된 중분류에 따라 옵션이 동적으로 추가 -->
                             </select>
                        </td>
                    </tr>
                    <tr>
                        <th>입사일</th>
                        <td>
                            <input type="date" name="joinDate" class="form-control mb-2"/>
                        </td>
                    </tr>
                   
                     <tr>
					    <th style="vertical-align: top; padding-top:10px;">서명이미지</th>
					    	<td>
					            <label class="photo2" for="fileSignatureInput" style="height: 10px;">
					            <img src="<c:url value='/resource/img/no_image.png'/>" id="signatureImg" alt="서명 이미지">
					                <span class="file-icon2"><i class="fas fa-upload"></i></span>
					            </label>
					            <div class="file-upload" >
					                <input type="file" name="fileSignature" id="fileSignatureInput" title="등록" style="height:inherit;">
					            </div>
					    	</td>
					</tr>
                    <tr>
                        <th colspan="2">
                            <input type="submit" value="회원가입" class="btn btn-primary regibtn"/>
                        </th>
                    </tr>
                </table>
            </div>
        </td>
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
            var departmentText = $('#departmentSelect option:selected').text();
            var firstOptionValue = $('#departmentSelect option:first').val();
            data.forEach(function(option, index) {
                var value = index + 1;
                departmentSelect.append($('<option>', {
                    value: option,
                    text: option
                }))
            });
            $('#departmentSelect').prop('selectedIndex', 0).trigger('change');
           /*  if ($('#deSelect').val()=='1') {
            	 console.log(firstOptionValue);
            } else {
            	 
            	 console.log(firstOptionValue);
            } */
            
           
        },
        error: function(e) {	
            console.log(e);
        }
    });
}

function onDepartmentSelect() {
    console.log('부서 선택시 담당 변경!!!!!!!!!!!!');
    resSelect.empty();
    var departmentText = $('#departmentSelect option:selected').text();
    var selectPositionID = $('#selectPositionID').val();
    
    console.log(departmentText);
    
        $.ajax({
            url: 'getDepartmentText.do',
            data: { departmentText: departmentText },
            success: function(data) {
                console.log(data);
                data.forEach(function(option, index) {
                    $('#resSelect').append($('<option>', {
                        value: option,
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
	$('input[name="joinDate"]').val(new Date().toISOString().substring(0, 10).toString());
    $('#branchSelect').change(function() {
        onBranchSelectChange();
        console.log('지점변경!!!');
    });

    $('#deSelect').off('change').on('change', function() {
        console.log('본부변경!!!');
        onDeSelectChange();
        console.log($('#deSelect').val() + '!!!!!!!!!!!!!');
    });

    $('#departmentSelect').change(function() {
        console.log('부서변경!!!');
        console.log('@@@@@@@@@' + $(this).val());
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

$('#fileInput').on('change', function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
        $('#thumbnail_image').attr('src', e.target.result);
    };
    reader.readAsDataURL(file);
});

$('#fileSignatureInput').on('change', function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = function(e) {
        $('#signatureImg').attr('src', e.target.result);
    };
    reader.readAsDataURL(file);
});

$('input[name="employeeID"]').on('focusout',function(){
	var employeeID = $('#employeeID').val();
	console.log(employeeID);
	$.ajax({
		url:'checkDuplicateEmployeeID.do',
		type:'POST',
		data:{employeeID:employeeID},
		success:function(result){
			if(result== true){
				$('#duplicateMsg').css('display', 'block');
				$('#employeeID').val('');
			}else{
				$('#duplicateMsg').css('display', 'none');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
})





</script>
</html>