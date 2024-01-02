<%@ page language="java" contentType="text/html; charset=UTF-8"	
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#hTitle {
	width: 120px;
	height: 50px;
	left: 400px; 
	position: absolute;
	top: 120px;
}

#hTitle a {
	font-size: 22px;
}

#checkBox {
	width: 70%;
	height: 20%;
	font-size: 13px;
	top: 100px;
	left: 400px;
	padding-top: 45px;
	position: absolute;
}

#box1 {
	position: absolute;
	top: 110px;
	left: 25px;
	z-index: 9999;
}

#box2 {
	position: absolute;
	left: 450px;
	top: 110px;
	z-index: 9999;
}

label {
	padding-right: 25px;
	padding-left: 10px;
}

#search {
	position: absolute;
	left: 77%;
	top: 45%;
	width: 450px;
}

#search input {
	z-index: 99999;
}

#tankSubmit {
	
	position: absolute;
	left: 87%;
	width: 100px;
	top: 850px;
}

@media screen and (max-width: 1457px) {
	#search {
		top: 23%;
	}
	#search button {
		width: 233px;
	}
	#search input {
		margin-bottom: 5px;
	}
}
</style>
</head>
<body>
	<c:import url="/side"/>
<main>
	<div id="hTitle">
		<a>코션하우스</a>
	</div>
	
	
        <div id="checkBox">
        <div id="box1">

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" checked name="selectAll"  value="selectAll" id="option1" onclick="selectAll(this)">
            <label class="form-check-label" for="option1">전체&nbsp;&nbsp;</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" checked value="${sessionScope.userInfo.employeeID}" id="option2" name="empolyeeID">
            <label class="form-check-label" for="option2">담당하우스</label>
        </div>

            <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" checked value="정상" name="tankStatus" id="option3">
            <label class="form-check-label" for="option3">정상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        </div>
            <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" checked value="이상" name="tankStatus" id="option4">
            <label class="form-check-label" for="option4">이상&nbsp;&nbsp;</label>
        </div>
    </div>
    <div id="box2">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" checked value="1" name="tankType" id="option5">
            <label class="form-check-label" for="option5">해수&nbsp;&nbsp;</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" checked value="2" name="tankType" id="option6">
            <label class="form-check-label" for="option6">담수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        </div>
            <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" checked value="3" name="tankType" id="option7">
            <label class="form-check-label" for="option7">반수생&nbsp;</label>
        </div>
            <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" checked value="4" name="tankType" id="option8">
            <label class="form-check-label" for="option8">육상&nbsp;&nbsp;</label>
        </div>
    </div>

        
        <nav class="navbar navbar" id="search">
            <form class="form-inline">
              <input class="form-control mr-sm-2" type="search" placeholder="담당자명을 입력하세요." aria-label="Search">
              <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">검색</button>
            </form>
          </nav>
    </div>
    

	<div id="tank_table">
		<table class="table table-hover">
			<thead id="tank_head">
				<tr>
					<th scope="col">수조 번호</th>
					<th scope="col">수조 이름</th>
					<th scope="col">분류</th>
					<th scope="col">지점</th>
					<th scope="col">상태</th>
					<th scope="col">담당자</th>
				</tr>
			</thead>

			<tbody id=tankList>
				<c:forEach items="${list}" var="item">
					<tr>
						<td scope="row">${item.getTankID()}</td>
						<td><a href="detail.go?tankID=${item.getTankID()}">${item.getTankName()}</a></td>
						<td>${item.getTankType()}</td>
						<td>${item.getBranchName()}</td>
						<td>${item.getTankStatus()}</td>
						<td>${item.getName()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button type="button" id="tankSubmit" onclick="location.href='write.go'" class="btn btn-primary">등록</button>
	
	<section id="paging">
	<button class="p" data-list-pn="${pager.startNum-1}" type="button">이전</button>

	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		<span class="p" data-list-pn="${i}" >${i}</span>
	</c:forEach>

	<c:if test="${!pager.lastCheck}">
		<button class="p" data-list-pn="${pager.lastNum+1}" type="button">다음</button>
	</c:if>
</section>
</main>
</body>
<script>

$(".p").click(function() {
	const n= $(this).attr("data-list-pn");
	$("#pageNum").val(n);
	$('#frm').submit();
			
});


	
	function selectAll(selectAll){
		const chkBoxes = $('input[type="checkbox"]');
		
		Array.from(chkBoxes).forEach(function(box, index) {
			box.checked = selectAll.checked;
		})
	}



</script>
</html>