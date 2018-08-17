package com.zou.servlet;

import com.zou.model.Order;
import com.zou.model.ShopCar;
import com.zou.service.OrderManage;
import com.zou.service.ProductManage;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class OrderServlet extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ArrayList buylist = (ArrayList)session.getAttribute("buylist");     //获取购物车内商品信息
        String total = (String)session.getAttribute("total");               //获取支付金额
        int uid = Integer.valueOf(session.getAttribute("id").toString());   //获取用户id
        String date = (String)session.getAttribute("time");                 //获取下单时间
        String address = request.getParameter("address");                   //获取收货地址
        Order order = new Order();
        JSONObject data = new JSONObject(); //定义json对象
        boolean flag = false;
        if (buylist==null){
            data.put("mess","购物车内无商品!");
            data.put("flag",1);
            //response.sendRedirect("ShopServlet?pageNow=1&proName&proCategory");
            response.getWriter().print(data);
        }else {
            for(int i=0;i<buylist.size();i++){
                ShopCar sc=(ShopCar)buylist.get(i);
                order.setOrdernum(String.valueOf(uid)+date);
                order.setUid(uid);
                order.setCreatetime(date);
                order.setProid(sc.getId());
                order.setTotal(total);
                order.setQuantity(String.valueOf(sc.getMany()));
                order.setAddress(address);
                flag = OrderManage.AddOrder(order);
                ProductManage.updateStock(sc.getMany(),sc.getId());
            }
        }
        if (flag) {
            buylist.clear();
            data.put("mess","下单成功!");
            data.put("flag",0);
            response.getWriter().print(data);

            //response.sendRedirect("ShopServlet?pageNow=1&proName&proCategory");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }
}
