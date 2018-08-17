package com.zou.test;

import java.sql.Connection;


public class test {
	public static void main(String[] args) {
		Connection conn = com.zou.dao.db.getConnection();
		if(conn!=null){
			System.out.println("sucess");
		}else{
			System.out.println("fall");
		}
	}
}
