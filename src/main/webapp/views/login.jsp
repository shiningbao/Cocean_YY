<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cocean</title>
	<link rel="icon" href="<c:url value='/resource/img/favi.png'/>" type="image/x-icon">
	<!-- MDN 라이브러리 CND -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet"/>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        @font-face {
            font-family: 'SOYOMapleBoldTTF';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/SOYOMapleBoldTTF.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        h1, h2, h3, h4, a, input, button {
        font-family: 'SOYOMapleBoldTTF';
        }

        body{
            font-family: 'SOYOMapleBoldTTF';
            background-image: url(resource/img/main_2.png);
            background-position: center;
            background-size: cover;
            height: 100vh;
            overflow: hidden;
            max-height: 100%; 
            width: auto;
            margin: 0;
            display: flex;
            justify-content: right;
            align-items: center;
            margin-right: 80px;
        }
        #loginBox{
            height: 120px;
            width: 350px;
            flex-direction: column;
            justify-content: space-evenly;
            margin-right: 90px;
            margin-top: 170px;
            position: fixed;
            font-size: 22px;
        }

        #login{
            width: 300px;
            height: 40px;
            font-size: 15px;
            border-radius: 5px;
            margin-top: 20px;
            margin-left: 10px;
            background-color: #2F80ED ;
        }
        
        input:focus+label,
        input:valid+label {
        -webkit-transform: translateY(-10px) scale(.70);
        -ms-transform: translateY(-10px) scale(.70);
        transform: translateY(-10px) scale(.70);
        -webkit-transform-origin: top left;
        -ms-transform-origin: top left;
        transform-origin: top left;
        letter-spacing: -.28px;
        }
        
        .form-control{
            line-height: 2.5;
        }
        


    </style>
</head>
    <body>
        <div id="loginBox">
            <form action="logingo" method="post">
                <div data-mdb-input-init class="form-outline mb-4">
                  <input type="text" id="userNum" class="form-control" />
                  <label class="form-label" for="userNum">사번</label>
                </div>
                <div data-mdb-input-init class="form-outline mb-4">
                  <input type="password" id="password" class="form-control" />
                  <label class="form-label" for="password">비밀번호</label>
                </div>
                <button data-mdb-ripple-init type="submit" class="btn btn-primary btn-block" id="login">로그인</button>
              </form>
        </div>
    </body>
    <script>
    
	var msg = "${msg}";
	if(msg != ""){
		swal({
			title: msg,
			button: '확인'
		});
	}
    
    
    
    
    </script>
</html>