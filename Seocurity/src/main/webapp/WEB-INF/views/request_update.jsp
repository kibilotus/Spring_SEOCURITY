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
		
			
		String sql="update consulting_request set request_subject=?,request_name=?,request_phone=?,request_email=?,request_comment=? where consulting_type=? AND request_id=?;";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,request_subject);
		pstmt.setString(2,request_name);
		pstmt.setString(3,request_phone);
		pstmt.setString(4,request_email);
		pstmt.setString(5,request_comment);
		pstmt.setInt(6,consulting_type);
		pstmt.setString(7,user_id);
		
		pstmt.executeUpdate();%>
		<script>
	    alert("상담 내용이 수정되었습니다.");
	    location.href="main.jsp?target=request_check&column=2";
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
</body>
</html>