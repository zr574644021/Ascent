package com.zou.service;

import com.zou.dao.PageUtil;
import com.zou.model.Product;
import com.zou.model.ShopCar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductManage {
    private static Connection conn = null;
    private static PreparedStatement pst = null;
    private static ResultSet rs = null;
    private static boolean flag = false;

    //添加商品
    public static boolean addProduct(Product pro){
        String sql = "insert into product values(null,?,?,?,?,'ss.jpg',?,?,?,?,?,?,?,?,?,'0',?)";
        conn = com.zou.dao.db.getConnection();
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1,pro.getProductnum());
            pst.setString(2,pro.getProductname());
            pst.setString(3,pro.getCatrgoryno());
            pst.setString(4,pro.getCategory());
            //pst.setString(5,pro.getImagepath());
            pst.setString(5,pro.getIsnewproduct());
            pst.setString(6,pro.getPrice1());
            pst.setString(7,pro.getPrice2());
            pst.setString(8,pro.getRealstock());
            pst.setString(9,pro.getStock());
            pst.setString(10,pro.getCas());
            pst.setString(11,pro.getMdlint());
            pst.setString(12,pro.getFormula());
            pst.setString(13,pro.getWeight());
            pst.setString(14,pro.getNote());
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

    //查询所有商品
    public static List<Product> selectAllPro(int page){
        String sql = "select * from product where state=0 order by id limit ?,?";
        conn = com.zou.dao.db.getConnection();
        List list = new ArrayList<Product>();
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1,(page-1)*6);
            pst.setInt(2,6);
            rs = pst.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.serId(rs.getInt(1));
                p.setProductnum(rs.getString(2));
                p.setProductname(rs.getString(3));
                p.setCatrgoryno(rs.getString(4));
                p.setCategory(rs.getString(5));
                p.setImagepath(rs.getString(6));
                p.setIsnewproduct(rs.getString(7));
                p.setPrice1(rs.getString(8));
                p.setPrice2(rs.getString(9));
                p.setRealstock(rs.getString(10));
                p.setStock(rs.getString(11));
                p.setCas(rs.getString(12));
                p.setMdlint(rs.getString(13));
                p.setFormula(rs.getString(14));
                p.setWeight(rs.getString(15));
                p.setState(rs.getString(16));
                p.setNote(rs.getString(17));
                list.add(p);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        return list;
    }

    //商品ID查询
    public static ShopCar selectProById(int id){
        String sql = "select * from product where id = ?";
        conn = com.zou.dao.db.getConnection();
        ShopCar sc = new ShopCar();
        try {
            pst = conn.prepareStatement(sql);
            pst.setInt(1,id);
            rs = pst.executeQuery();
            while (rs.next()){
                sc.setId(id);
                sc.setName(rs.getString(3));
                sc.setPrice(Double.parseDouble(rs.getString(8)));
                sc.setPronum(rs.getString(2));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        return sc;
    }

    //商品名查询
    public static List<Product> selectProByName(String productname){
        String sql = "select * from product where productname = ? and state=0 ";
        conn = com.zou.dao.db.getConnection();
        List list = new ArrayList<Product>();
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1,productname);
            rs = pst.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.serId(rs.getInt(1));
                p.setProductnum(rs.getString(2));
                p.setProductname(rs.getString(3));
                p.setCatrgoryno(rs.getString(4));
                p.setCategory(rs.getString(5));
                p.setImagepath(rs.getString(6));
                p.setIsnewproduct(rs.getString(7));
                p.setPrice1(rs.getString(8));
                p.setPrice2(rs.getString(9));
                p.setRealstock(rs.getString(10));
                p.setStock(rs.getString(11));
                p.setCas(rs.getString(12));
                p.setMdlint(rs.getString(13));
                p.setFormula(rs.getString(14));
                p.setWeight(rs.getString(15));
                p.setState(rs.getString(16));
                p.setNote(rs.getString(17));
                list.add(p);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        return list;
    }

    //商品类别查询
    public static List<Product> selectProBytype(int page,String category){
        String sql = "select * from product where category=? and state=0 order by id limit ?,?";
        conn = com.zou.dao.db.getConnection();
        List list = new ArrayList<Product>();
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1,category);
            pst.setInt(2,(page-1)*6);
            pst.setInt(3,6);
            rs = pst.executeQuery();
            while(rs.next()){
                Product p = new Product();
                p.serId(rs.getInt(1));
                p.setProductnum(rs.getString(2));
                p.setProductname(rs.getString(3));
                p.setCatrgoryno(rs.getString(4));
                p.setCategory(rs.getString(5));
                p.setImagepath(rs.getString(6));
                p.setIsnewproduct(rs.getString(7));
                p.setPrice1(rs.getString(8));
                p.setPrice2(rs.getString(9));
                p.setRealstock(rs.getString(10));
                p.setStock(rs.getString(11));
                p.setCas(rs.getString(12));
                p.setMdlint(rs.getString(13));
                p.setFormula(rs.getString(14));
                p.setWeight(rs.getString(15));
                p.setState(rs.getString(16));
                p.setNote(rs.getString(17));
                list.add(p);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        return list;
    }

    //删除商品
    public static boolean DeletePro(int id) {
        // TODO Auto-generated method stub
        String sql = "update product set state=1 where id=?";
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

    //修改商品
    public static boolean UpdatePro(Product pro){
        String sql = "update product set productnum=?,catrgoryno=?,category=?,price1=?,price2=?," +
                "realstock=?,stock=?,cas=?,mdlint=?,formula=?,weight=?,note=? where productname = ?";
        conn = com.zou.dao.db.getConnection();
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1,pro.getProductnum());
            //pst.setString(2,pro.getProductname());
            pst.setString(2,pro.getCatrgoryno());
            pst.setString(3,pro.getCategory());
            pst.setString(4,pro.getPrice1());
            pst.setString(5,pro.getPrice2());
            pst.setString(6,pro.getRealstock());
            pst.setString(7,pro.getStock());
            pst.setString(8,pro.getCas());
            pst.setString(9,pro.getMdlint());
            pst.setString(10,pro.getFormula());
            pst.setString(11,pro.getWeight());
            pst.setString(12,pro.getNote());
            pst.setString(13,pro.getProductname());
            //System.out.println(pst);
            int row = pst.executeUpdate();
            if (row>0){
                flag = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst);
        }
        return flag;
    }

    //修改商品重量
    public static void updateStock(int many,int id){
        String sql_1 = "select stock from product where id=?";
        String sql_2 = "update product set stock=? where id=?";
        conn = com.zou.dao.db.getConnection();
        PreparedStatement pst_1 = null;
        PreparedStatement pst_2 = null;
        try{
            pst_1 = conn.prepareStatement(sql_1);
            pst_1.setInt(1,id);
            rs = pst_1.executeQuery();
            if (rs.next()){
                int stock = Integer.parseInt(rs.getString(1))-many;
                pst_2 = conn.prepareStatement(sql_2);
                pst_2.setInt(1,stock);
                pst_2.setInt(2,id);
                int row = pst_2.executeUpdate();
                if (row>0)
                    System.out.println("sucess");
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            com.zou.dao.db.close(conn,pst_2);
            com.zou.dao.db.close(conn,pst_1);
        }
    }

    //商品记录,分页要用
    public static int getCountPro(){
        int count = 0;
        String sql= "select count(*) from product where state=0";
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
