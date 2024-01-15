<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
    }
    table, td{
    	text-align: left;
    }
    table{
    	/* width: 50px; */
   /*  width: 447px; */
    width: 200px;
    }
    /* form {
    	width: 200px;
    } */
   	button{
   		float: right;
   	}
</style>
</head>
<body>
<form action="productInfoRegister.do" method="post" enctype="multipart/form-data" onsubmit="return submitForm(this);">
    <table>
        <tr>
            <th>상품명</th>
            <td>
                <input type="text" name="productName" required/>
            </td>
        </tr>
        <tr>
            <th>가격</th>
            <td>
                <input type="text" name="price"/>
            </td>
        </tr>
        <tr>
            <th>구분</th>
            <td>
                <select name="category" onchange="toggleFileInput(this.value)">
                    <option value="상품">상품</option>
                    <option value="티켓">티켓</option>
                </select>
            </td>
        </tr>
        <tr id="fileInputRow">
            <th>사진</th>
            <td>
                <input type="file" name="photo" multiple="multiple" id="fileInput">
            </td>
        </tr>
    </table>
    <div class="row">
    <button type="button" class="btn btn-secondary" onclick="location.href='storeList.go'">취소</button>
    <button type="submit" class="btn btn-primary" id="productInfoRegister">등록</button>
    </div>
</form>

<script>
    function submitForm(form) {
        swal({
            title: "등록하시겠습니까?",
            text: "",
            icon: "info",
            buttons: ["취소", "등록"],
        })
            .then((isOkey) => {
                if (isOkey) {
                    swal('등록이 완료되었습니다.', '', 'success')
                        .then((isOkey) => {
                            if (isOkey) {
                                form.submit();
                            }
                        })
                }
            });
        return false;
    }

    function toggleFileInput(category) {
        var fileInput = document.getElementById("fileInput");

        if (category === "티켓") {
            fileInput.disabled = true;
        } else {
            fileInput.disabled = false;
        }
    }
</script>
</body>
</html>
