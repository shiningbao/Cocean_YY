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
<div class="branchLocation">지점 위치 </div>

<div id="map" style="width:500px;height:400px;"></div>
<div class="produectList">상품 리스트</div>
<div class="ticketList">티켓 리스트</div>

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
new Promise((resolve, reject) => {
    // 첫 번째 Ajax 호출
    $.ajax({
        type: 'get',
        url: 'storeList.do',
        dataType: 'json',
        success: function (data) {
            console.log(data);
            console.log("x : " + data.documents[0].x);
            console.log("y : " + data.documents[0].y);
            initializeMap(data);
            resolve(); // 첫 번째 Ajax 호출 성공 시 resolve 호출
        },
        error: function (e) {
            console.log(e);
            console.log("첫 번째 Ajax 호출 실패");
            reject("첫 번째 Ajax 호출 실패"); // 첫 번째 Ajax 호출 실패 시 reject 호출
        }
    });
}).then(() => {
    // 두 번째 Ajax 호출
    return new Promise((resolve, reject) => {
        $.ajax({
            type: 'get',
            url: 'storeList.ajax',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                	console.log("두번째 ajax 호출 성공");
                	console.log(data.branchList[0].branchName);
                	
                	for (var i = 0; i < data.branchList.length; i++) {
                        console.log("지점 이름: " + data.branchList[i].branchName);

                        // 지점 정보를 <div class="branchLocation">에 동적으로 추가
                        $('.branchLocation').append('<button>' + data.branchList[i].branchName + '</button>');
                    } $('.branchLocation').append('<div>' + data.branchList[0].branchLocation + '</div>');

                	
                // infowindow(data);
                resolve(); // 두 번째 Ajax 호출 성공 시 resolve 호출
            },
            error: function (e) {
                console.log(e);
                console.log("두 번째 ajax 호출 실패");
                reject(); // 두 번째 Ajax 호출 실패 시 reject 호출
            }
        });
    });
}).catch((error) => {
    console.log("에러 발생: " + error);
});

	// 지도 그리기
    function initializeMap(data) {
        var mapContainer = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(data.documents[0].y, data.documents[0].x),
            level: 3
        };
		// 마커 표시
        var map = new kakao.maps.Map(mapContainer, options);

            var markerPosition = new kakao.maps.LatLng(data.documents[0].y, data.documents[0].x);
	
            var marker = new kakao.maps.Marker({
                position: markerPosition,
                title: data.documents[0].region_3depth_name
            });

            marker.setMap(map);

            // 지점명을 인포윈도우로 표시
    }
           /*  var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="padding:5px;">' + data.documents[0].region_3depth_name + '</div>'
            });

            kakao.maps.event.addListener(marker, 'mouseover', function () {
                infowindow.open(map, marker);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function () {
                infowindow.close();
            }); */
    function drawList(data){
    	console.log("drawList data : "+data);
    	 $('#branch').append(content);
    };
    

</script>
</html>