<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        #pointHistory{position:relative; margin-top:150px; overflow: hidden;}
        #lnb{position: fixed; left:0; top:100px; width:300px; height:100%; background-color: #f9f9f9; z-index: 99;}
        #lnb ul{margin-top:20px;}
        #lnb ul li{width:280px; height:60px; line-height: 60px; box-sizing: border-box; border-radius: 10px; margin:10px auto; padding-left:40px; font-family: 'KorailRoundGothicBold';}
        #lnb ul li.on{background-color: #fcdfa0; color:#fff;}
        #lnb a:hover{text-decoration:none;}
        #lnb .logout{position:absolute; margin-left:50px; bottom:200px;}
        #lnb .logout a span{font-size:20px; line-height:25px; position:relative; top:-7px; color:#FFBC38;}
        #pointHistory .pointHistoryInner{position:relative; left:300px;}
        #pointHistory .pointHistoryInner .pagingArea{position: relative; width:400px; height: 36px; border: 1px solid #b7b7b7; margin:0 32%;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox{position:relative; width:1200px; height:680px; margin:0 11%;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox h2{text-align: center; font-size:38px; margin-bottom: 40px;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox p{font-size:30px;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .tabs{position:absolute; width:140px; height:35px; left:0; top:40px; background-color: #FFBC38; text-align: center; border-radius: 5px; box-sizing: border-box;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .tabs li{float:left; width:50%; height:35px; cursor: pointer; font-size:16px; line-height:35px; color:#fff; border:1px solid #FFBC38; box-sizing: border-box; border-radius: 5px;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .tabs li.on{color: #FFBC38; background-color: #fff;} 
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .tabs li:hover{color: #FFBC38; background-color: #fff;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .listForm{position:absolute; width:1200px; height:550px; text-align: center;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .listForm>ul>li{width:100%; height:50px; border-bottom: 1px solid #b7b7b7; box-sizing: border-box;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .listForm>ul>li:first-child{border-top: 1px solid #222; border-bottom: 1px solid #222; background-color: #fcdfa0;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .listForm ul li .listTitle{box-sizing: border-box;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox #chargeListForm ul li .listTitle li{float:left; width:25%; line-height:50px; font-size:18px; font-family: 'KorailRoundGothicBold'; box-sizing: border-box;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox #useListForm{display: none;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox #useListForm ul li .listTitle li{float:left; width:20%; line-height:50px; font-size:18px; font-family: 'KorailRoundGothicBold'; box-sizing: border-box;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .pointListBox{position: relative; width:1200px; height:500px; margin-top:90px; margin-bottom: 30px;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox .pointListBox>li{width:100%; height:50px;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox #chargeListBox>li>ul>li{float:left; width:25%; text-align: center; line-height: 50px; box-sizing: border-box;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox #useListBox{display: none;}
        #pointHistory .pointHistoryInner .pointHistoryInnerBox #useListBox>li>ul>li{float:left; width:20%; text-align: center; line-height: 50px; box-sizing: border-box;}
        .container {padding-right: 280px;}

</style>
</head>
<body>
  <section id="pointHistory">
        <div class="pointHistoryInner">
            <div class="pointHistoryInnerBox">
                <h2>포인트 내역</h2>
                
                <ul class="tabs">
                    <li id="chargePoint" class="on">충전</li>
                </ul>
                <div id="chargeListForm" class="listForm">
                    <ul>
                        <li>
                            <ul class="listTitle">
                                <li>이름</li>
                                <li>전화번호</li>
                                <li>직급</li>
                                <li>부서</li>
                            </ul>
                        </li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>           
                <ul id="chargeListBox" class="pointListBox">
                    
                </ul>
                <ul id="useListBox" class="pointListBox">
                	
                </ul>
            </div>
            <div class="container">
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
        </div>
    </section>
</body>
<script>

var msg = '${msg}';
if(msg != ''){
	alert(msg);
}


var showPage = 1;
chargeListCall(showPage);

$('.tabs>li').on('click', function () {
	  $(this).addClass('on');
	  $(this).siblings().removeClass('on');

	  if ($(this).attr('id') === 'chargePoint') {
	    $('#chargeListForm').fadeIn(500);
	    $('#chargeListBox').fadeIn(500);
	    $('#pagination').twbsPagination('destroy');
	    chargeListCall(showPage);
	    
	  }
	});
	
function useListCall(page){
	console.log("useListCall");
	$.ajax({
		type: 'post',
		url: 'useListCall.ajax',
		data: {'page':page},
		dataType: 'json',
		success:function(data){
			console.log("성공");
			console.log(data);
			drawUseList(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}


function chargeListCall(page){
	console.log("chargeListCall");
	$.ajax({
		type: 'post',
		url: 'chargeListCall.ajax',
		data: {'page':page},
		dataType: 'json',
		success:function(data){
			console.log("성공");
			console.log(data);
			drawChargeList(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

	
function drawChargeList(obj){
	var content = '';
	obj.chargeList.forEach(function(item, idx){
		content += '<li><ul>';
		content += '<li>'+item.userId+'</li>';
		var money = item.chargePrice.toLocaleString();
		content += '<li>'+money+'원</li>';
		content += '<li>'+item.depositor+'</li>';
		var date = new Date(item.chargeDate);
		var dateStr = date.toLocaleDateString("ko-KR");
		content += '<li>'+dateStr+'</li>';
		content += '</ul></li>';
	});
	$('#chargeListBox').empty();
	$('#chargeListBox').append(content);
	
	
	$('#pagination').twbsPagination({
		startPage:1, // 보여줄 페이지
		totalPages:obj.pages,// 총 페이지 수(총갯수/페이지당보여줄게시물수) : 서버에서 계산해서 가져와야함
		visiblePages:10,//[1][2][3][4][5]
		onPageClick:function(e,page){ // 번호 클릭시 실행할 내용
			//console.log(e);
			if(showPage != page){
				console.log(page);
				showPage = page; // 클릭해서 다른 페이지를 보여주게 되면 현재 보고 있는 페이지 번호도 변경해 준다.
				chargeListCall(page);
			}
		}
	});
}
</script>
</html>