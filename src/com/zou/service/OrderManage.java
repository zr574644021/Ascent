package com.zou.service;

import com.zou.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderManage {
    private static Connection conn = null;
    private static PreparedStatement pst = null;
    private static ResultSet rs = null;
    private static boolean flag = false;

    public static List<Order> OrderItem(int id){
        String sql = "select orders.id,orders.ordernum,orders.userid,orders.createtime,orders.state,orderitem.address,orderitem.quantity," +
                "orderitem.allprice ,product.productnum,product.productname,product.price1 from orders,orderitem,product " +
                "where orderitem.orderid=orders.id and orderitem.productid=product.id and orders.id=?";
        conn = com.zou.dao.db.getConnection();
        //System.out.println(id);
        List<Order> list = new ArrayList<Order>();
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1,id);
            //System.out.println(pst);
            rs = pst.executeQuery();
            while (rs.next()){
                Order or = new Order();
                //System.out.println(rs.getInt("id"));
                or.setId(rs.getInt("id"));
                or.setOrdernum(rs.getString("ordernum"));
                or.setUid(rs.getInt("userid"));
                or.setCreatetime(rs.getString("createtime"));
                or.setState(rs.getString("state"));
                or.setTotal(rs.getString("allprice"));
                or.setPronum(rs.getString("productnum"));
                or.setProname(rs.getString("productname"));
                or.setPrice1(rs.getString("price1"));
                or.setQuantity(rs.getString("quantity"));
                or.setAddress(rs.getString("address"));
                list.add(or);
                //System.out.println(list);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        //System.out.println(list);
        return list;
    }

    //查询所有订单
    public static List<Order> SelectAllOrder(){
        String sql = "select * from orders";
        conn = com.zou.dao.db.getConnection();
        List list = new ArrayList<Order>();
        try {
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()){
                Order or = new Order();
                or.setId(rs.getInt(1));
                or.setOrdernum(rs.getString(2));
                or.setUid(rs.getInt(3));
                or.setCreatetime(rs.getString(4));
                or.setState(rs.getString(5));
                list.add(or);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        return list;
    }

    //根据商品编号查询订单
    public static List<Order> SelectOrByornum(String ornum){
        String sql = "select * from orders where ordernum=?";
        conn = com.zou.dao.db.getConnection();
        List list = new ArrayList<Order>();
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1,ornum);
            //System.out.println(pst);
            rs = pst.executeQuery();
            while (rs.next()){
                Order or = new Order();
                or.setId(rs.getInt(1));
                or.setOrdernum(rs.getString(2));
                or.setUid(rs.getInt(3));
                or.setCreatetime(rs.getString(4));
                or.setState(rs.getString(5));
                list.add(or);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        return list;
    }

    //根据用户ID查询订单
    public static List<Order> SelectOrByUid(int uid){
        String sql = "select * from orders where userid=?";
        conn = com.zou.dao.db.getConnection();
        List list = new ArrayList<Order>();
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1,uid);
            rs = pst.executeQuery();
            while (rs.next()){
                Order or = new Order();
                or.setId(rs.getInt(1));
                or.setOrdernum(rs.getString(2));
                or.setUid(rs.getInt(3));
                or.setCreatetime(rs.getString(4));
                or.setState(rs.getString(5));
                list.add(or);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        return list;
    }


    //添加订单
    public static boolean AddOrder(Order order) {
        String sql1 = "insert into orders values(NULL,?,?,?,'0')";
        String sql2 = "insert into orderitem values(null,?,?,?,?,?)";
        String sql3 = "select id from orders where ordernum=?";

        conn = com.zou.dao.db.getConnection();
        PreparedStatement pst1 = null;
        PreparedStatement pst2 = null;
        PreparedStatement pst3 = null;
        PreparedStatement pst4 = null;
        try{
            pst1 = conn.prepareStatement(sql3);
            pst1.setString(1,order.getOrdernum());
            rs = pst1.executeQuery();
            if (rs.next()){
                order.setId(rs.getInt(1));
                pst4 = conn.prepareStatement(sql2);
                pst4.setInt(1,order.getId());
                pst4.setInt(2,order.getProid());
                pst4.setString(3,order.getTotal());
                pst4.setString(4,order.getAddress());
                pst4.setString(5,order.getQuantity());
                int row1 = pst4.executeUpdate();
                if (row1>0){
                    flag = true;
                    System.out.println(flag);
                }
            }else {
                pst2 = conn.prepareStatement(sql1);
                pst2.setString(1,order.getOrdernum());
                pst2.setInt(2,order.getUid());
                pst2.setString(3,order.getCreatetime());
                int row = pst2.executeUpdate();
                if (row>0){
                    pst3 = conn.prepareStatement(sql3);
                    pst3.setString(1,order.getOrdernum());
                    rs = pst3.executeQuery();
                    if (rs.next()){
                        order.setId(rs.getInt(1));
                        pst4 = conn.prepareStatement(sql2);
                        pst4.setInt(1,order.getId());
                        pst4.setInt(2,order.getProid());
                        pst4.setString(3,order.getTotal());
                        pst4.setString(4,order.getAddress());
                        pst4.setString(5,order.getQuantity());
                        int row1 = pst4.executeUpdate();
                        if (row1>0){
                            flag = true;
                            System.out.println(flag);
                        }
                    }
                }
                pst1.close();
                pst2.close();
                pst3.close();
                rs.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst4);
        }
        return flag;
    }

    //管理员处理订单
    public static boolean DellOrder(int orid){
        String sql = "update orders set state='1' where id=?";
        conn = com.zou.dao.db.getConnection();
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1,orid);
            int row = pst.executeUpdate();
            if (row>0){
                flag = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        System.out.println(flag);
        return flag;
    }

    //用户删除订单
    public static boolean DeleteOrder(int orid){
        String sql = "delete from orders where id=?";
        conn = com.zou.dao.db.getConnection();
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1,orid);
            int row = pst.executeUpdate();
            if (row>0){
                flag = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        System.out.println(flag);
        return flag;
    }

    //获取订单数量
    public static int getCountOrder(){
        int count = 0;
        String sql= "select count(*) from orders";
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
