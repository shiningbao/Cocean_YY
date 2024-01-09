<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.resizeAuto {
		resize: none;
		overflow-y: hidden;
	}
	

</style>


</head>
<body>
	<c:import url="/side"/>
	<div class="container-fluid contentField">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">${bt}</h1>
		</div>
		<div class="card shadow p-3">
			<div class="d-inline">
				<div class="float-left">
					<h3>${detail.title}</h3>
				</div>
				<div class="float-right">
					<c:if test="${prevNext.prev ne null}">
					<button class="btn btn-outline-primary btn-sm" onclick="location.href='detail?boardID=${prevNext.prev}'">이전글</button>
					</c:if>
				
					<c:if test="${prevNext.next ne null}">
					<button class="btn btn-outline-primary btn-sm" onclick="location.href='detail?boardID=${prevNext.next}'">다음글</button>
					</c:if>
				</div>
			</div>
			
			<p>
				<c:if test="${bt ne '익명게시판'}">
					${detail.name} / 
				</c:if>
				${detail.creationDate}
			</p>
			
			<hr>
			
			<div style="min-height:250px"> 
				${detail.content}
			</div>
			
			<hr>
			
			<div>
			<h5>댓글</h5>
			<div id="comment" class="mb-4">
				<c:forEach items="${commentList}" var="item">
					<div class="card p-2">
						<div class="d-inline">
							<div class="float-left">
								<c:if test="${bt ne '익명게시판'}">
									${item.name} / 
								</c:if>
								${item.creationDate}
							</div>
							<button class="float-right">숨김</button>
						</div>
						<div class="mt-1 pl-2 splitCon">${item.content}</div>
					</div>
				</c:forEach>
			</div>

			<div class="card p-2">

				<c:if test="${bt ne '익명게시판'}">
					${userInfo.name}
				</c:if>
				<c:if test="${bt eq '익명게시판'}">
					익명
				</c:if>
	
				<div class="d-inline">
					<div class="float-left" style="width: 100%">
						<textarea id="commnet" class="resizeAuto" placeholder="댓글을 남겨보세요" style="width: 100%"></textarea>
					</div>
					<div class="float-right">
						<button onclick="commentWrite()">댓글 작성</button>
					</div>
				</div>
			</div>
			</div>
			<div>
				<button class="float-right mt-4 ml-2">삭제</button>
				<button class="float-right mt-4 ml-2">수정</button>
				<button class="float-right mt-4 ml-2">목록</button>
			</div>
		
		</div>
		

	</div>
	<c:import url="/footer"/>
</body>
<script>
	split();
	$('.resizeAuto').on('input', function () {
	    this.style.height = 'auto';
	    this.style.height = (this.scrollHeight) + 'px';
	  });
	
	function commentWrite(){
		var content = $('#commnet').val();
		if(content == ''){
			swal({
				title: '댓글을 작성해 주세요',
				button: '확인'
			});
		}else{
			swal({
				title:'댓글을 작성하시겠습니까?',
				icon:'info',
				buttons:['취소','확인']
			}).then((isOkey) =>{
				if(isOkey){
					var data = {};
					data.employeeID = ${userInfo.employeeID};
					data.content = content;
					data.boardID = ${detail.boardID};
					//console.log(data);
					$.ajax({
						type: 'post',
						url: 'commentWrite',
						data: data,
						dataType: 'JSON',
						success: function(data){
							console.log(data);
							var con = '<div class="card p-2"><div><c:if test="${bt ne \'익명게시판\'}">';
							con += data.newcomment.name;
							con += ' / </c:if>';
							con += data.newcomment.creationDate;
							con += '</div><div class="mt-1 pl-2 splitCon">';
							con += data.newcomment.content;
							con += '</div></div>';
							$('#comment').append(con);
							split();
						},
						error: function(e){
							console.log(e);
						}
					});
				}
			});
		}
	}
	
	function split(){
		$('.splitCon').each(function(con){
			var c = $(this).html();
			var s = c.replace(/\n/g, '<br>');
			$(this).html(s);
		});
	}
	
	
	
	
	
	

</script>
</html>