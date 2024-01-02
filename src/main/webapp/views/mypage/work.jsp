<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<title>Insert title here</title>
<style>
table, th, td{
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

</style>
</head>
<body>

<!-- 
<table>

		<tr>	   
			<th>번호</th>
			<th>날짜</th>
			<th>출근시간</th>
			<th>퇴근시간</th>
		</tr>
		 <li>		
		<c:if test="${list.size()==0}">
		<tr><td colspan="5">게시물이 존재하지 않습니다.</td></tr>
		</c:if>
		<c:forEach items="${list}" var="work">
		<tr>
			<td>${work.workID}</td>
			<td>${work.workDate}</td>
			<td id="go">${fn:substring(work.gowork, 10,19)}</td>
			<td id="leave">${fn:substring(work.leavework, 10,19)}</td>		
		</tr>
		</c:forEach>
	</table>
 -->


<!-- 마이페이지 클릭하면 출퇴근 모달창 넘어가게 모달창 만들기 -->
<jsp:include page="../side.jsp"></jsp:include>
<!--  
    <div id="dateserch" style="float: left; margin-left: 19%; margin-top: 2%;">
		<label for="date">
        <input type="date" id="pfirstsearchdate" value="" />
        ~
        <input type="date" id="plastsearchdate" value="" />
        <input type="button" id="psearchButton" class="comm-btn" value="검색" />
    </label>



 <table>
		<thead>
        	<tr>
        		<th>번호</th>
				<th>날짜</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
        	</tr>
		</thead>
    	<tbody id="worklist">
    	</tbody>
	</table>

	</div>
	-->
	
	
<div id="topPointContainer" style="float: left; margin-left:2%; margin-top: 5%; margin-bottom: 40px;">
	<label for="date">
        <input type="date" id="pfirstsearchdate" value="" />
        ~
        <input type="date" id="plastsearchdate" value="" />
        <input type="button" id="psearchButton" class="comm-btn" value="검색" />
    </label>
	<table>
		<thead>
        	<tr>
        		<th>번호</th>
				<th>날짜</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
        	</tr>
		</thead>
    	<tbody id="worklist">
    	</tbody>
	</table>
</div>	
	
	

	
	
</body>
<script>
const today = new Date();
const yesterday = new Date(today);
yesterday.setDate(today.getDate() - 1);

const year = today.getFullYear();
const month = (today.getMonth() + 1).toString().padStart(2, '0'); 
const firstDayOfMonth = year + '-' + month + '-01';


const formattedYesterday = yesterday.getFullYear() + '-' + (yesterday.getMonth() + 1).toString().padStart(2, '0') + '-' + yesterday.getDate().toString().padStart(2, '0');

function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear(); 
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}



//두 개의 input 요소에 formattedYesterday 값을 설정
const pfirstSearchDateInput = document.getElementById('pfirstsearchdate');
const plastSearchDateInput = document.getElementById('plastsearchdate');

pfirstSearchDateInput.value = firstDayOfMonth;
plastSearchDateInput.value = formattedYesterday;

drawwork(pfirstSearchDateInput.value,plastSearchDateInput.value);


function drawwork(pfirstSearchDate, plastSearchDate) {
    $.ajax({
        type: 'GET',
        url: 'worklist',
        data: { 'pfirstsearchdate': pfirstSearchDate, 'plastsearchdate': plastSearchDate },
        dataType: 'json',
        success: function (data) {
        	console.log(data)
        	var content ='';   	
        	data.work.forEach(function(item, idx){
	    		idx += 1;
	    		content +='<tr>';
	    		content +='<td>'+item.workID+'</td>';
	    		content +='<td>'+item.workDate+'</td>';
	    		content +='<td>'+item.gowork.substring(11,19)+'</td>';
	    		content +='<td>'+item.leavework.substring(11,19)+'</td>';
	    		content +='</tr>';
	    	});
        	$('#worklist').empty();
			$('#worklist').append(content);
        },
        error: function (error) {
            console.error(error);
        }
    });
}

//출퇴근 날짜 검색
document.getElementById('psearchButton').addEventListener('click', function () {
	  const pfirstSearchDate = pfirstSearchDateInput.value;
	  const plastSearchDate = plastSearchDateInput.value;
	  drawwork(pfirstSearchDate, plastSearchDate);
	});


























</script>
</html>