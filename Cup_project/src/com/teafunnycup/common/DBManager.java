package com.teafunnycup.common;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	
	private static Connection conn;
	
	/*private final static String DDRIVE = "oracle.jdbc.driver.OracleDriver";
	private final static String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	private final static String USER = "java";
	private final static String PASSWORD = "1234";*/
	
	
	private DBManager() {
		
	}
	
	public static Connection getConnection() {
		conn = null;
		
		if(conn==null) {
			try {
				Context initContext = new InitialContext();
				Context envContext = (Context)initContext.lookup("java://comp/env");	// lookup방식이라 Context로 형변환
				DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");		// Serveer.xml의 DB 이름을 적어 줌
			
				
				conn = ds.getConnection();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
		return conn;
	}
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs){
		try {
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e){
					e.printStackTrace();
				}
			} if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e){
					e.printStackTrace();
				}
			} if(rs != null) {
				try {
					rs.close();
				} catch (Exception e){
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e){
					e.printStackTrace();
				}
			} if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e){
					e.printStackTrace();
				}
			} 
		}catch (Exception e){
			e.printStackTrace();
		}
	}
}