package com.zou.servlet;

import com.zou.dao.PageUtil;
import com.zou.model.User;
import com.zou.service.UserManage;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int pageNow = Integer.parseInt(request.getParameter("pageNow"));
        String userName = request.getParameter("userName");
        //JSONArray json = null;//初始化json数据
        List<User> list = null;//初始化list
        if (!userName.equals("")){//判断是否接收到用户名，根据用户名进行查询
            list = UserManage.SelectByName(userName);
            request.setAttribute("bar", "『1』");
            /*JSONArray json = JSONArray.fromObject(list);
            response.getWriter().print(json);*/
        }else {
            if(pageNow>0){//判断传递页码是否有效
                list = UserManage.SelectAll(pageNow);
                //json = JSONArray.fromObject(list);
            }
            StringBuffer sb = new StringBuffer();       // 实例化StringBuffer
            int count = UserManage.getCountUser();	//获取数据库总记录数
            int pa = PageUtil.getPages(count);//获取总页数
            for(int i=1; i <= pa; i++){			// 通过循环构建分页导航条
                if(i == pageNow){ 						// 判断是否为当前页
                    sb.append("『" + i + "』");			// 构建分页导航条
                }else{
                    // 构建分页导航条
                    sb.append("<a href='UserServlet?pageNow=" + i + "&userName'>" + i + "</a>");
                }
                sb.append("　");									// 构建分页导航条
            }
            request.setAttribute("bar", sb.toString());	// 将分页导航条的字符串放置到request中
        }
        //response.getWriter().print(json);
        // 转发到manage_user.jsp页面
        request.setAttribute("list",list);
        request.getRequestDispatcher("product/manage_user.jsp").forward(request, response);
    }
}
