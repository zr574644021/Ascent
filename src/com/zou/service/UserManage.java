package com.zou.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.zou.dao.PageUtil;
import com.zou.model.User;

public class UserManage {
	private static Connection conn = null;
	private static PreparedStatement pst = null;
	private static ResultSet rs = null;
	private static boolean flag = false;

	//注册
	public static boolean Register(User s) {
		// TODO Auto-generated method stub
		conn = com.zou.dao.db.getConnection();
		String sql = "insert into user values(NULL ,?,?,?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, s.getUsername());
			pst.setString(2, s.getPassword());
			pst.setString(3, s.getFullname());
			pst.setString(4, s.getTel());
			pst.setString(5, s.getEmail());
			pst.setString(6, s.getIdentify());
			pst.setString(7, s.getState());
			int row = pst.executeUpdate();
			if(row>0){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			com.zou.dao.db.close(conn, pst);
		}
		return flag;
	}

	//登陆检查
	public static User Login(String username, String password) {
		// TODO Auto-generated method stub
		String sql = "select * from user where username=? and password=? and state=0";
		conn = com.zou.dao.db.getConnection();
		User user = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,username);
			pst.setString(2,password);
			rs = pst.executeQuery();
			while(rs.next()){
				user = new User();
				user.setId(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setEmail(rs.getString(6));
				user.setIdentify(rs.getString(7));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			com.zou.dao.db.close(conn, pst);
		}
		return user;
	}

	//查询所有用户
	@SuppressWarnings("unchecked")
	public static List<User> SelectAll(int pageNow) {
		String sql = "select * from user where state=0 order by id limit ?,?";
		conn = com.zou.dao.db.getConnection();
		List list = new ArrayList<User>();
		try{
			pst = conn.prepareStatement(sql);//执行SQL语句
			pst.setInt(1,(pageNow-1)*6);
			pst.setInt(2,6);
			rs = pst.executeQuery();//获取结果集
			while (rs.next()){
				//System.out.println(111);
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				//u.setPassword(rs.getString("password"));
				u.setFullname(rs.getString("fullname"));
				u.setTel(rs.getString("tel"));
				u.setEmail(rs.getString("email"));
				u.setIdentify(rs.getString("identify"));
				//u.setState(rs.getString("state"));
				//u.setPage(pa);
				u.setPageNow(pageNow);
				list.add(u);
				//System.out.println(u);
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			com.zou.dao.db.close(conn, pst);
		}
		//System.out.println(list);
		return list;
	}

	//修改用户
	public static boolean UpdateUser(String fullname,String tel,String email,String username){
		String sql = "update user set fullname = ?,tel = ?,email = ? where username = ?";
		conn = com.zou.dao.db.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,fullname);
			pst.setString(2,tel);
			pst.setString(3,email);
			pst.setString(4,username);
			int row = pst.executeUpdate();
			if(row>0){
				flag = true;
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			com.zou.dao.db.close(conn,pst);
		}
		return flag;
	}

	//修改密码
	public static boolean UpdatePass(String username,String newpass,String password){

		String sql = "update user set password = ? where username=?";
		String sql1 = "select password from user where username=?";
		PreparedStatement pst1 = null;
		PreparedStatement pst2 = null;
		conn = com.zou.dao.db.getConnection();
		try {
			pst1 = conn.prepareStatement(sql1);
			pst1.setString(1,username);
			rs = pst1.executeQuery();
			if (rs.next()){
				System.out.println(rs.getString(1));
				if (rs.getString(1).equals(password)){
					pst2 = conn.prepareStatement(sql);
					pst2.setString(1,newpass);
					pst2.setString(2,username);
					int row = pst2.executeUpdate();
					if(row>0){
						flag = true;
					}
				}
			}
			pst1.close();
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			com.zou.dao.db.close(conn,pst2);
		}
		System.out.println(flag);
		return flag;
	}

	//注册检查
	public static boolean CheckByName(String username) {
		String sql = "select * from user where username=?";
		conn = com.zou.dao.db.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1,username);
			rs = pst.executeQuery();
			if (rs.next())
				flag = true;
				System.out.println(flag);
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			com.zou.dao.db.close(conn, pst);
		}
		return flag;
	}

	//管理员根据用户名查找
	public static List<User> SelectByName(String username) {
		String sql = "select * from user where username=? and state=0";
		conn = com.zou.dao.db.getConnection();
		List list = new ArrayList<User>();
		try{
			pst = conn.prepareStatement(sql);
			pst.setString(1,username);
			rs = pst.executeQuery();
			while (rs.next()){
					User u = new User();
					u.setId(rs.getInt("id"));
					u.setUsername(rs.getString("username"));
					//u.setPassword(rs.getString("password"));
					u.setFullname(rs.getString("fullname"));
					u.setTel(rs.getString("tel"));
					u.setEmail(rs.getString("email"));
					u.setIdentify(rs.getString("identify"));
					u.setState(rs.getString("state"));
					list.add(u);
					//System.out.println(u)
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			com.zou.dao.db.close(conn, pst);
		}
		//System.out.println(list);
		return list;
	}

	//删除账号
	public static boolean Delete(int id) {
		// TODO Auto-generated method stub
		String sql = "update user set state=1 where id=?";
		conn = com.zou.dao.db.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			int row = pst.executeUpdate();
			if(row>0){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			com.zou.dao.db.close(conn, pst);
		}
		return flag;
	}

	//账号恢复
	public static boolean Recover(String username) {
		// TODO Auto-generated method stub
		String sql = "update user set state=? where username=+"+"'"+username+"'";
		conn = com.zou.dao.db.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "0");
			int row = pst.executeUpdate();
			if(row>0){
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			com.zou.dao.db.close(conn, pst);
		}
		return flag;
	}

	//用户记录,分页要用
	public static int getCountUser(){
		int count = 0;
		String sql= "select count(*) from user where state=0";
		Connection conn = com.zou.dao.db.getConnection();
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			com.zou.dao.db.close(conn,pst);
		}
		return count;
	}
}
