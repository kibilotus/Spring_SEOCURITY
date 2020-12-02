<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seocurity|컨설팅 신청 확인</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/mypage.css?after">
<link rel="stylesheet" type="text/css" href="../../resources/css/request.css?after">
</head>
<body>
<tr>
	<td width="20%">
			<div class="mypage_list">
				<ul>
					<li><a href="main.jsp?target=user_update&column=2">회원 정보 수정</a></li>
					<li><a href="main.jsp?target=request_check&column=2">상담 내용 수정</a></li>
				</ul>
			</div>
	</td>
	<td width="80%">
<%
			if (session.getAttribute("loginId") != null) {
				
			
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try{
				String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?serverTimezone=UTC";//우리가 사용하는 DB는 jsptest
				String dbid="jspid";
				String dbPass="jsp2019";
				String driverName="com.mysql.cj.jdbc.Driver";
				
				Class.forName(driverName);
				conn=DriverManager.getConnection(jdbcUrl,dbid,dbPass);
				
				pstmt=conn.prepareStatement("select * from consulting_request where request_id=?");
				pstmt.setString(1, (String)session.getAttribute("loginId"));
				rs=pstmt.executeQuery();
				
				if(rs.next()){
							int consulting_type = rs.getInt("consulting_type");
							String request_subject=rs.getString("request_subject");
							String request_name=rs.getString("request_name");
							String request_phone=rs.getString("request_phone");
							String request_email=rs.getString("request_email");
							String request_comment=rs.getString("request_comment");
							Timestamp signdate= rs.getTimestamp("signdate");
							%>
			
				<div style="margin-left:180px;">
					<form name="request_check" method="post" action="request_update.jsp">
					<dl class="request_top">
						<dt class="request_list">컨설팅 선택</dt>
						<dd class="request_sub"> <select name="consulting_type">
		
									<option value="10" selected>주요정보통신기반 시설보호 컨설팅</option>
									<option value="20">개인정보 보호 컨설팅</option>
									<option value="30">정보보호 종합 컨설팅</option>
									<option value="40">시스템 취약점 진단 컨설팅</option>
							
							</select></dd>
						<dt class="request_list">제목</dt>
						 <dd class="request_sub"> <input type="text" name="request_subject" size="50" maxlength="60" value="<%= request_subject %>"></dd>
						<dt class="request_list">성 함</dt> 
						<dd class="request_sub"><input type="text" name="request_name" value="<%= request_name %>" readonly></dd>
						<dt class="request_list">상담 가능 전화번호</dt>
						<dd class="request_sub"><input type="text" name="request_phone" value="<%= request_phone %>"></dd>
						<dt class="request_list">상담 가능 이메일</dt>
						<dd class="request_sub"><input type="text" name="request_email" value="<%= request_email %>"></dd>
						<dt class="request_list">상담 내용</dt> 
						<dd class="request_sub"><textarea name="request_comment" cols="60" rows="10"><%=request_comment %></textarea></dd>
						<dt class="request_list">작성일</dt>
						<dd class="request_sub"><%= signdate %></dd>
					</dl>
					<div style="margin-left:140px;">
						<input type="submit" value="상담 수정" class="btn_style2" style='background:#3282FF;' >
						<input type="button" value="수정 취소" class="btn_style2" onclick="location.href='main.jsp'">
					</div>
					</form>
				</div>
					<%
				}else{
					
					%>
					<center><h2>컨설팅 신청 내용이 존재하지 않습니다.</h2></center>
					
					<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(rs != null) try{rs.close();}catch(SQLException sql){}
				if(pstmt !=null) try{pstmt.close();}catch(SQLException sql){}
				if(conn != null) try{conn.close();}catch(SQLException sql){}
			}
			}else{
		%>
		<script>
	    alert("회원만 상담 신청 확인이 가능합니다.");
	    location.href="main.jsp?target=loginform";
	</script>
	
	<%
		}
 %>
	</td>
</tr>
</body>
</html>