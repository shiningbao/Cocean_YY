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

