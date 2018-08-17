package com.zou.dao;

import java.sql.*;

import javax.swing.JOptionPane;

public class db {
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/ascentweb?characterEncoding=utf8&useSSL=true";
	private static String username = "root";
	private static String passwrod = "19970207";
	//建立数据库连接
	public static Connection getConnection(){
		Connection conn = null;
	    	try {
	    		Class.forName(driver); 
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	    	try {
	    		conn = DriverManager.getConnection(url,username,passwrod);
			} catch (Exception e) {
				// TODO: handle exception
			}
	    	return conn;
	}

	//关闭资源
	public  static void close(Connection conn,Statement st){
		if(conn!=null){
			try{
				conn.close();
			}catch(SQLException e){
				JOptionPane.showMessageDialog(null, "数据库驱动加载失败");
			}
		}
		if(st!=null){
			try{
				st.close();
			}catch(SQLException e){
				JOptionPane.showMessageDialog(null, "数据库驱动加载失败");
			}
		}
	}

}
