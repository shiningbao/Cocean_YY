<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">
<meta name="viewport"	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<div class="modal fade" id="classifiModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<!-- 모달창 제목 -->
				<h5 class="modal-title">생물 분류군</h5>
				<button type="button" class="close" data-dismiss="modal"	aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group" style="display: flex">
					<input type="text" id="keyword" class="form-control" style="margin-right: 10px">
					<button type="button" class="btn btn-outline-primary" onclick="classficationSearch()">검색</button>
				</div>
				<div class="form-group">
					<div style="height: 428px; overflow-y: auto">
						<table class="table table-hove">
							<colgroup>
								<col style="width: 27%">
								<col style="width: 45%">
								<col style="width: 28%">
							</colgroup>
							<thead style="background-color: #86B0F3; position: sticky; top: -1px; text-align: center">
								<tr>
									<th>분류</th>
									<th>학명</th>
									<th>국명</th>
								</tr>
							</thead>
							<tbody id="classifiList">
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" onclick="sendVal()">확인</button>
			</div>
		</div>
	</div>
</div>

<script>

	var speciesID_click;
	var taxo_click;
	var scien_click;
	var common_click;

	function classficationSearch() {
		var keyword = $('#keyword').val();
		$.ajax({
			type : 'get',
			url : 'classficationSearch',
			data : {
				'keyword' : keyword
			},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				drowList(data.list);
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	function drowList(list){
		var content = '';
		$('#classifiList').html('');
		list.forEach(function(item){
			var value = "\'"+item.speciesID+"','"+item.taxonomy+"','"+item.scientificName+"','"+item.commonName+"\'";
			content += '<tr onclick="clickList(this,'+value+')" ondblclick="sendVal()">';
			content += '<th>'+item.taxonomy+'</th>';
			content += '<th>'+item.scientificName+'</th>';
			content += '<th>'+item.commonName+'</th>';
			content += '</tr>';
		});
		$('#classifiList').html(content);
	}
	
	function clickList(e,id,t,s,c){
		var list = $(e).siblings();
		for (var i = 0; i < list.length; i++) {
			list[i].style.backgroundColor = 'white';
		};
		$(e).css({'background-color' : '#DEDEDE'});
		speciesID_click = id;
		taxo_click = t;
		scien_click = s;
		common_click = c;
	}

	function sendVal(){
		if(speciesID_click != null){
			var classifi;
			switch (taxo_click) {
				case "무척추동물류":
					classifi = "In";
					break;
				case "미삭동물":
					classifi = "Ch";
					break;
				case "양서류":
					classifi = "Am";
					break;
				case "어류":
					classifi = "Fi";
					break;
				case "조류":
					classifi = "Av";
					break;
				case "파충류":
					classifi = "Re";
					break;
				case "포유류":
					classifi = "Ma";
					break;
			}

			drawClassifi(speciesID_click,taxo_click,classifi,scien_click,common_click);
			$("#classifiModal").modal('hide');
		}else{
			alert('동물 분류를 선택해 주세요.');
		}
	}
</script>