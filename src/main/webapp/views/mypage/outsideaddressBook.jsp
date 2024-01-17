<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<style>



.outaddress{
margin-top:-25px;
margin-left:330px;
background-color: #86B0F3;
}

 .outaddress th {
	background-color: #86B0F3;
	width:137.5px;
}
   
 .outaddress td {
 background-color: #FFFFFF;
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
 background-color: #FFFFFF;
	width:200px;
}



/*검색창*/
/*
.form-inline {
	position: absolute;
	left: -255px;
	top: 45px;
}*/



#outreturn{
margin-left:300px;
margin-bottom:20px;
margin-top:20px;
}

#outsidejoin{
margin-right:20px;
}






.swal-confirm-button-center {
        margin-right:140px;       
    }

.swal-cancel-button-center{
 		text-align: center;

}

.table table-hover{
top:-20px;
}

#outaddress_head{
background-color: #86B0F3;
}

#inaddress_head{
background-color: #86B0F3;
}

.row {
        display: flex;
        align-items: center;
        margin-bottom: -20px; /* 원하는 여백 크기 조절 */
    }
    
    .table table-hover {
       position: absolute;
       top:50px;
    }
</style>
</head>

<body>



 




<c:import url="/side"/>

<div class="container-fluid contentField">  
<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">주소록</h1>
	</div>  

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
	 
    


<div class="row" style="width: 1500px;">
         <input class="form-control mr-sm-2" type="text" name="query" id="query" style="width:250px; margin-left:-240px;" placeholder="이름 또는 부서를 입력해주세요."  aria-label="이름 또는 부서 검색" >
    <button class="btn btn-outline-primary my-2 my-sm-0" type="button" id="reserch" style="height:40px; margin-left:-4px;">검색</button>
    <button type="submit" id="outreturn" class="btn btn-primary" style="width:100px; margin-left:1003px;">검색 초기화</button>
    <button type="submit" id="outsidejoin" class="btn btn-primary" style="height:40px;">주소록 추가</button>
    <button type="submit" id="del" class="btn btn-primary" onclick="confirmDelete()"style="height:40px;" >삭제</button>
</div>

  
    
</div>
	 
    
   <table class="table table-hover">
      <thead id="outaddress_head">
      <tr>
         <th><input type="checkbox" id="all"/></th>
         <th scope="col">이름</th>
         <th scope="col">전화번호</th>
         <th scope="col">회사명</th>
         <th scope="col">직급</th>
         <th scope="col">직책</th>
         <th scope="col">부서</th>
      </tr>
      </thead>
      <!-- 내용 -->
      <tbody id="list">      
      </tbody>      
   </table>
	</div>  
    
	
	
      <div id="tab02">
      
     <div style="display: flex; flex-direction: column; align-items: center;">
    <div style="display: flex; margin-top:7px; ">
    <input class="form-control mr-sm-2" type="text" name="mul" id="mul" placeholder="이름 또는 부서를 입력해주세요." aria-label="이름 또는 부서 검색" style="width:250px;">
    <button class="btn btn-outline-primary my-2 my-sm-0" type="button" id="inreserch">검색</button>
    <button type="submit" id="inreturn" class="btn btn-primary" style=" margin-left:1170px">검색 초기화</button>
    </div>

    <table class="table table-hover">
    
        <thead id="inaddress_head">
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





function confirmDelete() {
    var chkArr = [];
    $('input[type="checkbox"]:checked').each(function (addressNumber, item) {
        var val = $(item).val();
        if (val != 'on') {
            chkArr.push(val);
        }
    });

    if (chkArr.length === 0) {
        swal('선택된 항목이 없습니다.', '', 'info');
        return;
    }

    // SweetAlert2를 사용하여 삭제 여부 확인
    swal({
        title: '주의',
        text: '선택한 ' + chkArr.length + ' 개의 주소록을 삭제하시겠습니까?',
        icon: 'warning',
        buttons: {
            cancel: {
                text: '취소',
                value: null,
                visible: true,
                className: 'swal-cancel-button-center',
                closeModal: true,
            },
            confirm: {
                text: '삭제',
                value: true,
                visible: true,
                className: 'swal-confirm-button-center', // 추가된 클래스
                closeModal: true,
            }
        },
        dangerMode: true,
    })
    .then(function (confirmed) {
        if (confirmed) {
            // AJAX로 데이터 전송
            $.ajax({
                type: 'get',
                url: 'delete',
                data: { 'delList': chkArr },
                dataType: 'JSON',
                success: function (data) {
                    console.log(data);
                    if (data.del_cnt > 0) {
                        swal('선택한 ' + data.del_cnt + ' 개의 주소록이 삭제되었습니다.', '', 'success');
                        listCall();
                    }
                },
                error: function (e) {
                    console.log(e);
                }
            });
        } else {
            // 사용자가 '취소' 버튼을 클릭한 경우 아무런 작업도 수행되지 않음
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
        content += '<td colspan="7" style="text-align: center; color: black;">저장된 주소록이 없습니다.</td>';
        content += '</tr>';
    } else {
        list.forEach(function (item, addressNumber) {
            content += '<tr>';
            content += '<td><input type="checkbox" value="' + item.addressNumber + '"/></td>';
            /* content += '<td>'+item.addressNumber+'</td>'; */
            content += '<td><a href="detail?addressNumber=' + item.addressNumber + '">' + item.name + '</a></td>';
            content += '<td>' + item.phoneNumber + '</td>';
            content += '<td>' + item.companyName + '</td>';
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
                content += '<td style="text-align: center; color: red;" colspan="7">' + query + '이 존재하지 않습니다.</td>';
                content += '</tr>';
                $('#list').append(content);
            } else {
                for (var i = 0; i < data.size; i++) {
                    var item = data.list[i];
                    content += '<tr>';
                    content += '<td><input type="checkbox" value="' + item.addressNumber + '"/></td>';
                    content += '<td><a href="detail?addressNumber=' + item.addressNumber + '">' + item.name + '</a></td>';
                    content += '<td>' + item.phoneNumber + '</td>';
                    content += '<td>' + item.companyName  + '</td>';
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

 
 