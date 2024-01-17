<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<style>
/* th, td { */
/* 	border: 1px solid #ddd; */
/* 	padding: 8px; */
/* 	text-align: left; */
/*  	} */

/* th { */
/* 	background-color: #f4f4f4; */
/* } */

td{
	color:gray;
}
.headerInfo {
	font-size: 20px;
	margin-bottom: 5%;
}
#addButton ,.delButton{

    background: none;
	font-size:20px;
    border: none;

}
#plusButton , #plusDepartmentButton {
	font-size: 15px;
	float: right;
	background: none;
	border: none;
	padding: 8px;
}

.tab_menu {
	list-style: none;
	padding: 0;
	margin: 0;
}

.tab_menu li {
	display: inline-block;
	margin-right: 10px;
}

.tab_menu li a {
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 5px 5px 0 0;
	background-color: #f2f2f2;
}

.tab_menu li.active a {
	background-color: #fff;
}

.tab.active {
	color: grey; /* 회색으로 변경 */
	font-size: 100%; /* 글씨 크기 조정 */
}

.tab:hover {
	color: grey; /* 마우스 오버 시 글자 색상을 회색으로 변경 */
	font-size: 100%; /* 마우스 오버 시 글자 크기를 원래 크기로 변경 */
	cursor: pointer;
}
/* 탭 내용 숨김 */
.tab-content {
	display: none;
	padding: 10px;
	background-color: #fff;
	border-radius: 0 0 5px 5px;
}

/* 활성화된 탭 내용 표시 */
.tab-content.active {
	display: block;
}
/* table { */
/*   border: 1px #a39485 solid; */
/*   font-size: .9em; */
/*   box-shadow: 0 2px 5px rgba(0,0,0,.25); */
/*   width: 100%; */
/*   border-collapse: collapse; */
/*   border-radius: 5px; */
/*   overflow: hidden; */
/* } */
.editRank:hover  ,.editPosition:hover ,.edithq:hover ,.editdp:hover{
    /* 호버 시 적용될 스타일 */
    /* 예: 배경색 변경 */
    cursor: pointer;
    background-color: #f0f0f0;
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

.additional-buttons{
    position: absolute;
    top: 5vw;
    left: 24vw;
}
.table-header {
    background-color: lightgray;
    font-weight: bold;
    /* 다른 스타일 속성 추가 */
}

.divide_bar {
    box-shadow: 1px 1px 1px 0px #555555;
    display: inline-block;
    margin: -1px 19px;
    width: 1px;
    height: 24px;
    background: #bebebe;
    vertical-align: top;
}
.abc{
	display:flex;
}
</style>
</head>
<body>
<c:import url="/side"/>
	

<div class="container-fluid contentField">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">조직관리</h1>
	</div>


					<div class="additional-buttons" id="additionalButtons" style="display: none;">
						<button type="button" class="btn btn-primary mr-2 addhq" data-toggle="addhqModal" data-target="addhqModal">본부생성</button>
						<button type="button" class="btn btn-primary addDepartment" data-toggle="addDepartmentModal" data-target="addDepartmentModal">부서생성</button>
					</div>

	<div class="row">
		<div class="col-3">
			<div class="card shadow">
				<div class="card-body">
					<div style="margin-bottom: 20px">
						조직도
						<button id="plusDepartmentButton" data-toggle="select" data-target="select"><i class="fas fa-plus"></i>추가</button>
					</div>

	        <c:import url="/personnel/organization/0"/>

				</div>
			</div>
		</div>	
		
		<div class="col-9">
					<div class="card shadow" style="margin-bottom: 10px; padding: 17px; font-size: 16px;">
					
						<div>
							<ul class="tab_menu">
								<li data-tab="depart" class="tab">본부/부서</li>
								<span class="divide_bar"></span>
								<li data-tab="rank" class="tab">직급</li>
								<span class="divide_bar"></span>
								<li data-tab="position" class="tab">직책</li>
									
							</ul>
	
						</div>
					</div>
				<div class="card shadow">	
					<div class="card-body infoClass">
							<div class="tab-content" id="departTab" style="display: none;">
								본부/부서
							</div>
							
							<div class="tab-content" id="rankTab" style="display: none;">
								직급
							</div>
							
							<div class="tab-content" id="positionTab" style="display: none;">
								직책
							</div>
						
					</div>
					<div class="card-body psinfoClass">
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 직급모달 -->	
  <div class="modal fade" id="editmodal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">직급수정</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="editSubmit"> <!-- 입력폼 -->
            			<div class="form-group">
				            <label for="rankName">직급번호:</label>
				            <input type="text" class="form-control" name="rankID" readonly>
				        </div>
				        <div class="form-group">
				            <label for="rankName">직급명:</label>
				            <input type="text" class="form-control" name="rankName" required> 
				        </div>
				        <div class="form-group">
				            <label for="isActive">활성화 여부:</label>
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" value="1" name="isActive">
				                <label class="form-check-label" for="isActiveCheckbox">활성화</label>
				            </div>
				        </div>
				        <div style="float:right">
				        <button class="btn btn-outline-primary cancleRank" type="button">취소</button>
						<button class="btn btn-primary saveRank" type="submit">저장</button>
						</div>
				        
            </form>
          </div>
        </div>
      </div>
    </div>
    <!--직책 모달 -->	
  <div class="modal fade" id="editPositionmodal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">직책수정</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="editPositionSubmit"> <!-- 입력폼 -->
            			<div class="form-group">
				            <label for="positionName">직책번호:</label>
				            <input type="text" class="form-control" name="positionID" readonly>
				        </div>
				        <div class="form-group">
				            <label for="rankName">직책명:</label>
				            <input type="text" class="form-control" name="positionName" required> 
				        </div>
				        <div class="form-group">
				            <label for="isActive">활성화 여부:</label>
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" value="true" name="isActive">
				                <label class="form-check-label" for="isActiveCheckbox">활성화</label>
				            </div>
				        </div>
				        <div style="float:right">
				        <button class="btn btn-outline-primary canclePosition" type="button">취소</button>
						<button class="btn btn-primary savePositon" type="submit">저장</button>
				        </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
       <!--직책 추가 모달 -->	
  <div class="modal fade" id="addPositionmodal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">직책생성</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="addPositionSubmit"> <!-- 입력폼 -->
            			<div class="form-group">
				            <label for="positionName">직책번호:</label>
				            <input type="text" class="form-control" name="addpositionID" required>
				             <div id="duplicateMsg" style="display: none; color: red;">직책번호 중복</div>
				        </div>
				        <div class="form-group">
				            <label for="rankName">직책명:</label>
				            <input type="text" class="form-control" name="addpositionName" required> 
				        </div>
				        <div class="form-group">
				            <label for="isActive">활성화 여부:</label>
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" value="1" name="addisActive">
				                <label class="form-check-label" for="isActiveCheckbox">활성화</label>
				            </div>
				        </div>
				        <div style="float:right">
				        <button class="btn btn-outline-primary cancleAddPosition" type="button">취소</button>
						<button class="btn btn-primary addPositon" type="submit">생성</button>
				        </div>
            </form>
          </div>
        </div>
      </div>
    </div>		
    
  <div class="modal fade" id="addRankmodal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">직급생성</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="addRankSubmit"> <!-- 입력폼 -->
            			<div class="form-group">
				            <label for="positionName">직급번호:</label>
				            <input type="text" class="form-control" name="addRankID" required>
				             <div id="duplicateMsg2" style="display: none; color: red;">직급번호 중복</div>
				        </div>
				        <div class="form-group">
				            <label for="rankName">직급명:</label>
				            <input type="text" class="form-control" name="addRankName" required> 
				        </div>
				        <div class="form-group">
				            <label for="isActive">활성화 여부:</label>
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" value="1" name="add2isActive">
				                <label class="form-check-label" for="isActiveCheckbox">활성화</label>
				            </div>
				        </div>
				        <div style="float:right">
				        <button class="btn btn-outline-primary cancleAddRank" type="button">취소</button>
						<button class="btn btn-primary addRank" type="submit">생성</button>
				        </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    

    
    
    
      <div class="modal fade" id="addDepartmentModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">부서생성</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="addDepartmentSubmit"> <!-- 입력폼 -->
						<div class="form-group">
				            <label for="rankName">지점명:</label>
				            <select id="branchSelect" class="psSelect"></select>
				            
				        </div>
				        <div class="form-group">
				            <label for="rankName">본부명:</label>
				            <select id="deSelect" class="psSelect"></select>
				            
				        </div>
				        
				        <div class="form-group">
				            <label for="rankName">부서명:</label>
				            <input type="text" class="form-control" name="addDepartmentName" required> 
				        </div>
				        <div class="form-group">
				             <label for="rankName">담당명:</label>
				             
							    <div id="responNames" >
							    	<div class="abc">
							        <input type="text" class="form-control" name="responsibility[0].category" style="width: 80%; margin-bottom: 20px " placeholder="1개이상 담당 입력" required>
							        <button id="addButton" onclick="addRowRs()"type="button">+</button>
							    	</div>
							    </div>	
							    	
							    
							    
				        </div>
				        <div class="form-group">
				            <label for="isActive">활성화 여부:</label>
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" value="1" name="dpisActive">
				                <label class="form-check-label" for="isActiveCheckbox">활성화</label>
				            </div>
				        </div>
				        <div style="float:right">
				        <button class="btn btn-outline-primary cancleAdddp" type="button">취소</button>
						<button class="btn btn-primary addPositon" type="submit">생성</button>
				        </div>
            </form>
          </div>
        </div>
      </div>
    </div>    			
    
      <div class="modal fade" id="addhqModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">본부생성</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="addhqSubmit"> <!-- 입력폼 -->
						<div class="form-group">
				            <label for="rankName">지점명:</label>
				            <select id="branchSelectHq" class="psSelect"></select>
				            
				        </div>
				        
				        <div class="form-group">
				            <label for="rankName">본부명:</label>
				            <input type="text" class="form-control" name="addhqName" required> 
				        </div>
				        <div class="form-group">
				            <label for="isActive">활성화 여부:</label>
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" value="1" name="hqisActive">
				                <label class="form-check-label" for="isActiveCheckbox">활성화</label>
				            </div>
				        </div>
				        <div class="float-right">
				        <button class="btn btn-outline-primary cancleAddhq" type="button">취소</button>
						<button class="btn btn-primary addPositon" type="submit">생성</button>
						</div>
				        
            </form>
          </div>
        </div>
      </div>
    </div>
    
          <div class="modal fade" id="edithqModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">본부수정</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="edithqSubmit"> <!-- 입력폼 -->

				        
				        <div class="form-group">
				            <label for="positionName">본부번호:</label>
				            <input type="text" class="form-control " name="hqID" id="edithqID" readonly>
				        </div>
				        <div class="form-group">
				            <label for="rankName">본부명:</label>
				            <input type="text" class="form-control" name="hqName" id="edithqName" required> 
				        </div>
				        <div class="form-group">
				            <label for="isActive">활성화 여부:</label>
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" value="true" name="edithqisActive" id="edithqisActive">
				                <label class="form-check-label" for="isActiveCheckbox">활성화</label>
				            </div>
				        </div>
				        <div class="float-right">
				        <button class="btn btn-outline-primary cancleEditHq" type="button">취소</button>
						<button class="btn btn-primary savePositon" type="submit">저장</button>
				        </div>
            </form>
          </div>
        </div>
      </div>
    </div>   
    
          <div class="modal fade" id="editdpModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">부서수정</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form id="editdpSubmit"> <!-- 입력폼 -->
				        <div class="form-group">
				            <label for="positionName">부서번호:</label>
				            <input type="text" class="form-control" name="departmentID"  id="departmentID"readonly>
				        </div>
				        <div class="form-group">
				            <label for="rankName">부서명:</label>
				            <input type="text" class="form-control" name="departmentName" id="departmentName" required> 
				        </div>
				        <div class="form-group">
				            <label for="isActive">활성화 여부:</label>
				            <div class="form-check">
				                <input class="form-check-input" type="checkbox" value="true" name="editdpisActive" id="editdpisActive">
				                <label class="form-check-label" for="isActiveCheckbox">활성화</label>
				            </div>
				        </div>
				        <div class="float-right">
				        <button class="btn btn-outline-primary cancleEditDp" type="button">취소</button>
						<button class="btn btn-primary savePositon" type="submit">저장</button>
				        </div>
				        
            </form>
          </div>
        </div>
      </div>
    </div>       						
			
</div>

<c:import url="/footer"/>
</body>

<script>
$('#branchSelect').change(function() {
    onBranchSelectChange();
    console.log('지점변경!!!');
});

$.ajax({
    url: 'getBranch.do',
    success: function(data) {
        console.log(data);
        data.forEach(function(option) {
            $('#branchSelect').append($('<option>', {
                value: option.branchID,
                text: option.branchName
            }));
            $('#branchSelectHq').append($('<option>', { // branchSelect2에도 append
                value: option.branchID,
                text: option.branchName
            }));
        });
        $('#branchSelect, #branchSelectHq').val('1').trigger('change'); // branchSelect와 branchSelect2 둘 다 trigger
    },
    error: function(e) {
        console.log(e);
    }
});


function onBranchSelectChange() {
    console.log('지점 선택시 본부항목 변경!!!!!!!!!!!!!!!!!');
var branchID = $('#branchSelect').val();
    console.log(branchID);
    $.ajax({
        url: 'getBranchOrgID.do',
        method: 'GET',
        data: { branchID: branchID },
        success: function(data) {
            console.log(data);
            $('#deSelect').empty();
            data.forEach(function(option, index) {
                $('#deSelect').append($('<option>', {
                    value: option.hqID,
                    text: option.hqName
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

	



$('.tab').removeClass('active');
$('.tab-content').removeClass('active');

$('li[data-tab="depart"]').addClass('active');
$('#departTab').addClass('active');
drawloadDp();

var member = 0;
var thisHqMembers = 0;
$(".tab").click(function() {
    $('.tab').removeClass('active');
    $('.tab-content').removeClass('active');

    $(this).addClass('active');

    var tabContentId = $(this).data('tab');
    $('#' + tabContentId).addClass('active');

    $(".tab-content").hide();

    var tabId = $(this).attr("data-tab");
   	$('input[name="tabID"]').val(tabId);
   	if(tabId=='rank'){
   		drawRank()
   	}else if(tabId=='position'){
   		drawPosition();
   	}else if(tabId=='depart'){
   		
   		drawDp();
   	}
    $("#" + tabId + "Tab").show();
    
});


var employeeID;
var nodeText


var selectedDepartmentInfo;
console.log(selectedDepartmentInfo);
function drawloadDp(){
	var content ='<div style="color:darkgrey">' +
    '<span> * 조직도에서 본부나 부서를 선택해주세요 *</span>' +
    '</div>';
    $(".infoClass").empty();
    $(".infoClass").append(content);
}


function get1EmployeeID(employeeID, nodeText) {
    $.ajax({
        url: 'getEmployeeInfo.do',
        type: 'post',
        data: {
            employeeID: employeeID,
            nodeText: nodeText
        },
        success: function (data) {

            console.log(data.nodata);
            console.log(data);
            var dpInfo = data.dpInfo;
            var hqInfo = data.hqInfo;
            var nodata = data.nodata;
            member = data.thisDepartmentMembers;
            thisHqMembers = data.thisHqMembers;
            console.log('@@@@@@@@@@@@@@@member =='+member);
            console.log('@@@@@@@@@@@@@@@thisHqMembers =='+thisHqMembers);
            $('.tab').removeClass('active');
            $('.tab-content').removeClass('active');
            $('li[data-tab="depart"]').addClass('active');
            $('#departTab').addClass('active');

            if (data.dpInfo) {
                var content =
                    '<div class="headerInfo">' +
                    '<span> 부서관리 ('+data.dpInfo.totalEmployee+'명) </span>'+
                    '</div>' +
                    '<table class="table table-hover">' +
                    '<colgroup> <col width="30%"> <col width="70%"> </colgroup>' +
                    '<tr><th colspan="col">부서번호</th><td>' + data.dpInfo.departmentID + '</td></tr>' +
                    '<tr><th colspan="col">부서명</th><td class="editdp" data-toggle="editdpModal" data-target="#editdpModal" data-departmentname="' + data.dpInfo.departmentName + '"  data-departmentid="' + data.dpInfo.departmentID + '" data-isactive="' + data.dpInfo.isActive + '">' +
                    data.dpInfo.departmentName +
                    '<i class="fas fa-edit ml-2"></i>' +
                	'</td></tr>' +
                    '<tr><th colspan="col">활성화/비활성화</th><td>' + (data.dpInfo.isActive == 1 ? '활성화' : '비활성화') + '</td></tr>' +
                    '<tr><th colspan="col">상위본부</th><td>' + data.dpInfo.hqName + '</td></tr>' +
                    '</table>';
                    
//                     var psContent = '<div>';
//                     for (var i = 0; i < dmdata.length; i++) {
//                         if (dmdata[i].thisDepartmentMembers && dmdata[i].thisDepartmentMembers.name) {
//                             psContent += '<span>' + dmdata[i].thisDepartmentMembers.name + '</span>';
//                         }
//                     }
//                     psContent += '</div>';
                    
                selectedDepartmentInfo = content;
                $(".infoClass").empty().append(content);
            } else if (data.hqInfo) {
                var contentHq =
                    '<div class="headerInfo">' +
                    '<span> 본부관리 </span>'+
                    '</div>' +
                    '<table class="table table-hover">' +
                    '<colgroup> <col width="30%"> <col width="70%"> </colgroup>' +
                    '<tr><th colspan="col">본부번호</th><td>' + data.hqInfo.hqID + '</td></tr>' +
                    '<tr><th colspan="col">본부명</th><td class="edithq" data-toggle="edithqModal" data-target="#edithqModal" data-hqname="' + data.hqInfo.hqName + '"  data-hqid="' + data.hqInfo.hqID + '" data-isactive="' + data.hqInfo.isActive + '">' +
                    data.hqInfo.hqName +
                    '<i class="fas fa-edit ml-2"></i>' +
                	'</td></tr>'+
                    '<tr><th colspan="col">활성화/비활성화</th><td>' + (data.hqInfo.isActive == 1 ? '활성화' : '비활성화') + '</td></tr>' +
                    '<tr><th colspan="col">상위지점</th><td>' + data.hqInfo.branchName + '</td></tr>' +
                    '</table>';
                    
                selectedDepartmentInfo = contentHq;
                $(".infoClass").empty().append(contentHq);
            } else if (!data || $.isEmptyObject(data)) {
                console.log('aaaaaaaaa');
                var content = '<div style="color:darkgrey">' +
                    '<span> * 조직도에서 본부나 부서를 선택해주세요 *</span>' +
                    '</div>';
                $(".infoClass").empty();
                $(".infoClass").append(content);
            }
            
            $('#edithqSubmit').on('submit', function(e) {
                e.preventDefault();
                console.log(thisHqMembers);
                if(thisHqMembers==0){
                	
                var hqID = $('#edithqID').val();
                var hqName = $('#edithqName').val();
                var isActive = $('#edithqisActive').is(':checked');
                $.ajax({
                    url: 'editHq.do',
                    type: 'post',
                    data: { hqID:hqID,
                    	 hqName:hqName
                    	, isActive:isActive},
                    success: function(response) {
            			swal({
            				title: response.message,
            				button: "확인"
            			}).then((isOkey) => {
            				if(isOkey){
            					location.href=location.href;
            				}
            			});
            		
                    },
                    error: function(error) {
                    	alert('업데이트 실패: ' + error);
                    }
                });
                }else{
                	swal('소속 부서를 비활성화 처리해주세요','','warning');
                }
            });

            $('#editdpSubmit').on('submit', function(e) {
            	e.preventDefault();
            	console.log('@@@@@@@member!!!!!!!!@@'+member);
            	if(member==0){
            		
            	var departmentID = $('#departmentID').val();
                var departmentName = $('#departmentName').val();
                var isActive = $('#editdpisActive').is(':checked');
                    $.ajax({
                        url: 'editDp.do',
                        type: 'post',
                        data: { departmentID:departmentID,
                        	departmentName:departmentName
                        	, isActive:isActive},
                        success: function(response) {
            				console.log(response);
            				swal({
            					title: response.message,
            					button: "확인"
            				}).then((isOkey) => {
            					if(isOkey){
            						location.href=location.href;
            					}
            				});
                		
                        },
                        error: function(error) {
                        	alert('업데이트 실패: ' + error);
                        }
                    });
            	}else{
            		swal('소속 부서원을 옮겨주세요','','warning');
            	}


            });




        },
        error: function (e) {
            console.log(e);
        }
    });
}
$(document).on('click','.edithq',function(){
	console.log(this);
    var hqName = $(this).text();// 클릭한 직급명 가져오기
    var hqID = $(this).data('hqid');
    var edithqisActive = $(this).data('isactive');
    console.log('hqID:', hqID);
    console.log('hqName:', hqName);
    console.log('Is Active:', edithqisActive);
    $('#edithqID').val(hqID); // #edithqmodal 바깥의 ID가 아닌, 모달 내부의 ID 사용
    $('#edithqName').val(hqName);
    $('#edithqisActive').prop('checked', edithqisActive);
    
    $('#edithqModal').modal('show'); // 모달 띄우기
});

$('.cancleRank').on('click',function(){
	console.log('click');
	 $('#editmodal').modal('hide');
});
$('.cancleEditHq').on('click',function(){
	$('#edithqModal').modal('hide');
})

$('.canclePosition').on('click',function(){
	$('#editPositionmodal').modal('hide');
})

$('.cancleAddPosition').on('click',function(){
	$('#addPositionmodal').modal('hide');
})

$('.cancleAddRank').on('click',function(){
	$('#addRankmodal').modal('hide');
})

$(document).on('click','.editdp',function(){
	console.log(this);
    var departmentName = $(this).text(); // 클릭한 직급명 가져오기
    var departmentID = $(this).data('departmentid');
    var editdpisActive = $(this).data('isactive');
   	$('#departmentID').val(departmentID);
    $('#departmentName').val(departmentName);
    $('#editdpisActive').prop('checked', editdpisActive);
    
    $('#editdpModal').modal('show'); // 모달 띄우기
	
});

function drawDp() {
    var content = '';
    if (selectedDepartmentInfo != null) {
        content += selectedDepartmentInfo;
    }


    $(".infoClass").empty();
    $(".infoClass").append(content);
}

function drawRank(){
	$.ajax({
		url:'getRankNameOrg.do',
		type:'post',
		success:function(data){
			console.log(data);
			var content = '<div class="headerInfo">' +
		    '<span>직급관리</span>' +
		    '</div>' +
		    '<div class="contentInfo">' +
		    '<button id="plusButton" class=" rankAdd" data-toggle="addRankmodal" data-target="#addRankmodal"><i class="fas fa-plus"></i>추가</button>'+
		    '<table class="table table-hover">' +
		    '<colgroup> <col width="30%"> <col width="30%"> <col width="40%"> </colgroup>' +
		    '<tr>' +
		    '<th scope="col">직급번호</th>' +
		    '<th scope="col">직급명</th>' +
		    '<th scope="col">활성화/비활성화</th>' +
		    '</tr>';
			data.forEach(function(option) {
			    content += '<tr>' +
		        '<td>' + option.rankID + '</td>' +
		        '<td class="editRank" data-toggle="editmodal" data-target="#editmodal" data-rankid="' + option.rankID + '" data-isactive="' + option.isActive + '">' +
		        option.rankName +
		        '<i class="fas fa-edit ml-2"></i>' +
		    	'</td>' +
		        '<td>' + (option.isActive == 1 ? '활성화' : '비활성화') + '</td>'
		        
		        '</tr>';
			});
			content += '</table>' +

		    '</div>';
			$(".infoClass").empty();
		    $(".infoClass").append(content);
		    
		    $(".editRank").on("click", function () {
                var rankName = $(this).text(); // 클릭한 직급명 가져오기
                var rankID = $(this).data('rankid');
                var isActive = $(this).data('isactive');
                console.log('Rank ID:', rankID);
                console.log('Rank Name:', rankName);
                console.log('Is Active:', isActive);
                $('#editmodal input[name="rankID"]').val(rankID);
                $('#editmodal input[name="rankName"]').val(rankName);
                $('#editmodal input[name="isActive"]').prop('checked', isActive);
                
                $('#editmodal').modal('show'); // 모달 띄우기
            });
			
		},
		error:function(e){
			console.log(e);
		}
	});
}


function drawPosition(){
	$.ajax({
		url:'getPositionNameOrg.do',
		type:'post',
		success:function(data){
			console.log(data);
			var content = '<div class="headerInfo">' +
		    '<span>직책관리</span>' +
		    '</div>' +
		    '<div class="contentInfo">' +
		    '<button id="plusButton" class ="positionAdd" data-toggle="addPositionmodal" data-target="#addPositionmodal" ><i class="fas fa-plus"></i>추가</button>'+
		    '<table class="table table-hover">' +
		    '<colgroup> <col width="30%"> <col width="30%"> <col width="40%"> </colgroup>' +
		    '<tr>' +
		    '<th scope="col">직책번호</th>' +
		    '<th scope="col">직책명</th>' +
		    '<th scope="col">활성화/비활성화</th>' +
		    '</tr>';
			data.forEach(function(option,index) {
			    content += '<tr>' +
		        '<td>' + option.positionID + '</td>' +
		        '<td class="editPosition" data-toggle="editmodal" data-target="#editmodal" data-positionid="' + option.positionID + '" data-isactive="' + option.isActive + '">' +
		        option.positionName +
		        '<i class="fas fa-edit ml-2"></i>' +
		    	'</td>' +
		        '<td>' + (option.isActive == 1 ? '활성화' : '비활성화') + '</td>'
		        '</tr>';
			});
			content += '</table>' +
		    '</div>';
			$(".infoClass").empty();
		    $(".infoClass").append(content);
		    
		    $(".editPosition").on("click", function () {
                var positionName = $(this).text(); // 클릭한 직책명 가져오기
                var positionID = $(this).data('positionid');
                var isActive = $(this).data('isactive');
                console.log('Position ID:', positionID);
                console.log('Position Name:', positionName);
                console.log('Is Active:', isActive);
                $('#editPositionmodal input[name="positionID"]').val(positionID);
                $('#editPositionmodal input[name="positionName"]').val(positionName);
                $('#editPositionmodal input[name="isActive"]').prop('checked', isActive);
                
                $('#editPositionmodal').modal('show'); // 모달 띄우기
            });
			
		},
		error:function(e){
			console.log(e);
		}
	});
}

$(document).on('click','.positionAdd',function(){
	console.log('positionAdd');	
	$('#addPositionmodal').modal('show');
});




$(document).on('click','.rankAdd',function(){
	console.log('rankAdd');	
	$('#addRankmodal').modal('show');
});


function send1EmployeedID(employeeID,nodeText){
	//console.log('값 보내기');
	get1EmployeeID(employeeID,nodeText);
}



$('#editSubmit').on('submit', function(e) {
    e.preventDefault();

    var rankID = $('input[name="rankID"]').val();
    var rankName = $('input[name="rankName"]').val();
    var isActive = $('input[name="isActive"]').is(':checked');
    
    $.ajax({
        url: 'updateRank.do',
        type: 'post',
        data: {rankID:rankID 
        	, rankName:rankName
        	, isActive:isActive},
        success: function(response) {
        	console.log(response);
            swal('수정완료','','success');
        	
		
            $('#editmodal').modal('hide');
            drawRank();
		
        },
        error: function(error) {
        	alert('업데이트 실패: ' + error);
        }
    });
});

$('#editPositionSubmit').on('submit', function(e) {
    e.preventDefault();

    var positionID = $('input[name="positionID"]').val();
    var positionName = $('input[name="positionName"]').val();
    var isActive = $('input[name="isActive"]').is(':checked');
    $.ajax({
        url: 'updatePosition.do',
        type: 'post',
        data: {positionID:positionID 
        	, positionName:positionName
        	, isActive:isActive},
        success: function(response) {
        	swal('수정완료','','success');
		
            $('#editPositionmodal').modal('hide');
            drawPosition();
		
        },
        error: function(error) {
        	alert('업데이트 실패: ' + error);
        }
    });
});

$('.cancleAddhq').on('click',function(){
	$('#addhqModal').modal('hide');
});

$('.cancleAdddp').on('click',function(){
	$('#addDepartmentModal').modal('hide');
})
$('#addPositionSubmit').on('submit', function(e) {
    e.preventDefault();

    var positionID = $('input[name="addpositionID"]').val();
    var positionName = $('input[name="addpositionName"]').val();
    var isActive = $('input[name="addisActive"]').is(':checked');
    console.log(positionID);
    $.ajax({
        url: 'addPostion.do',
        type: 'post',
        data: {positionID:positionID 
        	, positionName:positionName
        	, isActive:isActive},
        success: function(response) {
        	swal('생성완료','','success');
		
            $('#addPositionmodal').modal('hide');
            drawPosition();
		
        },
        error: function(error) {
        	alert('업데이트 실패: ' + error);
        }
    });
});

$('#addRankSubmit').on('submit', function(e) {
    e.preventDefault();

    var rankID = $('input[name="addRankID"]').val();
    var rankName = $('input[name="addRankName"]').val();
    var isActive = $('input[name="add2isActive"]').is(':checked');
    $.ajax({
        url: 'addRank.do',
        type: 'post',
        data: {rankID:rankID 
        	, rankName:rankName
        	, isActive:isActive},
        success: function(response) {
        	swal('생성완료','','success');
		
            $('#addRankmodal').modal('hide');
            drawRank();
		
        },
        error: function(error) {
        	alert('업데이트 실패: ' + error);
        }
    });
});
var counter = 0; // 입력 필드를 구분하기 위한 카운터 변수

function addRowRs() {
    counter++;
    
    var newInput = $('<input>', {
        type: 'text',
        class: 'form-control',
        name: 'responsibility[' + counter + '].category',
        style: 'width: 80%; margin-bottom:20px;',
        required: true
    });

    var delButton = $('<button>', {
        text: '-',
        class:'delButton',
        click: function() {
            $(this).parent().remove();
        }
    });

    var plusButton = $('<button>', {
        text: '+',
        id: 'addButton', // 새로운 행을 추가할 버튼
        type: 'button',
        click: function() {
            addRowRs();
        }
    });

    var newRow = $('<div class="abc">').append(newInput).append(delButton).append(plusButton);
    $('#responNames').append(newRow);
}


$('#addDepartmentSubmit').on('submit', function(e) {
    e.preventDefault();

    var hqID = $('#deSelect').val();
    var departmentName = $('input[name="addDepartmentName"]').val();
    var isActive = $('input[name="dpisActive"]').is(':checked');
    var responsibility = [];
    $('input[name^="responsibility"]').each(function() {
    	var value = $(this).val();
        responsibility.push(value);
    });
    $.ajax({
        url: 'addDepartment.do',
        type: 'post',
        data: {hqID:hqID 
        	, departmentName:departmentName
        	, isActive:isActive
        	,responsibility:responsibility},
        success: function(response) {
			swal({
				title: response.message,
				button: "확인"
			}).then((isOkey) => {
				if(isOkey){
					location.href=location.href;
				}
			});
        	
		
        },
        error: function(error) {
        	alert('업데이트 실패: ' + error);
        }
    });
});

$('#addhqSubmit').on('submit', function(e) {
    e.preventDefault();

    var branchID = $('#branchSelectHq').val();
    var hqName = $('input[name="addhqName"]').val();
    var isActive = $('input[name="hqisActive"]').is(':checked');
    $.ajax({
        url: 'addhq.do',
        type: 'post',
        data: {branchID:branchID 
        	, hqName:hqName
        	, isActive:isActive},
        success: function(response) {
			swal({
				title: response.message,
				button: "확인"
			}).then((isOkey) => {
				if(isOkey){
					location.href=location.href;
				}
			});
		
        },
        error: function(error) {
        	alert('업데이트 실패: ' + error);
        }
    });
});





$('input[name="addpositionID"]').on('focusout',function(){
	var addpositionID = $('input[name="addpositionID"]').val();
	console.log(addpositionID);
	$.ajax({
		url:'checkDuplicateAddpositionID.do',
		type:'POST',
		data:{addpositionID:addpositionID},
		success:function(result){
			if(result== true){
				$('#duplicateMsg').css('display', 'block');
				$('input[name="addpositionID"]').val('');
			}else{
				$('#duplicateMsg').css('display', 'none');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
})

$('input[name="addRankID"]').on('focusout',function(){
	var addRankID = $('input[name="addRankID"]').val();
	console.log(addRankID);
	$.ajax({
		url:'checkDuplicateAddRankID.do',
		type:'POST',
		data:{addRankID:addRankID},
		success:function(result){
			if(result== true){
				$('#duplicateMsg2').css('display', 'block');
				$('input[name="addRankID"]').val('');
			}else{
				$('#duplicateMsg2').css('display', 'none');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
})

var isAdditionalButtonsVisible = false;

$('#plusDepartmentButton').on('click', function () {
    isAdditionalButtonsVisible = !isAdditionalButtonsVisible;

    if (isAdditionalButtonsVisible) {
        $('.additional-buttons').show();
    } else {
        $('.additional-buttons').hide();
    }
});

$('.addDepartment').on('click',function(){
	$('#addDepartmentModal').modal('show');
})
$('.addhq').on('click',function(){
	$('#addhqModal').modal('show');
})


$('.cancleEditDp').on('click',function(){
	console.log('aaaa');
	$('#editdpModal').modal('hide');
})

$("#jstree").on('click', '.jstree-anchor', function (e) {
	 
    var clickedNode = $(e.target).closest('li');
    employeeID = $("#jstree").jstree(true).get_node(clickedNode).id;
    
    nodeText = $("#jstree").jstree(true).get_node(clickedNode).text;
    console.log(employeeID);
    console.log(nodeText);
    send1EmployeedID(employeeID,nodeText);


    drawDp();
    //console.log(employeeID);
});

</script>
</html>