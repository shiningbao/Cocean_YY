<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
	.animalPreview{
		display: none;
		position: absolute;
		top: 10%;
		left: 50%;
		z-index: 3;
		transform: translateX(-50%);
		background-color: red;
		
	}
</style>

<div class="table">
	<div class="row" style="margin:12px 30px">
		<c:forEach items="${list}" var="item" varStatus="idx">
			<div class="col-md-2">
				<div class="card rounded" style="margin:10px 0px" onclick="detailGo(${item.animalID},'${item.nickname}')">
					<img class="card-img-top animalImg" alt="${item.serverFileName}" src="/photo/cocean/animal/${item.serverFileName}">
					<div class="card-body">
						<h5 class="card-title">${item.nickname}</h5>
						<p class="card-text">${item.commonName}</p>
					</div>
				</div>
				<div class="animalPreview">aaaaa</div>
			</div>
		</c:forEach>
	</div>
</div>




<script>
	//$(".animalDiv").css({"width":"100px","float":"left","margin":"0"});
	$(".animalImg").css({"width":"100%","height":"200px"});
// 	resizeWidth();
	
// 	window.addEventListener('resize',resizeWidth);
	
// 	function resizeWidth(){
// 		var imgWidth = $(".animalImg").outerWidth();
// 		$(".animalImg").css({"height":imgWidth});
// 	}

	$(".col-md-2").hover(
		function(){
			$(this).find('.animalPreview').fadeIn();
		},	function(){
			$(this).find('.animalPreview').fadeOut();
		});





function detailGo(animalID,nickname){
	location.href="detail.go?animalID="+animalID+"&nickname="+nickname;
}
</script>
