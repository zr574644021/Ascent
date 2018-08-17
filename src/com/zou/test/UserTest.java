package com.zou.test;

import com.zou.model.Order;
import com.zou.model.Product;
import com.zou.model.User;
import com.zou.service.OrderManage;
import com.zou.service.ProductManage;
import com.zou.service.UserManage;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class UserTest {
	public static void main(String[] args) {

		/*User s = new User();
		s.setUsername("zou");
		s.setPassword("123456");
		s.setFullname("cheng");
		s.setTel("1234564");
		s.setEmail("223232@163.com");
		s.setIdentify("3");
		s.setState("0");*/
		//boolean flag = um.Delete(8);
		//System.out.println(flag);
		//um.SelectByName("admin");
		//User user = UserManage.Login("zou","123456");
		/*Product product = new Product();
		product.serId(3);
		product.setProductnum("111");
		product.setProductname("二甲双胍片");
		product.setCatrgoryno("11");
		product.setCategory("西药");
		product.setPrice1(12.5);
		product.setPrice2(9.5);
		product.setRealstock("123");
		product.setStock("100");
		product.setCas("177900-48-3");
		product.setFormula("CH4 C2H2 CH3OH C2H5OH CH3COOH ");
		product.setWeight("30");
		product.setNote("better");
		boolean flag = ProductManage.UpdatePro(product);*/
		/*int count = UserManage.getCountUser();
		System.out.println(count);*/
		//System.out.println(user.getIdentify());
		//System.out.println();
	/*	List<User> list = new ArrayList<User>();
		list = UserManage.SelectAll(1);*/
		Order or = new Order();
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//String time = "2017-12-17";
		or.setOrdernum("110");
		or.setUid(1);
		or.setCreatetime("2017-12-17");
		or.setId(1);
		or.setProid(2);
		or.setTotal("30");
		or.setQuantity("30");
		or.setAddress("30");
		boolean flag = OrderManage.AddOrder(or);
		System.out.println(flag);
	}
}
