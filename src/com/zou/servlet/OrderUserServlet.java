package com.zou.servlet;

import com.zou.dao.PageUtil;
import com.zou.model.Order;
import com.zou.service.OrderManage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderUserServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        int pagenow = Integer.parseInt(request.getParameter("pagenow"));
        String ornum = request.getParameter("ornum");
        //System.out.println(ornum);
        int uid = Integer.valueOf(request.getSession().getAttribute("id").toString());
        List<Order> list = null;
        StringBuffer sb = new StringBuffer();       // 实例化StringBuffer
        int count = OrderManage.getCountOrder();
        int pa = PageUtil.getPages(count);
        if(!ornum.equals("")) list = OrderManage.SelectOrByornum(ornum);
        else {
            list = OrderManage.SelectOrByUid(uid);
            for (int i = 1; i <= pa; i++) {            // 通过循环构建分页导航条
                if (i == pagenow) {                        // 判断是否为当前页
                    sb.append("『" + i + "』");            // 构建分页导航条
                } else {
                    // 构建分页导航条
                    sb.append("<a href='OrderUserServlet?pagenow=" + i + "&ornum&'>" + i + "</a>");
                }
                sb.append("　");                                    // 构建分页导航条
            }
        }
        request.setAttribute("bar", sb.toString());	// 将分页导航条的字符串放置到request中
        request.setAttribute("list",list);
        request.getRequestDispatcher("product/user_order.jsp").forward(request, response);
    }
}
