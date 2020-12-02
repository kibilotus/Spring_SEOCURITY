<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seocurity_회원가입</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/join.css?after">
</head>
<body>
<%
	String join_id =request.getParameter("id");

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
		
		pstmt=conn.prepareStatement("select * from user1 where user_id=?");
		pstmt.setString(1, join_id);
		rs=pstmt.executeQuery();

		
		if(rs.next()){
			String user_id=(String)rs.getString("user_id");
			String user_pwd=(String)rs.getString("user_pwd");
			String user_name=(String)rs.getString("user_name");
			String phone_agency=(String)rs.getString("phone_agency");
			String user_phone=(String)rs.getString("user_phone");
			String user_birth=(String)rs.getString("user_birth");
			String user_calendar=(String)rs.getString("user_calendar");
			String user_addrnum=(String)rs.getString("user_addrnum");
			String user_address=(String)rs.getString("user_address");
			String user_email=(String)rs.getString("user_email");
			String mail_check=(String)rs.getString("mail_check");
			String sms_check=(String)rs.getString("sms_check");
	%>
	
<header>
	<center><a href="main.jsp"><img src="../../resources/image/title.jpg"></a></center>
</header>		
		<br>
		<hr>
	
		<center><h1>회원가입을 축하합니다</h1></center>
		<center>
	 	<form>
	   	 <table>
	     	  <tr>
	     	  	     	  <th>&middot; 아이디</th>
	     	  	     	  <td>
							          <%= user_id %>
	     	  	     	  </td>
 	     	  </tr>
	     <tr>
				<th>&middot; 비밀번호</th>
				<td>
						<%=user_pwd%>
				</td>
	     </tr>
	     <tr>
				<th>&middot; 이름</th>
				<td>
					 
						<%=user_name%>
					 
				</td>
	     </tr>
	     <tr>
			<th>&middot; 전화번호</th> 
			<td>
				 
					<%=phone_agency%>
					<%=user_phone%>
				 
			</td>
	     </tr>
	     <tr>
			<th>&middot; 생년월일</th>
			<td>
	  		  <%
			   if(user_calendar.equals("solar")){
				          %>양력<%}
			   else{%>
				          음력
			<%} %>
				<%=user_birth%>
			 				   
		</td>
	     </tr>
	     <tr>
			<th>&middot; 이메일</th>
			<td>
				 
					<%=user_email%>
			</td>
	     </tr>
	     
	     <tr>
			<th>&middot; 메일수신</th>
			<td>
				 <%
					if(mail_check.equals("yes")){
						%>	메일 수신 함
					<%}else{%>
						메일 수신 안 함
				 	<%} %>	
			</td>
	     </tr>

	     
<tr>
			<th>&middot; SMS 수신</th>
			<td>
				 <%
					if(sms_check.equals("yes")){
						%>SMS 수신 함
					<%}else{%>
						SMS 수신 안 함
				 	<%} %>
			</td>
	     </tr>
	   </table>
	   
	   <input type="button" value="홈으로 돌아가기" class="btn_style3" onclick="location.href='main.jsp'">
	</form>
	</center>
			
			<%
		}
			
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sql){}
		if(pstmt !=null) try{pstmt.close();}catch(SQLException sql){}
		if(conn != null) try{conn.close();}catch(SQLException sql){}
	}
%>

</body>
</html>