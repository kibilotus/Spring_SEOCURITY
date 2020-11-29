<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보안컨설팅_SEOCURITY</title>
<link rel="stylesheet" type="text/css" href="main.css?after">
</head>

<%
	String target=request.getParameter("target");
	if(target==null) target="main_intro";
	String targetPage=target+".jsp";
	
	String target_col=request.getParameter("column");
	if(target_col == null) target_col="1";
	
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
					<i class="s1"><a href="main.jsp?target=loginform">로그인</a>&nbsp;/&nbsp;<a href="join_main.jsp">회원가입</a></i>
			<%
				} else {
			%>
    				<a href="main.jsp?target=user_update&column=2"><%=session.getAttribute("loginUser")%>님의 My Page</a> |
				    <a href="logout.jsp">로그아웃</a>
			<%
			}
			%>
			
		   </div>
		</td>
	</tr>  

	<tr>
		<td colspan="<%= target_col %>">
			<center><a href="main.jsp"><img src="img/title.jpg"></img></a></center>
		</td>
	</tr>  
  
<tr>
	<td colspan="<%= target_col %>">
	<div class="drop_box">
			<ul>
				<li><a href="main.jsp?target=consulting_main">Seocurity 컨설팅</a>
				<div class="sub_menu">
					<ul>
						<li><a href="main.jsp?target=consulting_main">컨설팅 소개및 장점</a></li>
						<li><a href="main.jsp?target=consulting_request">보안 컨설팅 신청</a></li>
					</ul>
				</div>
				</li>
				<li><a href="main.jsp?target=consulting_sub1">주요정보통신기반시설 보호</a></li>
				<li><a href="main.jsp?target=consulting_sub2">개인정보 보호</a></li>
				<li><a href="main.jsp?target=consulting_sub3">정보보호 종합컨설팅</a></li>
				<li><a href="main.jsp?target=consulting_sub4">시스템취약점진단</a></li>
			</ul>
	</div>
		</td>
	</tr>
	
		<jsp:include page="<%=targetPage %>"/>

	<tr>
		<td colspan="<%= target_col %>" bgcolor="#A6A6A6" height="150px" style=" align:center;">
		<div class="footer">
			<img src="img/title2.jpg">
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