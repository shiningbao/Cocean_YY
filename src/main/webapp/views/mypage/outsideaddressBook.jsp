
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<form action="list" method="get">
	<table>
	<!-- 
		 <li>
  			<div class="allCheck">
   			<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
			  </div>
  
 			 <div class="delBtn">
 			  <button type="button" class="selectDelete_btn">선택 삭제</button> 
 			 </div>
  
		 </li>
	
	 -->
	 
	  <button type="button" class="btn btn-default btn-sm checkbox-toggle" id="checkall" ><i class="fa fa-square-o"></i>
 </button><input type="checkbox" id="ckall" style="display: none;">
	 
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>직급</th>
			<th>직책</th>
			<th>부서</th>
		</tr>
		 <li>		
		<c:if test="${list.size()==0}">
		<tr><td colspan="5">게시물이 존재하지 않습니다.</td></tr>
		</c:if>
		<c:forEach items="${list}" var="address">
		<tr>
			<input type="checkbox" name="chk" class="chk" data-cartNum="${address.addressNumber}" />
			<td><a href="detail?addressNumber=${address.addressNumber}">${address.name}</a></td>
			<td>${address.phoneNumber}</td>
			<td>${address.rankLevel}</td>
			<td>${address.positionLevel}</td>
			<td>${address.departmentName}</td>
		</tr>
		</c:forEach>
	</table>
         
		
        </form>
</body>
<script>

$(document).ready(function(){
	
   
	
	$("#btnDelete").click(function(){
		mailDelete();
	});
	
;
	
});



function allCheck(){
	
    //클릭되었으면
    $("#ckall").click();
    
    if($("#ckall").prop("checked")){
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
        $(".chk").prop("checked",true);
        $("#ckall").prop("checked",true);
        //클릭이 안되있으면
    }else{
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
        $(".chk").prop("checked",false);
        $("#ckall").prop("checked",false);
    }

}


function mailDelete(){
	
	
	$(".chk").each(function(index){
		
		if($(this).prop("checked")){
			var addressNumber =$(this).attr("data-addressNumber");
			
			$.ajax({
				
				url:"/mypage/outsideaddressBook"+addressNumber,
				type:"get",
				success:function(result){
						
				}	
			});
	    	
		}
	
	}); 
		
	setTimeout(function(){

		  if(confirm("삭제 했습니다.")){
			  location.href='/mypage/outsideaddressBook';
		  }
	}, 2000);
	
		

	
}

</script>


</script>
</html>

 
 