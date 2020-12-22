<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	
	String messege= (String)request.getAttribute("messege");
	if(messege.equals("login")){
		String userid = request.getParameter("id");
		session.setAttribute("loginUser", userid);

		
	}
	else{

	}
	
	response.sendRedirect("/controller");
	 %>
</body>
</html>