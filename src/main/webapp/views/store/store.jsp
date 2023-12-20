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
<div>지점 위치 <button id="branch">가산점</button><div>${branch.branchLocation}</div></div> 
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



// 지점 리스트
$(document).ready(function () {
    $.ajax({
        type: 'get',
        url: 'storeList.do',
        dataType: 'json',
        success: function (data) {
            if (data.length > 0) { // 배열에 데이터가 하나 이상 있는 경우
                console.log("경도 : " + data[0].x);
                console.log("위도 : " + data[0].y);
                initializeMap(data[0]);
                	console.log(data);
            } else {
                console.log("데이터가 없습니다.");
                console.log(data);
                	console.log("x / " +data.x);
            }
        },
        error: function (e) {
            console.log(e);
            console.log("데이터 가져오기 실패");
        }
    });
});

    function initializeMap(data) {
        var mapContainer = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(data.y, data.x),
            level: 3
        };

        var map = new kakao.maps.Map(mapContainer, options);

        for (var i = 0; i < branchList.length; i++) {
            var markerPosition = new kakao.maps.LatLng(branchList[i].latitude, branchList[i].longitude);

            var marker = new kakao.maps.Marker({
                position: markerPosition,
                title: branchList[i].branchName
            });

            marker.setMap(map);

            // 지점명을 인포윈도우로 표시
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="padding:5px;">' + branchList[i].branchName + '</div>'
            });

            kakao.maps.event.addListener(marker, 'mouseover', function () {
                infowindow.open(map, marker);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function () {
                infowindow.close();
            });
        }
    }

</script>
</html>