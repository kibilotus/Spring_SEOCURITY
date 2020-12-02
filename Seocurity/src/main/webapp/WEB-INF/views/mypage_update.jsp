<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<body>
<%
	String user_id=request.getParameter("user_id");
	String user_pwd=request.getParameter("user_pwd");
	String phone_agency=request.getParameter("phone_agency");
	String user_phone=request.getParameter("user_phone");
	String user_addrnum=request.getParameter("user_addrnum");
	String user_address=request.getParameter("user_address");
	String user_email=request.getParameter("user_email");
	String mail_check=request.getParameter("mail_check");
	String sms_check=request.getParameter("sms_check");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	Resultset rs=null;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?useUnicode=yes&characterEncoding=UTF-8&serverTimezone=UTC";//우리가 사용하는 DB는 jsptest
		String dbid="jspid";
		String dbPass="jsp2019";
		String driverName="com.mysql.cj.jdbc.Driver";
		
		Class.forName(driverName);
		conn=DriverManager.getConnection(jdbcUrl,dbid,dbPass);
		
		
		String sql="update user1 set user_pwd=?,phone_agency=?,user_phone=?,user_addrnum=?,user_address=?, user_email=?, mail_check=?,sms_check=? where user_id=?;";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,user_pwd);
		pstmt.setString(2,phone_agency);
		pstmt.setString(3,user_phone);
		pstmt.setString(4,user_addrnum);
		pstmt.setString(5,user_address);
		pstmt.setString(6,user_email);
		pstmt.setString(7,mail_check);
		pstmt.setString(8,sms_check);
		pstmt.setString(9,user_id);
		
		pstmt.executeUpdate();%>
		<script>
		    alert("회원정보가 수정되었습니다.");
		    location.href="main.jsp?target=user_update&column=2";
		</script>
		
		<%
	}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt !=null)
			try{pstmt.close();}catch(SQLException sql){}
		if(conn != null)
			try{conn.close();}catch(SQLException sql){}
		
	}
	

%>
</body>
</html>