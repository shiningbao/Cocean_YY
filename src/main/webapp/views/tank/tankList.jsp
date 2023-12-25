<%@ page language="java" contentType="text/html; charset=UTF-8"	
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#tank_head {
	background-color: #86B0F3;
}

#tank_table {
	width: 1000px;
	height: 100%;
	margin: 0px 0px 0px 380px;
	text-align: center;
}

#hTitle {
	width: 120px;
	height: 50px;
	margin: 20px 0px 0px 380px;
	padding-top: 10px;
}

#hTitle a {
	font-size: 22px;
}

#checkBox {
	display: flex;
	justify-content: space-around;
	width: 1150px;
	height: 150px;
	font-size: 13px;
	top: 0px;
	left: 300px;
	align-items: flex-start;
	padding-top: 50px;
}

#box1 {
	position: absolute;
	height: 50px;
	padding-right: 450px;
	z-index: 9999;
}

#box2 {
	position: absolute;
	margin-top: 60px;
	z-index: 9999;
	padding-right: 450px;
}

#search {
	padding-left: 700px;
}

label {
	padding-right: 25px;
	padding-left: 10px;
}

#search{
    padding-left: 755px;
    margin-top: 15px;
}

#search input{
	z-index: 99999;
}
#tankSubmit{
	margin-top: 380px;
    position: absolute;
    left: 1280px;
    width: 100px;

}

</style>
</head>
<body>
	<jsp:include page="../side.jsp"></jsp:include>
	<div id="hTitle">
		<a>코션하우스</a>
	</div>
	
	
        <div id="checkBox">
        <div id="box1">

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="option1">
            <label class="form-check-label" for="option1">전체&nbsp;&nbsp;</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="option2">
            <label class="form-check-label" for="option2">담당하우스</label>
        </div>

            <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="option3">
            <label class="form-check-label" for="option3">정상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        </div>
            <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="option4">
            <label class="form-check-label" for="option4">이상&nbsp;&nbsp;</label>
        </div>
    </div>
    <div id="box2">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="option5">
            <label class="form-check-label" for="option5">해수&nbsp;&nbsp;</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="option6">
            <label class="form-check-label" for="option6">담수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        </div>
            <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="option7">
            <label class="form-check-label" for="option7">반수생&nbsp;</label>
        </div>
            <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" value="" id="option8">
            <label class="form-check-label" for="option8">육상&nbsp;&nbsp;</label>
        </div>
    </div>

        
        <nav class="navbar navbar" id="search">
            <form class="form-inline">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search</button>
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
						<td>${item.getTankID()}</td>
						<td><a href="detail?tankID=${item.getTankID()}">${item.getTankName()}</a></td>
						<td>${item.getTankType()}</td>
						<td>${item.getBranchName()}</td>
						<td>${item.getTankStatus()}</td>
						<td>${item.getName()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button type="button" id="tankSubmit" class="btn btn-primary">등록</button>
	
</body>
<script>


</script>
</html>