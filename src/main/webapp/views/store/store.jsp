<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- popper CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
	
</head>
<style>
.contentField {
    padding-left: 250px;
    margin-top: 80px;
}
.listTable {
    overflow: auto;
    width: 519px;
    height: 355px
}

table, th, td{
border: 1px solid gray;
text-align: center;
}
tbody{
text-align: center;
}
.productList{
    left: 770px;
    top: 70px;
    width: 585px;
}

#modalSearch{
	width: 300px;
}
#branchLocation{
	width: 50%;
	height: 50%;
	top: 255px;
	left: 400px;
}
#map{
	width:450px;
	height:450px;
}
#secondProductModal{
	height: 650px;
	overflow: auto;
}
#totalProductNumber{
	text-align: right;
    margin-right: 34px
}
img {
    transition: all 0.2s linear;
}

img:hover {
    transform: scale(2);
    border: 1px solid #000;
    /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); */
}
#deleteBtn{
	margin-left: 335px;
}

</style>
<body>
<c:import url="/side"/>
<div class="container-fluid contentField">
<div class="row">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">스토어 관리</h1>
    </div>
</div>
<div class="container" style="display: flex; margin-left: 33px; flex-direction: column;align-content: space-around;flex-wrap: wrap; ">
<div class="row">
<div class="branchLocation">지점
</div>
</div>
<div class="row" style="width: 100%; display: flex; justify-content: space-between;">

<div id="map" class="card shadow mb-4"></div>

<!-- 지점등록 모달 -->	
<!-- 버튼 클릭 시 열리는 모달창 -->
    <div class="modal fade" id="firstBranchModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title">지점등록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form action="">
              <div class="form-group">
                <label>지점명</label>
                <input type="text" id="branchName" class="form-control" required>
              </div>
              <div class="form-group">
                <label>도로명주소</label>
                	 <input type="button" onclick="roadAddr()" value="찾기"><br/>
                 <input type="text" id="branchLocation" class="form-control" readonly required  ></input>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary" onclick="branchRegisterConfirm()">등록</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      
    </div>
    
<div class="productList" >
	<div class="row">
	<p>상품 리스트<input type="text" class="searchProduct" placeholder="검색어 입력">
	<button id="productSearch" class="btn btn-primary">검색</button></p>
	<button id="modalProductRegister" class="btn btn-primary" class="btn" data-toggle="modal" data-target="#firstProductModal" style="display: none; width: 57px; height: 39px; margin-left: 3px;">등록</button>
	<button id="productInfoRegister" class="btn btn-primary" onclick="productInfoRegister()" style="display: inline; margin-left:3px; width: 126px; height: 39px">본사상품 등록</button>
	</div>
	<div class="row" id="deleteBtn">
	<button id="branchProductDelete" class="btn btn-primary" onclick="branchProductDelete()">삭제</button>
	<div id="totalProductNumber">
	상품 개수 :
	</div>
	</div>
	<div class="row" style="flex-wrap: nowrap;">
		<div class="col">
		<div id="productTable" class="listTable">
		<table style="width: 100%;">
		</table>
		</div>
		</div>
		
		<div class="col">
			<div id="productInfoRegisterPage">
		 	</div>
	 	</div>
 	</div>
 
 	</div>
</div>
</div>

<!-- 첫번째 모달창 -->
<div class="modal fade" id="firstProductModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">상품등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="modal-body">
            <form action="" method="get">
              <div class="form-group">
                <label>지점명</label> 
                <input type="text" name="currentBranchName" readonly class="form-control" id="currentBranchName">
              </div>
              <div class="form-group">
                <label>카테고리</label>
                <input type="text" readonly class="form-control" id="currentProductCategory">
              </div>
              <div class="form-group">
                <label>상품명</label>
                 <!-- 두번째 모달 창 열기 버튼 -->
        		 <button type="button" id="firstProductSearchModal" class="btn btn-primary" data-toggle="modal" data-target="#secondProductModal">검색</button>
                	 <input type="text" name="currentProductName" readonly required class="form-control" id="currentProductName">
              </div>
              <div class="form-group">
                <label>가격</label>
                 <input type="text"  class="form-control" class="price" id="currentProductPrice" readonly></input>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary" id="branchProductRegister" onclick="branchProductRegisterBtn()">등록</button>
              </div>
            </form>
          </div>
      </div>
    </div>
  </div>
</div>

<!-- 두번째 모달 창 -->
<div class="modal fade" id="secondProductModal" tabindex="-1" role="dialog" style="margin-left: 400px;">
  <div class="modal-dialog" role="document">
    <div class="modal-content" id="secondProductModal">
      <div class="modal-header">
        <h5 class="modal-title">상품검색</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div>
	        <input type="text" id="secondProductModalSearch" class="form-control">
	        <button class="secondProductModalSearch" class="btn btn-primary">검색</button>
	        </div>
	        <div class="searchedModalProduct" >
	               <table class="table">
	                   <thead>
	                       <tr>
	                           <th>상품번호</th>
	                           <th>상품명</th>
	                           <th>가격</th>
	                           <th>사진</th>
	                       </tr>
	                   </thead>
	                   <tbody></tbody>
	               </table>
	           </div>
	      </div>
      </div>
      </div>
    </div>
    
    
   
 	<c:import url="/footer"/>
 	
 	</div>
</body>
<script>
var matchedProductList;
var productListTable = $('.productList table');
productListTable.html('<tr><th>삭제</th><th>상품번호</th><th>상품명</th><th>가격</th><th>사진</th></tr>');
// 현재 보여지고 있는 지점명
var currentBranchName;
var currentProductCategory;
var currentProductName;
var currentProductPrice;

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
            
            /* initializeMap(data); */
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
                	initializeMap(data);
                 	// 첫 번째 Ajax 결과의 x, y 값과 일치하는 branch 찾기
                    var productListTable = $('.productList table');
                    var matchedBranch = null;
                    for (var i = 0; i < data.branchProductList.length; i++) {
                        var branch = data.branchProductList[i];
                        console.log(branch);
                        currentBranchName = branch.branchName;
                        currentProductCategory = "상품";
                        currentTicketCategory = "티켓";
                        $('#currentBranchName').val(currentBranchName);
                        $('#currentProductCategory').val(currentProductCategory);
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
    				   // 지점 버튼들 오른쪽에 + 버튼(지점 추가)
    				   var registerButton = $('<button id="modalBtn" class="btn btn-primary" class="btn" data-toggle="modal" data-target="#firstBranchModal" style="margin-left: 6px;">&#43;</button>');
    		       	   $('.branchLocation').append(registerButton);
    		       		
   		       		  // 총 상품 개수 추가
   		       		  $('#totalProductNumber').append(data.totalProductNumber[0].totalProductNumber);
   		       		  
    				// 상품 리스트 추가
    				console.log("------------------");
    				console.log(data);
    				for (var i = 0; i < data.branchProductList.length; i++) {
						if(data.branchProductList[i].branchName == matchedBranch.branchName &&
								data.branchProductList[i].category != "관람객" && data.branchProductList[i].status === "판매중"){
							var product = data.branchProductList[i];
							    var productInfo = '<tr>' +
							    '<td><input type="checkbox" onclick="return false"></td>' + 
							    '<td>' + product.productID + '</td>' +
							    '<td>' + product.productName + '</td>' +
							    '<td>' + product.price + '</td>' +
							    '<td>' + (product.serverFileName ? '<img class="card-img-top" style="width: 50%; height: 80px;" src="/photo/cocean/product/' +
								product.serverFileName + '" alt="티켓은 사진이 없습니다"/>' : '티켓은 사진이 없습니다') + '</td>' +
							    '</tr>';

	                     productListTable.append(productInfo);
						}
					}
					
    				// 지점 탭 클릭
    				$('.branchButton').click(function () {
					    console.log("------------------");
					    console.log("지점 버튼 클릭");
					    branchName = $(this).data('branchName');
					    $('#currentBranchName').val(branchName);
					    currentBranchName = branchName;
					    // 현재 지점명이 "가산점"이면 productInfoRegister 버튼을 보이게 하고, 그렇지 않으면 modalBtn 버튼을 보이게 함
					    if (currentBranchName === "가산점") {
					        document.getElementById("modalProductRegister").style.display = "none";
					        document.getElementById("productInfoRegister").style.display = "inline";
					    } else {
					        document.getElementById("modalProductRegister").style.display = "inline";
					        document.getElementById("productInfoRegister").style.display = "none";
					    }
					    // 선택된 branchName에 해당하는 지점 찾기
					    var matchedBranch = data.branchProductList.find(function (branch) {
					        return branch.branchName === branchName;
					    });
					    var matchedTotalProduct = data.totalProductNumber.find(function (branch) {
				        return branch.branchName === branchName;
					    });
					    var matchedProducts = data.branchProductList.filter(function (product) {
					        return product.branchName === matchedBranch.branchName && product.category != "관람객" &&
					            product.status === "판매중";
					    });
					
					    if (matchedBranch) {
					        console.log("클릭된 지점명과 일치하는 지점명");
					        console.log("탭 지점명 : " + branchName);
					        var branchName = $(this).data('branchName');
					        console.log("클릭된 지점명 값 : " + matchedBranch.branchName);
					        console.log(matchedBranch);
					        console.log(matchedBranch.branchLongitude);
					        console.log(matchedBranch.branchLatitude);
					        initializeMap({
					            branchList: [{
					                branchLocation: matchedBranch.branchLocation,
					                branchLongitude: matchedBranch.branchLongitude,
					                branchLatitude: matchedBranch.branchLatitude
					            }]
					        });
					        // 모달창에 현재 클릭된 지점명 넣기
					        $('.branchName').val(branchName);
					
					        // 상품리스트로 테이블 업데이트
					        var productListTable = $('.productList table');
					        productListTable.html('<tr><th>삭제</th><th>상품번호</th><th>상품명</th><th>가격</th><th>사진</th></tr>');
					        
					     	// 총 상품 개수 추가
   		       		  		$('#totalProductNumber').html('상품 개수 : ' + matchedTotalProduct.totalProductNumber);
					     	
					        // 상품 데이터를 테이블에 추가
					        if (matchedProducts.length > 0) {
					            for (var j = 0; j < matchedProducts.length; j++) {
					                var product = matchedProducts[j];
					                var productInfo = '<tr>' +
					                /* '<td><input type="checkbox" name="productCheckbox" data-productID="' + product.productID + '" data-branchID="' + product.branchID + '"></td>' + */
					                '<td><input type="checkbox" name="productCheckbox" data-productID="' + product.productID + '" data-branchID="' + product.branchID + '"></td>' +
					                '<td>' + product.productID + '</td>' +
					                '<td>' + product.productName + '</td>' +
					                '<td>' + product.price + '</td>' +
					                '<td>' + (product.serverFileName ? '<img class="card-img-top" style="width: 50%; height: 80px;" src="/photo/cocean/product/' +
					    								product.serverFileName + '" alt="티켓은 사진이 없습니다"/>' : '티켓은 사진이 없습니다') + '</td>' +
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
					    } else {
					        console.log("지점에 등록된 상품이 없습니다");
					    }
					}); 

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

// 상품 리스트 등록 버튼 클릭시 상품명, 가격 value 값 비우기
$('#modalProductRegister').click(function () {
	$("#currentProductName").val('');
	$('#currentProductPrice').val('');
});
	
// 상품 검색 버튼 클릭
$('#productSearch').click(function () {
searchKeyword = $('.searchProduct').val();
console.log(searchKeyword);
searchProduct(searchKeyword, currentBranchName);
});

// 모달검색 버튼 클릭
 $('.secondProductModalSearch').click(function () {
   console.log("모달검색버튼 클릭");
   searchKeyword = $('#secondProductModalSearch').val();
   currentBranchName = "본사상품"
   searchProduct(searchKeyword,currentBranchName);
});

//상품 검색 ajax
 function searchProduct(searchKeyword, currentBranchName) {
	 console.log("------------------");
 	 console.log("keyword/Name : "+searchKeyword+"/"+currentBranchName);
     $.ajax({
         type: 'get',	
         url: 'searchProduct.do',
         data: {
             'searchKeyword': searchKeyword,
             'branchName': currentBranchName
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
             alert("검색된 상품 또는 티켓이 없습니다");
         }
     });
 }
	// 지도 그리기
    function initializeMap(data) {
        var mapContainer = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(data.branchList[0].branchLatitude,data.branchList[0].branchLongitude),
            level: 3
        };
		// 마커 표시
        var map = new kakao.maps.Map(mapContainer, options);

            var markerPosition = new kakao.maps.LatLng(data.branchList[0].branchLatitude, data.branchList[0].branchLongitude);
            var marker = new kakao.maps.Marker({
                position: markerPosition,
                title: data.branchList[0].branchLocation
            });

            marker.setMap(map);

            // 지점명을 인포윈도우로 표시
            var infowindow = new kakao.maps.InfoWindow({
            		content: '<div style="padding:5px; font-size: 14px; text-align: center; width: 250px;">' + data.branchList[0].branchLocation + '</div>'
            });

            // 초기에 InfoWindow를 열어둠
            infowindow.open(map, marker);
    }
	// 모달 상품 검색 버튼 클릭시
    $(document).ready(function () {
    $('#firstProductSearchModal').click(function () {
        // Ajax를 사용하여 서버에 검색 요청
        $.ajax({
            type: 'get',
            url: 'modalProductList.do',
            data: {
              'currentBranchName': currentBranchName,
          	},
            dataType: 'json',
            success: function (data) {
                // 검색 결과를 받아와서 동적으로 테이블에 추가
                var searchedModalProduct = $('.searchedModalProduct table tbody');
                console.log("상품모달 리스트 성공");
                console.log(data);
                for (var i = 0; i < data.modalSearchedList.length; i++) {
                    var product = data.modalSearchedList[i];
                    var productInfo = '<tr>' +
				    '<td>' + product.productID + '</td>' +
				    '<td class="productNameCell">' + product.productName + '</td>' +
				    '<td>' + product.price + '</td>' +
				    '<td>' + (product.serverFileName ? '<img class="card-img-top" style="width: 50%; height: 80px;" src="/photo/cocean/product/' +
								product.serverFileName + '" alt="티켓은 사진이 없습니다"/>' : '티켓은 사진이 없습니다') + '</td>' +
				    '</tr>';
				    
                    searchedModalProduct.append(productInfo);
                }

            },
            error: function (e) {
                console.log("상품모달 리스트 실패");
                console.log(e);
            }
        });
    });
});
	
 // productName을 클릭하는 이벤트 처리
    $(document).on('click', '.productNameCell', function() {
      // 클릭한 행의 productName과 price 값을 가져와 변수에 저장
      var clickedRow = $(this).closest('tr');
      currentProductName = clickedRow.find('td:eq(1)').text();
      currentProductPrice = clickedRow.find('td:eq(2)').text();
      $('#currentProductName').val(currentProductName);
      $('#currentProductPrice').val(currentProductPrice);
      console.log("선택한 상품명: " + currentProductName);
      console.log("선택한 가격: " + currentProductPrice);
	  console.log ($('#currentProductName').val());
      $('#secondProductModal').modal('hide');
  });
 
	// 검색된 상품 그리기
    function drawProduct(data) {
    console.log("drawProduct 함수");
    console.log(data);

    if (data.searchedList[0].status == "본사상품") {
        console.log("모달 검색 성공");

        // 모달 상품 검색 결과를 보여주는 테이블
        var searchedModalProduct = $('.searchedModalProduct table tbody');
        searchedModalProduct.empty(); // 기존 내용 비우기
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
		    '<td>' + (product.serverFileName ? '<img class="card-img-top" style="width: 50%; height: 80px;" src="/photo/cocean/product/' +
						product.serverFileName + '" alt="티켓은 사진이 없습니다"/>' : '티켓은 사진이 없습니다') + '</td>' +
		    '</tr>';
            searchedModalProduct.append(productInfo);
        }
    } else if (data.searchedList[0].status != "본사상품") {
    	
        // 검색된 결과에 따라 상품 또는 티켓을 보여주는 테이블
        var productListTable = $('.productList table');
		productListTable.empty();
		productListTable.html('<tr><th>상품번호</th><th>상품명</th><th>가격</th><th>사진</th></tr>');
		
		for (var i = 0; i < data.searchedList.length; i++) {
		    var product = data.searchedList[i];
		
		    if (product.category != "관람객") {
		        console.log("상품");
		        console.log(product);
		
		        var productInfo = '<tr>' +
				    '<td>' + product.productID + '</td>' +
				    '<td>'+ product.productName + '</td>' +
				    '<td>' + product.price + '</td>' +
				    '<td>' + (product.serverFileName ? '<img class="card-img-top" style="width: 50%; height: 80px;" src="/photo/cocean/product/' +
								product.serverFileName + '" alt="티켓은 사진이 없습니다"/>' : '티켓은 사진이 없습니다') + '</td>' +
				    '</tr>';
		
		        productListTable.append(productInfo);
		    }
		}
    }
}

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
       // 필요한 데이터를 추출
       var branchName = document.getElementById('branchName').value;
       var branchLocation = document.getElementById('branchLocation').value;

       // 값이 비어 있는지 확인
       if (!branchName || !branchLocation) {
           alert("내용을 입력해주세요.");
           return; // 값이 비어 있다면 함수를 실행하지 않음
       }

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
    
    function branchProductRegisterBtn(){
        	console.log(currentBranchName);
        	console.log(currentProductName);
    	  var isConfirmed = confirm("등록하시겠습니까?");
        if (isConfirmed) {
        	branchProductRegister(currentBranchName, currentProductName);
        	
        } else {
            console.log("등록이 취소되었습니다.");
        }
        
    }
   

    
   	// 모달 상품등록 데이터를 서버로 보내는 함수
    function branchProductRegister(currentBranchName, currentProductName){
   		console.log("모달 상품등록 버튼");
    	$.ajax({
        type: 'post',
        url: 'branchProductRegister.do',
        data: {
        	currentBranchName: currentBranchName,
        	currentProductName: currentProductName
        },
        success: function(data) {
            console.log(data);
            console.log("성공");
           alert("등록되었습니다!");
           /* swal("등록되었습니다!", "", "success"); */
           console.log(currentBranchName);
        },
        error: function(error) {
            console.error(error);
        }
    	});
    }
   	
   	// 본사상품 등록 페이지 불러오기
    function productInfoRegister(){
     	$.ajax({
	      url: "productInfoRegister.go",
	      type: "GET",
	      success: function(data) {
	          $("#productInfoRegisterPage").html(data);
	      },
	      error: function(e) {
	          console.log(e);
	      	}
	  	});
   }
   	
   	var productID;
    document.getElementById('productTable').addEventListener('click', function (event) {
      // 체크박스를 클릭한 경우에만 처리
      if (event.target.type === 'checkbox' && event.target.name === 'productCheckbox') {
          // 체크된 체크박스의 productID 값을 가져옴
          productID = event.target.getAttribute('ßID');
          branchID = event.target.getAttribute('data-branchID');
          console.log('Selected ProductID:', productID);
          console.log('Selected branchID:', branchID);
      }
  });
    
   	// 지점 상품 삭제
   	function branchProductDelete(){
   		console.log(productID);
   		console.log(branchID);
	   	 var isConfirmed = confirm("삭제하시겠습니까?");
	     if (isConfirmed) {
	    	 $.ajax({
	    			url: "branchProductDelete.do",
	 	   		data: {
	 	        'productID': productID,
	 	        'branchID' : branchID
	 	     	},
	    			type: "POST",
	    			success: function(data){
	    				console.log("지점상품 삭제 성공");
	    				alert("상품이 삭제되었습니다!");
	    			},
	    			error: function(e){
	    				console.log(e);
	    			}
	    		});
	     } else {
	     }
   	}
   	
   	var msg = "${msg}";
   	if(msg!=""){
   		alert(msg);
   	}

</script>
</html>