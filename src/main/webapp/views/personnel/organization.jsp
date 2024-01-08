<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<!-- jsTree theme -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>


<style>

.schbtn{
	float: right;
}


/* .jstree-default .jstree-node, .jstree-default .jstree-icon{
	background-image: url('<c:url value="/resource/img/icon2.jpg"/>') !important;
	background-size: 16px 16px;
} */
</style>
</head>
<body>
<%-- <jsp:include page="../side.jsp"></jsp:include> --%>
<div>
<button onclick="fSch()" class="btn btn-primary schbtn" >검색</button>
<input type="text" id="schName" value="" class="form-control mb-2" placeholder="이름/부서/본부/지점명" style="width:70%">
</div>
<div id="jstree"></div>

<script>
function fSch() {
    console.log("껌색할께영");
    $('#jstree').jstree(true).search($("#schName").val());
/*     var tree = $('#jstree').jstree(true);
    var selectedNode = tree.get_node(nodeId);

    if (selectedNode) {
        // 찾은 노드를 선택하고 화면에 표시하기
        tree.select_node(selectedNode);
        tree.show_node(selectedNode);
    } else {
        console.log("해당 ID를 가진 노드를 찾을 수 없습니다.");
    } */
}

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
    	console.log('----');

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
    // 더블클릭시 이벤트
    
    $("#jstree").on('dblclick', '.jstree-anchor',function(e){
    	// 더블클릭시 값 전송
    	var clickedNode = $(e.target).closest('li');
    	var node = $("#jstree").jstree(true).get_node(clickedNode);
    	var icon = node.icon;
    	console.log(icon);
    	if(icon!=true){
    		
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

</script>
</body>
</html>