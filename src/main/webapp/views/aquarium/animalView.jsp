<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
	.animalPreview{
		display: none;
		position: absolute;
		top: 30%;
		left: 50%;
		z-index: 3;
		transform: translateX(-50%);
		background-color: red;
		
	}
</style>

<div class="table">
	<div class="row" style="margin:3px 0 0 0">
		<c:forEach items="${list}" var="item" varStatus="idx">
			<div class="col-md-2">
				<div class="card shadow rounded" style="margin:10px 0px" onclick="detailGo(${item.animalID})">
					<img class="card-img-top animalImg" alt="${item.serverFileName}" src="/photo/cocean/animal/${item.serverFileName}">
					<div class="card-body">
						<h5 class="card-title">${item.nickname}</h5>
<%-- 						<p class="card-text">${item.commonName}</p> --%>
					</div>
				</div>
				<div class="animalPreview">
					<div class="card" style="width: 18rem;">
						<div class="card-body">
						<h5 class="card-title">${item.nickname}</h5>
						<h6 class="card-subtitle mb-2 text-body-secondary">${item.commonName}</h6>
						<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						<a href="detail.go?animalID=${item.animalID}" class="card-link">상세보기</a>
<!-- 						<a href="#" class="card-link">Another link</a> -->
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>




<script>

	$(".animalImg").css({"width":"100%","height":"200px"});


	$(".col-md-2").hover(
		function(){
			$(this).find('.animalPreview').fadeIn();
		},	function(){
			$(this).find('.animalPreview').fadeOut();
		});





function detailGo(animalID,nickname){
	location.href="detail.go?animalID="+animalID;
}
</script>
