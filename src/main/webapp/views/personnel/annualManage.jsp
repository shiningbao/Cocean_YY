<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>


<style>
input{
	width:40px;
}
th , tr ,td{
}
.tb_content{
	padding:15px;
	    width: 20%;
}

.col2 {
margin-bottom: 14%;
  display: flex; /* Flex 컨테이너로 지정 */
  justify-content: space-between; /* 요소 사이의 공간을 최대한 활용하여 배치 */
  align-items: center; /* 세로 정렬을 위해 필요한 경우 */
}

.formbtn{
	margin-top: 10%;
    float: right;
}
.marginrow{
	margin-top: 5%;
}

.addbtn,.delbtn{
	border: none;
	background: none;
	font-size: 30px;
}

</style>
</head>
<body>
<c:import url="/side"/>
	

		<div class="container-fluid contentField">
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">연차관리</h1>
			</div>
			<div class="card shadow">
				<div class="card-body">
				<span class="title" style="margin-bottom:5%;">근속연수별 연차 설정</span>
				  <table>
					<tr>

                <td>
                    <div class="tb_vacation_set" style="display: flex;">
                        <div class="" id="working_year_list" style="display: flex; flex-wrap: nowrap;">
                        
                        <div class="row marginrow">
                            <div class="tb_content">
                                <span class="txt">0 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="12" data-year="1" style="text-align: right;">
                                </span>
                            </div>
                            
                            <div class="tb_content">
                                <span class="txt">1 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="12" data-year="1" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">2 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="12" data-year="2" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">3 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="13" data-year="3" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">4 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="13" data-year="4" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">5 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="14" data-year="5" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">6 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="14" data-year="6" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">7 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="15" data-year="7" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">8 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="15" data-year="8" style="text-align: right;">
                                </span>
                            </div>


                            <div class="tb_content">
                                <span class="txt">9 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="16" data-year="9" style="text-align: right;">
                                </span>
                            </div>
                            
                            <div class="tb_content">
                                <span class="txt">10 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="16" data-year="10" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">11 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="17" data-year="11" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">12 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="17" data-year="12" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">13 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="18" data-year="13" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">14 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="18" data-year="14" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">15 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="19" data-year="15" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">16 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="19" data-year="16" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">17 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="20" data-year="17" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">18 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="20" data-year="18" style="text-align: right;">
                                </span>
                            </div>
                   
                            <div class="tb_content">
                                <span class="txt">19 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="21" data-year="19" style="text-align: right;">
                                </span>
                            </div>
                            <div class="tb_content">
                                <span class="txt">20 년차</span>
                                <span class="wrap_txt">
                                    <input class="txt wfix_small points" name="" value="21" data-year="20" style="text-align: right;">
                                </span>
                            </div>
                                  </div>
                        </div>
                        <div class="col2">
                        	<button onclick="addRow()" class="addbtn" type="button">+</button>
                        	<button onclick="delRow()" class="delbtn"type="button">-</button>
                        </div>
                    </div>
                </td>
            </tr>
            </table>
            
                    <div class="formbtn">
				        <button class="btn btn-primary annualSaveBtn" type="button">저장</button>
			        </div>
            
				</div>
			</div>	
			
		</div>

<c:import url="/footer"/>
</body>

<script>
$(document).ready(function(){
	
$.ajax({
	url:'getAnnualLeave.do',
	type:'post',
	success:function(data){
		console.log(data);
		renderDataOnPage(data);
	},
	error:function(e){
		console.log(e);
	}
});
})

function renderDataOnPage(data) {
    for (var i = 0; i < data.length; i++) {
        var year = data[i].year;
        var value = data[i].value;

        // 연차에 해당하는 input 요소를 찾아서 값을 설정
        $('.tb_content').each(function() {
            var currentYear = $(this).find('span.txt').text().split(' ')[0];
            if (currentYear == year) {
                $(this).find('input').val(value);
            }
        });
    }
}
function addRow() {
    var lastYearInput = $(".tb_content input:last");
    var currentValue = parseInt(lastYearInput.val());
    var newYearValue = currentValue + 1;
    var newInput = '<div class="tb_content"><span class="txt">' + newYearValue + ' 년차</span><span class="wrap_txt"><input class="txt wfix_small points" name="" value="' + newYearValue + '" data-year="' + newYearValue + '" style="text-align: right;"></span></div>';
    $(".row").append(newInput);
}

function delRow() {
    var lastYearInput = $(".tb_content input:last");
    var currentValue = parseInt(lastYearInput.val());
    if (currentValue > 20) {
        $(".tb_content:last").remove();
    }
}

$('.annualSaveBtn').on('click', function() {
    swal({
        title: "연차 설정을 저장하시겠습니까??",
        text: "매년 1월1일 등록",
        icon: "success",
        buttons: ["취소","확인"],
    })
    .then((isOkey) => {
        if (isOkey) {
            swal('저장 되었습니다.', '', 'success')
            .then((isOkey) => {
                if (isOkey) {
                    var dataToSend = [];
                    $('.tb_content').each(function() {
                        var year = $(this).find('span.txt').text().split(' ')[0];
                        var value = $(this).find('input').val();
                        dataToSend.push({ year: year, value: value });
                    });
                    console.log(dataToSend);
                    $.ajax({
                        type: 'POST',
                        url: 'annualLeave.do', // 실제 서버 URL
                        contentType: 'application/json',
                        data: JSON.stringify(dataToSend),
                        success: function(response) {
                            // 성공적으로 서버에 데이터를 보냈을 때 처리하는 코드
                            // 서버에서 반환한 데이터를 기반으로 화면을 업데이트
                            console.log("서버 응답: ", response);
                            for (var i = 0; i < response.length; i++) {
                                var year = response[i].year;
                                var value = response[i].value;

                                // 연차에 해당하는 input 요소를 찾아서 값을 설정
                                $('.tb_content').each(function() {
                                    var currentYear = $(this).find('span.txt').text().split(' ')[0];
                                    if (currentYear == year) {
                                        $(this).find('input').val(value);
                                    }
                                });
                            }
                        },
                        error: function(err) {
                            // 에러 발생 시 처리하는 코드
                            console.error("에러 발생: ", err);
                        }
                    });         
                }
            })
        }
    });
});

</script>
</html>