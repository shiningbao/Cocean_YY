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


/* 모달 스타일 */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* 닫기 버튼 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
.button{
	background-color: white;
	border-color: #2F80ED;
	color: #2F80ED;
	border-radius: 6px;
}
</style>
<body>
<jsp:include page="../side.jsp"></jsp:include>

<div>스토어 관리 
<div class="branchLocation">지점 위치 </div>
<div id="map" style="width:500px;height:400px;"></div>
<button type="button" class="button" id="branchRegister">등록</button>
</div>

<div id="myModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <!-- 모달 내용 -->
    <p/>주소
		     <p/><input type="text" id="postcode" placeholder="우편번호" style="width: 50%;">
			 <input type="button" id="findpostcode" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			 <input type="text" id="roadAddress"  name = member_roadAddr placeholder="도로명주소" style="width: 50%;"><br/>
			 <input type="text" id="jibunAddress" name = member_parcelAddr placeholder="지번주소" style="width: 50%;"><br/>
			 <span id="guide" style="color:#999; display:none"></span><br/>
			 <input type="text" id="detailAddress" name = member_detailAddr placeholder="상세주소">		  
			 <input type="text" id="extraAddress" placeholder="참고항목">              
  </div>
</div>

<div class="modal fade" id="regModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 모달창 제목 -->
					<h5 class="modal-title">일정등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="scheduleWrite.do" method="POST" id="calForm">
						<!-- 입력폼 -->
							<p>제목 <input type="text" name="title" placeholder="제목을 입력해주세요."></p>
							<p>시작일
								<input type="datetime-local" name="start" value="${dto.start}" >
							</p>
							<p>종료일
								<input type="datetime-local" name="end" value="${dto.end}" >
							</p>
							<p>중분류    
								<select id="midSelect" name="mainCategory">
									<option value="개인">개인</option>
									<option value="팀">팀</option>
								</select>
							</p>
							<p>소분류
							    <select id="subSelect" name="subCategory">
							        <!-- 선택된 중분류에 따라 옵션이 동적으로 추가될 것입니다 -->
							    </select>
							</p>
<!-- 							<p class="writeViewCallender">개인캘린더 -->
<!-- 							    <select id="myCallender" name="category"> -->
<!-- 							    	<option value="내 일정(기본)">내 일정(기본)</option> -->
<!-- 							    </select> -->
<!-- 							</p> -->
							<p>비고
								<input type="text" name="remarks">
							</p>
							<p>공개여부
								<input type="checkbox" name="publicCategory">
							</p>
							<p>내용
								<textarea name="description"></textarea>
							</p>
							
						<div class="modal-footer">
							<button type="button" id="calSubmit" class="btn btn-primary">저장</button>
							<button type="button" class="btn btn-secondary"data-dismiss="modal" class="cancleBtn">취소</button>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<div class="productList">상품 리스트
	<input type="text" id="searchProduct" placeholder="검색어 입력">
	<button id="search" class="button">검색</button>
	<div class="listTable">
	<table>
	</table>
	</div>
	<button type="button" class="button" onclick="location.href='storeProductRegister.go'">등록</button>
</div>

<div class="ticketList">티켓 리스트</div>

</body>
<script>
var matchedProductList;
var productListTable = $('.productList table');
productListTable.html('<tr><th>상품번호</th><th>상품명</th><th>가격</th></tr>');

// 지점 리스트 지도에 표시
new Promise((resolve, reject) => {
    // 첫 번째 Ajax 호출
    // 카카오 지도 api 를 사용해서 지도 그리기
    $.ajax({
        type: 'get',
        url: 'storeMap.do',
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
            url: 'storeList.do',
            dataType: 'json',
            success: function (data) {
                	console.log("두번째 ajax 호출 성공");
                	console.log(data);
                	
                 	// 첫 번째 Ajax 결과의 x, y 값과 일치하는 branch 찾기
                    var productListTable = $('.productList table');
                    var matchedBranch = null;
                    for (var i = 0; i < data.branchProductList.length; i++) {
                        var branch = data.branchProductList[i];
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
                    $(document).ready(function() {
                        // 테이블에 상품 정보를 추가하는 코드를 여기에 배치
                    });
    				// 지점 탭 추가
	    			console.log("------------------");
    				for (var i = 0; i < data.branchList.length; i++) {
    				    console.log(data.branchList[i].branchName);
    				    var branchButton = $('<button class="branchButton">' + data.branchList[i].branchName + '</button>');
    				    branchButton.data('branchName', data.branchList[i].branchName);
    				    $('.branchLocation').append(branchButton);
    				}
    				console.log("------------------");
    				for (var i = 0; i < data.branchProductList.length; i++) {
						if(data.branchProductList[i].branchName == matchedBranch.branchName &&
								data.branchProductList[i].category === "상품"){
							var product = data.branchProductList[i];
							console.log(product);
							var productInfo = '<tr>' +
	                         '<td>' + product.productID + '</td>' +
	                         '<td>' + product.productName + '</td>' +
	                         '<td>' + product.price + '</td>' +
	                         '</tr>';
	                         console.log("프로덕트");
			                 console.log(productInfo);
	                     productListTable.append(productInfo);
						}
					}
    				
    				// 지점 탭 클릭
    				$('.branchButton').click(function () {
					    console.log("------------------");
					    console.log("지점 버튼 클릭");
					    branchName = $(this).data('branchName');
					    console.log(branchName);
					
					    // 선택된 branchName에 해당하는 지점 찾기
					    var matchedBranch = data.branchProductList.find(function (branch) {
					        return branch.branchName === branchName;
					    });
					
					    if (matchedBranch) {
					        console.log("클릭된 지점명과 일치하는 지점명");
					        console.log("탭 지점명 : " + branchName);
					        console.log("클릭된 지점명 값 : " + matchedBranch.branchName);
					        console.log(matchedBranch.branchLongitude);
					        console.log(matchedBranch.branchLatitude);
					
					        initializeMap({
					            documents: [{
					                x: matchedBranch.branchLongitude,
					                y: matchedBranch.branchLatitude
					            }]
					        });
					
					        // 상품 데이터로 테이블을 업데이트합니다.
					        var productListTable = $('.productList table');
					        productListTable.html('<tr><th>상품번호</th><th>상품명</th><th>가격</th></tr>');
					
					        // 데이터를 테이블에 추가
					        for (var j = 0; j < data.branchProductList.length; j++) {
					            var product = data.branchProductList[j];
					
					            // 여기서 category가 "상품"인 경우에만 추가
					            if (product.category === "상품" && product.branchName === matchedBranch.branchName) {
					                var productInfo = '<tr>' +
					                    '<td>' + product.productID + '</td>' +
					                    '<td>' + product.productName + '</td>' +
					                    '<td>' + product.price + '</td>' +
					                    '</tr>';
					                productListTable.append(productInfo);
					            }
					        }
					    } else {
					        console.log("일치하는 지점을 찾을 수 없습니다.");
					    }
					});

    				
    				// 
	                 // 해결 해야함
	                 // 
	                 //
	                 // 
	                 //
	                 // 
	                 //
                    // 첫 번째 Ajax 결과의 x, y 값과 일치하는 productList 찾기
                    /* var matchedProductList = data.branchProductList.filter(function(product) {
				    var matchedBranch = data.branchProductList.find(function(branch) {
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
                  */
                 
                 
                 
    				
                 
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
	
    
    
	
	
 // 모달 열기
    function openModal() {
      var modal = document.getElementById('myModal');
      modal.style.display = 'block';
    }

    // 모달 닫기
    function closeModal() {
      var modal = document.getElementById('myModal');
      modal.style.display = 'none';
    }

    // 버튼 클릭 시 모달 열기
    document.getElementById('branchRegister').addEventListener('click', openModal);

    // 모달 내 닫기 버튼 클릭 시 모달 닫기
    document.getElementsByClassName('close')[0].addEventListener('click', closeModal);

    // 모달 외 다른 부분 클릭 시 모달 닫기
    window.addEventListener('click', function (event) {
      var modal = document.getElementById('myModal');
      if (event.target === modal) {
        closeModal();
      }
    });

    /* function registerConfirm(){
    	if(confirm("등록하시겠습니까?")){
    		alert("등록되었습니다!");
    	}
    	
  	function validationConfirm(){
      		alert("모든 내용을 입력해주세요!");
  	} */

</script>
</html>