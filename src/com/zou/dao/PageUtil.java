package com.zou.dao;

public class PageUtil {
    public static final int PAGE_SIZE = 6; 	// 每页记录数

    public static int getPages(int count){
        int pages; //总页数
        //int count = UserManage.getCountUser();
        if(count % PAGE_SIZE == 0){//对总页数赋值
            pages = count/PAGE_SIZE;
        }else {
            pages = count/PAGE_SIZE+1;
        }
        return pages;
    }
}
