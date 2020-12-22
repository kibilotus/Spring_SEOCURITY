package com.seocurity.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.seocurity.connector.Connector;

import com.seocurity.dto.RequestDTO;
import com.seocurity.dto.UserDTO;
public class RequestDAO {


	private static Connection con;
	PreparedStatement pstmt;
	public RequestDTO dto;
	
	
	public String Request(RequestDTO RDTO) {
		
		
		Connector conn=new Connector();
		con=conn.getCon();		
		try {
				String sql="insert into consulting_request(Consulting_type, Request_id, Request_subject, Request_name, Request_phone, Request_email,Request_comment,signdate)"
						+ "values(?,?,?,?,?,?,?,sysdate)";
				pstmt= con.prepareStatement(sql);	
				pstmt.setString(1, RDTO.getConsulting_type());			
				pstmt.setString(2, RDTO.getRequest_id());
				pstmt.setString(3, RDTO.getRequest_subject());
				pstmt.setString(4, RDTO.getRequest_name());
				pstmt.setString(5, RDTO.getRequest_phone());
				pstmt.setString(6, RDTO.getRequest_email());
				pstmt.setString(7, RDTO.getRequest_comment());
			
				int r=pstmt.executeUpdate();


				return "consulting_request";				
		} catch (SQLException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
			return "fail";	
		}		
		
		
	}
	
	public static ArrayList<Map<String, Object>> getRequest(String request_id) {
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();


		String sql ="select consulting_type ,request_id ,request_subject ,request_name,request_phone,request_email,request_comment,signdate " + 
				" from consulting_request " + 
				" where request_id='"+request_id+"'";
		Connector conn=new Connector();
		con=conn.getCon();		
		try {
			Statement stmt= con.createStatement();			
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("consulting_type", rs.getInt("consulting_type"));
				map.put("request_id", rs.getString("request_id"));
				map.put("request_subject", rs.getString("request_subject"));
				map.put("request_name", rs.getString("request_name"));
				map.put("request_phone", rs.getString("request_phone"));
				map.put("request_email", rs.getString("request_email"));
				map.put("request_comment", rs.getString("request_comment"));
				map.put("signdate", rs.getString("signdate"));
				list.add(map);
			}
			return list;		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return null;
		}
		
	}
	
public String Request_Update(RequestDTO RDTO) {
		
		
		Connector conn=new Connector();
		con=conn.getCon();		
		try {
				String sql="update consulting_request set Consulting_type=?, "
						+ "Request_subject=?, Request_name=?, Request_phone=?, Request_email=?,Request_comment=? where request_id='"+ RDTO.getRequest_id() +"'";
				pstmt= con.prepareStatement(sql);	
				pstmt.setString(1, RDTO.getConsulting_type());
				pstmt.setString(2, RDTO.getRequest_subject());
				pstmt.setString(3, RDTO.getRequest_name());
				pstmt.setString(4, RDTO.getRequest_phone());
				pstmt.setString(5, RDTO.getRequest_email());
				pstmt.setString(6, RDTO.getRequest_comment());
			
				int r=pstmt.executeUpdate();


				return "request_update";				
		} catch (SQLException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
			return "fail";	
		}		
		
		
	}

	

}
