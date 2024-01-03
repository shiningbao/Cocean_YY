<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.photo {
	display: flex;
	justify-content: center;
	align-items: center;
}

.photo img {
	width: 150px;
	height: 150px;
	border-radius: 50%; /* 이미지를 동그랗게 처리하는 CSS */
}

.photo2 img {
	width: 55px;
	height: 55px;
}

.file-icon {
	width: 40px;
	height: 40px;
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
	width: 30px;
	height: 30px;
	transform: translate(120%, -80%);
	font-size: 20px;
	color: #379cff;
	cursor: pointer;
	border-radius: 50%;
	background-color: #ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
}

.file-icon3 {
	width: 40px;
	height: 40px;
	transform: translate(650%, -130%);
	font-size: 20px;
	color: #379cff;
	cursor: pointer;
	border-radius: 50%;
	background-color: #ffffff;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
}

#fileInput, #fileSignatureInput {
	display: none;
}

.form-control {
	margin-bottom: 12px !important;
}

.psSelect {
	/* form-control 클래스 스타일 */
	margin-bottom: 12px;
	height: 38px;
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

.modal-content {
	width: 800px;
}

.regibtn {
	float: right;
}

.desc {
	color: #96b6d3;
}

tbody tr {
	margin-bottom: 10px; /* 각 tr 요소 사이에 10px의 여백을 주겠습니다. */
}

.desc1 {
	font-size: 12px;
	color: #96b6d3;
}
.wrap_photo{
	margin-left: 15%
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
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>직급</th>
                        <td>
                            <select id="selectRankID" name="rankID" class="psSelect">
                            </select>
                        </td>
                    </tr>
                     <tr>
                        <th>전화번호</th>
                        <td>
                            <input type="text" name="phoneNumber" class="form-control mb-2"placeholder="010-0000-0000"  pattern="\d{3}-\d{4}-\d{4}" title="전화번호 형식인 010-0000-0000으로 입력하세요."required/>
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <th style="vertical-align: top; padding-top: 10px;">주소</th>
                        <td>
                            <input type="text" name="address" id="address" class="form-control mb-2" required/>
							    <span class="file-icon3"><i class="fas fa-map-marker-alt" onclick="sample6_execDaumPostcode()"></i></span>
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
					    <th style="vertical-align: top; padding-top:10px; width:80px;">서명이미지</th>
					    	<td>
					    	<span class="desc1" style="font-size=12px;">※ 서명이미지는 자동으로 55x55 사이즈로 적용됩니다.</span>
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
                            <input type="submit" value="등록" class="btn btn-primary regibtn"/>
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

function getPositionName() {
    $.ajax({
        url: 'getPositionName.do',
        method: 'POST',
        data: {},
        success: function(data) {
            console.log(data);
            data.forEach(function(option, index) {
                $('#selectPositionID').append($('<option>', {
                    value: option.positionID,
                    text: option.positionName
                }))
            });

        },
        error: function(e) {
            console.log(e);
        }
    });
}
function getRankName() {
    $.ajax({
        url: 'getRankName.do',
        method: 'POST',
        data: {},
        success: function(data) {
            console.log(data);
            data.forEach(function(option, index) {
                $('#selectRankID').append($('<option>', {
                    value: option.rankID,
                    text: option.rankName
                }))
            });

        },
        error: function(e) {
            console.log(e);
        }
    });
}
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
	
	getPositionName();
	getRankName()
	$('input[name="joinDate"]').val(new Date().toISOString().substring(0, 10).toString());
    $('#branchSelect').change(function() {
        onBranchSelectChange();
        console.log('지점변경!!!');
    });

    $('#deSelect').on('change', function() {
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
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("address").value = extraAddr;
            
            } else {
                document.getElementById("address").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address").focus();
        }
    }).open();
}




</script>
</html>