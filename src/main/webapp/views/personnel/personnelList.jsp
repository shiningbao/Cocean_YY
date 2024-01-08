<%@ page language="java" contentType="text/html; charset=UTF-8"	
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resource/css/sidebar.css'/>">
<link rel="icon" href="resource/img/favi.png" type="image/x-icon">

<!-- 부트스트랩 CSS/favicon -->

<title>Insert title here</title>
<style>
#personnel_head {
	background-color: #86B0F3;
}







@media screen and (max-width: 1457px) {
	#psSchBtn {
		top: 23%;
	}
	#psSchBtn button {
		width: 233px;
	}
	#psSchBtn input {
		margin-bottom: 5px;
	}
}
/* #personnelRegist{
    top: 26%;
    width:5%%;
    position: absolute;
    left: 90%
} */
#psSchBtn{
	margin-bottom: 10px !important;
}
/* #search{
	    position: absolute;
	    top:20%;
    left: 73%;
} */


#dropdownMenuButton{
    border: none;
    background: none;
    padding: 0; /* 내부 여백 제거 */
    cursor: pointer;
    float:right;
    width: 
}

.dropdown {
    position: relative;
}

.dropdown-menu {
    display: none;
    position: absolute;
    z-index: 1;
}

.psSelect2 {
    /* form-control 클래스 스타일 */
    margin-bottom:12px;
    height:38px;
    display: block;
    width: 20%%;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}


</style>
</head>
<body>

<c:import url="/side"/>
		<div class="container-fluid contentField">

		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">사원리스트</h1>
		</div>
		    <div class="card shadow mb-4">
                      <div class="card-body">
                                    <button type="button" style="margin-left: 91%;" id="personnelRegist" class="btn btn-primary " data-toggle="modal" data-target="#regModal">사원등록</button>
        <div id="checkBox">
        
        <nav class="navbar navbar float-right" id="search">
            <form class="form-inline">
           		<select id="emName" class="psSelect2">
           			<option value="employeeID">사번</option>
           			<option value="name">이름</option>
           		</select>
              <input class="form-control mr-sm-2" id="inputSearch" type="search" placeholder="사원명이나 사번을 입력하세요." aria-label="Search">
              <button class="btn btn-outline-primary my-2 my-sm-0" id="psSchBtn" type="button">검색</button>
              
            </form>
          </nav>
    	</div>
    

	<div id="personnel_table">
		<table class="table table-hover">
			<thead id="personnel_head">
				 <tr>
			        <th scope="col">사번</th>
			        <th scope="col">이름</th>
			        <th scope="col">부서</th>
			        <th scope="col">직급</th>
			        <th scope="col">직책</th>
			        <th scope="col">상태</th>
			        <th scope="col">
			        	<div class="dropdown">
			                <button class="dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="bottom: 3%;position: absolute;left: 6%;">
			                	지점
			                </button>
			                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			                    <a class="dropdown-item" href="#" data-value="지점">지점</a>
			                </div>
			            </div>
			            </th>
			    </tr>
			</thead>

			<tbody id=personnelList>
				<c:forEach items="${list}" var="item">
					<tr>
						<td scope="row">${item.employeeID}</td>
						<td><a href="detail.go?employeeID=${item.employeeID}">${item.name}</a></td>
						<td>${item.departmentName}</td>
						<td>${item.rankName}</td>
						<td>${item.positionName}</td>
						<td>${item.status}</td>
						<td>${item.branchName}</td>
					</tr>
				</c:forEach>
			</tbody> 
		</table>
	</div>
	
	<div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <!-- 모달창 제목 -->
            <h5 class="modal-title ">사원등록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
 			<jsp:include page="../personnel/personnel.jsp"></jsp:include>
          </div>
        </div>
      </div>
    </div>
</div>
                                    
                                    
                                </div>
                            </div>
<!-- 	<div class="thisMember">현재 사원수</div> -->
		
<c:import url="/footer"/>	
</body>
<script>
    var tableHTML = '';

    // 페이지 로드 시 AJAX를 사용하여 서버에서 지점 목록을 가져옵니다.
    $.ajax({
        url: 'getBranch.do',
        method: 'GET',
        success: function(response) {
            // 성공적으로 데이터를 받아온 경우 드롭다운 메뉴 생성
            response.forEach(function(getbranch) {
                $('.dropdown-menu').append('<a class="dropdown-item" href="#" data-value="' + getbranch + '">' + getbranch + '</a>');
            });
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });

    // 드롭다운 메뉴의 항목을 클릭했을 때 테이블을 그리도록 이벤트 핸들러를 등록합니다.
    $('.dropdown-menu').on('click', '.dropdown-item', function(event) {
        console.log('click');
        var selectedBranchValue = $(this).data('value');
		
        $.ajax({
            url: 'getSelectOptionBranch.do',
            method: 'GET',
            data: { selectedBranchValue: selectedBranchValue },
            success: function(data) {
            	console.log(data);
            	 fillTable(data);
            },
            error: function(e) {
                console.error(e);
            }
        });
    });
	
    $('#psSchBtn').on('click',function(){
    	var select = $('select');
    	var selectedOption = $("#emName option:selected").text();
    	 
    	 var searchInput = $('.form-control');
    	 var searchValue = $('#inputSearch').val();
    	 console.log(selectedOption);
    	 console.log(searchValue);
    		 $.ajax({
    			 url:'searchPerson.do',
    			 method:'GET',
    			 data:{searchValue:searchValue,
    				 selectedOption:selectedOption},
    			 success:function(data){
    				 console.log(data);
    				 fillTable(data);
    			 },
    			 error:function(e){}
    		 });
    	 
    })
    
    function fillTable(data) {

    data.forEach(function(item) {
        tableHTML += '<tr>';
        tableHTML += '<td>' + item.employeeID + '</td>';
        tableHTML += '<td><a href="detail.go?employeeID=' + item.employeeID + '">' + item.name + '</a></td>';
        tableHTML += '<td>' + item.departmentName + '</td>';
        tableHTML += '<td>' + item.rankName + '</td>';
        tableHTML += '<td>' + item.positionName + '</td>';
        tableHTML += '<td>' + item.status + '</td>';
        tableHTML += '<td>' + item.branchName + '</td>';
        tableHTML += '</tr>';
    });

    tableHTML += '</tbody>';
    $('#personnelList').html(tableHTML);
}

</script>
</html>