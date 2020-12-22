<%@page import="com.seocurity.connector.Connector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보안컨설팅_SEOCURITY</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?after">
</head>

<%
Connector con =new Connector();
con.getCon();
	String target=request.getParameter("target");
	if(target==null) target="main_intro.jsp";
	String targetPage=target;
	
	String target_col=request.getParameter("column");
	if(target_col == null) target_col="1";
	
	if(targetPage.equals("request_check.jsp") || targetPage.equals("user_update.jsp")) target_col="2";
	
	System.out.println(targetPage);
%>


<body>
		<br>

<table width="100%">
	<tr>
		<td colspan="<%= target_col %>">
		   <div align="right">
			<%
			
				if(session.getAttribute("loginUser")==null){
			%>
					<i class="s1"><a href="/controller/loginform">로그인</a>&nbsp;/&nbsp;<a href="/controller/joinform">회원가입</a></i>
			<%
				} else {
			%>
    				<a href="/controller/user_update?id=<%= session.getAttribute("loginUser")%>"><%=session.getAttribute("loginUser")%>님의 My Page</a> |
				    <a href="/controller/logout">로그아웃</a>
			<%
			}
			%>
			
		   </div>
		</td>
	</tr>  

	<tr>
		<td colspan="<%= target_col %>">
			<center><a href="/controller"><img src="${pageContext.request.contextPath}/resources/image/title.jpg"></img></a></center>
		</td>
	</tr>  
  
<tr>
	<td colspan="<%= target_col %>">
	<div class="drop_box">
			<ul>
				<li><a href="/controller/consulting_main">Seocurity 컨설팅</a>
				<div class="sub_menu">
					<ul>
						<li><a href="/controller/consulting_main">컨설팅 소개및 장점</a></li>
						<li><a href="/controller/consulting_request">보안 컨설팅 신청</a></li>
					</ul>
				</div>
				</li>
				<li><a href="/controller/consulting_sub1">주요정보통신기반시설 보호</a></li>
				<li><a href="/controller/consulting_sub2">개인정보 보호</a></li>
				<li><a href="/controller/consulting_sub3">정보보호 종합컨설팅</a></li>
				<li><a href="/controller/consulting_sub4">시스템취약점진단</a></li>
			</ul>
	</div>
		</td>
	</tr>
	
		<jsp:include page="<%=targetPage %>"/>

	<tr>
		<td colspan="<%= target_col %>" bgcolor="#A6A6A6" height="150px" style=" align:center;">
		<div class="footer">
			<img src="${pageContext.request.contextPath}/resources/image/title2.jpg">
			<div style="color:#F6F6F6; font-size:14px; opacity:0.5; width:600px;" >
				(주)서큐리티 대표이사 서나연 사업자 등록번호 2018-070-38 <br>
				(14780)경기도 부천시 경인로 590(괴안동) 나눔관 4층 | Tel. 02-2610-0778 | Fax. 02-2610-0778 <br>
				Copyright(c) Seocurity Corp. AllRights Reserved
			</div>
		</div>
		</td>
	</tr> 
</table>
</body>
</html>