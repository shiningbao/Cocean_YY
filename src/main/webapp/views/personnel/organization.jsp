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


/* .jstree-default .jstree-node, .jstree-default .jstree-icon{
	background-image: url('<c:url value="/resource/img/icon2.jpg"/>') !important;
	background-size: 16px 16px;
} */
</style>
</head>
<body>
<%-- <jsp:include page="../side.jsp"></jsp:include> --%>
<input type="text" id="schName" value="">
<button onclick="fSch()">탐색</button>
<div id="jstree"></div>

<script>
/* $(function () {
    $("#jstree").jstree({
        'core': {
            'data': {
                "url": "getChart.do",
                "dataType": "JSON"
            }
        },
        'plugins': ["search"],
    }).bind('select_node.jstree', function (event, data) {
        // 클릭된 노드의 ID
        var nodeId = data.node.id;
        
        // 클릭된 노드의 부모 노드
        var parentNode = $('#jstree').jstree(true).get_node(data.node.parent);

        // 부모 노드의 자식 노드 목록
        var childrenNodes = parentNode.children;

        // 클릭된 노드를 제외한 다른 노드들의 ID 출력
        childrenNodes.forEach(function (childId) {
            if (childId !== nodeId) {
                var otherNode = $('#jstree').jstree(true).get_node(childId);
                console.log("다른 노드 ID: " + otherNode.id);
            }
        });
    });
}); */

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

    // jstree 클릭 이벤트 처리
    $("#jstree").on('click', '.jstree-anchor', function (e) {
        var clickedNode = $(e.target).closest('li');
        var employeeID = $("#jstree").jstree(true).get_node(clickedNode).id;
        console.log(employeeID);
        $.ajax({
        	url:"/Cocean/personnel/getEmployeeID.do",
        	data:{employeeID:employeeID},
        	success:function(data){
        		console.log(data);
        	},
        	error:function(e){
        		console.log(e);
        	}
        })
        // 이벤트 처리 추가
    });
});
    function fSch() {
        console.log("껌색할께영");
        $('#jstree').jstree(true).search($("#schName").val());
    }

</script>
</body>
</html>