package com.seocurity.dao;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.seocurity.connector.Connector;
import com.seocurity.dto.UserDTO;

public class UserDAO {
	private Connection con;
	PreparedStatement pstmt;
	public UserDTO dto;
		
	
	public ArrayList<String> ModSelect(String id) {
		
		ArrayList<String> list = new ArrayList<String>();

		//System.out.println(id);
		
			String sql ="select user_id,user_pwd,user_name,user_phone,user_agency,user_addrnum,user_address,user_email,mail_check,sms_check" + 
				" from user1 where user_id='"+id+"'";

			Connector conn=new Connector();
			con=conn.getCon();
		try {
			Statement stmt= con.createStatement();			
			ResultSet rs=stmt.executeQuery(sql);
			//System.out.println(rs.next());
			//System.out.println(rs.getString(1));
			//System.out.println(rs.getString(2));
			//System.out.println(rs.getString(3));
			if(rs.next()) {	

				list.add(rs.getString(1));
				list.add(rs.getString(2));
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5));
				list.add(rs.getString(6));
				list.add(rs.getString(7));
				list.add(rs.getString(8));
				list.add(rs.getString(9));
				list.add(rs.getString(10));
			}
		}
		catch (SQLException e) {
		}
			return list;
	}
	public String ModUpdate(UserDTO UDTO) {
		
		Connector conn=new Connector();
		con=conn.getCon();		
		try {
				String sql = "update user1 set USER_PWD=?,USER_PHONE=?,USER_AGENCY=?,USER_ADDRNUM=?,USER_ADDRESS=?,USER_EMAIL=?,MAIL_CHECK=?,SMS_CHECK=?"
						+ " where USER_ID=?";
				pstmt= con.prepareStatement(sql);		
				pstmt.setString(1, UDTO.getUser_pwd());
				pstmt.setString(2, UDTO.getUser_phone());
				pstmt.setString(3, UDTO.getUser_agency());
				pstmt.setString(4, UDTO.getUser_addrnum());
				pstmt.setString(5, UDTO.getUser_address());
				pstmt.setString(6, UDTO.getUser_email());
				pstmt.setString(7, UDTO.getMail_check());
				pstmt.setString(8, UDTO.getSms_check());
				pstmt.setString(9, UDTO.getUser_id());
				pstmt.executeUpdate();
				//System.out.println(sql);
				return "update";	
							
		} catch (SQLException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
			return "fail";	
		}
		
	}
	
	public String Join(UserDTO UDTO) {
		
		Connector conn=new Connector();
		con=conn.getCon();		
		try {
				String sql="insert into user1(USER_ID, USER_PWD, USER_NAME, USER_PHONE, USER_AGENCY, USER_BIRTH,"
						+ "USER_CALENDAR, USER_ADDRNUM, USER_ADDRESS, USER_EMAIL, MAIL_CHECK, SMS_CHECK)"
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";				
				pstmt= con.prepareStatement(sql);				
				pstmt.setString(1, UDTO.getUser_id());
				pstmt.setString(2, UDTO.getUser_pwd());
				pstmt.setString(3, UDTO.getUser_name());
				pstmt.setString(4, UDTO.getUser_phone());
				pstmt.setString(5, UDTO.getUser_agency());
				pstmt.setString(6, UDTO.getUser_birth());
				pstmt.setString(7, UDTO.getUser_calendar());
				pstmt.setString(8, UDTO.getUser_addrnum());
				pstmt.setString(9, UDTO.getUser_address());
				pstmt.setString(10, UDTO.getUser_email());
				pstmt.setString(11, UDTO.getMail_check());
				pstmt.setString(12, UDTO.getSms_check());								
				int r=pstmt.executeUpdate();					
				return "join";				
		} catch (SQLException e) {
			// TODO Auto-generated catch block			
			e.printStackTrace();
			return "fail";	
		}
	}
	
	public String getnamebyID(String id) {
		String sql ="select user_id,user_name" + 
				" from user1" + 
				" where user_id='"+id+"'";
		Connector conn=new Connector();
		con=conn.getCon();		
		try {
			Statement stmt= con.createStatement();			
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()) {
				return rs.getString("user_name");
			}
			else {
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return null;
		}
		
	}
	

	public String Login(UserDTO UDTO) {		
		String sql ="select user_id,user_pwd" + 
				" from user1" + 
				" where user_id='"+UDTO.getUser_id()+"'";
		Connector conn=new Connector();
		con=conn.getCon();		
		try {
			Statement stmt= con.createStatement();			
			ResultSet rs=stmt.executeQuery(sql);
			
			if(rs.next()) {
				if(rs.getString("user_pwd").equals(UDTO.getUser_pwd())){
					String messege= "login";
					rs.close();
					con.close();
					return messege;
				}
				else {
					rs.close();
					con.close();
					return null;
				}
			}
			else {
				rs.close();
				con.close();
				return null;				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return null;	
		}
	};
	
	
	

}
