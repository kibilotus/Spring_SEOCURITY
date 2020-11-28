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
<% 
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String id =request.getParameter("id");
		int cnt=0;
		
		try{
			String jdbcUrl="jdbc:mysql://localhost:3306/jsptest?serverTimezone=UTC";//우리가 사용하는 DB는 jsptest
			String dbid="jspid";
			String dbPass="jsp2019";
			String driverName="com.mysql.cj.jdbc.Driver";
			
			Class.forName(driverName);
			conn=DriverManager.getConnection(jdbcUrl,dbid,dbPass);
			
			pstmt=conn.prepareStatement("select count(user_id) from user1 where user_id=?");
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()){
				cnt=rs.getInt(1);
			}
			
			
			if(cnt == 1){
				%>
					<script>
						var result=confirm("이미 사용중인 아이디 입니다");
						if(result == true){
							location.href="join_main.jsp";
						}
					</script>
				<%
			}else{
				%>
				<script>
				var result=confirm("사용가능한 아이디 입니다");
				if(result == true){
					location.href="join_main.jsp?id="+<%= id %>;
				}
				</script>
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