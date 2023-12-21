<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=530dd95ca9b426f51d6a8307877fcb3f"></script>
</head>
<style>
.listTable {
    overflow: auto;
    width: 500px;
    height: 100px; /* 디자인에 맞게 더 큰 값을 설정하세요 */
}

table, th, td{
border: 1px solid gray;
}
</style>
<body>
<jsp:include page="../side.jsp"></jsp:include>

<div>스토어 관리 </div>
<div class="branchLocation">지점 위치 </div>
<div id="map" style="width:500px;height:400px;"></div>
<div class="productList">상품 리스트
	<input type="text" id="searchProduct" placeholder="검색어 입력">
	<button id="search">검색</button>
	<div class="listTable">
	<table>
	</table>
	</div>
	<button type="button" onclick="location.href='storeProductRegister.go'">등록</button>
</div>

<div class="ticketList">티켓 리스트</div>

</body>
<script>
var matchedProductList;

// 지점 리스트 지도에 표시
new Promise((resolve, reject) => {
    // 첫 번째 Ajax 호출
    // 카카오 지도 api 를 사용해서 지도 그리기
    $.ajax({
        type: 'get',
        url: 'storeList.do',
        dataType: 'json',
        success: function (data) {
        	console.log("첫번째 ajax 호출 성공");
            console.log(data);
            console.log("x : " + data.documents[0].x);
            console.log("y : " + data.documents[0].y);
            console.log("------------------");
            initializeMap(data);
            resolve(data); // 첫 번째 Ajax 호출 성공 시 resolve 호출
        },
        error: function (e) {
            console.log(e);
            console.log("첫 번째 Ajax 호출 실패");
            reject("첫 번째 Ajax 호출 실패"); // 첫 번째 Ajax 호출 실패 시 reject 호출
        }
    });
}).then((apiResult) => {
    // 두 번째 Ajax 호출
    // 데이터로 받아온 지점의 위도,경도를 가지고 그 지점에 해당하는 상품, 티켓 리스트 뿌려주기
    return new Promise((resolve, reject) => {
        $.ajax({
            type: 'get',
            url: 'storeList.ajax',
            dataType: 'json',
            success: function (data) {
                	console.log("두번째 ajax 호출 성공");
                	console.log(data);
                	
                 	// 첫 번째 Ajax 결과의 x, y 값과 일치하는 branch 찾기
                    var matchedBranch = null;
                    for (var i = 0; i < data.branchList.length; i++) {
                        var branch = data.branchList[i];
                        console.log(branch);
                        console.log("api x 값 / "+ apiResult.documents[0].x);
                        console.log("api y 값 / "+ apiResult.documents[0].y);
                        console.log("지점 x 값 / "+branch.branchLongitude);
                        console.log("지점 y 값 / "+branch.branchLatitude);
                        if (branch.branchLongitude === apiResult.documents[0].x && branch.branchLatitude === apiResult.documents[0].y) {
                            matchedBranch = branch;
                            branchName = matchedBranch;
                            console.log(matchedBranch);
                            break;
                        }
                    }

    				// 지점 탭 추가
	    			console.log("------------------");
    				for (var i = 0; i < data.branchList.length; i++) {
    				    console.log(data.branchList[i].branchName);
    				    var branchButton = $('<button class="branchButton">' + data.branchList[i].branchName + '</button>');
    				    branchButton.data('branchName', data.branchList[i].branchName);
    				    $('.branchLocation').append(branchButton);
    				}
    				
    				// 지점 탭 클릭
    				$('.branchButton').click(function () {
    					console.log("------------------");
    			    	console.log("지점 버튼 클릭");
    			        branchName = $(this).data('branchName');
    			        console.log(branchName);
    			        for (var i = 0; i < data.branchList.length; i++) {
    			        	var branch = data.branchList[i];
    			        	if(branchName == branch.branchName){
    			        		console.log("클릭된 지점명과 일치하는 지점명");
    			        		console.log("탭 지점명 : "+branchName);
    			        		console.log("클릭된 지점명 값 : "+branch.branchName);
    			        		console.log(branch.branchLongitude);
    			        		console.log(branch.branchLatitude);
    			        		
    			        		 initializeMap({
    			                     documents: [{
    			                         x: branch.branchLongitude,
    			                         y: branch.branchLatitude
    			                     }]
    			                 });
    			        		 matchedProductList = data.productList.filter(function (product) {
    			                     return product.branch === branch.branchName;
    			                 });

    			                 // 상품 데이터로 테이블을 업데이트합니다.
    			                 var productListTable = $('.productList table');
    			                 productListTable.html('<tr><th>상품번호</th><th>상품명</th><th>가격</th></tr>');

    			                 // 데이터를 테이블에 추가
    			                 for (var j = 0; j < matchedProductList.length; j++) {
    			                     var product = matchedProductList[j];
    			                     var productInfo = '<tr>' +
    			                         '<td>' + product.productID + '</td>' +
    			                         '<td>' + product.productName + '</td>' +
    			                         '<td>' + product.price + '</td>' +
    			                         '</tr>';
    			                     productListTable.append(productInfo);
    			                 }
    			                 break;
    			        	}
						}
    			        
    			    });
    				
                    // 첫 번째 Ajax 결과의 x, y 값과 일치하는 productList 찾기
                    var matchedProductList = data.productList.filter(function(product) {
				    var matchedBranch = data.branchList.find(function(branch) {
				        return branch.branchLongitude === apiResult.documents[0].x && branch.branchLatitude === apiResult.documents[0].y;
				    });
				    return matchedBranch && product.branch === matchedBranch.branchName;
				});

                 var productListTable = $('.productList table');

                 // 기존 내용을 지우고 테이블 헤더를 추가
                 productListTable.html('<tr><th>상품번호</th><th>상품명</th><th>가격</th></tr>');

                 // 데이터를 테이블에 추가
                 for (var i = 0; i < matchedProductList.length; i++) {
                     var product = matchedProductList[i];
                     var productInfo = '<tr>' +
                         '<td>' + product.productID + '</td>' +
                         '<td>' + product.productName + '</td>' +
                         '<td>' + product.price + '</td>' +
                         '</tr>';
                     productListTable.append(productInfo);
                 } 
                 
                 
                 
                 
    				
                 
                 // 검색 버튼 클릭
                 $('#search').click(function () {
                     searchKeyword = $('#searchProduct').val();
                     branchName = matchedBranch.branchName;
                     searchProduct(searchKeyword, branchName);
                 });
             	
                 function searchProduct(searchKeyword, branchName) {
                	 console.log("------------------");
                 	 console.log("keyword/Name : "+searchKeyword+"/"+branchName);
                     $.ajax({
                         type: 'get',	
                         url: 'searchProduct.do',
                         data: {
                             'searchKeyword': searchKeyword,
                             'branchName': branchName
                         },
                         dataType: 'json',
                         success: function (data) {
                             console.log(data);
                             console.log("성공");
                             drawProduct(data);
                         },
                         error: function (e) {
                        	 console.log("실패");
                             console.log(e);
                         }
                     });
                 }
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
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="padding:5px;">' + data.documents[0].region_3depth_name + '</div>'
            });

            // 초기에 InfoWindow를 열어둠
            infowindow.open(map, marker);
        
    }
	// 검색된 상품 그리기
    function drawProduct(data) {
		console.log("drawProduct 함수");
		console.log(data.searchedList[0].productName);
    // 기존 내용을 지우고 테이블 헤더를 추가
    var searchedProduct = $('.productList table');
    searchedProduct.html('<tr><th>상품번호</th><th>상품명</th><th>가격</th></tr>');

    // 데이터를 테이블에 추가
    for (var i = 0; i < data.searchedList.length; i++) {
        var product = data.searchedList[i];
        console.log(product.productID);
        console.log(product.productName);
        console.log(product.price);
        console.log(data.searchedList[i].productName);
        
        var productInfo = '<tr>' +
            '<td>' + product.productID + '</td>' +
            '<td>' + product.productName + '</td>' +
            '<td>' + product.price + '</td>' +
            '</tr>';
            searchedProduct.append(productInfo);
    }
}
	
    
    


</script>
</html>