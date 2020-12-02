<%@page import="com.mysql.cj.Session"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seocurity|컨설팅 신청</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/request.css?after">

</head>
<body>
<tr>
	<td>
	<%
		if(session.getAttribute("loginId") != null){
	
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
			
			pstmt=conn.prepareStatement("select user_name,user_phone,user_email from user1 where user_id=?");
			pstmt.setString(1, (String)session.getAttribute("loginId"));
			rs=pstmt.executeQuery();

		
			if(rs.next()){
				String user_name=(String)rs.getString("user_name"); 
				String user_phone=(String)rs.getString("user_phone");
				String user_email=(String)rs.getString("user_email");

	%>
	<div style=" margin-left:400px; margin-top:50px;"><h2>SEOCURITY 보안 컨설팅 신청</h2></div>
	<div style="border:1px solid #d8d8d8; margin-left:400px; margin-left:330px; padding:25px; width:65%">
		<div style="margin-left:300px;">
			<form name="consulting_request" method="post" action="request_insert.jsp">
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
				<dd class="request_sub"><input type="text" name="request_name" value="<%= user_name %>" readonly></dd>
				<dt class="request_list">상담 가능 전화번호 </dt>
				<dd class="request_sub"><input type="text" name="request_phone" value="<%= user_phone %>" required></dd>
				<dt class="request_list">상담 가능 이메일 </dt>
				<dd class="request_sub"><input type="text" name="request_email" value="<%= user_email %>" required></dd>
				<dt class="request_list">상담 내용 </dt> 
				<dd class="request_sub"><textarea name="request_comment" cols="60" rows="10" required></textarea></dd>
			</dl>
			<div style="margin-left:140px;">
				<input type="submit" value="상담 신청" class="btn_style2" style='background:#3282FF;' >
				<input type="button" value="상담 취소" class="btn_style2" onclick="location.href='main.jsp'">
				
			</div>
			
			</form>
		</div>
	
	</div>
		
	<%	
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt !=null)
				try{pstmt.close();}catch(SQLException sql){}
			if(conn != null)
				try{conn.close();}catch(SQLException sql){}
			
		}
		
		}else{%>
		<script>
		    alert("회원만 상담이 가능합니다.");
		    location.href="/loginform";
		</script>
	
	<%
		}
			 %>
	</td>
</tr>
</body>
</html>