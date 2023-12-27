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

*{
  margin:0; padding:0;
  font-size:15px; 
  line-height:1.3;
}
ul{list-style:none;}
.tabmenu{ 
  max-width:600px; 
  margin: 0 auto; 
  position:relative; 
}
.tabmenu ul{
  position: relative;
}
.tabmenu ul li{
  display:  inline-block;
  width:33.33%; 
  float:left;  
  text-align:center; 
  background :#f9f9f9;
  line-height:40px;
}
.tabmenu label{
  display:block;
  width:100%; 
  height:40px;
  line-height:40px;
}
.tabmenu input{display:none;}
.tabCon{
  display:none; 
  width: 100%;
  text-align:left; 
  padding: 20px;
  position:absolute; 
  left:0; top:40px; 
  box-sizing: border-box; 
  border : 5px solid #f9f9f9;
}
.tabmenu input:checked ~ label{
  background:#ccc;
}
.tabmenu input:checked ~ .tabCon{
  display:block;
}

</style>
</head>

<body>




   
   

   
   
    
    
    <!-- 외부 검색 -->

   <input type="text" name="name" placeholder="이름을 입력해주세요."/>
   <button id="search">검색</button>
    
    
    <button onclick="del()">삭제</button>
    <input id="outsidejoin" type="button" value="주소록 저장"/>
   <table>
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

    
 

</body>
<script>
var msg = "${msg}";
if(msg != ""){
   alert(msg);
}

listCall();


/*
   function selectAll(selectAll)  {
        const checkboxes 
             = document.getElementsByName('chk');
        
        checkboxes.forEach((checkbox) => {
          checkbox.checked = selectAll.checked;
        })
      }
*/      

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
         drawList(data.list);
      },
      error:function(e){
         console.log(e);
      }
   });   
   listCall();
});






   







</script>
  
  
</html>

 
 