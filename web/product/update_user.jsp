<%@ page import="java.util.List" %>
<%@ page import="com.zou.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取保存在session范围内的用户
    String user=(String)session.getAttribute("username");
    String email=(String)session.getAttribute("email");
%>
<html>
<head>
    <title>Title</title>
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
    <div style="margin:10px;position: absolute">当前位置->医药商务系统后台->用户信息修改</div>
    <div id="left">
        <ul>
            <li><P>欢迎您！<%=user%></P></li>
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
    <div>
        <table width="20%" class="mars" align="center" cellspacing="1" cellpadding="0" width="100%" border="0">
            <tbody>
            <%
                List<User> list = (List<User>) request.getAttribute("list");
                if (list == null || list.size() < 1) {
                    out.print("<tr><td bgcolor='#FFFFFF' align='center'>用户信息出错！</td></tr>");
                }else {
                    for (User us : list){
            %>
            <td class="item" width="41%">
                <div align="right">ID:</div>
            </td>
            <td width="52%">
                <input type="text" value="<%=us.getId()%>" name="uid" id="uid" readonly="readonly">&nbsp;&nbsp;
                <font color="red">*</font>
            </td>
            </tr>
            <tr>
                <td class="item" width="41%">
                    <div align="right">用户名:</div>
                </td>
                <td width="52%">
                    <input type="text" value="<%=us.getUsername()%>" name="username" id="username" readonly="readonly">&nbsp;&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td class="item" width="41%">
                    <div align="right">昵称:</div>
                </td>
                <td width="52%">
                    <input type="text" value="<%=us.getFullname()%>" name="fullname" id="fullname">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">电话:</div>
                </td>
                <td>
                    <input type="text" value="<%=us.getTel()%>" name="tel" id="tel">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">邮箱:</div>
                </td>
                <td>
                    <input type="text" value="<%=us.getEmail()%>" name="email" id="email">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <br>
                    <button type="button" onclick="update()">修改</button>
                    <button type="button" onclick="location.href='../UserServlet?pageNow=1&userName'">返回</button>
                </td>
            </tr>
            <%
                    }
                }

            %>
            </tbody>
        </table>
    </div>
</div>
<div id="footer">
    <p><a class="lin" href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司&copy;2004-2008|京ICP备05005681</a></p>
</div>
<script src="../js/jquery-3.2.1.min.js"></script>
<script language="javascript">
    function update() {
        //var id = parseInt(document.getElementById("uid"));
        var username = document.getElementById("username").value;
        var fullname = document.getElementById("fullname").value;
        var tel = document.getElementById("tel").value;
        var email = document.getElementById("email").value;
        $.ajax({
            url:'http://localhost:8080/UpdateUserServlet',
            data:{
                username : username,
                fullname : fullname,
                tel : tel,
                email : email
            },
            methods:'POST',
            success:function (data) {
                var flag = data;
                console.log(data);
                console.log(flag);
                //console.log(flag);
                if (flag=="true"){
                    alert("修改用户成功！");
                    window.location.href="http://localhost:8080/UserServlet?pageNow=1&userName="+ username +"";
                }else {
                    alert("修改用户失败!");
                    window.location.href="http://localhost:8080/UserServlet?pageNow=1&userName";
                }
            }
        });
    }
</script>
</body>
</html>
