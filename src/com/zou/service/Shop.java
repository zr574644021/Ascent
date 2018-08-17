package com.zou.service;

import com.zou.model.ShopCar;

import java.util.ArrayList;


public class Shop {
    private ArrayList buylist=new ArrayList();						//用来存储购买的商品
    public void setBuylist(ArrayList buylist) {
        this.buylist = buylist;
    }

    //向购物车中添加商品
    public void addItem(ShopCar sc){
        if(sc!=null){
            if(buylist.size()==0){									//如果buylist中不存在任何商品
                ShopCar temp=new ShopCar();
                temp.setId(sc.getId());
                temp.setPronum(sc.getPronum());
                temp.setName(sc.getName());
                temp.setPrice(sc.getPrice());
                temp.setMany(sc.getMany());
                buylist.add(temp);                                  //存储商品
                //System.out.println(1);
            }
            else{													//如果buylist中存在商品
                int i=0;
                for(;i<buylist.size();i++){							//遍历buylist集合对象，判断该集合中是否已经存在当前要添加的商品
                    ShopCar temp=(ShopCar)buylist.get(i);			//获取buylist集合中当前元素
                    if(temp.getName().equals(sc.getName())){		//判断从buylist集合中获取的当前商品的名称是否与要添加的商品的名称相同
                        //如果相同，说明已经购买了该商品
                        //System.out.println(2);
                        temp.setMany(temp.getMany()+sc.getMany());  //将商品购买数量相加
                        break;										//结束for循环
                    }
                }
                if(i>=buylist.size()){								//说明buylist中不存在要添加的商品
                    //System.out.println(i);
                    ShopCar temp=new ShopCar();
                    temp.setId(sc.getId());
                    temp.setPronum(sc.getPronum());
                    temp.setName(sc.getName());
                    temp.setPrice(sc.getPrice());
                    temp.setMany(sc.getMany());
                    buylist.add(temp);
                    //System.out.println(3);
                }
            }
        }
    }

    //从购物车中移除指定名称的商品
    public void removeItem(String name){
        for(int i=0;i<buylist.size();i++){							//遍历buylist集合，查找指定名称的商品
            ShopCar temp=(ShopCar)buylist.get(i);   		        //获取集合中当前位置的商品
            if(temp.getName().equals(name)){						//如果商品的名称为name参数指定的名称
                buylist.remove(i);                                  //从buylist集合对象中移除该商品
                //System.out.println(4);
                break;
            }
        }
    }
}
