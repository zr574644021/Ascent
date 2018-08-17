package com.zou.model;

public class User {
	private	int id;			//用户ID
	private String username;//用户名
	private String password;//密码
	private String fullname;//用户全称
	private String tel;		//电话
	private String email;	//邮箱
	private String identify;//用户角色权限3超级管理员,2管理员,1普通用户
	private String state;	//软删除标志，1:删除，0：未删除
	private int pageNow;

	public User(int id,String username,String password,String fullname,String tel,String email ,String identify,String state){
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.tel = tel;
		this.email = email;
		this.identify = identify;
		this.state = state;
	}

	public User(){
		super();
	}

	public int getId(){
		return this.id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public String getUsername(){
		return this.username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void setPassword(String password){
		this.password = password;
	}
	
	public String getFullname(){
		return this.fullname;
	}
	
	public void setFullname(String fullname){
		this.fullname = fullname;
	}
	
	public String getTel(){
		return this.tel;
	}
	
	public void setTel(String tel){
		this.tel = tel;
	}
	
	public String getEmail(){
		return this.email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getIdentify(){
		return this.identify;
	}
	
	public void setIdentify(String identify){
		this.identify = identify;
	}
	
	public String getState(){
		return this.state;
	}
	
	public void setState(String state){
		this.state = state;
	}

	public int getPageNow() {
		return this.pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
}
