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
	<table>
	</table>
</div>

	
	
<div class="ticketList">티켓 리스트</div>

<!-- <div>스토어 관리</div>
<div class="left-container">
        <div class="branchLocation">지점 위치</div>
        <div id="map"></div>
    </div>

    오른쪽 영역: 상품 리스트 및 티켓 리스트
    <div class="right-container">
        <div class="productList">상품 리스트</div>
        <div class="ticketList">티켓 리스트</div>
    </div>
 -->
</body>
<script>
//이미지 지도에서 마커가 표시될 위치입니다 
/* var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
    position: markerPosition
}; */
var branchName;
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
    return new Promise((resolve, reject) => {
        $.ajax({
            type: 'get',
            url: 'storeList.ajax',
            dataType: 'json',
            success: function (data) {
                console.log(data);
                	console.log("두번째 ajax 호출 성공");
                	
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

                    console.log("matchedBranch : "+matchedBranch);
                    if (matchedBranch) {
                    	console.log("matchedBranch : "+matchedBranch);
                        // 지점 정보를 <div class="branchLocation">에 동적으로 추가
                        $('.branchLocation').append('<button id="branchName">' + matchedBranch.branchName + '</button>');
                    }

                    // 첫 번째 Ajax 결과의 x, y 값과 일치하는 productList 찾기
                    const matchedProductList = data.productList.filter(function(product) {
				    const matchedBranch = data.branchList.find(function(branch) {
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
                     var rowHtml = '<tr>' +
                         '<td>' + product.productID + '</td>' +
                         '<td>' + product.productName + '</td>' +
                         '<td>' + product.price + '</td>' +
                         '</tr>';
                     productListTable.append(rowHtml);
                 }
                 $('#search').click(function () {
                     searchKeyword = $('#searchProduct').val();
                     branchName = matchedBranch.branchName;
                     searchProduct(searchKeyword, branchName);
                 });
             	
                 function searchProduct(searchKeyword, branchName) {
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
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="padding:5px;">' + data.documents[0].region_3depth_name + '</div>'
            });

            // 초기에 InfoWindow를 열어둠
            infowindow.open(map, marker);
        
    }
	// 상품 검색
    
    /* function drawList(obj) {
        var content = '';
        var totalItems = obj.list.length;
    	
        if (totalItems === 0) {
        		content = '<tr><td colspan="5">검색 결과가 없습니다.</td></tr>';
        } else {
            obj.list.forEach(function (item, board_id) {
            	content += '<tr>';
            	content += '<td>' + item.board_id + '</td>';
            	content += '<td><a class="icon" href="detail?board_id=' + item.board_id + '">' + item.board_subject;
            	if (item.img > 0) {
            	    content += '<a class="icon"><img src="resources/img/image.png" width="20px" height="20px"></a>';
            	}
            	if (item.reply > 0) {
            	    content += '<a id="reply" class="icon">[' + item.reply + ']</a>';
            	}
            	content += '</td>';
            	content += '<td>' + item.member_nickName + '</td>';
            	var regDate = new Date(item.board_regDate);
            	var formattedRegDate = regDate.getFullYear() + "-" + (regDate.getMonth() + 1) + "-" + regDate.getDate();
            	content += '<td>' + formattedRegDate + '</td>';
            	content += '<td>' + item.board_bHit.toLocaleString() + '</td>';
            	content += '<td>' + item.likeCount.toLocaleString() + '</td>';
            	content += '</tr>';
            });
            $('#list').empty();
            $('#list').append(content);

            // 검색 결과가 있으면 페이징 UI 그리기
            if (searchType !== '' && searchKeyword !== '') {
                $('#pagination').twbsPagination({
                    startPage: obj.currPage,
                    totalPages: obj.pages,
                    visiblePages: 5,
                    onPageClick: function (e, page) {
                        if (showPage != page) {
                            showPage = page;
                            searchCall(page, searchType, searchKeyword); // 검색 결과로 페이지 이동
                        }
                    }
                });
            } else {
                $('#pagination').twbsPagination({
                    startPage: obj.currPage,
                    totalPages: obj.pages,
                    visiblePages: 5,
                    onPageClick: function (e, page) {
                        if (showPage != page) {
                            showPage = page;
                            listCall(page); // 일반 목록으로 페이지 이동
                        }
                    }
                });
            }
        } 
    }*/

</script>
</html>