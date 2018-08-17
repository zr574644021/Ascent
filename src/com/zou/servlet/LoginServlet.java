package com.zou.servlet;

import com.zou.model.User;
import com.zou.service.UserManage;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class LoginServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        //字符串转换
        String userName = request.getParameter("username");
        String passWord = request.getParameter("password");
        User user = UserManage.Login(userName,passWord);
        JSONObject data = new JSONObject();
        if (user!=null){
            request.getSession().setAttribute("id",user.getId());
            request.getSession().setAttribute("username",userName);
            request.getSession().setAttribute("email",user.getEmail());
            request.getSession().setAttribute("ident",user.getIdentify());
            request.getSession().setAttribute("pass",user.getPassword());
            switch (user.getIdentify()){//状态码200：成功，400：失败，返回data数据，在前端转换成json格式
                case "1":
                    //System.out.println(1);
                    data.put("state","200");
                    data.put("user",user.getUsername());
                    data.put("identify",user.getIdentify());
                    data.put("email",user.getEmail());
                    response.getWriter().print(data);

                    break;
                case "2":
                    data.put("state","200");
                    data.put("user",user.getUsername());
                    data.put("identify",user.getIdentify());
                    data.put("url","http://localhost:8080/product/manage.jsp");
                    response.getWriter().print(data);
                    break;
                case "3":
                    data.put("state","200");
                    data.put("user",user.getUsername());
                    data.put("identify",user.getIdentify());
                    data.put("url","http://localhost:8080/product/manage.jsp");
                    response.getWriter().print(data);
                    break;
            }
        }else {
            data.put("state","400");
            data.put("mess","用户名或密码错误");
            response.getWriter().print(data);
        }
    }
}
