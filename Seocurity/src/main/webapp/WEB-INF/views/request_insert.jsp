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
<body>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<body>
<%
	int consulting_type = Integer.parseInt(request.getParameter("consulting_type"));
	String user_id =(String)session.getAttribute("loginId");
	String request_subject=request.getParameter("request_subject");
	String request_name=request.getParameter("request_name");
	String request_phone=request.getParameter("request_phone");
	String request_email=request.getParameter("request_email");
	String request_comment=request.getParameter("request_comment");
	String request_pwd=request.getParameter("request_pwd");
	Timestamp signdate=new Timestamp(System.currentTimeMillis());


	Connection conn=null;
	PreparedStatement pstmt=null;
	
	try{
		String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?useUnicode=yes&characterEncoding=UTF-8&serverTimezone=UTC";//우리가 사용하는 DB는 jsptest
		String dbid="jspid";
		String dbPass="jsp2019";
		String driverName="com.mysql.cj.jdbc.Driver";
		
		Class.forName(driverName);
		conn=DriverManager.getConnection(jdbcUrl,dbid,dbPass);
		
		
		String sql="insert into consulting_request values(?,?,?,?,?,?,?,?);";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,consulting_type);
		pstmt.setString(2,user_id);
		pstmt.setString(3,request_subject);
		pstmt.setString(4,request_name);
		pstmt.setString(5,request_phone);
		pstmt.setString(6,request_email);
		pstmt.setString(7,request_comment);
		pstmt.setTimestamp(8,signdate);
		
		pstmt.executeUpdate();%>
		<script>
		    alert("컨설팅 신청이 완료 되었습니다.");
		    location.href="main.jsp?target=request_check&column=2";
		</script>
	<%
	}
	catch(Exception e){
		e.printStackTrace();
		%>
		<script>
		    alert("이미 컨설팅 신청이 되어있습니다.");
		    location.href="main.jsp?target=request_check&column=2";
		</script>
	<%
	}finally{
		if(pstmt !=null)
			try{pstmt.close();}catch(SQLException sql){}
		if(conn != null)
			try{conn.close();}catch(SQLException sql){}
		
	}
	

%>
</body>
</html>
</body>
</html>