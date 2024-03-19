<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<%-- <script src="<c:url value='/resource/summernote/summernote-lite.js'/>"></script> --%>
<%-- <script src="<c:url value='/resource/summernote/lang/summernote-ko-KR.js'/>"></script> --%>
<%-- <link rel="stylesheet" href="<c:url value='/resource/summernote/summernote-lite.css'/>"> --%>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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

.img2{
	width:20px;
	height:20px;
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
.facilityEditDel{
	float: right;
	font-size:25px;
}
.editButton{
	padding: 10px;
}

#plusButton{
	font-size: 15px;
	float: right;
	background: none;
	border: none;
	padding: 8px;
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
.modal-content{
	width: 750px !important;
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
				<div>
				<button id="plusButton" data-toggle="addFacility" data-target="addFacility"><i class="fas fa-plus"></i>추가</button>
					<p style="margin-bottom: 10%">시설정보</p>
					
				</div>		
						<c:forEach var="facility" items="${getCategory }">
						<div class="facility">
						<button class="interestCalendar Hide">
							<img src="<c:url value='/resource/img/carrot-side.PNG'/>"
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
				        <div id="summernote"></div>
<!-- 				       <div class="form-group"> -->
<!-- 				            <label for="">시설정보:</label> -->
<!-- 				            <textarea class="form-control" style="height: 200px" name="facilityInfo"  id="facilityInfo" required></textarea> -->
<!-- 				        </div> -->
				        
				        <input type="hidden" class="form-control" name="facilityID"  id="facilityID" required>
				        <div class="float-right">
				        <button class="btn btn-outline-primary cancleEditfacility" type="button">취소</button>
						<button class="btn btn-primary savePositon" type="submit">저장</button>
				        </div>
				        
            </form>
          </div>
        </div>
      </div>
    </div>   
    
    <div class="modal fade" id="addFacility" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">시설추가</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="addFacilitySubmit"> <!-- 입력폼 -->
				        <div class="form-group">
				            <label for="">카테고리</label>
				            <select id="category" name="category" class="psSelect">
				            	    <c:forEach var="facility" items="${getCategory}">
								        <option value="${facility.category}">${facility.category}</option>
								    </c:forEach>
				             </select>
							
				        </div>
				        
				        <div class="form-group">
				            <label for="">시설명:</label>
				            <input type="text" class="form-control" name="facilityName"  id="addfacilityName" required>
				        </div>
				        
				        <div class="form-group">
				            <label for="">시설정보:</label>
				           <div id="summernote1"></div>
				        </div>
				        <div class="float-right">
				        <button class="btn btn-outline-primary cancleAddfacility" type="button">취소</button>
						<button class="btn btn-primary savePositon" type="submit">저장</button>
				        </div>
				        
            </form>
          </div>
        </div>
      </div>
    </div>     						


<c:import url="/footer"/>
</body>

<script>

$('#summernote').summernote({
	height: 200,
	maxHeight: 200,
	minHeight: 200,
	focus: true,
	toolbar:['picture']
});
$('#summernote1').summernote({
	height: 200, width: 700,
	maxHeight: 200,
	minHeight: 200,
	focus: true,
	toolbar:['picture']
});
var loginResponName = '${userInfo.employeeID}';
var responName = '${userInfo.responName}';
if (responName == '시설관리') {
    $('#plusButton').show(); // 버튼 보이기
} else {
    $('#plusButton').hide(); // 버튼 숨기기
}
console.log(loginResponName);
console.log(responName);

var carrotSideImgUrl = '<c:url value="/resource/img/carrot-side.PNG"/>';
var carrotDownImgUrl = '<c:url value="/resource/img/carrot-down.PNG"/>';





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
var facilityData;
$(document).on('click','.editButton',function(){
    var text = $('.facilityMainInfo').text();
    console.log('!!!!!!!'+facilityData);
	console.log(text);
	var facilityID = $(this).closest('.facilityEditDel').data('facilityid');
	$('#facilityID').val(facilityID);
    $('#facilityName').val(text);
    $('#summernote').summernote('code', facilityData);
    $('#editFacilityModal').modal('show');
});

$('.cancleEditfacility').on('click',function(){
	 $('#editFacilityModal').modal('hide');
})

$('.cancleAddfacility').on('click',function(){
	 $('#addFacility').modal('hide');
})

$(document).on('click','.text', drawInfo);

function drawInfo(){
    var facilityName = $(this).text();
    $.ajax({
        url: 'getFacilityInfo.do',
        type: 'POST',
        data: { facilityName: facilityName }, 
        success: function(data) {
            console.log(data);
            facilityData = data.getfacilityInfo.facilityInfo;
            
            var facilityID = data.getfacilityInfo.facilityID;
            console.log('@@@@@@@@@@@@@@@'+facilityData);
            var facilityInfo = $('.facilityInfo');
            facilityInfo.empty();

            var formattedContent = facilityData.replace(/\n/g, '<br>');
            $('.facilityInfo').html(formattedContent);
			var facilityUse = data.getfacilityInfo.isUse;
     		
	         var facilityList = ''; // 조건문 밖에서 기본 값으로 빈 문자열로 미리 정의합니다.

	         if (responName == '시설관리') {
	             // responName이 '시설관리'일 때 수정 버튼과 삭제 버튼 추가
	             facilityList = '<div class="facilityEditDel" data-facilityid="' + facilityID + '">';
	             facilityList += '<i class="fas fa-cog editButton" data-toggle="editFacilityModal" data-target="#editFacilityModal"></i>';
	             facilityList += '<i class="fas fa-times deleteButton"></i>';
	             facilityList += '</div>';
	         }
	         var availabilityText = facilityUse ? '대여 불가능' : '대여 가능';
	         var availabilityClass = facilityUse ? 'userInfoX' : ''; // 대여 불가능일 때 userInfoX 클래스 추가

	         var availabilityHTML = '<div class="useInfo ' + availabilityClass + '" >' + availabilityText + '</div>';
	         facilityInfo.prepend(availabilityHTML);
	         $('.facilityMainInfo').empty();
	         $('.facilityMainInfo').append(data.getfacilityInfo.facilityName);
	         $('.facilityMainInfo').append(facilityList);	
            

			
        },
        error: function(error) {
            console.error('전송 실패');
        }
    });
}

function drawFacility(category, clickItem) {
    $.ajax({
        url: 'getFacilityName.do',
        type: 'POST',
        data: { category: category },
        success: function(data) {
            console.log(data.getfacilityName.facilityName);
            console.log(data.getfacilityName.facilityID);
            var facilityList = '<div>';
            for (var i = 0; i < data.getfacilityName.length; i++) {
                facilityList += '<div>';
                facilityList += '<div class="text" id="'+data.getfacilityName[i].facilityID+'">' + data.getfacilityName[i].facilityName + '</div>';

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

	swal({
		title: "시설을 삭제 하시겠습니까?",
		text: "삭제된 내용은 즉시 반영됩니다.",
		icon: "warning",
		buttons: ["취소","삭제"],
	})
	.then((isOkey) => {
		if (isOkey) {
			swal('식제가 완료되었습니다.','','success')
			.then((isOkey) => {
				if(isOkey){
					var deltxt = $(this).closest('.facilityMainInfo').text().trim(); // 수정된 부분
					console.log('@@@@@@@@'+deltxt);	
				    $.ajax({
				        url: 'delFacility.do',
				        type: 'post',
				        data: {deltxt: deltxt}, // 수정된 부분
				        success: function(response) {
				        },
				        error: function(error) {
				        	alert('삭제 실패: ' + error);
				        }
				    });				
				}
			})
		}
	});

});

$('#plusButton').on('click',function(){
	$('#addFacility').modal('show');
})
$('#addFacilitySubmit').on('submit', function(e) {
    e.preventDefault();
    
	swal({
		title:"시설을 추가하시겠습니까?",
		text: "추가된 내용은 즉시 반영됩니다.",
		icon: "success",
		buttons: ["취소","확인"],
	})
	.then((isOkey) => {
		if (isOkey) {
			swal('추가가 완료되었습니다.','','success')
			.then((isOkey) => {
				if(isOkey){
				    var category = $('#category').val();
				    var facilityName = $('#addfacilityName').val();
				    var facilityInfo = $("#summernote1").summernote('code')
				    $.ajax({
				        url: 'addFacility.do',
				        type: 'post',
				        data: {
				        	category: category,
				        	facilityName: facilityName,
				        	facilityInfo: facilityInfo
				        },
				        success: function(response) {
				        	$('#addFacility').modal('hide');
				        },
				        error: function(error) {
				            alert('업데이트 실패: ' + error);
				        }
				    });
					
				}
			})
		}
	});
    

});

$('#facilitySubmit').on('submit', function(e) {
    e.preventDefault();
    
	swal({
		title: "시설을 수정하시겠습니까?",
		text: "수정된 내용은 즉시 반영됩니다.",
		icon: "success",
		buttons: ["취소","확인"],
	})
	.then((isOkey) => {
		if (isOkey) {
			swal('수정이 완료되었습니다.','','success')
			.then((isOkey) => {
				if(isOkey){
				    var facilityName = $('#facilityName').val();
				    var facilityInfo = $("#summernote").summernote('code')
				    var facilityID = $('#facilityID').val();
				    console.log('@@@' + facilityID);
				    
				    $.ajax({
				        url: 'updateFacilityName.do',
				        type: 'post',
				        data: {
				            facilityName: facilityName,
				            facilityInfo: facilityInfo,
				            facilityID: facilityID
				        },
				        success: function(response) {
				        	$('#editFacilityModal').modal('hide');
				        },
				        error: function(error) {
				            alert('업데이트 실패: ' + error);
				        }
				    });
					
				}
			})
		}
	});
    
    

});

</script>
</html>