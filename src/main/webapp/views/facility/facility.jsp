<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />


<style>
ul.mylist{
    list-style: none;
    margin: 0px;
    padding: 0px;
  
    max-width: 250px;
    width: 100%;
}
    ul.mylist li:before {
        display: inline-block;
        vertical-align: middle;
        padding: 0px 5px 6px 0px;
    }

    ul.mylist li.active:before {
        display: inline-block;
        vertical-align: middle;
        padding: 0px 5px 6px 0px;
    }
    
.mylist li {
    list-style-type: none;
}    


.Hide{
    border: none;
    background: none;
    padding: 0; /* 내부 여백 제거 */
    cursor: pointer;
}

.facilityList{
	display: inline;
}
img{
	width: 20px;
	height: 20px;
}
.facilityInfo{
	color: gray;
}

.useInfo{
	float: right;
	border: none;
    background-color: #c7e2fd;
    border-radius: 5px;
    padding: 5px 10px;
    width: 12%;
    text-align: center;
}
.userInfoX{
	float: right;
	border: none;
    background-color: #fdbdb7;
    border-radius: 5px;
    padding: 5px 10px;
    width: 12%;
    text-align: center;
}
</style>
</head>
<body>
<c:import url="/side"/>
	
	
<div class="container-fluid contentField">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">시설관리</h1>
	</div>
	
	<div class="row">
		<div class ="col-3">
			<div class="card shadow">
				<div class="card-body">
					<p style="margin-bottom: 10%">시설정보</p>

						<c:forEach var="facility" items="${getCategory }">
						<div class="facility">
						<button class="interestCalendar Hide">
							<img src="<c:url value='/resource/img/carrot-side.png'/>"
									class="img2" alt="버튼 이미지">
									<p class="facilityList">${facility.category }</p>
						</button>
						
						
						<div class="someClass" style="margin-left: 20%; color: gray"></div>
						</div>	
						</c:forEach>


				</div>
			</div>
		</div>
		<div class ="col-9">
			<div class="card shadow" style="margin-bottom: 1.2%">
				<div class="card-body facilityMainInfo">
					시설
				</div>
			</div>
			
			<div class="card shadow">
				<div class="card-body">
					<div class="facilityInfo">
						*  시설을 선택해주세요  *
					</div>
					<div style="margin-top: 15%; color: gray" >
						※운영관리자 ${getPersonnelLeader.name  } &nbsp; ${getPersonnelLeader.positionName } (TEL.${getPersonnelLeader.phoneNumber })
					</div>
				</div>
			</div>
		</div>
		

	</div>		
	
	
</div>

<div class="modal fade" id="editFacilityModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">시설수정</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="facilitySubmit"> <!-- 입력폼 -->
				        <div class="form-group">
				            <label for="">시설명:</label>
				            <input type="text" class="form-control" name="facilityName"  id="facilityName" required>
				        </div>
				        
				        <div class="form-group">
				            <label for="">시설정보:</label>
				            <input type="text" style="height: 200px" class="form-control" name="facilityInfo"  id="facilityInfo" required>
				        </div>
				        
				        <button class="btn btn-outline-primary canclePosition" type="button">취소</button>
						<button class="btn btn-primary savePositon" type="submit">저장</button>
				        
				        
            </form>
          </div>
        </div>
      </div>
    </div>       						

</body>

<script>
var loginResponName = '${userInfo.employeeID}';
var responName = '${userInfo.responName}';
console.log(loginResponName);
console.log(responName);

var carrotSideImgUrl = '<c:url value="/resource/img/carrot-side.png"/>';
var carrotDownImgUrl = '<c:url value="/resource/img/carrot-down.png"/>';





$('.interestCalendar').on('click', function() {
    var img = $(this).find('img');
    var isDown = img.attr('src') == carrotDownImgUrl; // 현재 이미지가 내려가 있는지 확인

    if (!isDown) {
        img.attr('src', carrotDownImgUrl); 
        console.log('true');
        // 관련 요소 초기화
        var clickItem =  $(this).closest('.facility').find('.someClass');
        clickItem.empty();

        var category = $(this).closest('.facility').find('.facilityList').text();
        drawFacility(category, clickItem);
    } else {
        img.attr('src', carrotSideImgUrl); 
        console.log('false');
        var clickItem =  $(this).closest('.facility').find('.someClass');
        clickItem.empty(); 
    }
});
$(document).on('click','.editButton',function(){
    $('#editFacilityModal').modal('show');
    var text = $(this).parent().text();
    console.log('!!!!!!!'+facilityData);
	console.log(text);
    $('#facilityName').val(text);
    $('#facilityInfo').val(facilityData);
});

var facilityData;

$(document).on('click','.text', function() {
	
        var facilityName = $(this).text();
        $.ajax({
            url: 'getFacilityInfo.do',
            type: 'POST',
            data: { facilityName: facilityName }, 
            success: function(data) {
                console.log(data);
                facilityData = data.getfacilityInfo.facilityInfo;
                console.log('@@@@@@@@@@@@@@@'+facilityData);
                var facilityInfo = $('.facilityInfo');
                facilityInfo.empty();


    			var facilityUse = data.getfacilityInfo.isUse;
    	         facilities = facilityData.split(/\d+\. /); // 숫자와 .으로 시작하는 패턴을 기준으로 문자열을 나눔
    	
    	         // 배열의 첫 번째 요소는 빈 문자열일 수 있으므로 제거합니다.
    	         facilities = facilities.filter(function(facility) {
    	             return facility.trim() !== '';
    	         });
    	
    	         // 각 facility 정보에 div 태그를 붙여서 추가합니다.
    	         facilities.forEach(function(facility) {
    	             var optionHTML = '<div>' + facility + '</div>';
    	             facilityInfo.append(optionHTML);
    	         });        		
    	         
    	         var availabilityText = facilityUse ? '대여 불가능' : '대여 가능';
    	         var availabilityClass = facilityUse ? 'userInfoX' : ''; // 대여 불가능일 때 userInfoX 클래스 추가

    	         var availabilityHTML = '<div class="useInfo ' + availabilityClass + '">' + availabilityText + '</div>';
    	         facilityInfo.prepend(availabilityHTML);
    	         $('.facilityMainInfo').empty();
    	         $('.facilityMainInfo').append(data.getfacilityInfo.facilityName);
                	
                

    			
            },
            error: function(error) {
                console.error('전송 실패');
            }
        });
   

    
    
});



function drawFacility(category, clickItem) {
    $.ajax({
        url: 'getFacilityName.do',
        type: 'POST',
        data: { category: category },
        success: function(data) {
            console.log(data.getfacilityName.facilityName);
            // 가져온 데이터를 정렬된 목록으로 추가
            var facilityList = '<div>';
            for (var i = 0; i < data.getfacilityName.length; i++) {
                facilityList += '<div class="text">' + data.getfacilityName[i].facilityName;
                if (responName == '시설관리') {
                    // responName이 '시설관리'일 때 수정 버튼 추가
                    facilityList += '<i class="fas fa-cog editButton" data-toggle="editFacilityModal" data-target="#editFacilityModal"></i>';
                    facilityList += '<i class="fas fa-times deleteButton"></i>';
                }
                facilityList += '</div>';
            }
            facilityList += '</div>';
            clickItem.append(facilityList);
            

        },
        error: function(error) {
            console.error('전송 실패');
        }
    });
}

$(document).on('click','.deleteButton',function(){
	console.log('click');
	var deltxt = $(this).parent().text(); // 수정된 부분
	console.log(deltxt);
	if(confirm("삭제하시겠습니까?")){
	    $.ajax({
	        url: 'delFacility.do',
	        type: 'post',
	        data: {deltxt: deltxt}, // 수정된 부분
	        success: function(response) {
	        	
	        		alert('삭제 성공: ' + response.message);
	        		location.href= location.href;
	        },
	        error: function(error) {
	        	alert('삭제 실패: ' + error);
	        }
	    });
	}
});
$('#facilitySubmit').on('submit',function(){
	e.preventDefault();
	
	var facilityName =$('#facilityName').val();
    $.ajax({
        url: 'updateFacilityName.do',
        type: 'post',
        data: {facilityName:facilityName},
        success: function(response) {
            alert('업데이트 성공: ' + response.message)
		
            $('#editmodal').modal('hide');
            drawFacility(category, clickItem);
		
        },
        error: function(error) {
        	alert('업데이트 실패: ' + error);
        }
    });
});


</script>
</html>