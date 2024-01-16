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

#container-work {
  
    margin-top: 100px; 
    margin-left: 50px;
   margin-bottom: 10px; 
}

table {
    margin: auto; 
    margin-top: 100px; 
    width:1000px;
}


/* 출근 퇴근*/
 #attendanceButton, #leaveButton {
            padding: 6px 20px; 
            font-size: 20px;
        
  }      
  
       
 #work_table {
 	margin-top:0px;
 }       
 
        
 #work_table th {
	background-color: #86B0F3;
}
   
 #work_table td {
	background-color: #E9ECEF;
}

#pfirstsearchdate {
margin-left:300px;

}

#work-button{
margin-top:-60px;
margin-left:-20px;

}
        
</style>
</head>
<body>




  <c:import url="/side" />
	<div class="container-fluid contentField">  
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">근태 기록</h1>
	</div>  

<div class="card shadow p-3"> 
	<div id="container-work">
	<div id="work-button">
	<label for="date">
        <input type="date" id="pfirstsearchdate" value="" style="height: 38px; font-size: 14px; width:150px"/>
        ~
        <input type="date" id="plastsearchdate" value="" style="height: 38px; font-size: 14px; width:150px"/>
        
        <button class="btn btn-outline-primary my-2 my-sm-0" type="button" id="psearchButton">검색</button> 
    </label>
	</div>
	<table id="work_table">
		<thead>
        	<tr>
        	<!--  
        		<th>번호</th>
			-->	
				<th>날짜</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
        	</tr>
		</thead>
    	<tbody id="worklist">
    	</tbody>
	</table>
<!--  
	<button type="submit" id="attendanceButton" class="btn btn-primary">출근</button>
	<button type="submit" id="leaveButton" class="btn btn-primary">퇴근</button>
-->	
</div>









	</div>
	
	</div>
</body>
<script>
const today = new Date();
const yesterday = new Date(today);
yesterday.setDate(today.getDate());// -1빼버리면 현재 날짜로

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
	    		/*
	    		content +='<td>'+item.workID+'</td>';
	    		*/
	    		content +='<td>'+item.workDate+'</td>';
                content += '<td>' + (item.gowork ? item.gowork.substring(11, 19) : '') + '</td>';
                content += '<td>' + (item.leavework ? item.leavework.substring(11, 19) : '') + '</td>';
	    		
	    	
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


/*
function formatDateFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);

    var formattedDate = year + '-' + month + '-' + day;

    return formattedDate;
}

// 타임스탬프를 시간 형식으로 변환하는 함수
function formatTimeFromTimestamp(timestamp) {
    var date = new Date(timestamp);

    // 로컬 시간대와 UTC 시간과의 차이를 계산
    var timezoneOffsetInMinutes = date.getTimezoneOffset();

    // UTC 기준 시간에서 로컬 시간대와의 차이를 뺀 후, 시간 형식으로 변환
    date.setMinutes(date.getMinutes() - timezoneOffsetInMinutes);

    var year = date.getFullYear();
    var month = ('0' + (date.getMonth() + 1)).slice(-2);
    var day = ('0' + date.getDate()).slice(-2);
    
    var hours = ('0' + date.getHours()).slice(-2);
    var minutes = ('0' + date.getMinutes()).slice(-2);
    var seconds = ('0' + date.getSeconds()).slice(-2);

    var formattedTime = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;

    return formattedTime;
}




// 타임스탬프를 날짜 및 시간 형식으로 변환하는 함수(공통)

function formatDateTimeFromTimestamp(timestamp) {
    var formattedDate = formatDateFromTimestamp(timestamp);
    var formattedTime = formatTimeFromTimestamp(timestamp);

    return formattedDate + ' ' + formattedTime;
}






// 출근 퇴근 버튼
var attendanceChecked = false;
var leaveChecked = false;
var canClick = true;

function resetClickPermission() {
    console.log("클릭 권한 재설정 중.");
    var now = new Date();
    var hours = now.getHours();

    // 아침 6시에 초기화
    if (hours === 6) {
        canClick = true;
        console.log("클릭 권한이 성공적으로 재설정되었습니다.");
    }
}

function sendAttendanceData() {
    if (!canClick) {
        alert("아침 6시이후에 다시 출근 체크를 할 수 있습니다.");
        return;
    }

    if (attendanceChecked) {
        alert("이미 출근 체크 하셨습니다.");
        return;
    }

    var currentTimestamp = Date.now();
    var formattedTime = formatTimeFromTimestamp(currentTimestamp); // 시간
    var formattedDate = formatDateFromTimestamp(currentTimestamp); // 년월일

    var url = "gocheck";

    var requestData = {
        timedata: formattedTime, datedate: formattedDate
    };

    $.ajax({
        type: "POST",
        url: url,
        data: requestData,
        dataType: "json",
        success: function (data) {
            console.log("서버 응답: " + data);
            alert("출근이 되었습니다.");
            attendanceChecked = true;
            canClick = false; // 출근 클릭 후에는 다시 클릭하지 못하게 설정
        },
        error: function (error) {
            console.error(error);
        }
    });
}

$("#attendanceButton").click(function () {
    sendAttendanceData();
});

function leaveAttendanceData() {
    if (leaveChecked) {
        alert(" 아침 6시이후에 다시 퇴근체크를 할 수 있습니다.");
        return;
    }

    if (!attendanceChecked) {
        alert("출근 체크를 먼저 해주세요.");
        return;
    }

    var currentTimestamp = Date.now();
    var formattedTime = formatTimeFromTimestamp(currentTimestamp); // 시간
    var formattedDate = formatDateFromTimestamp(currentTimestamp); // 년월일

    var url = "leavecheck";

    var leaveData = {
        timedata: formattedTime, datedate: formattedDate
    };

    $.ajax({
        type: "POST",
        url: url,
        data: leaveData,
        dataType: "json",
        success: function (data) {
            console.log("서버 응답: " + data);
            alert("퇴근이 되었습니다.");
            leaveChecked = true; // 퇴근 체크 후 플래그 설정
            attendanceChecked = false; // 출근 체크 여부 초기화
            canClick = false; // 퇴근 클릭 후에는 다시 클릭하지 못하게 설정
        },
        error: function (error) {
            console.error(error);
        }
    });
}

$("#leaveButton").click(function () {
    leaveAttendanceData();
});

// 1분마다 클릭 여부 초기화 확인
setInterval(resetClickPermission, 60000);

*/
















</script>
</html>