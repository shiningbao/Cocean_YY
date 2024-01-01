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

<!-- 마이페이지 클릭하면 출퇴근 모달창 넘어가게 모달창 만들기 -->
<jsp:include page="../side.jsp"></jsp:include>

    <div id="dateserch" style="float: left; margin-left: 19%; margin-top: 2%;">
		<label for="date">
        <input type="date" id="dfirstsearchdate" value="" />
        ~
        <input type="date" id="dlastsearchdate" value="" />
        <input type="button" id="dsearchButton" class="comm-btn" value="검색" />
    	</label>
</div>


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


	
	
</body>
<script>


/*스크립트로 시간 따로 뽑기*/

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




//검색버튼 클릭시 일어나는일 다시 정리하기 
$(document).ready(function() {
    $("#searchButton").click(function() {
        // 어제 날짜 가져오기
        const yesterday = getFormattedYesterday();

        // AJAX를 사용하여 서버에 어제 날짜로 조회하는 요청을 보냅니다.
        $.ajax({
            url: "search",
            method: "GET",
            data: { date: yesterday },
            success: function(result) {
                console.log(result);
                // 결과를 처리하는 로직을 추가할 수 있습니다.
            },
            error: function(error) {
                console.error("Error during search:", error);
            }
        });
    });

    function getFormattedYesterday() {
        const today = new Date();
        const yesterday = new Date(today);
        yesterday.setDate(today.getDate() - 1);

        return formattedDate(yesterday);
    }

    function formattedDate(date) {
        const year = date.getFullYear();
        const month = (date.getMonth() + 1).toString().padStart(2, '0');
        const day = date.getDate().toString().padStart(2, '0');
        return year + '-' + month + '-' + day;
    }









//달력으로 조회
/*
$('#searchButton').on('click', function () {
    if($('#firstsearchdate').val() && $('#lastsearchdate').val()){
    firstSearchDateValue = $('#firstsearchdate').val();
    lastSearchDateValue = $('#lastsearchdate').val();
    console.log(firstpage);
    if(firstpage){
    	adminGroupBuyIntList(searchblock,firstSearchDateValue,lastSearchDateValue);		
	}else{
		adminGroupBuySerUserIntList(searchblock, seruser,firstSearchDateValue,lastSearchDateValue);       		
	}
    }else{
    	alert('날짜를 모두 선택해 주세요.');
    }
});*/



</script>
</html>