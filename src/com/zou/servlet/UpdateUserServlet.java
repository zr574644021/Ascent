package com.zou.servlet;

import com.zou.model.User;
import com.zou.service.UserManage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class UpdateUserServlet extends HttpServlet{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        //int id = Integer.parseInt(request.getParameter("uid"));
        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        List<User> list = new ArrayList<User>();
        if (!username.equals("")&&fullname.equals("")&&tel.equals("")&&email.equals("")){
            list = UserManage.SelectByName(username);
            request.setAttribute("list",list);
            request.getRequestDispatcher("product/update_user.jsp").forward(request, response);
        }else {
            boolean flag = UserManage.UpdateUser(fullname,tel,email,username);
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
