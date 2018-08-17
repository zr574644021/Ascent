package com.zou.servlet;


import com.zou.model.Product;
import com.zou.service.ProductManage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class AddProServlet extends HttpServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product pr = new Product();
        pr.setProductnum(request.getParameter("pronum"));
        pr.setProductname(request.getParameter("proname"));
        pr.setCatrgoryno(request.getParameter("typenum"));
        pr.setCategory(request.getParameter("type"));
        pr.setPrice1(request.getParameter("price1"));
        pr.setPrice2(request.getParameter("price2"));
        pr.setRealstock(request.getParameter("realstock"));
        pr.setStock(request.getParameter("stock"));
        pr.setCas(request.getParameter("cas"));
        pr.setFormula(request.getParameter("formula"));
        pr.setMdlint(request.getParameter("mdlint"));
        pr.setWeight(request.getParameter("weight"));
        pr.setNote(request.getParameter("note"));
        pr.setIsnewproduct(request.getParameter("pronew"));
        System.out.println(1);
        List<Product> flag = ProductManage.selectProByName(pr.getProductname());

        if (null != flag || flag.size() > 0){
            System.out.println(2);
            boolean fl = ProductManage.addProduct(pr);
            if (fl){
                response.getWriter().print(true);
                System.out.println(3);
            }else {
                response.getWriter().print(false);
                System.out.println(4);
            }
        }else {
            response.getWriter().print("have");
            System.out.println(5);
        }
        //request.getRequestDispatcher("product/manage_user.jsp").forward(request, response);
    }
}
