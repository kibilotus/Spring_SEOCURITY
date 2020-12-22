<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>로그인 | seocurity</title>
<style>
 .login_box{
	width: 600px;
    height:400px;
    margin: auto;
    padding: 35px;
	background-color:#CBDEF5;
    border: 1px solid #d8d8d8;
    background: #fbfcfd;
    box-sizing: border-box;
    }
    .login_input{
    margin-top: 10px;
    width:350px;
	height: 50px;
    }
    
    #btn_login{
   		margin-top: 30px;
    	background:#030066;
    	border:none;
    	color:white;
    	font-size:15px;
    }
    .s3{
    	text-decoration:underline;
    }
</style>
</head>
<body>
<tr>
	<td height="600px">
	
	<center><h2>로그인</h2></center>
	
	<center>
		<div class="login_box">
			<form id="loginForm" method=POST action="login">
			<div style="margin-top:40px;">
				<div>
						<input type="text" name="id" placeholder="아이디" class="login_input">
						<input type="password" name="pwd" placeholder="비밀번호" autocomplete="false"  class="login_input">
				</div>
				<div>
					<input type="submit" value="로그인" class="login_input" id="btn_login">
				</div>
				<br>
				<div>
					아직 회원이 아니신가요? <i class="s3"><a href="/controller/joinform">회원가입</a></i>
				</div>
			</div>
			</form>
		</div>
		</center>
	</td>
</tr>
</body>
</html>