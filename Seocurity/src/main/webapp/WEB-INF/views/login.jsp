<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
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
		
		pstmt=conn.prepareStatement("select user_id,user_pwd,user_name from user1 where user_id=?");
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();

		
		if(rs.next()){
			String db_pwd = (String)rs.getString("user_pwd");
			if(rs.getString("user_pwd").equals(pwd)){
				session.setAttribute("loginId", rs.getString("user_id"));
				session.setAttribute("loginUser", rs.getString("user_name"));
			   response.sendRedirect("main.jsp");
			}else{
				%>
				   <script>
	    				alert("아이디와 비밀번호가 일치하지 않습니다.");
	    				location.href="main.jsp?target=loginform";
					</script>
				   
				   <%
				}
			
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