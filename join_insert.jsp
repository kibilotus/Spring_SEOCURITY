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
	String user_name=request.getParameter("user_name");
	String phone_agency=request.getParameter("phone_agency");
	String user_phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
	String user_birth=request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("date");
	String user_calendar=request.getParameter("user_calendar");
	String user_addrnum=request.getParameter("user_addrnum");
	String user_address=request.getParameter("user_address");
	String user_email=request.getParameter("user_email")+"@"+request.getParameter("email_domain");
	String mail_check=request.getParameter("mail_check");
	String sms_check=request.getParameter("sms_check");
	
	
	String prnM=null;

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
		
		
		String sql="insert into user1 values(?,?,?,?,?,?,?,?,?,?,?,?);";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,user_id);
		pstmt.setString(2,user_pwd);
		pstmt.setString(3,user_name);
		pstmt.setString(4,phone_agency);
		pstmt.setString(5,user_phone);
		pstmt.setString(6,user_birth);
		pstmt.setString(7,user_calendar);
		pstmt.setString(8,user_addrnum);
		pstmt.setString(9,user_address);
		pstmt.setString(10,user_email);
		pstmt.setString(11,mail_check);
		pstmt.setString(12,sms_check);
		
		pstmt.executeUpdate();//업데이트 해주기
		response.sendRedirect("join_complete.jsp?id="+user_id);
	}
	catch(Exception e){
		e.printStackTrace();
		prnM="user테이블에 새로운 레코드 추가를 실패했습니다.";
		out.println(prnM);
	}finally{
		if(pstmt !=null)
			try{pstmt.close();}catch(SQLException sql){}
		if(conn != null)
			try{conn.close();}catch(SQLException sql){}
		
	}
	

%>
</body>
</html>