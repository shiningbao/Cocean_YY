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
		min-height: 54px;
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
							<div class="float-left mb-1">
								<c:if test="${bt ne '익명게시판'}">
									${item.name} / 
								</c:if>
								${item.creationDate}
							</div>
							<button class="btn btn-outline-primary btn-sm float-right ml-2" onclick="commentFunction(this,'${item.commentID}')">숨김</button>
							<button class="btn btn-outline-primary btn-sm float-right ml-2" onclick="commentFunction(this,'${item.commentID}')">삭제</button>
							<button class="btn btn-outline-primary btn-sm float-right ml-2" onclick="commentFunction(this,'${item.commentID}')">수정</button>
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
	
				<div class="d-inline mt-1">
					<div class="float-left" style="width: 100%">
						<textarea id="commnet" class="resizeAuto" oninput="resizeAuto(this)" placeholder="댓글을 남겨보세요" style="width: 100%"></textarea>
					</div>
					<div class="float-right">
						<button class="btn btn-outline-primary float-right ml-2" onclick="commentWrite()">댓글 작성</button>
					</div>
				</div>
			</div>
			</div>
			<div>
				<button class="btn btn-outline-primary float-right mt-4 ml-2" onclick="boardFunction(this)">숨김</button>
				<button class="btn btn-outline-primary float-right mt-4 ml-2" onclick="boardFunction(this)">삭제</button>
				<button class="btn btn-outline-primary float-right mt-4 ml-2" onclick="boardFunction(this)">수정</button>
				<button class="btn btn-outline-primary float-right mt-4 ml-2" onclick="location.href = 'list?searchCategory=&search=&page=1'">목록</button>
			</div>
		
		</div>
		

	</div>
	<c:import url="/footer"/>
</body>
<script>
	split();
	
	function resizeAuto(e){
		e.style.height = 'auto';
		e.style.height = (e.scrollHeight) + 'px';
	}
	
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
	
	// 댓글 관련
	function commentFunction(e,commentID){
		var con = $(e).text();
		var icon = 'info';
		if(con == '삭제'){
			icon = 'error';
		}
		
		swal({
			title:'댓글을 '+con+'하시겠습니까?',
			icon:icon,
			buttons:['취소','확인']
		}).then((isOkey) => {
			if(isOkey){
				if(con == '삭제'){
					location.href = 'commentDel?boardID=${detail.boardID}&commentID='+commentID;
				}else if(con == '수정'){
					commentUpdate(e,commentID);
				}else if(con == '숨김'){
					location.href = 'commentHidden?boardID=${detail.boardID}&commentID='+commentID;
				}
			}
		});
	}
	
	// 댓글 수정
	function commentUpdate(e,commentID){
		$('#comment').find('button').prop('disabled', true);
		var $target = $(e).parent().parent();
		
		var content = $target.find('.splitCon').html();
		content = content.replace(/<br>/g, '\n');
		var updateForm = '<div class="commentUpdateForm mt-1 pl-2"><textarea class="resizeAuto" oninput="resizeAuto(this)" placeholder="댓글을 남겨보세요" style="width: 100%"></textarea>';
		updateForm +='<div class="float-right"><button onclick="commnetUpdateReset(this)">취소</button>';
		updateForm +='<button onclick="commentUpdateGo(this,'+commentID+')">댓글 수정</button></div></div>';
		$target.append(updateForm);
		$target.find('textarea').val(content).trigger('input');
		
		$target.children().first().find('button').css({'display':'none'});
		$target.find('.splitCon').css({'display':'none'});
	}
	
	function commentUpdateGo(e,commentID){
		var $target = $(e).parent().parent().parent();
		var content = $target.find('textarea').val();
		
		$.ajax({
			type:'post',
			url:'commentUpdateGo',
			data:{'commentID':commentID,'content':content},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				if(data.result == 1){
					swal({
						title:'댓글을 수정했습니다.',
						button:'확인'
					}).then((isOkey) => {
						if(isOkey){
							content = content.replace(/\n/g, '<br>');
							$target.find('.splitCon').html(content);
							console.log(content);
						
							commnetUpdateReset(e);	
						}
					});	
				}else{
					swal({
						title:'실패',
						button:'확인'
					});
				}
			},
			error:function(e){
				console.log(e);
			}		
		});
	}
	
	function commnetUpdateReset(e){
		var $target = $(e).parent().parent().parent();
		$('#comment').find('button').prop('disabled', false);
		$target.children().first().find('button').css({'display':'inline-block'});
		$target.find('.splitCon').css({'display':'block'});
		$target.find('.commentUpdateForm').remove();
	}
	

	function boardDel(boardID){
		swal({
			title:'삭제하시겠습니까?',
			icon:'error',
			buttons:['취소','삭제']
		}).then((isOkey) => {
			if(isOkey){
				location.href= "delete.do?boardID="+boardID;
			}
		});
		
		
	}
	
	
	
	
	function boardUpdate(){}
	
	
	
	function boardFunction(e){
		var con = $(e).text();
		var icon = 'info';
		if(con == '삭제'){
			icon = 'error';
		}
		
		swal({
			title:'게시글을 '+con+'하시겠습니까?',
			icon:icon,
			buttons:['취소','확인']
		}).then((isOkey) => {
			if(isOkey){
				if(con == '삭제'){
					location.href = 'boardDel?boardID=${detail.boardID}';
				}else if(con == '수정'){
					location.href = 'boardUpdate.Go?boardID=${detail.boardID}';
				}else if(con == '숨김'){
					location.href = 'boardHidden?boardID=${detail.boardID}';
				}
			}
		});		
		
		
		
		
	}
	
	
	
	
	
	

</script>
</html>








