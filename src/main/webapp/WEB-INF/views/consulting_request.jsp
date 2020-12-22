
<%@page import="com.seocurity.dao.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seocurity|컨설팅 신청</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/request.css?after">

</head>
<%
	UserDAO udao=new UserDAO();
%>
<body>
	<%
	if(session.getAttribute("loginUser") != null){
		%>

<tr>
	<td>
	
	<div style=" margin-left:400px; margin-top:50px;"><h2>SEOCURITY 보안 컨설팅 신청</h2></div>
	<div style="border:1px solid #d8d8d8; margin-left:400px; margin-left:330px; padding:25px; width:65%">
		<div style="margin-left:300px;">
		
			<form name="consulting_request" method="post" action="request_insert">
			<dl class="request_top">
				<dt class="request_list">컨설팅 선택 </dt>
				<dd class="request_sub"><select name="consulting_type">
							<option value="10">주요정보통신기반 시설보호 컨설팅</option>
							<option value="20">개인정보 보호 컨설팅</option>
							<option value="30">정보보호 종합 컨설팅</option>
							<option value="40">시스템 취약점 진단 컨설팅</option>
					</select>
				</dd>
				<dt class="request_list">제목  </dt> 
				<dd class="request_sub"><input type="text" name="request_subject" size="50" maxlength="60" required></dd> 
				<dt class="request_list">성 함 </dt> 
				<dd class="request_sub"><input type="text" name="request_name" value="<%=udao.getnamebyID(session.getAttribute("loginUser").toString())%>" required></dd>
				<dt class="request_list">상담 가능 전화번호 </dt>
				<dd class="request_sub"><input type="text" name="request_phone" value="" required></dd>
				<dt class="request_list">상담 가능 이메일 </dt>
				<dd class="request_sub"><input type="text" name="request_email" value="" required></dd>
				<dt class="request_list">상담 내용 </dt> 
				<dd class="request_sub"><textarea name="request_comment" cols="60" rows="10" required></textarea>
				<input type="hidden" name="request_date" value="">
				<input type="hidden" name="user_id" value="<%=session.getAttribute("loginUser")%>"></dd>
				
			</dl>
			<div style="margin-left:140px;">
				<input type="submit" value="상담 신청" class="btn_style2" style='background:#3282FF;' >
				<input type="button" value="상담 취소" class="btn_style2" onclick="location.href='/controller'">
				
			</div>
			
			</form>
			
		</div>
	
	</div>
	</td>
</tr>

<%}else{%>

	<tr height="900px">
		<td>
				<center><h2>SEOCURITY 보안 컨설팅 신청은 로그인 후 가능합니다.</h2></center>
				<i style="text-decoration:underline;"><center><a href="/controller/loginform">SEOCURITY 로그인 페이지로 이동하시겠습니까?</a></center></i>
				
		</td>
	</tr>
			<%}%>

</body>
</html>