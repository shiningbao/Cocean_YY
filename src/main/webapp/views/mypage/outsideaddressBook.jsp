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

/*테이블*/
/*
.outaddress{
 position: absolute;
  top: 50%; 
  left: 60%;
  transform: translate(-50%, -50%);
  width: 1000px;
  height: 50px;
  margin-top:0px;
 
}*/
.outaddress{
margin-top:-25px;
margin-left:400px;
}

 .outaddress th {
	background-color: #86B0F3;
	width:137.5px;
}
   
 .outaddress td {
	background-color: #E9ECEF;
	width:137.5px;
}




.inaddress{
position: absolute;
  top: 90%;
  left: 60%;
  transform: translate(-50%, -50%);
  width: 1000px;
  height: 50px;
}


.tabnav {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: center; /* 가운데 정렬을 위해 추가 */
}

.tabnav li {
    margin-right: -5px;
    width: 120px;
}

.tabnav a {
    text-decoration: none;
    padding: 10px 15px;
    background-color: #2F80ED;
    color: #fff;
    border-radius: 5px;
    /*
    transition: background-color 0.3s;
    */
    display: flex;
    align-items: center;
    justify-content: center;
}

.tabnav a:hover {
   /* background-color: #2980b9;*/
    transition: background-color 0.3s; /* 이 줄을 추가하여 지속적인 색상 변경을 방지합니다. */
}



.address {
margin-top:3px;

}

 .address th {
	background-color: #86B0F3;
	width:200px;
}
   
 .address td {
	background-color: #E9ECEF;
	width:200px;
}

.row{
	position: relative;
}

/*검색창*/
.form-inline {
	position: absolute;
	left: 142px;
	top: 20px;
}



#outreturn{
margin-left:300px;
margin-bottom:20px;
margin-top:20px;
}

#outsidejoin{
margin-right:20px;
}


/*버튼 나머지 버튼들 사이 조절*/
.button-container  {
    margin-left: 373px;
}

#reserch {
    margin-right: -20px; 
}


#tab02{
margin-top:1%;
}






</style>
</head>

<body>



 




<c:import url="/side"/>

<div class="container-fluid contentField">  

<div class="card shadow p-3"> 
<div class="tab">
<!-- 외부검색 -->
    <ul class="tabnav">
      <li><a href="#tab01" value="tab01" id="tab_01">외부 주소록</a></li>
      <li><a href="#tab02" value="tab02" id="tab_02">내부 주소록</a></li>
    </ul>
    
    <div class="tabcontent">
      <div id="tab01">
	 
	 <div class="container text-center">
	 
    <nav class="navbar navbar" id="search">

 		


<div class="row">
<form class="form-inline ">
         <input class="form-control mr-sm-2" type="text" name="query" id="query" placeholder="이름 또는 부서를 입력해주세요." aria-label="이름 또는 부서 검색">
    <button class="btn btn-outline-primary my-2 my-sm-0" type="button" id="reserch">검색</button>
        </form>
   <div class="button-container">
    <button type="submit" id="outreturn" class="btn btn-primary" >검색 초기화</button>
    <button type="submit" id="outsidejoin" class="btn btn-primary" >주소록 추가</button>
    <button type="submit" id="del" class="btn btn-primary" onclick="del()" >삭제</button>
</div>
</div>
  
    </nav>
</div>
	 
    
   <table class="outaddress">
      <thead>
      <tr>
         <th><input type="checkbox" id="all"/></th>
<!--  
         <th>번호</th>
  --> 
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
      
     <div style="display: flex; flex-direction: column; align-items: center;">
    <div style="display: flex; margin-top:7px;">
    <input class="form-control mr-sm-2" type="text" name="mul" id="mul" placeholder="이름 또는 부서를 입력해주세요." aria-label="이름 또는 부서 검색">
    <button class="btn btn-outline-primary my-2 my-sm-0" type="button" id="inreserch">검색</button>
    <button type="submit" id="inreturn" class="btn btn-primary" style=" margin-left:615px">검색 초기화</button>
    </div>

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


// 이렇게 해야 alert이 중복이 안됨
var msg = "${msg}";
if(msg != ""){
   swal(msg,'','success');
}

     
//외부주소록
$('#outsidejoin').on('click',function(){
   location.href='./outsidejoin';
});




//외부주소록(체크박스)
$('#all').on('click', function (event) {
    var $chk = $('input[type="checkbox"]');
    console.log($chk);
    if ($(this).is(":checked")) {
        $chk.prop("checked", true);
    } else {
        $chk.prop("checked", false);
    }
    event.stopPropagation();
});

// 헤더의 <th>에 대한 클릭 이벤트 추가
$('th').on('click', function () {
    $('#all').trigger('click');
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
        	 swal('선택한' + data.del_cnt + ' 개의 주소록이 삭제 되었습니다.', '', 'success');
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
function drawList(list) {
    console.log(list);

    var content = '';

    if (list.length === 0) {
        content = '<tr>';
        content += '<td colspan="6" style="text-align: center; color: red;">저장된 주소록이 없습니다.</td>';
        content += '</tr>';
    } else {
        list.forEach(function (item, addressNumber) {
            content += '<tr>';
            content += '<td><input type="checkbox" value="' + item.addressNumber + '"/></td>';
            /* content += '<td>'+item.addressNumber+'</td>'; */
            content += '<td><a href="detail?addressNumber=' + item.addressNumber + '">' + item.name + '</a></td>';
            content += '<td>' + item.phoneNumber + '</td>';
            content += '<td>' + item.rankLevel + '</td>';
            content += '<td>' + item.positionLevel + '</td>';
            content += '<td>' + item.departmentName + '</td>';
            content += '</tr>';
        });
    }

    $('#list').empty();
    $('#list').append(content);
}

//외부 주소록 검색
$('#reserch').on('click', function () {
    var query = $('input[name="query"]').val(); 

    $.ajax({
        type: 'get',
        url: 'addresssearch',
        data: { 'query': query }, 
        dataType: 'JSON',
        success: function (data) {
            console.log(data);

            var content = '';
            $('#list').empty();

            if (data.size == 0) {
                content = '<tr >';
                content += '<td style="text-align: center; color: red;" colspan="6">' + query + '이 존재하지 않습니다.</td>';
                content += '</tr>';
                $('#list').append(content);
            } else {
                for (var i = 0; i < data.size; i++) {
                    var item = data.list[i];
                    content += '<tr>';
                    content += '<td><input type="checkbox" value="' + item.addressNumber + '"/></td>';
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

    $('input[name="query"]').val(''); // 'name'을 'query'로 변경
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
    var mul = $('input[name="mul"]').val();

    $.ajax({
        type: 'get',
        url: 'inaddresssearch',
        data: { 'mul': mul },
        dataType: 'JSON',
        success: function (data1) {
            console.log(data1);

            var content = '';
            $('#inlist').empty();

            if (data1.size === 0) {
                content = '<tr>';
                content += '<td style="text-align: center; color: red;" colspan="5">' + mul + '에 대한 결과가 없습니다.</td>';
                content += '</tr>';
                $('#inlist').append(content);
            } else {
                for (var i = 0; i < data1.list1.length; i++) {
                    var item1 = data1.list1[i];
                    content += '<tr>';
                    content += '<td>' + item1.name + '</td>';
                    content += '<td>' + item1.phoneNumber + '</td>';
                    content += '<td>' + item1.rankName + '</td>';
                    content += '<td>' + item1.positionName + '</td>';
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

    $('input[name="mul"]').val('');
});





</script>
  
  
</html>

 
 