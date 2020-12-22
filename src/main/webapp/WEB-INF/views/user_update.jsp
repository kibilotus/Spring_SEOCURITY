<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css?after">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/list.css?after">
<style>
.btn_style2{
			    border-radius: 5px;
			    width: 150px;
			    height:50px;
				
			}
</style>
</head>
<body>
<tr>
	<td width="20%">
			<div class="mypage_list">
				<ul>
					<li><a href="/controller/user_update?id=<%= session.getAttribute("loginUser")%>">회원 정보 수정</a></li>
					<li><a href="/controller/request_check?id=<%= session.getAttribute("loginUser")%>">상담 내용 수정</a></li>
				</ul>
			</div>
			
	</td>
	<td width="80%">
	<%
	if(session.getAttribute("loginUser") != null){
		%>
		<div style="margin-left:180px;">
		<form method=POST action="user_updateinsert">
	
		     			<dl class="top_list">
								<dt class="list">&middot; 아이디(필수)</dt>
								<dd class="sub_list"><input type="text" name="user_id" value="<%= request.getAttribute("id") %>" readonly>
	 
								<dt class="list">&middot; 비밀번호(필수)</dt>
								<dd class="sub_list"><input type="password" name="user_pwd" value="<%= request.getAttribute("pwd") %>" required></dd>
				 
								<dt class="list">&middot; 이름(필수)</dt>
								<dd class="sub_list"><input type="text" name="user_name" value="<%= request.getAttribute("name") %>" readonly></dd>
						
								<dt class="list">&middot; 전화번호</dt> 
								<dd class="sub_list">
									<select name="phone_agency">
									<%
									if(request.getAttribute("agency").equals("SKT")){	%>
										<option value="SKT" selected>SKT</option>
										<option value="KT">KT</option>
										<option value="LG U+">LG U+</option>
										<%} %>
											<%
									if(request.getAttribute("agency").equals("KT")){	%>
										<option value="SKT" >SKT</option>
										<option value="KT" selected>KT</option>
										<option value="LG U+">LG U+</option>
										<%} %>
											<%
									if(request.getAttribute("agency").equals("LG U+")){	%>
										<option value="SKT" >SKT</option>
										<option value="KT">KT</option>
										<option value="LG U+" selected>LG U+</option>
										<%} %>
									</select>
									<input type="text" size="15" maxlength="20" name="user_phone" title="휴대폰 번호 입력"  value="<%= request.getAttribute("phone") %>">
								</dd>
		     			
								<dt class="list">&middot; 주소</dt>
								<dd class="sub_list">
								<input type="text" name="user_addrnum" size="10" maxlength="5"  value="<%= request.getAttribute("addrnum") %>"><br>
								<input type="text" name="user_address" size="50"  value="<%= request.getAttribute("address") %>">
								</dd>

								<dt class="list">&middot; 이메일</dt>
								<dd class="sub_list">
									<input type="text" name="user_email" size="30" maxlength="40" value="<%= request.getAttribute("email") %>">
								</dd>

								<dt class="list">&middot; 메일수신(필수)</dt>
								<dd class="sub_list">
								<%
										if(request.getAttribute("mailcheck").equals("yes")){
											%>
										<input type="radio" id="agree1" name="mail_check" checked="checked" value="yes" >메일 수신함
										<input type="radio" id="disagree1" name="mail_check" value="no" >메일 수신안함
								<%
									}else{
								%>		
										<input type="radio" id="agree1" name="mail_check" value="yes" >메일 수신함
										<input type="radio" id="disagree1" name="mail_check" checked="checked" value="no" >메일 수신안함
								<%
										}
								%>
								</dd>
								<dt class="list">&middot; SMS 수신(필수)</dt>
								<dd class="sub_list">
								<%
										if(request.getAttribute("smscheck").equals("yes")){
											%>
								<input type="radio" id="agree2" name="sms_check" checked="checked" value="yes"  >SMS 수신함
								<input type="radio" id="disagree2" name="sms_check" value="no" >SMS 수신안함
								<%
									}else{
								%>
								<input type="radio" id="agree2" name="sms_check" value="yes"  >SMS 수신함
								<input type="radio" id="disagree2" name="sms_check" checked="checked" value="no" >SMS 수신안함	
								<%
										}
								
								%>
								</dd>	

						</dl>
						<div style="margin-left:180px;">	
				<input type="submit" value="회원 정보 수정" class="btn_style2" style='background:#3282FF;' >
				<input type="button" value="취소" class="btn_style2" onclick="location.href='/controller'">
				</div>
				</div>
		</form>
				<%
			}

	%>
			
	
			
	</td>
</tr>
</body>
</html>