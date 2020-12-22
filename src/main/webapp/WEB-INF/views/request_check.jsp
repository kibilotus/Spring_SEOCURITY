<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.seocurity.dao.RequestDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seocurity|컨설팅 신청 확인</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css?after">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/request.css?after">
</head>
<%
RequestDAO rdao = new RequestDAO();
String request_id = session.getAttribute("loginUser").toString();
ArrayList<Map<String, Object>> list = rdao.getRequest(request_id);

for(Map<String, Object> m : list) {
%>
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
<%if (session.getAttribute("loginUser") != null) { %>
			
				<div style="margin-left:180px;">
					<form name="request_check" method="post" action="request_update">
					<dl class="request_top">
						<dt class="request_list">컨설팅 선택</dt>
						<dd class="request_sub"> <select name="consulting_type">
						<% if(m.get("consulting_type").equals(10)){ %>
									<option value="10" selected>주요정보통신기반 시설보호 컨설팅</option>
									<option value="20">개인정보 보호 컨설팅</option>
									<option value="30">정보보호 종합 컨설팅</option>
									<option value="40">시스템 취약점 진단 컨설팅</option>
						<% }else if(m.get("consulting_type").equals(20)){%>
									<option value="10" >주요정보통신기반 시설보호 컨설팅</option>
									<option value="20" selected>개인정보 보호 컨설팅</option>
									<option value="30">정보보호 종합 컨설팅</option>
									<option value="40">시스템 취약점 진단 컨설팅</option>
						<% } else if(m.get("consulting_type").equals(30)){%>
									<option value="10">주요정보통신기반 시설보호 컨설팅</option>
									<option value="20">개인정보 보호 컨설팅</option>
									<option value="30" selected>정보보호 종합 컨설팅</option>
									<option value="40">시스템 취약점 진단 컨설팅</option>
						<% } else if(m.get("consulting_type").equals(40)){%>
									<option value="10">주요정보통신기반 시설보호 컨설팅</option>
									<option value="20">개인정보 보호 컨설팅</option>
									<option value="30">정보보호 종합 컨설팅</option>
									<option value="40" selected>시스템 취약점 진단 컨설팅</option>
						<% } %>
							</select></dd>
						<dt class="request_list">제목</dt>
						 <dd class="request_sub"> <input type="text" name="request_subject" size="50" maxlength="60" value="<%=m.get("request_subject")%>"></dd>
						<dt class="request_list">성 함</dt> 
						<dd class="request_sub"><input type="text" name="request_name" value="<%=m.get("request_name")%>" readonly></dd>
						<dt class="request_list">상담 가능 전화번호</dt>
						<dd class="request_sub"><input type="text" name="request_phone" value="<%=m.get("request_phone")%>"></dd>
						<dt class="request_list">상담 가능 이메일</dt>
						<dd class="request_sub"><input type="text" name="request_email" value="<%=m.get("request_email")%>"></dd>
						<dt class="request_list">상담 내용</dt> 
						<dd class="request_sub"><textarea name="request_comment" cols="60" rows="10"><%=m.get("request_comment")%></textarea></dd>
						<dt class="request_list">작성일</dt>
						<dd class="request_sub"><%=m.get("signdate")%><input type="hidden" name="user_id" value="<%=m.get("request_id")%>"></dd>
					</dl>
					<div style="margin-left:140px;">
						<input type="submit" value="상담 수정" class="btn_style2" style='background:#3282FF;' >
						<input type="button" value="수정 취소" class="btn_style2" onclick="location.href='/controller'">
					</div>
					</form>
				</div>
					
					
					<%
			//else{}
		%>

	
	<%
		}
}
 %>
	</td>
</tr>
</body>
</html>