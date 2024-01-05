<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">


<style>


</style>
</head>
<body>
<c:import url="/side"/>
	

<div class="container-fluid contentField">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">조직관리</h1>
	</div>
	<div class="row">
		<div class="col-3">
			<div class="card shadow">
				<div class="card-body">
					조직도
					<c:import url="/personnel/organization"/>
				</div>
			</div>
		</div>	
		
		<div class="col-9">
			<div class="card shadow">
				<div class="card-body">
					
				</div>
			</div>
		</div>
	</div>
	
	
			
			
</div>

<c:import url="/footer"/>
</body>

<script>
var employeeID;
var nodeText
function getEmployeeID(employeeID,nodeText){
	
	$.ajax({
		url:'getEmployeeInfo.do',
		type:'post',
		data:{employeeID:employeeID},
		success:function(data){
			console.log(data);
		},
		error:function(e){
			console.log(e);
		}
	});
}

</script>
</html>