<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=530dd95ca9b426f51d6a8307877fcb3f"></script>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>

<div>스토어 관리</div>
<div>지점 위치 <button id="branch">가산점</button></div> 
<div id="map" style="width:500px;height:400px;"></div>

</body>
<script>
//이미지 지도에서 마커가 표시될 위치입니다 
/* var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
    position: markerPosition
}; */


//store.jsp
storeList();

// 지점 리스트
function storeList() {
    $.ajax({
        type: 'get',
        url: 'storeList.do',
        data: {},
        dataType: 'json',
        success: function (data) {
            console.log(data);
            console.log("성공");
            initializeMap(data.branchList);
        },
        error: function (e) {
            console.log(e);
            console.log("실패");
        }
    });
}

function drawList(branchList) {
}

function initializeMap(branchList) {
    var container = document.getElementById('map');
    var firstBranch = branchList;

    if (firstBranch) {
        var options = {
            center: new kakao.maps.LatLng(firstBranch.branchLatitude, firstBranch.branchLongitude),
            level: 3
        };

        var map = new kakao.maps.Map(container, options);

        // 지도에 모든 지점의 마커를 추가할 수 있습니다.
        for (var i = 0; i < branchList.length; i++) {
            var markerPosition = new kakao.maps.LatLng(branchList[i].branchLatitude, branchList[i].branchLongitude);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            marker.setMap(map);
        }
    }
}

</script>
</html>