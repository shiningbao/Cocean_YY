<%@ page language="java" contentType="text/html; charset=UTF-8"	
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>


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
.pagination{
	margin-left: 40%;
}


</style>
</head>
<body>

<c:import url="/side"/>
		<div class="container-fluid contentField">

		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">사원리스트</h1>
		</div>
		
		<div class="row">
		<div class="form-inline ml-auto">

				<select id="emName" name="category" class="psSelect2">
					<option value="employeeID">사번</option>
					<option value="name">이름</option>
				</select> 
				<input class="form-control mr-sm-2" name="inputSearch" type="text" id="inputSearch"
					placeholder="사원명이나 사번을 입력하세요." aria-label="Search"> 
					<input type="hidden" name="startNum" value="1" id="startNum">
					<input type="hidden" name="pageNum" value="1" id="pageNum">
					<button class="btn btn-outline-primary" id="psSchBtn"
				onclick="searchGo()">검색</button>
		</div>
			
		</div>
		<div class="card shadow mb-4">
              <div class="card-body">
                                   
        

    

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
			                    <a class="dropdown-item" onclick="selectGO(e)" href="#" data-value="0">전체</a>
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
	 
	<div>
	
	
  <ul class="pagination" id="paging">
  <c:if test="${pager.pageNum > 1}">
   <li class="page-item">
  <div class="p" data-list-pn="${pager.pageNum-1}">
      <a class="page-link" data-list-pn="${pager.pageNum-1}">&laquo;</a>
    </div>
    </li>
    </c:if>
    	<c:forEach begin="1" end="${pager.totalCount}" var="i">
    	 <li class="${pager.pageNum == i ? "page-item active":"page-item"}">
      		<div class="p" data-list-pn="${i}"><a class="page-link" data-list-pn="${i}">${i}</a></div>
    	</li>
		</c:forEach>
	
	<c:if test="${pager.pageNum < pager.totalCount}">
	<li class="page-item">
	<div class="p" data-list-pn="${pager.pageNum+1}">
      <a class="page-link" >&raquo;</a>
      </div>
    </li>
    </c:if>
	  </ul>
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
                            <button type="button" style="margin-left: 91%;" id="personnelRegist" class="btn btn-primary " data-toggle="modal" data-target="#regModal">등록</button>
<!-- 	<div class="thisMember">현재 사원수</div> -->
		
<c:import url="/footer"/>	
</body>
<script>
$('.p').click(function(){
	
	const no = $(this).attr("data-list-pn");
	$("#pageNum").val(no);
	var href = location.href;
	if(href.length != 0){
		href = href.slice(0, -1) + no;
	}
	location.href = href;
})

    var tableHTML = '';

    // 페이지 로드 시 AJAX를 사용하여 서버에서 지점 목록을 가져옵니다.
    $.ajax({
        url: 'getBranch.do',
        method: 'GET',
        success: function(response) {
            // 성공적으로 데이터를 받아온 경우 드롭다운 메뉴 생성
        	 response.forEach(function(branch) {
                 $('.dropdown-menu').append('<a class="dropdown-item" onclick="selectGO()" href="#" data-value="' + branch.branchID + '">' + branch.branchName + '</a>');
             });
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
    
    $('.dropdown-item').on('change',function(){
    	
//     	location.href='personnelList.go?category='+category+'&search='+inputSearch+'&pageNum=1';
    	
    });

    // 드롭다운 메뉴의 항목을 클릭했을 때 테이블을 그리도록 이벤트 핸들러를 등록합니다.
//     $('.dropdown-menu').on('click', '.dropdown-item', function(event) {
//         console.log('click');
//         var selectedBranchValue = $(this).data('value');
		
//         $.ajax({
//             url: 'getSelectOptionBranch.do',
//             method: 'GET',
//             data: { selectedBranchValue: selectedBranchValue },
//             success: function(data) {
//             	console.log(data);
//             	 fillTable(data);
//             },
//             error: function(e) {
//                 console.error(e);
//             }
//         });
//     });
    
var category = '';  // 초기값을 빈 문자열로 설정
var inputSearch = '';  // 초기값을 빈 문자열로 설정

function selectGO(e) {

    // 이전 검색 조건 가져오기
    var currentCategory = category;
    var currentInputSearch = inputSearch;

    // 새로운 branchID 가져오기
    var branchID = $(event.target).data('value');
    console.log(branchID);


        location.href = 'personnelList.go?category=&search=&branch=' + branchID + '&pageNum=1';
  
}

function searchGo() {
    category = $('#emName').val();
    inputSearch = $('#inputSearch').val();
    console.log(inputSearch);

    if (inputSearch !== '') {
        location.href = 'personnelList.go?category=' + category + '&search=' + inputSearch + '&branch=0&pageNum=1';
    } else {
        swal({
            title: '검색어를 입력해주세요',
            button: '확인'
        });
    }
}

//     function linkClick(){

    	
// 		$('.page-link').on('click',function(){
// 	    	var no = $(this).attr("data-list-pn");
// 	    	var pageNum = $("#pageNum").val(no);
//    		 $.ajax({
// 			 url:'searchPerson.do',
// 			 method:'GET',
// 			 data:{
// 				 pageNum:pageNum
// 			dataType:'JSON',
// 			 success:function(data){
// 				 console.log(data);
//  				 fillTable(data.list);
//   				updatePagination(data.pager)
// 			 },
// 			 error:function(e){}
// 		 });
// 		})
//     }
    
//     $('#psSchBtn').on('click',function(){
//     	var select = $('select');
//     	var selectedOption = $("#emName option:selected").text();
//     	 var startNum = $('#startNum').val();
//     	 var pageNum = $('#pageNum').val();
//     	 var searchInput = $('.form-control');
//     	 var searchValue = $('#inputSearch').val();
//     	 console.log(selectedOption);
//     	 console.log(searchValue);
//     		 $.ajax({
//     			 url:'searchPerson.do',
//     			 method:'GET',
//     			 data:{
//     				 startNum:startNum,
//     				 pageNum:pageNum,
//     				 searchValue:searchValue,
//     				 selectedOption:selectedOption},
//     			dataType:'JSON',
//     			 success:function(data){
//     				 console.log(data);
//      				 fillTable(data.list);
//      				updatePagination(data.pager)
//     			 },
//     			 error:function(e){}
//     		 });
    	 
//     })
    
//     function fillTable(data) {

//     data.forEach(function(item) {
//         tableHTML += '<tr>';
//         tableHTML += '<td>' + item.employeeID + '</td>';
//         tableHTML += '<td><a href="detail.go?employeeID=' + item.employeeID + '">' + item.name + '</a></td>';
//         tableHTML += '<td>' + item.departmentName + '</td>';
//         tableHTML += '<td>' + item.rankName + '</td>';
//         tableHTML += '<td>' + item.positionName + '</td>';
//         tableHTML += '<td>' + item.status + '</td>';
//         tableHTML += '<td>' + item.branchName + '</td>';
//         tableHTML += '</tr>';
//     });

//     tableHTML += '</tbody>';
//     $('#personnelList').html(tableHTML);
// }
    
//     function updatePagination(pager) {
//         var pagingUl = $('#paging');
//         pagingUl.empty(); // 기존 페이징 제거

//         if (pager.pageNum > 1) {
//             pagingUl.append('<li class="page-item"><div class="p" data-list-pn="' + (pager.pageNum - 1) + '"><a class="page-link" data-list-pn="' + (pager.pageNum - 1) + '">&laquo;</a></div></li>');
//         }

//         for (var i = 1; i <= pager.totalCount; i++) {
//             var liClass = pager.pageNum == i ? 'page-item active' : 'page-item';
//             pagingUl.append('<li class="' + liClass + '"><div class="p" data-list-pn="' + i + '"><a class="page-link" data-list-pn="' + i + '">' + i + '</a></div></li>');
//         }

//         if (pager.pageNum < pager.totalCount) {
//             pagingUl.append('<li class="page-item"><div class="p" data-list-pn="' + (pager.pageNum + 1) + '"><a class="page-link" data-list-pn="' + (pager.pageNum + 1) + '">&raquo;</a></div></li>');
//         }
//     }

</script>
</html>