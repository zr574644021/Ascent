<%--
  Created by IntelliJ IDEA.
  User: 82070
  Date: 2017/12/12
  Time: 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();//销毁session
    response.sendRedirect("index.jsp");//重定向页面到index.jsp
%>
