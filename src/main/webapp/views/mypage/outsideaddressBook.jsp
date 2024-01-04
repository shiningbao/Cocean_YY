<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
table, th, td{
   border: 1px solid black;
   border-collapse: collapse;
   padding: 5px 10px;
}

html,body {width:100%;  }
body,div,ul,li{margin:0; padding:0;}
ul,li {list-style:none;}


/*tab css*/
.tab{float:left; width:1200px; height:600px; overflow: auto;}
.tabnav li{display: inline-block;  height:46px; text-align:center; border-right:1px solid #ddd;}
.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
.tabnav li a.active:before{background:#7ea21e;}
.tabnav li a.active{border-bottom:1px solid #fff;}
.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 30px; line-height:46px; text-decoration:none; font-size:16px;}
.tabnav li a:hover,
.tabnav li a.active{background:#fff; color:#7ea21e; }


/*
 position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 200px; 
  height: 200px; 
  overflow: auto;
  */


.outaddress{
 position: absolute;
  top: 40%; /* 예시로 10%로 조정. 필요에 따라 조절하세요. */
  left: 60%;
  transform: translate(-50%, -50%);
  width: 600px;
  height: 50px;
 
}


.inaddress{
position: absolute;
  top: 90%;
  left: 60%;
  transform: translate(-50%, -50%);
  width: 1000px;
  height: 50px;
}




</style>
</head>

<body>



 




<jsp:include page="../side.jsp"></jsp:include>



<div class="tab">
<!-- 외부검색 -->
    <ul class="tabnav">
      <li><a href="#tab01" value="tab01">탭1</a></li>
      <li><a href="#tab02" value="tab02">탭2</a></li>
    </ul>
    
    <div class="tabcontent">
      <div id="tab01">
      <!-- 
   <input type="text" name="name" placeholder="이름을 입력해주세요."/>
   <button id="search">검색</button>
    -->
    <!--  
    <nav class="navbar navbar" id="search">
    <form class="form-inline">
    <input type="text" name="name" value="" placeholder="이름을 입력해주세요." style="margin: 0px 5px;"/>
	<input type="button" id="reserch" value="검색" style="margin: 0px 5px;"/>
	 </form>
	 </nav>
	 -->
	 <!--  
	     <nav class="navbar navbar" id="search">
            <form class="form-inline">
              <input class="form-control mr-sm-2" type="text" name="name" value="" placeholder="이름을 입력해주세요." aria-label="Search">
              <button class="btn btn-outline-primary my-2 my-sm-0" type="button" id="reserch" type="submit">검색</button>
            </form>
          </nav>
	 -->
	 
	 <div class="container text-center">
    <nav class="navbar navbar" id="search">
        <form class="form-inline mx-auto">
            <input class="form-control mr-sm-2" type="text" name="name" value="" placeholder="이름을 입력해주세요." aria-label="Search">
            <button class="btn btn-outline-primary my-2 my-sm-0" type="button" id="reserch">검색</button>
        </form>
	<input type="button" id="outreturn" value="외부 리스트" style="margin: 0px 5px;"/>
    <button onclick="del()">삭제</button>
    <input id="outsidejoin" type="button" value="주소록 추가"/>   
    </nav>
</div>
	 
    
   <table class="outaddress">
      <thead>
      <tr>
         <th><input type="checkbox" id="all"/></th>
         <th>번호</th>
         <th>이름</th>
         <th>전화번호</th>
         <th>직급</th>
         <th>직책</th>
         <th>부서</th>
      </tr>
      </thead>
      <!-- 내용 -->
      <tbody id="list">      
      </tbody>      
   </table>
	</div>
	
	
      <div id="tab02">
       <input type="text" name="inname" value="" placeholder="이름을 입력해주세요." style="margin: 0px 5px;"/>
	<input type="button" id="inreserch" value="검색" style="margin: 0px 5px;"/>
    <input type="button" id="inreturn" value="내부 리스트" style="margin: 0px 5px;"/>
    
    <table class="address">
      <thead>
      <tr>
         <th>이름</th>
         <th>전화번호</th>
         <th>직급</th>
         <th>직책</th>
         <th>부서</th>
      </tr>
      </thead>
      <!-- 내용 -->
      <tbody id="inlist">      
      </tbody>      
   </table>
      </div>
    </div>
  </div>


</body>
<script>
listCall();
addresslistCall();

//외부 리턴
$('#outreturn').on('click',function(){
	listCall();
});

//내부 리턴
$('#inreturn').on('click',function(){
	addresslistCall();
});


//탭버튼 전환
$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
	  });



var msg = "${msg}";
if(msg != ""){
   alert(msg);
}

     
//외부주소록
$('#outsidejoin').on('click',function(){
   location.href='./outsidejoin';
});




//외부주소록
$('#all').on('click',function(){
   var $chk = $('input[type="checkbox"]');
   console.log($chk);
   if($(this).is(":checked")){
      $chk.prop("checked",true);
   }else{
      $chk.prop("checked",false);
   }
   
});

//외부주소록
function del(){
   var chkArr = [];
   $('input[type="checkbox"]:checked').each(function(addressNumber,item){
      var val = $(item).val();
      if(val != 'on'){
         chkArr.push(val);
      }      
   });
   console.log(chkArr);
   
   $.ajax({
      type:'get',
      url:'delete',
      data:{'delList':chkArr},
      dataType:'JSON',
      success:function(data){
         console.log(data);
         if(data.del_cnt>0){
            alert('선택한'+data.del_cnt+' 개의 주소록이 삭제 되었습니다.');
            listCall();
         }
      },
      error:function(e){
         console.log(e);
      }

   });
}

//외부주소록

function listCall(){
   $.ajax({
      type:'get',
      url:'listCall',
      data:{},
      dataType:'json',
      success:function(data){
         console.log(data);
         if(!data.login){
            alert('로그인이 필요한 서비스 입니다.');
            location.href='./';
         }else{
            drawList(data.list);
         }      
      },
      error:function(e){
         console.log(e);
      }
   });   
}

//외부주소록
function drawList(list){
   console.log(list);
   var content = '';
   list.forEach(function(item, addressNumber){
      content += '<tr>';
      content += '<td><input type="checkbox" value="'+item.addressNumber+'"/></td>';
      content += '<td>'+item.addressNumber+'</td>';   
      content += '<td><a href="detail?addressNumber=' + item.addressNumber + '">' + item.name + '</a></td>';
      content += '<td>'+item.phoneNumber+'</td>';
      content += '<td>'+item.rankLevel+'</td>';
      content += '<td>'+item.positionLevel+'</td>';
      content += '<td>'+item.departmentName+'</td>';
      content += '</tr>';
   });
	   $('#list').empty();
	   $('#list').append(content);
}


//외부 주소록 검색
$('#reserch').on('click', function () {
    var name = $('input[name="name"]').val();
    console.log(name);

    $.ajax({
        type: 'get',
        url: 'addresssearch',
        data: { 'name': name },
        dataType: 'JSON',
        success: function (data) {
            console.log(data);

            var content = '';
            $('#list').empty();

            if (data.size == 0) {
                content = '<tr>';
                content += '<td style="text-align: center; color: red;">' + name + '가 존재하지 않습니다.</td>';
                content += '</tr>';
                $('#list').append(content);
            } else {
                for (var i = 0; i < data.size; i++) {
                    var item = data.list[i];
                    content += '<tr>';
                    content += '<td><input type="checkbox" value="' + item.addressNumber + '"/></td>';
                    content += '<td>' + item.addressNumber + '</td>';
                    content += '<td><a href="detail?addressNumber=' + item.addressNumber + '">' + item.name + '</a></td>';
                    content += '<td>' + item.phoneNumber + '</td>';
                    content += '<td>' + item.rankLevel + '</td>';
                    content += '<td>' + item.positionLevel + '</td>';
                    content += '<td>' + item.departmentName + '</td>';
                    content += '</tr>';
                }

                $('#list').append(content);
            }
        },
        error: function (e) {
            console.log(e);
        }
    });

    $('input[name="name"]').val('');
});












//내부 주소 리스트

function addresslistCall(){
   $.ajax({
      type:'get',
      url:'addresslistCall',
      data:{},
      dataType:'json',
      success:function(data1){
         console.log(data1);
         if(!data1.login){
            alert('로그인이 필요한 서비스 입니다.');
            location.href='./';
         }else{
        	 addressdrawList(data1.list1);
         }      
      },
      error:function(e){
         console.log(e);
      }
   });   
   
}


//내부주소리스트

function addressdrawList(list1){
   console.log(list);
   var content = '';
   list1.forEach(function(item1,idx){
      content += '<tr>';
      content += '<td>'+item1.name+'</td>';   
      content += '<td>'+item1.phoneNumber+'</td>';
      content += '<td>'+item1.rankName+'</td>';
      content += '<td>'+item1.positionName+'</td>';
      content += '<td>'+item1.departmentName+'</td>';
      content += '</tr>';      
   });
   $('#inlist').empty();
   $('#inlist').append(content);
   
}


//내부 주소록 서치
$('#inreserch').on('click', function () {
    var inname = $('input[name="inname"]').val();
    console.log(inname);

    $.ajax({
        type: 'get',
        url: 'inaddresssearch',
        data: { 'inname': inname },
        dataType: 'JSON',
        success: function (data1) {
            console.log(data1);

            var content = '';
            $('#inlist').empty();

            if (data1.size == 0) {
                content = '<tr>';
                content += '<td style="text-align: center; color: red;">' + name + '가 존재하지 않습니다.</td>';
                content += '</tr>';
                $('#inlist').append(content);
            } else {
                for (var i = 0; i < data1.size; i++) {
                    var item1 = data1.list1[i];
                    content += '<tr>';
                    content += '<td>' + item1.name + '</td>';
                    content += '<td>' + item1.phoneNumber + '</td>';
                    content += '<td>' + item1.rankLevel + '</td>';
                    content += '<td>' + item1.positionLevel + '</td>';
                    content += '<td>' + item1.departmentName + '</td>';
                    content += '</tr>';
                }

                $('#inlist').append(content);
            }
        },
        error: function (e) {
            console.log(e);
        }
    });

    $('input[name="inname"]').val('');
});





</script>
  
  
</html>

 
 