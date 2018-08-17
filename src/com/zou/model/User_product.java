package com.zou.model;

public class User_product {
	private int id;			//主键编号
	private User user;		//外键,引用用户id
	private Product product;//外键,引用商品id
	
	public int getId(){
		return this.id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public User getUser(){
		return this.user;
	}
	
	public void setUser(User user){
		this.user = user;
	}
	
	public Product getProduct(){
		return this.product;
	}
	
	public void setProduct(Product product){
		this.product = product;
	}
}
