<%@ page language="java" contentType="text/html; charset=UTF-8"	
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<link rel="icon" href="resource/img/favi.png" type="image/x-icon">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="<c:url value='/resource/css/personnel/personnel.min.css'/>">


<style>


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

.photo{
	justify-content:start !important;
}
.content{
	margin-left: 20%;
}
</style>
</head>
<body>
	<jsp:include page="../side.jsp"></jsp:include>
	<div id="hTitle">
		<a>사원상세</a>
	</div>
<div class="content">
<div class="wrap_info_content" style="margin-top: 10%;">
		    <div class="wrap_header">
		        <div class="wrap_photo">
		            <label class="photo" for="fileInput" style="width:10%;">
		                <img src="/Cocean/resource/img/psProfile.jpg" id="thumbnail_image" alt="프로필 사진">
		                <span class="file-icon"><i class="fas fa-pencil-alt"></i></span>
		            </label>
		            <input type="file" name="file" id="fileInput" title="등록" style="height:inherit;">
		            
		        </div>
		        <div class="wrap_info" >
		            <span class="desc">※ 사진은 자동으로 150x150 사이즈로 적용됩니다.</span>
		        </div>
		        
		        
		        
		    </div>
		</div>

	<table>
    <tr>
        <td style="width: 50%; vertical-align: top;">
            <div class="left-content">
            <c:forEach var='person' items="${list}">
                <table style="width: 100%;">
                    <!-- 좌측 컨텐츠 -->
                    
                    <tr>
                        <th>사번</th>
                        <td>
                        ${person.employeeID}
                        </td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>
                        ${person.name} 
                        </td>
                    </tr>
                    <!-- 중략 -->
                    <tr>
                        <th>직책</th>
                        <td>
                            <select id="selectPositionID" name="positionID" class="psSelect">
                                    <option value="1" <c:if test="${person.positionName eq '팀원'}">selected</c:if>>팀원</option>
						            <option value="2" <c:if test="${person.positionName eq '팀장'}">selected</c:if>>팀장</option>
						            <option value="3" <c:if test="${person.positionName eq '본부장'}">selected</c:if>>본부장</option>
						            <option value="4" <c:if test="${person.positionName eq '관장'}">selected</c:if>>관장</option>
						            <option value="5" <c:if test="${person.positionName eq '대표이사'}">selected</c:if>>대표이사</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>직급</th>
                        <td>
                            <select id="selectRankID" name="rankID" class="psSelect">
                                 <option value="1" <c:if test="${person.rankname eq '계약직'}">selected</c:if>>계약직</option>
						            <option value="2" <c:if test="${person.rankname eq '주임'}">selected</c:if>>주임</option>
						            <option value="3" <c:if test="${person.rankname eq '선임'}">selected</c:if>>선임</option>
						            <option value="4" <c:if test="${person.rankname eq '책임'}">selected</c:if>>책임</option>
						            <option value="5" <c:if test="${person.rankname eq '수석'}">selected</c:if>>수석</option>
						            <option value="6" <c:if test="${person.rankname eq '-'}">selected</c:if>>-</option>
                            </select>
                        </td>
                    </tr>
                    
                    
                    
                    <tr>
                        <th>주소</th>
                        <td>
                            <input type="text" name="address" class="form-control mb-2" required/>
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>
                            <input type="text" name="phoneNumber" class="form-control mb-2"placeholder="010-0000-0000"  pattern="\d{3}-\d{4}-\d{4}" title="전화번호 형식인 010-0000-0000으로 입력하세요."required/>
                        </td>
                    </tr>
                    <!-- 중략 -->
                </table>
            </div>
        </td>
        <td style="width: 50%; vertical-align: top;">
            <div class="right-content">
                <table style="width: 100%;">
                    <!-- 우측 컨텐츠 -->
                    <tr>
                        <th>지점</th>
                        <td>
                            <select id="branchSelect" class="psSelect"></select>
                        </td>
                    </tr>
                    <tr>
                        <th>본부</th>
                        <td>
                            <select id="deSelect" class="psSelect"></select>
                        </td>
                    </tr>
                    <tr>
                        <th>부서</th>
                        <td>
                             <select id="departmentSelect" name="departmentID" class="psSelect">
                                 <!-- 선택된 중분류에 따라 옵션이 동적으로 추가 -->
                             </select>
                        </td>
                    </tr>
                    <tr>
                        <th>담당</th>
                        <td>
                            <select id="resSelect" name="responsibility" class="psSelect">
                                 <!-- 선택된 중분류에 따라 옵션이 동적으로 추가 -->
                             </select>
                        </td>
                    </tr>
                   
                     <tr>
					    <th style="vertical-align: top; padding-top:10px; width:80px;">서명이미지</th>
					    	<td>
					    	<span class="desc1" style="font-size=12px;">※ 서명이미지는 자동으로 55x55 사이즈로 적용됩니다.</span>
					            <label class="photo2" for="fileSignatureInput" style="height: 10px;">
					            <img src="<c:url value='/resource/img/no_image.png'/>" id="signatureImg" alt="서명 이미지">
					                <span class="file-icon2"><i class="fas fa-upload"></i></span>
					            </label>
					            <div class="file-upload" >
					                <input type="file" name="fileSignature" id="fileSignatureInput" title="등록" style="height:inherit;">
					            </div>
					    	</td>
					</tr>
					
                </table>
                </c:forEach>
            </div>
        </td>
    </tr>
</table>
</div>
	
	

</body>
<script>



</script>
</html>