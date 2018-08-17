package com.zou.model;

public class ShopCar {
    private int id;
    private String name;        //商品名字
    private String pronum;      //商品编号
    private String address;     //收货地址
    private double price;       //商品价格
    private double allprice;    //支付金额
    private int many;           //商品数量

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getMany() {
        return many;
    }

    public void setMany(int many) {
        this.many = many;
    }

    public String getPronum() {
        return pronum;
    }

    public void setPronum(String pronum) {
        this.pronum = pronum;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getAllprice() {
        return allprice;
    }

    public void setAllprice(double allprice) {
        this.allprice = allprice;
    }
}
