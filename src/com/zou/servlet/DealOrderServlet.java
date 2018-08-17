package com.zou.servlet;

import com.zou.model.Order;
import com.zou.service.OrderManage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DealOrderServlet extends HttpServlet{

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");	//获取action参数值
        if(action==null)
            action="";
        if(action.equals("dele"))					//触发了“删除”请求
            dele(request,response);					//调用dele()方法实现订单删除
        if(action.equals("sure"))					//触发了“确认”请求
            sure(request,response);					//调用sure()方法实现订单确认
        if(action.equals("item"))                   //触发“明细”请求
            item(request,response);                 //调用item()方法实现订单明细
    }

    public void dele(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session=request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        boolean flag = OrderManage.DeleteOrder(id);
        if (flag){
            response.getWriter().print("true");
        }else {
            response.getWriter().print("false");
        }
    }

    public void sure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session=request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        boolean flag = OrderManage.DellOrder(id);
        if (flag){
            response.getWriter().print("true");
        }else {
            response.getWriter().print("false");
        }
    }

    public void item(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session=request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        List<Order> list = OrderManage.OrderItem(id);
        //System.out.println("12"+list);
        if (list==null){
            response.sendRedirect("../index.jsp");
        } else {
            session.setAttribute("item",list);
            request.getRequestDispatcher("product/orderitem.jsp").forward(request, response);
        }

    }
}
