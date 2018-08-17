<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mess = (String)session.getAttribute("mess");
%>
<html>
<head>
    <title>AscentSys医药商务系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="description" content="Your website description goes here"/>
    <meta name="keywords" content="your,keywords,goes,here"/>
    <link rel="stylesheet" id="styles" type="text/css" href="css/index.css" media="screen,projection">
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script language="javascript">
        function check(node){
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var password2 = document.getElementById("password2").value;
            var fullname = document.getElementById("fullname").value;
            var tel = document.getElementById("tel").value;
            var email = document.getElementById("email").value;
            //console.log()
            if(username==""){
                alert("用户名不能为空!");
                //username.focus();
                return false;
            }
            if(password==""){
                alert("请输入密码!");
                //password.focus();
                return false;
            }
            if(password2==""){
                alert("请再次输入密码!");
                //password2.focus();
                return false;
            }
            if (password!=password2) {
                alert("两次输入密码不一致!");
                //console.log(password);
                //console.log(password2);
                //password2.focus();
                return false;
            }
            if (email=="") {
                alert("请输入邮件!");
                //email.focus();
                return false;
            }
            $.ajax({
                url:'http://localhost:8080/RegisterServlet',
                data:{
                    username : username,
                    password : password,
                    fullname : fullname,
                    tel : tel,
                    email : email
                },
                methods:'POST',
                success:function(data) {
                    var d = data;
                    if (d=="true") {
                        alert("注册成功！");
                        window.location.href = "http://localhost:8080/index.jsp";
                    }else {
                        alert("用户名已存在！");
                        window.location.href = "http://localhost:8080/register.jsp";
                    }
                }
            });
            /*var regm = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            if(form.email.value != "" && form.email.value.match(regm)){
                alert("邮件格式不对，检查后请重新输入！");
                form.email.focus();
                return false
            }*/
        }
    </script>
</head>
<body>
<div id="container">
    <div id="header">
    </div>
    <div id="navigation">
        <ul>
            <li><a class="lin" href="index.jsp">首页</a></li>
            <li><a class="lin" href="product/itservice.html">IT服务</a></li>
            <li><a class="lin" href="product/products.html">医药商城</a></li>
            <li><a class="lin" href="product/employee.html">员工招聘</a></li>
            <li><a class="lin" href="product/ContactUs.html">关于我们</a></li>
        </ul>
    </div>
    <div id="cent">
        <%--<form name="form" action="RegisterServlet" method="post">--%>
            <table width="50%" class="mars" cellspacing="1" cellpadding="0" width="100%" border="0">
                <tbody>
                <tr>
                    <td class="item" width="41%">
                        <div align="right">用户名:</div>
                    </td>
                    <td width="7%"></td>
                    <td width="52%">
                        <input type="text" name="username" id="username">&nbsp;&nbsp;
                        <font color="red">*</font>
                        <div id="usernameCheckDiv" class="warning"></div>
                    </td>
                </tr>
                <tr>
                    <td class="item">
                        <div align="right">密码:</div>
                    </td>
                    <td width="7%"></td>
                    <td>
                        <input type="password" name="password" id="password">&nbsp;&nbsp;
                        <font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td class="item">
                        <div align="right">密码确认:</div>
                    </td>
                    <td width="7%"></td>
                    <td>
                        <input type="password" name="password2" id="password2">&nbsp;&nbsp;
                        <font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td class="item">
                        <div align="right">昵称:</div>
                    </td>
                    <td width="7%"></td>
                    <td>
                        <input type="text" name="fullname" id="fullname">
                    </td>
                </tr>
                <tr>
                    <td class="item">
                        <div align="right">电话:</div>
                    </td>
                    <td width="7%"></td>
                    <td>
                        <input type="text" name="tel" id="tel">
                    </td>
                </tr>
                <tr>
                    <td class="item">
                        <div align="right">Email:</div>
                    </td>
                    <td width="7%"></td>
                    <td>
                        <input type="text" name="email" id="email">&nbsp;&nbsp;
                        <font color="red">*</font>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input type="submit" value="注册"  name="<%=mess%>" onclick="check(this)">
                        <button type="button" onclick="window.location.href='index.jsp'">取消</button>
                    </td>
                </tr>
                </tbody>
            </table>
        <%--</form>--%>
    </div>
    <div id="footer">
        <p><a class="lin" href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司&copy;2004-2008|京ICP备05005681</a></p>
    </div>
</div>
<script src="./js/jquery-3.2.1.min.js"></script>
<script language="javascript">
    function check(node){
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;
        var fullname = document.getElementById("fullname").value;
        var tel = document.getElementById("tel").value;
        var email = document.getElementById("email").value;
        //console.log()
        if(username==""){
            alert("用户名不能为空!");
            //username.focus();
            return false;
        }
        if(password==""){
            alert("请输入密码!");
            //password.focus();
            return false;
        }
        if(password2==""){
            alert("请再次输入密码!");
            //password2.focus();
            return false;
        }
        if (password!=password2) {
            alert("两次输入密码不一致!");
            //console.log(password);
            //console.log(password2);
            //password2.focus();
            return false;
        }
        if (email=="") {
            alert("请输入邮件!");
            //email.focus();
            return false;
        }
        $.ajax({
            url:'http://localhost:8080/RegisterServlet',
            data:{
                username : username,
                password : password,
                fullname : fullname,
                tel : tel,
                email : email
            },
            methods:'POST',
            success:function(data) {
                var d = data;
                if (d=="true") {
                    alert("注册成功！");
                    window.location.href = "http://localhost:8080/index.jsp";
                }else {
                    alert("用户名已存在！");
                    window.location.href = "http://localhost:8080/register.jsp";
                }
            }
        });
        /*var regm = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
        if(form.email.value != "" && form.email.value.match(regm)){
            alert("邮件格式不对，检查后请重新输入！");
            form.email.focus();
            return false
        }*/
    }
</script>
</body>
</html>
