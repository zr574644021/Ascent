package com.zou.servlet;

import com.zou.model.User;
import com.zou.service.UserManage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        //System.out.println(1111);
        User user = new User(0,username,password,fullname,tel,email,"1","0");
        //System.out.println(2222);
        boolean flag1 = UserManage.CheckByName(username);
        System.out.println("falg:"+flag1);
        if (!flag1){
            boolean flag2 = UserManage.Register(user);
            if (flag2){
                response.getWriter().print(true);
                //request.getRequestDispatcher("index.jsp").forward(request,response);
            }
        }else{
            response.getWriter().print(false);
            //request.getRequestDispatcher("register.jsp").forward(request,response);
        }
    }
}
