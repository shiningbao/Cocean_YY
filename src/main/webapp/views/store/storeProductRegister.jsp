<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../side.jsp"></jsp:include>
	<form action="productInfoRegister.do" method="get">
	<table>
		<tr>
			<th>상품명</th>
			<td>
				<input type="text" name="productName"/>
			</td>
		<tr>
			<th>가격</th>
			<td>
				<input type="text" name="price"/>
			</td>
		</tr>
		 <tr>
            <th>구분</th>
            <td>
                <select name ="category">
					<option value="상품">상품</option>
					<option value="티켓">티켓</option>
                </select>
            </td>
        </tr>
		<tr>
			<th>사진</th>
			<td>
				<input type="file" name="files" multiple="multiple">
			</td>
		<tr>
		<tr>
             <th colspan="2">
                 <input type="submit" value="등록"/>
             </th>
         </tr>
	</table>
</form>
</body>
</html>