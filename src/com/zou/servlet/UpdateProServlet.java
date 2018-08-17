package com.zou.servlet;

import com.zou.model.Product;
import com.zou.service.ProductManage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class UpdateProServlet extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        Product pr = new Product();
        //System.out.println(111);
        //pr.serId(Integer.parseInt(request.getParameter("id")));
        pr.setProductnum(request.getParameter("pronum"));
        pr.setProductname(request.getParameter("proname"));
        pr.setCatrgoryno(request.getParameter("typenum"));
        pr.setCategory(request.getParameter("type"));
        pr.setPrice1(request.getParameter("price1"));
        pr.setPrice2(request.getParameter("price2"));
        pr.setRealstock(request.getParameter("realstock"));
        pr.setStock(request.getParameter("stock"));
        pr.setCas(request.getParameter("cas"));
        pr.setMdlint(request.getParameter("mdlint"));
        pr.setFormula(request.getParameter("formula"));
        pr.setWeight(request.getParameter("weight"));
        pr.setNote(request.getParameter("note"));
        List<Product> list = new ArrayList<Product>();
        System.out.println(1+pr.getWeight());
        System.out.println(2+pr.getFormula());
        //String a[] = pr;
        if (!pr.getProductname().equals("")&&pr.getProductnum().equals("")&&pr.getCatrgoryno().equals("")
                &&pr.getCategory().equals("") &&pr.getRealstock().equals("")&&pr.getStock().equals("")
                &&pr.getCas().equals("")&&pr.getFormula().equals("")&&pr.getWeight().equals("")&&pr.getNote().equals("")){
            list = ProductManage.selectProByName(pr.getProductname());
            //System.out.println(list);
            request.setAttribute("list",list);
            request.getRequestDispatcher("product/update_product.jsp").forward(request, response);
        }else {
            boolean flag = ProductManage.UpdatePro(pr);
            if (flag){
                response.getWriter().print(true);
            }else {
                response.getWriter().print(false);
            }
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }
}
