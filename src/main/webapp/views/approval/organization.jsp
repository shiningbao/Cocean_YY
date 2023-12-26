<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">

<head>
<meta charset="UTF-8">
<!-- jsTree theme -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<style>
	
.jstree-default .jstree-themeicon-custom{
	background-image: url('<c:url value="/resource/img/icon1.jpg"/>') !important;
	background-size: 16px 16px; /* 이미지 크기를 기본 jstree 아이콘과 동일하게 조정하세요 /
/ 그 외에 필요한 스타일링을 추가하세요 */
} 

#schName{
	width: 200px;
}

#jstree-container {
    display: inline-block;
    /* 인라인 블록 요소로 배치 */
    vertical-align: top;
    /* 상단 정렬 */
   }

#line-container {
    display: inline-block;
    /* 인라인 블록 요소로 배치 */
    vertical-align: top;
    /* 상단 정렬 */
    margin-left: 10px;
    /* 왼쪽 여백 추가 (원하는 여백 크기로 조정) */
}

#line{
	width:290px; 
	font-size:13px;
      
}

.cancel{
	cursor:pointer;
}

/* .jstree-default .jstree-node, .jstree-default .jstree-icon{
	background-image: url('<c:url value="/resource/img/icon2.jpg"/>') !important;
	background-size: 16px 16px;
} 
*/
</style>
</head>
<body>
<%-- <jsp:include page="../side.jsp"></jsp:include> --%>
<div id="jstree-container">
        <input type="text" id="schName" value="">
        <button onclick="fSch()">검색</button>
        <div id="jstree"></div>
    </div>
    <div id="line-container">
        <div id="line">
        <!-- 추가한 결재라인 그려지는곳 -->
        </div>
        <button class="btn btn-primary" onclick="saveApprovalLine()" data-dismiss="modal">저장</button>
    </div>
<script>
$(function () {
    // jstree 생성
    $("#jstree").jstree({
        'core': {
            'data': {
                "url": "/Cocean/personnel/getChart.do",
                "dataType": "JSON"
            }
        },
        'plugins': ["search"],
    });

    // jstree 생성 후, --
    $("#jstree").on("ready.jstree", function () {

	});
    
    var employeeID;
    
    
    // jstree 클릭 이벤트 처리
    $("#jstree").on('click', '.jstree-anchor', function (e) {
        var clickedNode = $(e.target).closest('li');
        employeeID = $("#jstree").jstree(true).get_node(clickedNode).id;
        
        //console.log(employeeID);
    });
    // 더블클릭시 이벤트
    $("#jstree").on('dblclick', '.jstree-anchor',function(e){
    	// 더블클릭시 값 전송
    	var clickedNode = $(e.target).closest('li');
    	var node = $("#jstree").jstree(true).get_node(clickedNode);
    	var icon = node.icon;
    	console.log(icon);
    	if(icon!=true){	
    		 $.ajax({
    	        	url:"/Cocean/approval/getEmployeeID.do",
    	        	data:{employeeID:employeeID},
    	        	success:function(data){
    	        		console.log(data);
    	        		console.log(data.employeeInfo);
    	        		drawLine(data.employeeInfo);

    	        	},
    	        	error:function(e){
    	        		console.log(e);
    	        	}
    	        });
    		 
   			sendEmployeedID(employeeID);
    	}
    });
});
function fSch() {
    console.log("껌색할께영");
    $('#jstree').jstree(true).search($("#schName").val());
}

function sendEmployeedID(employeeID){
	// console.log('값 보내기');
	getEmployeeID(employeeID);
}

function drawLine(employeeInfo) {
    var content = '';
 	console.log(employeeInfo);
    employeeInfo.forEach(function(item, idx) {
    	  var hqDepartmentRank = (item.hqName + '/' + item.departmentName + item.rankName).includes('-');
    	  content += '<div class="lineItem">';
    	  content += '<select class="category" name="approvalCategory" style="width: 46px; font-size: 10px;"><option value="결재" selected="selected">결재</option><option value="합의">합의</option><option value="참조">참조</option></select>'+'\u00A0'+'\u00A0';
          if (!hqDepartmentRank) {
              content += '<label class="hqName">' + item.hqName + '</label>'+ '/' +'<label class="departmentName">'+ item.departmentName + '</label>'+'\u00A0'+'\u00A0';
              content += '<label class="rank">' + item.rankName + '</label>'+'\u00A0'+'\u00A0';
          }
          content += '<label class="name">' + item.name + '</label>' +'<label class="cancel">'+'\u00A0'+'\u00A0'+'\u00A0'+'x'+'</label>'+ '<br/>';
          content += '<input type="hidden" class="employeeID" value="' + item.employeeID + '"/>';
          content += '</div>'
    });

    $('#line').append(content);
    appendCancel();
   
}

function drawRef(employeeInfo) {
    var content = '';
 	console.log(employeeInfo);
    employeeInfo.forEach(function(item, idx) {
    	  var hqDepartmentRank = (item.hqName + '/' + item.departmentName + item.rankName).includes('-');
    	  content += '<div class="lineItem">';
          if (!hqDepartmentRank) {
              content += '<label class="hqName">' + item.hqName + '</label>'+ '/' +'<label class="departmentName">'+ item.departmentName + '</label>'+'\u00A0'+'\u00A0';
              content += '<label class="rank">' + item.rankName + '</label>'+'\u00A0'+'\u00A0';
          }
          content += '<label class="name">' + item.name + '</label>' +'<label class="cancel">'+'\u00A0'+'\u00A0'+'\u00A0'+'x'+'</label>'+ '<br/>';
          content += '<input type="hidden" class="employeeID" value="' + item.employeeID + '"/>';
          content += '</div>'
          console.log(item.employeeID);
    });

    $('#line').append(content);
    appendCancel();

   
}



function appendCancel() {
$('.cancel').off('click').on('click', function() {
	var lineItem = $(this).closest('.lineItem');
    var employeeID = lineItem.find('.employeeID').val();

    lineItem.remove();
	console.log(employeeID);
});
}
var lineData;
// 결재라인 저장
function saveApprovalLine(lineData) {
   	lineData = [];
    $('.lineItem').each(function () {
        var category = $(this).find('.category').val();
        var hqName = $(this).find('.hqName').text();
        var departmentName = $(this).find('.departmentName').text();
        var rank = $(this).find('.rank').text();
        var name = $(this).find('.name').text();
        var employeeID = $(this).find('.employeeID').val();
        lineData.push({
            category: category,
            hqName: hqName,
            departmentName: departmentName,
            rank: rank,
            name: name,
            employeeID: employeeID
        });
    });
    console.log(lineData);
    getApprovalLine(lineData);
    /*  $.ajax({
        url: "/Cocean/approval/saveApprovalLine.do",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(lineData),
        success: function (data) {
            console.log(data);
            location.reload();
            
        },
        error: function (e) {
            console.log(e);
        }
    });  */
    
}


</script>
</body>
</html>