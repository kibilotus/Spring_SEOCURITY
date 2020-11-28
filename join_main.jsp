<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seocurity_회원가입</title>
<link rel="stylesheet" type="text/css" href="join.css?after">
</head>
<script>
	function idCheck(){
		var id;
		input=join.user_id.value;
		if(input.length == "" || input.length<1){
			alert("ID를 입력해 주세요");
			join.user_id.focus();
			return false;
		}else{
			location.href="id_check.jsp?id="+input;
			
		}
		
	}

</script>
<%
 String id = request.getParameter("id");
 if(id==null){
	 id="";
 }
%>
<body>

		<header>
			<center><a href="main.jsp"><img src="img/title.jpg"></a></center>
		</header>		
		<br>
		<hr>
		
<center><h1>회원가입</h1></center>
		<center>
	 	<form name="join" method=POST action="join_insert.jsp">
	   		<table>

	     			<tr>
							<th>&middot; 아이디(필수)</th>
							<td><input type="text" name="user_id" value="<%= id %>"required>
							<input type="button" name="id_btn"value="ID 중복확인" class="btn_style1" onclick="idCheck()">
				</td>
 
	    			 </tr>
	     			<tr>
				<th>&middot; 비밀번호(필수)</th>
				<td class="s2"><input type="password" name="user_pwd" required></td>
 
	     </tr>
	    
	     <tr>
		
				<th>&middot; 이름(필수)</th>
				<td><input type="text" name="user_name" required></td>
		
	     </tr>
	     			<tr>
		
					<th>&middot; 전화번호</th> 
					<td>
						<select name="phone_agency">	
							<option value="SKT">SKT</option>
							<option value="KT">KT</option>
							<option value="LG U+">LG U+</option>
						</select>
							<input type="text" size="3" maxlength="3" name="phone1" title="휴대폰 앞자리 번호 입력" > -
							<input type="text" size="4" maxlength="4" name="phone2" title="휴대폰 중간 번호 입력" > -
							<input type="text" size="4" maxlength="4" name="phone3" title="휴대폰 끝 번호 입력" >
					</td>
	     			</tr>
	     <tr>
		
				<th>&middot; 생년월일</th>
				<td>
				   <select name="year" style='width:70px; height: 23px;'>
					
					<%
						for(int year=1970; year<2020;year++){
					%>
							<option value="<%= year%>"><%= year %></option>
					<%
						}
					%>
				   </select>
				   <select name="month" style='width:70px; height: 23px;'>
					
                	<%
						for(int month=1; month<13;month++){
					%>
							<option value="<%= month%>"><%= month %></option>
					<%
						}
					%>
				   </select>
				   <select name="date" style='width:70px; height: 23px;'>
					
					<%
						for(int date=1; date<32;date++){
					%>
							<option value="<%= date%>"><%= date %></option>
					<%
						}
					%>
				   </select>
				<input type="radio" name="user_calendar" checked="checked" value="solar">양력
				<input type="radio" name="user_calendar" value="lunar" >음력
				</td>
		
	     </tr>
	     <tr>
			<th>&middot; 주소</th>
			<td>
			<input type="text" name="user_addrnum" size="10" maxlength="5"><br>
			<input type="text" name="user_address" size="50" >
			</td>
		</tr>
		<tr>
			<th>&middot; 이메일</th>
			<td>
			<input type="text" name="user_email" size="15" maxlength="20"> @
			<select name="email_domain" style="width:110px; height: 23px;">	
							<option value="naver.com">naver.com</option>
                			<option value="daum.net">daum.net</option>
                			<option value="gmail.com">gmail.com</option>
			</select>
			</td>
		</tr>

	     <tr>
			<th>&middot; 메일수신</th>
			<td>
			<input type="radio" id="agree1" name="mail_check" checked="checked" value="yes"  >메일 수신함
			<input type="radio" id="disagree1" name="mail_check" value="no" >메일 수신안함
			</td>

	     </tr>
	     <tr>
			<th>&middot; SMS 수신</th>
			<td>
			<input type="radio" id="agree2" name="sms_check" checked="checked" value="yes" >SMS 수신함
			<input type="radio" id="disagree2" name="sms_check" value="no" >SMS 수신안함
			</td>

	     </tr>
	   </table>
			<input type="submit" value="회원가입" class="btn_style2" style='background:#3282FF;' >
			<input type="button" value="취소" class="btn_style2" onclick="location.href='main.jsp'">
			
	</form>


	</center>
</body>
</html>