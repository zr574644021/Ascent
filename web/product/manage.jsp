<%--
  Created by IntelliJ IDEA.
  User: 82070
  Date: 2017/12/12
  Time: 8:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取保存在session范围内的用户昵称
    String username=(String)session.getAttribute("username");
    String email=(String)session.getAttribute("email");
%>
<html>
<head>
    <title>后台管理系统</title>
    <link rel="stylesheet" id="styles" type="text/css" href="../css/index.css" media="screen,projection">
</head>
<body>
<div id="container">
    <div id="header">
    </div>
    <div id="navigation">
        <ul>
            <li><a class="lin" href="../exit.jsp">首页</a></li>
            <li><a class="lin" href="itservice.html">IT服务</a></li>
            <li><a class="lin" href="../exit.jsp">医药商城</a></li>
            <li><a class="lin" href="employee.html">员工招聘</a></li>
            <li><a class="lin" href="ContactUs.html">关于我们</a></li>
        </ul>
    </div>
    <div style="margin:10px;position: absolute">当前位置->医药商务系统后台</div>
    <div id="left">
        <ul>
            <li><P>欢迎您！<%=username%></P></li>
            <li><P>邮箱：<%=email%></P></li>
            <li>
                <a href="../exit.jsp"><font color="#b22222" >[注销]</font></a>
                <a href="exit.jsp"><font color="#b22222" >[修改密码]</font></a>
            </li>
        </ul>
    </div>
    <div id="right">
        <ul>
            <li><input type="image" src="../images/userlist.jpg" onclick="window.location.href='/UserServlet?pageNow=1&userName'"></li>
            <li><input type="image" src="../images/productslist.jpg" onclick="window.location.href='/ProductServlet?pageNow=1&proName&proCategory'"></li>
            <li><input type="image" src="../images/ShowOrders.jpg" onclick="window.location.href='/OrderManageServlet?pagenow=1&ornum&uid'"></li>
        </ul>
    </div>
    <hr style="height:5px;border:none;border-top:5px ridge #467ba7;margin-top: 140px" />
</div>
<div id="footer">
    <p><a class="lin" href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司&copy;2004-2008|京ICP备05005681</a></p>
</div>
</body>
</html>
