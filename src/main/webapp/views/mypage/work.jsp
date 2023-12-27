<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <div id="dateserch" style="float: left; margin-left: 19%; margin-top: 2%;">
		<label for="date">
        <input type="date" id="dfirstsearchdate" value="" />
        ~
        <input type="date" id="dlastsearchdate" value="" />
        <input type="button" id="dsearchButton" class="comm-btn" value="검색" />
    	</label>
</div>


		<tr>	   
			<th>날짜</th>
			<th>번호</th>
			<th>출근시간</th>
			<th>퇴근시간</th>
		</tr>
		 <li>		
		<c:if test="${list.size()==0}">
		<tr><td colspan="5">게시물이 존재하지 않습니다.</td></tr>
		</c:if>
		<c:forEach items="${list}" var="work">
		<tr>
			<td>${work.workDate}</td>
			<td>${work.workID}</td>
			<td>${work.gowork}</td>
			<td>${work.leavework}</td>		
		</tr>
		</c:forEach>
	</table>
	
	
	
</body>
<script>
const today = new Date();
const yesterday = new Date(today);
yesterday.setDate(today.getDate() - 1);

const year = today.getFullYear();
const month = (today.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 두 자리로 포맷
const firstDayOfMonth = year + '-' + month + '-01';

// 어제 날짜를 "yyyy-mm-dd" 형식으로 포맷
const formattedYesterday = yesterday.getFullYear() + '-' + (yesterday.getMonth() + 1).toString().padStart(2, '0') + '-' + yesterday.getDate().toString().padStart(2, '0');

function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear(); // 연도를 4자리로 가져옵니다.
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    return year + '-' + month + '-' + day;
}


//달력으로 조회
$('#searchButton').on('click', function () {
	showPage = 1;
	$('#pagination').twbsPagination({
	    startPage: '1'
	});
    if($('#firstsearchdate').val() && $('#lastsearchdate').val()){
    firstSearchDateValue = $('#firstsearchdate').val();
    lastSearchDateValue = $('#lastsearchdate').val();
    console.log(firstpage);
    if(firstpage){
    	adminGroupBuyIntList(showPage,searchblock,firstSearchDateValue,lastSearchDateValue);		
	}else{
		adminGroupBuySerUserIntList(showPage, searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
	}
    }else{
    	alert('날짜를 모두 선택해 주세요.');
    }
});

</script>
</html>