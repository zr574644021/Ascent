package com.zou.servlet;

import com.zou.service.UserManage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UpPassServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String password = request.getParameter("oldpass");
        System.out.println(password);
        String newpass = request.getParameter("newpass");

        boolean flag = UserManage.UpdatePass(username,newpass,password);
        if (flag){
            response.getWriter().print(true);
        }else {
            response.getWriter().print(false);
        }
    }
}
