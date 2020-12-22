package com.seocurity.connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
static Connection con = null;
	
	public static Connection getCon() {
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			/*
			String url = "jdbc:sqlserver://localhost:4853;databaseName=MyDB";
			String user = "Jframe";
			String pwd = "1234";
			con = DriverManager.getConnection(url);
			*/
			String url = "jdbc:oracle:thin:@localhost:1521:orcl"; 
		    String id = "scott";
		    String pw = "tiger";

			con = DriverManager.getConnection(url,id,pw);  
			System.out.println("접속");
			
		} catch (ClassNotFoundException e) {
			System.out.println("error");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("error");
			e.printStackTrace();
		}			
		return con;
		
}
}
