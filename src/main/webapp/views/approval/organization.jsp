<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">

<head>
<meta charset="UTF-8">
<!-- jsTree theme -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<style>

#line{
	width:290px; 
	font-size:13px;
      
}

.schbtn{
	float: right;
}


.cancel{
	cursor:pointer;
	width:15px;
	height:15px;
}

</style>
</head>
<body>
<%-- <jsp:include page="../side.jsp"></jsp:include> --%>

<button onclick="fSch()" class="btn btn-primary schbtn">검색</button>
<input type="text" id="schName" value="" class="form-control mb-2" placeholder="이름/부서/본부/지점명" style="width:70%">


<div id="jstree" ></div>
<!--     <div id="line-container">
        <div id="line">
        추가한 결재라인 그려지는곳
        </div>
       
    </div> -->

<script>

function fSch() {
    console.log("껌색할께영");
    $('#jstree').jstree(true).search($("#schName").val());
}

var loginId="${sessionScope.userInfo.employeeID}";
$(function () {
    // jstree 생성
    $("#jstree").jstree({
        'core': {
            'data': {
            	"url": "<c:url value='/personnel/getChart.do/'/>"+${isActive},
                "dataType": "JSON"
            }
        },
        'plugins': ["search"],
    });

    // jstree 생성 후, --
    $("#jstree").on("ready.jstree", function () {

	});
    
   
    var employeeID;
    var icon;
    var nodeText;

    
    // jstree 클릭 이벤트 처리
    $("#jstree").on('click', '.jstree-anchor', function (e) {
        var clickedNode = $(e.target).closest('li');
        employeeID = $("#jstree").jstree(true).get_node(clickedNode).id;
        nodeText = $("#jstree").jstree(true).get_node(clickedNode).text;
        //console.log(employeeID);
    });
    // 더블클릭시 이벤트(사원추가)
    $("#jstree").on('dblclick', '.jstree-anchor',function(e){
    	// console.log(loginId);
    	// 더블클릭시 값 전송
    	var clickedNode = $(e.target).closest('li');
    	var node = $("#jstree").jstree(true).get_node(clickedNode);
    	var icon = node.icon;
    	// console.log(icon);
    	if(icon!=true){	
    		 $.ajax({
 	        	url:"/Cocean/approval/getEmployeeID.do",
 	        	data:{employeeID:employeeID},
 	        	success:function(data){
 	        		console.log(data);
 	        		drawLine(data.employeeInfo,employeeID);

 	        	},
 	        	error:function(e){
 	        		console.log(e);
 	        	}
 	        });
    		sendEmployeedID(employeeID,nodeText);
    	}
    });

    function sendEmployeedID(employeeID,nodeText){
    	//console.log('값 보내기');
    	getEmployeeID(employeeID,nodeText);
    }

    function aaa(){
    	var abb= employeeID;
    	return abb;
    }

});

var employeeID;


function getAddedLineData(lineData){
	// console.log(lineData);
}


var remLine;

function getRemainedEmpID(remLine){
       //  console.log("getRemainedEmpID호출");
   
}

// 조직도에서 사원 선택해서 옆에 그리는 부분
function drawLine(employeeInfo, currentEmployeeID,nodeText) {
	if (currentEmployeeID == loginId) {
		 swal('지정할 수 없습니다.','','warning');
	} else {
	    employeeInfo.forEach(function (item, idx) {
	        var existingEmployee = $('#line').find('.employeeID[value="' + item.employeeID + '"]').length > 0;
	        var isRemLineEmpID = remLine.includes(currentEmployeeID);
	        var inRefTable = $('#refTable').find('.employeeID[value="' + item.employeeID + '"]').length > 0;

	        if (!isRemLineEmpID && !existingEmployee&&!inRefTable) { // 옆 라인, 본페이지에 추가되어있는 사원이 아니라면
	            var hqDepartmentRank = (item.hqName + '/' + item.departmentName + item.positionName).includes('-');
	            var content = '<div class="lineItem">';
	            content += '<select class="category" name="approvalCategory" style="width: 46px; font-size: 10px;"><option value="결재" selected="selected">결재</option><option value="합의">합의</option><option value="참조">참조</option></select>' + '\u00A0' + '\u00A0';
	            if (!hqDepartmentRank) {
	                content += '<label class="hqName">' + item.hqName + '</label>' + '/' + '<label class="departmentName">' + item.departmentName + '</label>' + '\u00A0' + '\u00A0';
	                content += '<label class="rank">' + item.positionName + '</label>' + '\u00A0' + '\u00A0';
	            }
	            content += '<label class="name">' + item.name + '</label>' + '<img src="<c:url value='/resource/img/cancel.png'/>" class="cancel" alt="삭제 아이콘">' + '<br/>';
	            content += '<input type="hidden" class="employeeID" value="' + item.employeeID + '"/>';
	            content += '<input type="hidden" class="positionName" value="' + item.positionName + '"/>';
	            content += '<input type="hidden" class="photo" value="' + item.serverFileName + '"/>';
	            content += '</div>';

	            $('#line').append(content);
	            appendCancel();
	        } else {
	        	swal('이미 지정된 사원입니다.','','warning');
	        }
	    });
	}
}
function appendCancel() { // 모달창에서 x
$('.cancel').off('click').on('click', function() {
	var lineItem = $(this).closest('.lineItem');
    var employeeID = lineItem.find('.employeeID').val();

    lineItem.remove();
	// console.log(employeeID);
});
}
var lineData;
// 모달창 결재라인 저장
function saveApprovalLine(lineData) {
	lineData=[];
   	
    $('.lineItem').each(function () {
        var category = $(this).find('.category').val();
        var hqName = $(this).find('.hqName').text();
        var departmentName = $(this).find('.departmentName').text();
        var rank = $(this).find('.rank').text();
        var name = $(this).find('.name').text();
        var employeeID = $(this).find('.employeeID').val();
        var positionName = $(this).find('.positionName').val();
        var photo = $(this).find('.photo').val();
        lineData.push({
            category: category,
            hqName: hqName,
            departmentName: departmentName,
            rank: rank,
            name: name,
            employeeID: employeeID,
            positionName: positionName,
            photo: photo
        });
    });
    // console.log(lineData);
    getApprovalLine(lineData);
    $('#line').empty();
    
}


</script>
</body>
</html>