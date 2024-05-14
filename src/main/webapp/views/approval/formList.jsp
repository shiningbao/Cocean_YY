<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
	#formTableHead{
		background-color: #86B0F3;
		text-align: center;
	}
	
	#formList{
		text-align: center;
	}

	@media screen and (max-width: 1457px){
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
	
	<div class="container-fluid contentField">
	
		<div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-top: 15px;">
			<div class="hTitle">
			<h1 class="h3 mb-0 text-gray-800">기안서 양식</h1>
			</div>
		</div>
	
		<div class="search d-flex flex-column">
			<form class="form-inline ml-auto">
			    <input class="form-control mr-sm-2" id="keyword" type="search" placeholder="문서양식을 입력하세요." aria-label="Search">
			    <button class="btn btn-outline-primary my-2 my-sm-0" type="button" onclick="formSearch()">검색</button>
			</form>
		</div>
	
		<div class="card shadow mb-4">	
			<% 
			Date myDate = new Date();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedDate = dateFormat.format(myDate);
			%>			
			<div id="formTable">
				<table class="table table-hover">
					<thead id="formTableHead">
						<tr>
							<th scope="col">유형</th>
							<th scope="col">문서양식</th>
						</tr>
					</thead>
					
					<tbody id=formList>
					<c:forEach items="${list}" var="form">
						<tr>
							<td scope="row">${form.formCategory}</td>
							<td><a href="writeDraft.go?titleID=${form.titleID}&date=<%= formattedDate %>">${form.formTitle}</a></td>
						</tr>	
					</c:forEach>
					</tbody>
				</table>
			</div><!-- formTable 끝 -->
		</div><!-- card shadow mb-4 끝 -->
		
	</div><!-- container-fluid contentField 끝 -->
</body>

<script>
	function formSearch() {
		var keyword = $('#keyword').val();
		
		$.ajax({
			type : 'get',
			url : 'formSearch',
			data : {
				'keyword' : keyword
			},
			dataType : 'JSON',
			success : function(data) {
				console.log(data.fList);
				drawFlist(data.fList);		
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
    
    function drawFlist(fList) {
    	var content='';
    	
    	fList.forEach(function(item,idx){
		  	content += '<tr>';
		  	content += '<td scope="row">'+item.formCategory+'</td>';
	        content += '<td>'+'<a href="writeDraft.go?titleID='+item.titleID+'&date=<%= formattedDate %>">'+item.formTitle+'</a></td>';
			content += '</tr>';
    	});
    	
    	$('#formList').empty();
    	$('#formList').append(content);   	
    }
</script>
</html>