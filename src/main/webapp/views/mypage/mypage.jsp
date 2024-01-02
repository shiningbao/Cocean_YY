<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
#tank_head {
	background-color: #86B0F3;
}

#tank_table {
	width: 72%;
	height: 80%;
	text-align: center;
	position: absolute;
	top: 255px;
	left: 400px;
}

</style>
</head>
<body>

<jsp:include page="../side.jsp"></jsp:include>


<!--  
    <c:url value=''/>
    -->

<div id="title">
		<a>내 정보</a>
	</div>
	<c:forEach var='mypage' items="${list}">

		 <table class="list_box">
            <tr>
                <td class="profile_image" rowspan="4">
                    <span class="img_profile">
                       <label class="photo" for="fileInput" style="width: 10%;">
                        <c:choose>
                            <c:when test="${mypage.profileImage != null}">
                                <img src="/photo/cocean/personnel/${mypage.profileImage}" id="thumbnail_image" alt="프로필 사진">
                            </c:when>
                            <c:otherwise>
                                <img src="/Cocean/resource/img/psProfile.jpg" id="thumbnail_image" alt="프로필 사진">
                            </c:otherwise>
                        </c:choose>
				    </label>
                    </span>
                </td>
                
                <th class="name">이름</th>
                <td class="" colspan="3">${mypage.name }</td>
                <th class="team">소속</th>
                <td class="last" colspan="3">${mypage.departmentName }</td>
            </tr>
            <tr>
                <th class="number">사번</th>
                <td class="number_txt">${mypage.employeeID }</td>
                <th class="telephone">지점</th>
                <td class="telephone_txt last">${mypage.branchName }</td>
            </tr>
            <tr>
                <th class="email">직위 / 직책</th>
                <td class="email_txt">${mypage.positionName} / ${mypage.rankName }</td>
                <th class="mobile">휴대번호</th>
                <td class="mobile_txt last">${mypage.phoneNumber }</td>
            </tr>
            <tr>
                <th class="rank">담당</th>
                <td class="rank_txt">${mypage.responsibility }</td>
                <th class="address">주소</th>
                <td class="address_txt ">${mypage.address }</td>
                <th class="remain">연차</th>
                <td class="remain_txt">${mypage.remainingAnnualLeave}</td>
            </tr>
    </table>
 
    </c:forEach>





















    
    <input type="button" id="usermody" OnClick="location.href ='./mypageupdate'" value="수정">    
        
        
        
        
        
        
    
</body>
<script>
















/*
listCall();


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
	list.forEach(function(item, idx){
		  content += '<tr>';
		  content +='<td>'+item.idx+'</td>'
		  content += '<td>'+item.name+'</td>';
	      content += '<td>'+item.employeeID+'</td>';   
	      content += '<td>' + item.rankName + '</a></td>';
	      content += '<td>'+item.positionName+'</td>';
	      content += '<td>'+item.departmentName+'</td>';
	      content += '<td>'+item.phoneNumber+'</td>';
	      content += '<td>'+item.remainingAnnualLeave+'</td>';    
		  content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
	
}
*/












/* var userImg
var name;
var employeleeID;
var rankName;
var departmentName;
var positionName;
var phoneNumber;


var residue;
var Annual;
var Banchacha;


function myPageInfo(){
	console.log("유저 정보")
	$.ajax({
		type: 'get',
		url: 'mypage/myInfo.ajax',
		data: {},
		dataType: 'json',
		success: function(data) {
			console.log(data.myInfo);
		data.myInfo.forEach(function(item, idx) { //idx는 인덱스를 뜻한다
			userImg = item.userImg
			name = item.name;
			employeleeID = item.employeleeID;
			rankName = item.rankName;
			departmentName = item.departmentName;
			positionName = item.positionName;
			phoneNumber = item.phoneNumber;
		});
			$('#userImg').html(userImg);
			$('#name').html(name);	
			$('#employeleeID').html(employeleeID);	
			$('#rankName').html(rankName);	
			$('#departmentName').html(departmentName);	
			$('#positionName').html(positionName);	
			$('#phoneNumber').html(phoneNumber);
			
			residue = data.attendanceDraft.residue;
			Annual = data.attendanceDraft.Annual;
			Banchacha = data.attendanceDraft.Banchacha;
			$('#count_1').html(residue);
			$('#count_2').html(Annual);
			$('#count_3').html(Banchacha);
			
		},
		error: function(e){
			console.log(e);
		}
	});
	
}
 */
/*
var userImg, name, employeeID, rankName, departmentName, positionName, phoneNumber;
*/


//연차 반차 남은연차
//var residue, Annual, Banchacha;
/*
function myPageInfo() {
    console.log("유저 정보");
    $.ajax({
        type: 'GET', // Use uppercase 'GET'
        url: 'myInfo.ajax',
        dataType: 'json',
        success: function(data) {
            console.log(data.myInfo);

            data.myInfo.forEach(function(item, idx) {
                userImg = item.userImg;
                name = item.name;
                employeeID = item.employeeID; // Correct variable name
                rankName = item.rankName;
                departmentName = item.departmentName;
                positionName = item.positionName;
                phoneNumber = item.phoneNumber;
            });

            $('#userImg').html(userImg);
            $('#name').html(name);
            $('#employeeID').html(employeeID); // Correct ID
            $('#rankName').html(rankName);
            $('#departmentName').html(departmentName);
            $('#positionName').html(positionName);
            $('#phoneNumber').html(phoneNumber);

         /*    residue = data.attendanceDraft.residue;
            Annual = data.attendanceDraft.Annual;
            Banchacha = data.attendanceDraft.Banchacha;
            $('#count_1').html(residue);
            $('#count_2').html(Annual);
            $('#count_3').html(Banchacha); 
        },
        error: function(e) {
            console.log(e);
        }
    });
}*/

// Call the function when the document is ready
/*
$(document).ready(function() {
    myPageInfo();
});*/

</script>
</html>