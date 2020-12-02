<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/mypage.css?after">
<link rel="stylesheet" type="text/css" href="../../resources/css/list.css?after">
<style>
.btn_style2{
			    border-radius: 5px;
			    width: 150px;
			    height:50px;
				
			}
</style>
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
	if(session.getAttribute("loginId") != null){
		String user_id =(String)session.getAttribute("loginId");
	
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
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
	
			
			if(rs.next()){
				String user_name=(String)rs.getString("user_name");
				String user_phone=(String)rs.getString("user_phone");
				String phone_agency=(String)rs.getString("phone_agency");
				String user_addrnum=(String)rs.getString("user_addrnum");
				String user_address=(String)rs.getString("user_address");
				String user_email=(String)rs.getString("user_email");
				String mail_check=(String)rs.getString("mail_check");
				String sms_check=(String)rs.getString("sms_check");
		%>
		<div style="margin-left:180px;">
		<form method=POST action="mypage_update.jsp">
	
		     			<dl class="top_list">
								<dt class="list">&middot; 아이디(필수)</dt>
								<dd class="sub_list"><input type="text" name="user_id" value="<%=user_id %>" readonly>
	 
								<dt class="list">&middot; 비밀번호(필수)</dt>
								<dd class="sub_list"><input type="password" name="user_pwd" required></dd>
				 
								<dt class="list">&middot; 이름(필수)</dt>
								<dd class="sub_list"><input type="text" name="user_name" value="<%= user_name %>" readonly></dd>
						
								<dt class="list">&middot; 전화번호</dt> 
								<dd class="sub_list">
									<select name="phone_agency">
									<%
									if(phone_agency.equals("SKT")){	%>
										<option value="SKT" selected>SKT</option>
										<option value="KT">KT</option>
										<option value="LG U+">LG U+</option>
										<%} %>
											<%
									if(phone_agency.equals("KT")){	%>
										<option value="SKT" >SKT</option>
										<option value="KT" selected>KT</option>
										<option value="LG U+">LG U+</option>
										<%} %>
											<%
									if(phone_agency.equals("LG U+")){	%>
										<option value="SKT" >SKT</option>
										<option value="KT">KT</option>
										<option value="LG U+" selected>LG U+</option>
										<%} %>
									</select>
										<input type="text" size="15" maxlength="20" name="user_phone" title="휴대폰 번호 입력"  value="<%=user_phone %>">
								</dd>
		     			
								<dt class="list">&middot; 주소</dt>
								<dd class="sub_list">
								<input type="text" name="user_addrnum" size="10" maxlength="5"  value="<%=user_addrnum %>"><br>
								<input type="text" name="user_address" size="50"  value="<%=user_address %>">
								</dd>

								<dt class="list">&middot; 이메일</dt>
								<dd class="sub_list">
									<input type="text" name="user_email" size="30" maxlength="40" value="<%=user_email %>">
								</dd>
								<dt class="list">&middot; 메일수신(필수)</dt>
								<dd class="sub_list">
								<%
										if(mail_check.equals("yes")){
											%>
										<input type="radio" id="agree1" name="mail_check" checked="checked" value="yes" >메일 수신함
										<input type="radio" id="disagree1" name="mail_check" value="no" >메일 수신안함
								<%
									}else{
								%>		
										<input type="radio" id="agree1" name="mail_check" value="yes" >메일 수신함
										<input type="radio" id="disagree1" name="mail_check" checked="checked" value="no" >메일 수신안함
								<%
										}
								%>
								</dd>
								<dt class="list">&middot; SMS 수신(필수)</dt>
								<dd class="sub_list">
								<%
										if(sms_check.equals("yes")){
											%>
								<input type="radio" id="agree2" name="sms_check" checked="checked" value="yes"  >SMS 수신함
								<input type="radio" id="disagree2" name="sms_check" value="no" >SMS 수신안함
								<%
									}else{
								%>
								<input type="radio" id="agree2" name="sms_check" value="yes"  >SMS 수신함
								<input type="radio" id="disagree2" name="sms_check" checked="checked" value="no" >SMS 수신안함	
								<%
										}
								
								%>
								</dd>	
						</dl>
						<div style="margin-left:180px;">	
				<input type="submit" value="회원 정보 수정" class="btn_style2" style='background:#3282FF;' >
				<input type="button" value="취소" class="btn_style2" onclick="location.href='main.jsp'">
				</div>
				</div>
		</form>
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
	}else{
			%>
			<script>
			    alert("회원만 접근 가능합니다.");
			    location.href="main.jsp?target=loginform";
			</script>
			<%
		
	}
	
			 %>
			
	
			
	</td>
</tr>
</body>
</html>