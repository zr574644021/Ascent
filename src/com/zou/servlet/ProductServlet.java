package com.zou.servlet;

import com.zou.dao.PageUtil;
import com.zou.model.Product;
import com.zou.service.ProductManage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ProductServlet extends HttpServlet{

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/json");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        int pageNow = Integer.parseInt(request.getParameter("pageNow"));
        String proName = request.getParameter("proName");
        String proCategory = request.getParameter("proCategory");
        List<Product> list = null;
        StringBuffer sb = new StringBuffer();       // 实例化StringBuffer
        int count = ProductManage.getCountPro();	//获取数据库总记录数
        int pa = PageUtil.getPages(count);//获取总页数
        if(!proName.equals("")&&proCategory.equals("")){
            list = ProductManage.selectProByName(proName);
        }else if (proName.equals("")&&!proCategory.equals("")){
            list = ProductManage.selectProBytype(pageNow,proCategory);
            for(int i=1; i <= pa; i++){			// 通过循环构建分页导航条
                if(i == pageNow){ 						// 判断是否为当前页
                    sb.append("『" + i + "』");			// 构建分页导航条
                }else{
                    // 构建分页导航条
                    sb.append("<a href='ProductServlet?pageNow=" + i + "&proName&proCategory="+ proCategory +"'>" + i + "</a>");
                }
                sb.append("　");									// 构建分页导航条
            }
        }else if (pageNow>0&&proName.equals("")&&proCategory.equals("")){//判断传递页码是否有效
                list = ProductManage.selectAllPro(pageNow);
            for(int i=1; i <= pa; i++){			// 通过循环构建分页导航条
                if(i == pageNow){ 						// 判断是否为当前页
                    sb.append("『" + i + "』");			// 构建分页导航条
                }else{
                    // 构建分页导航条
                    sb.append("<a href='ProductServlet?pageNow=" + i + "&proName&proCategory'>" + i + "</a>");
                }
                sb.append("　");									// 构建分页导航条
            }
        }
        request.setAttribute("bar", sb.toString());	// 将分页导航条的字符串放置到request中
        request.setAttribute("list",list);
        request.getRequestDispatcher("product/manage_product.jsp").forward(request, response);
    }
}
