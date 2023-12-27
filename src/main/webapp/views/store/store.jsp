<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 카카오 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=530dd95ca9b426f51d6a8307877fcb3f&libraries=services"></script>
<!-- 다음 도로명주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- popper CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
	
<!-- 부트스트랩 자바스크립트 -->
<script src="/resource/js/bootstrap.min.js"></script>
<link rel="icon" href="resource/img/favi.png" type="image/x-icon">

<!-- 부트스트랩 CSS/favicon -->
<link rel="stylesheet" href="/resource/css/bootstrap.min.css">
<link rel="stylesheet" href="/resource/css/modal.css">
<link rel="stylesheet" href="/resource/css/common.css">
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
/* .modal {
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
 */
/* 닫기 버튼 스타일 */
/* .close {
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
} */
</style>
<body>
<jsp:include page="../side.jsp"></jsp:include>

<div>스토어 관리 
<div class="branchLocation">지점 위치 </div>
<div id="map" style="width:500px;height:400px;"></div>
<!-- <button type="button" class="button" id="branchRegisterConfirm">등록</button> -->
<button id="modalBtn" class="btn btn-primary" class="btn" data-toggle="modal" data-target="#modal">등록</button>

<!-- 버튼 클릭 시 열리는 모달창 -->
    <div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">관리일지</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action=""> <!-- 입력폼 -->
              <div class="form-group">
                <label>담당자</label>
                <input type="text" id="manager" readonly class="form-control">
              </div>
              <div class="form-group">
                <label>내용</label>
                <textarea type="text" class="form-control" required oninvalid="this.setCustomValidity('관리 내용을 작성해 주세요.')" oninput="this.setCustomValidity('')" maxlength="500" placeholder="500자까지 작성 가능" style="height: 180px;"></textarea>
              </div>
              <div class="form-row">
                <label>작성 날짜</label>
                <input class="form-control" id="currentDate" readonly type="text" value="date">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary">저장</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    
</div>

<div id="myBranchModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <!-- 모달 내용 -->
    <p>지점 등록<p/>
    		 지점명 <input type="text" id="branchName"  name = branchName placeholder="지점명을 입력해주세요" style="width: 50%;"><br/>
			 도로명주소 <input type="text" id="branchLocation"  name = branchLocation placeholder="도로명주소" style="width: 50%;">
			 <input type="button" onclick="roadAddr()" value="도로명주소 찾기"><br/>
			 <button type="button" class="button" onclick="branchRegisterConfirm()">등록</button>
  </div>
</div>

<div class="productList">상품 리스트
	<input type="text" id="searchProduct" placeholder="검색어 입력">
	<button id="search" class="button">검색</button>
	<button id="productInfoRegister" class="button" onclick="location.href='productInfoRegister.go'">본사상품 등록</button>
	<div class="listTable">
	<table>
	</table>
	</div>
	<button type="button" class="button" onclick="location.href='storeProductRegister.do'">등록</button>
</div>

<div class="ticketList">티켓 리스트
	<input type="text" id="searchProduct" placeholder="검색어 입력">
	<button id="search" class="button">검색</button>
	<div class="listTable">
	<table>
	</table>
	</div>
	<button type="button" class="button" id="ticketRegisterConfirm">등록</button>
	<div id="myTicketModal" class="modal">
	<div class="modal-content">
    <span class="close">&times;</span>
	<p>티켓 등록<p/>
    		 티켓명 <input type="text" id="productName"  name = productName placeholder="티켓명을 입력해주세요" style="width: 50%;"><br/>
			 가격 <input type="text" id="price" name = price placeholder="가격을 입력해주세요"><br/>
			 <button type="button" class="button" onclick="ticketRegisterConfirm()">등록</button>
  </div>
  </div>
</div>
</body>
<script>

var matchedProductList;
var productListTable = $('.productList table');
productListTable.html('<tr><th>상품번호</th><th>상품명</th><th>가격</th></tr>');
var ticketListTable = $('.ticketList table');
ticketListTable.html('<tr><th>티켓번호</th><th>티켓명</th><th>가격</th></tr>');

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
    				// 지점 탭 추가
	    			console.log("------------------");
    				for (var i = 0; i < data.branchList.length; i++) {
    				    console.log(data.branchList[i].branchName);
    				    var branchButton = $('<button class="branchButton">' + data.branchList[i].branchName + '</button>');
    				    branchButton.data('branchName', data.branchList[i].branchName);
    				    $('.branchLocation').append(branchButton);
    				}
    				// 상품 리스트 추가
    				console.log("------------------");
    				for (var i = 0; i < data.branchProductList.length; i++) {
						if(data.branchProductList[i].branchName == matchedBranch.branchName &&
								data.branchProductList[i].category === "상품" && data.branchProductList[i].status === "판매중"){
							var product = data.branchProductList[i];
							var productInfo = '<tr>' +
	                         '<td>' + product.productID + '</td>' +
	                         '<td>' + product.productName + '</td>' +
	                         '<td>' + product.price + '</td>' +
	                         '</tr>';
	                     productListTable.append(productInfo);
						}
					}
    				// 티켓 리스트 추가
    				console.log("------------------");
    				for (var i = 0; i < data.branchProductList.length; i++) {
						if(data.branchProductList[i].branchName == matchedBranch.branchName &&
								data.branchProductList[i].category === "티켓" && data.branchProductList[i].status === "판매중"){
							var ticket = data.branchProductList[i];
							var ticketInfo = '<tr>' +
	                         '<td>' + ticket.productID + '</td>' +
	                         '<td>' + ticket.productName + '</td>' +
	                         '<td>' + ticket.price + '</td>' +
	                         '</tr>';
                         ticketListTable.append(ticketInfo);
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
					
					    var matchedProducts = data.branchProductList.filter(function (product) {
					        return product.branchName === matchedBranch.branchName && product.category === "상품" 
					        	&& product.status === "판매중";
					    });
					    var matchedTickets = data.branchProductList.filter(function (product) {
					        return product.branchName === matchedBranch.branchName && product.category === "티켓" 
					        && product.status === "판매중";
					    });
					    
					    if (matchedBranch) {
					        console.log("클릭된 지점명과 일치하는 지점명");
					        console.log("탭 지점명 : " + branchName);
					        var branchName = $(this).data('branchName');
					        console.log("클릭된 지점명 값 : " + matchedBranch.branchName);
					        console.log(matchedBranch.branchLongitude);
					        console.log(matchedBranch.branchLatitude);
							
					        initializeMap({
					            documents: [{
					                x: matchedBranch.branchLongitude,
					                y: matchedBranch.branchLatitude
					            }]
					        });
					
					        // 상품리스트로 테이블 업데이트
					        var productListTable = $('.productList table');
					        productListTable.html('<tr><th>상품번호</th><th>상품명</th><th>가격</th></tr>');
							// 티켓리스트로 테이블 업데이트
							var ticketListTable = $('.ticketList table');
							ticketListTable.html('<tr><th>티켓번호</th><th>티켓명</th><th>가격</th></tr>');
							
					        // 상품 데이터를 테이블에 추가
					        if (matchedProducts.length > 0) {
							    for (var j = 0; j < matchedProducts.length; j++) {
							        var product = matchedProducts[j];
							        var productInfo = '<tr>' +
							            '<td>' + product.productID + '</td>' +
							            '<td>' + product.productName + '</td>' +
							            '<td>' + product.price + '</td>' +
							            '</tr>';
							        productListTable.append(productInfo);
							    }
							} else {
							    // 클릭된 지점명과 일치하는 상품이 하나도 없는 경우 메시지를 추가합니다.
							    var productInfo = '<tr>' +
							        '<td colspan="3">' + "아직 상품이 등록되지 않았습니다" + '</td>' +
							        '</tr>';
							    productListTable.append(productInfo);
							}
					        // 티켓 데이터를 테이블에 추가
					        if (matchedTickets.length > 0) {
							    for (var j = 0; j < matchedTickets.length; j++) {
							        var ticket = matchedTickets[j];
							        var ticketInfo = '<tr>' +
							            '<td>' + ticket.productID + '</td>' +
							            '<td>' + ticket.productName + '</td>' +
							            '<td>' + ticket.price + '</td>' +
							            '</tr>';
							        ticketListTable.append(ticketInfo);
							    }
							} else {
							    // 클릭된 지점명과 일치하는 상품이 하나도 없는 경우 메시지를 추가합니다.
							    var productInfo = '<tr>' +
							        '<td colspan="3">' + "아직 상품이 등록되지 않았습니다" + '</td>' +
							        '</tr>';
							    productListTable.append(productInfo);
							}
					     	 // 검색 버튼 클릭
			                 $('#search').click(function () {
			                     searchKeyword = $('#searchProduct').val();
			                     searchProduct(searchKeyword, branchName);
			                 });
					    }
					        else {
					        console.log("지점에 등록된 상품이 없습니다");
					    }
					});
    			 // 상품 검색 ajax
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
    // 공통으로 사용될 모달 열기 함수
    function openModal(modalId) {
      var modal = document.getElementById(modalId);
      modal.style.display = 'block';
    }

    // 공통으로 사용될 모달 닫기 함수
    function closeModal(modalId) {
      var modal = document.getElementById(modalId);
      modal.style.display = 'none';
    }

    // 버튼 클릭 이벤트 핸들러 동적으로 추가하는 함수
    function addButtonClickListener(buttonId, modalId) {
      document.getElementById(buttonId).addEventListener('click', function () {
        openModal(modalId);
      });

      document.getElementsByClassName('close')[0].addEventListener('click', function () {
        closeModal(modalId);
      });

      window.addEventListener('click', function (event) {
        var modal = document.getElementById(modalId);
        if (event.target === modal) {
          closeModal(modalId);
        }
      });
    }
	// 버튼 클릭 이벤트 핸들러 등록
    addButtonClickListener('branchRegisterConfirm', 'myBranchModal');
    addButtonClickListener('ticketRegisterConfirm', 'myTicketModal');
    
 	// 카카오 우편번호 api
    function roadAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                document.getElementById("branchLocation").value = roadAddr;
                
                var guideTextBox = document.getElementById("guide");
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                }
            }
        }).open();
    }

    function branchRegisterConfirm() {
        if (confirm("등록하시겠습니까?")) {
            // 필요한 데이터를 추출
            var branchName = document.getElementById('branchName').value;
            var branchLocation = document.getElementById('branchLocation').value;

            // 카카오 맵 지오코더 생성자
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소 검색 결과를 처리할 콜백 함수를 정의합니다.
            var callback = function(result, status) {
                // 검색 상태가 OK인 경우에만 처리합니다.
                if (status === kakao.maps.services.Status.OK) {
                    // 검색 결과에서 위도(latitude)와 경도(longitude)를 추출합니다.
                    var result = result[0];
                    var branchLatitude = result.y; // 위도
                    var branchLongitude = result.x; // 경도

                    branchReigster(branchName, branchLocation, branchLatitude, branchLongitude);
                } else {
                    // 검색 상태가 OK가 아닌 경우에는 에러 메시지를 출력합니다.
                    console.error("주소 검색 실패: " + status);
                }
            };
            // 주소 검색 요청을 수행합니다.
            geocoder.addressSearch(branchLocation, callback);
            alert("등록되었습니다!");
            closeModal();
        }
    }
    

    // 지점등록 데이터를 서버로 보내는 함수
    function branchReigster(branchName, branchLocation, branchLatitude, branchLongitude) {
        $.ajax({
            type: 'get',
            url: 'branchRegister.do',
            data: {
                branchName: branchName,
                branchLocation: branchLocation,
                branchLatitude: branchLatitude,
                branchLongitude: branchLongitude
            },
            success: function(data) {
                console.log(data);
                console.log("성공");
            },
            error: function(error) {
                console.error(error);
            }
        });
    }

    function ticketRegisterConfirm(){
    	if (confirm("등록하시겠습니까?")) {
    		var branchName = document.getElementById('branchName').value;
    		var productName = document.getElementById('productName').value;
            var price = document.getElementById('price').value;
			var category = "티켓";
			
			ticketRegister(productName, price, category);
			
    		alert("등록되었습니다!");
    		}
    }
    
 	// 티켓등록 데이터를 서버로 보내는 함수
    function ticketRegister(branchName, productName, price, category) {
        $.ajax({
            type: 'get',
            url: 'ticketRegister.do',
            data: {
            		branchName: branchName,
            		productName: productName,
            		price: price,
            		category: category
            },
            success: function(data) {
                console.log(data);
                console.log("성공");
            },
            error: function(error) {
                console.error(error);
            }
        });
    }
  	function validationConfirm(){
      		alert("모든 내용을 입력해주세요!");
  	}

</script>
</html>