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


.outaddress{
position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100px;
  height: 100px;
  overflow: auto;
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
      <li><a href="#tab01">탭1</a></li>
      <li><a href="#tab02">탭2</a></li>
    </ul>
    <div class="tabcontent">
      <div id="tab01">

   <input type="text" name="name" placeholder="이름을 입력해주세요."/>
   <button id="search">검색</button>
    
    
    <button onclick="del()">삭제</button>
    <input id="outsidejoin" type="button" value="주소록 추가"/>
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
       	<form action="insearch" method="get">
<input type="text" name="inname" placeholder="이름을 입력해주세요."/>
	<button id="search">검색</button>
</form>

	<table class="inaddress">
		<tr>	
			<th>이름</th>
			<th>전화번호</th>
			<th>직급</th>
			<th>직책</th>
			<th>부서</th>
		</tr>	
		<c:if test="${list.size()==0}">
		<tr><td colspan="5">게시물이 존재하지 않습니다.</td></tr>
		</c:if>
		<c:forEach items="${list}" var="inaddress">
		<tr>
			<td>${inaddress.name}</a></td>
			<td>${inaddress.phoneNumber}</td>
			<td>${inaddress.rankName}</td>
			<td>${inaddress.positionName}</td>
			<td>${inaddress.departmentName}</td>
		</tr>
		</c:forEach>
	</table>
      
     
      </div>
    </div>
  </div>


</body>
<script>
listCall();


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




//내부검색






     

$('#outsidejoin').on('click',function(){
   location.href='./outsidejoin';
});





$('#all').on('click',function(){
   var $chk = $('input[type="checkbox"]');
   console.log($chk);
   if($(this).is(":checked")){
      $chk.prop("checked",true);
   }else{
      $chk.prop("checked",false);
   }
   
});

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
            alert('선택한'+data.del_cnt+' 개의 게시물이 삭제 되었습니다.');
            listCall();
         }
      },
      error:function(e){
         console.log(e);
      }

   });
}


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

//외부 검색
$('#search').on('click',function(){
   var $name = $('input[name="name"]').val();
   console.log($name);
   var content = '';
   $.ajax({
      type:'get',
      url:'namesearch',
      data:{"name":$name},
      dataType:'json',
      success:function(data){
    	  console.log(data);
         drawList(data);
      },
      error:function(e){
         console.log(e);
      }
   });   
 
});








   







</script>
  
  
</html>

 
 