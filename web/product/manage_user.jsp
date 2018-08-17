<%@ page import="com.zou.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取保存在session范围内的用户
    String user=(String)session.getAttribute("username");
    String email=(String)session.getAttribute("email");
%>
<html>
<head>
    <title>用户管理</title>
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
    <div style="margin:10px;position: absolute">当前位置->医药商务系统后台->用户管理</div>
    <div id="left">
        <ul>
            <li><P>欢迎您！<%=user%></P></li>
            <li><P>邮箱：<%=email%></P></li>
            <li>
                <a href="../exit.jsp"><font color="#b22222" >[注销]</font></a>
                <a href="exit.jsp"><font color="#b22222" >[修改密码]</font></a>
            </li>
        </ul>
        </ul>
    </div>
    <div id="right">
        <ul>
            <li><input type="image" src="../images/userlist.jpg" onclick="window.location.href='UserServlet?pageNow=1&userName'"></li>
            <li><input type="image" src="../images/productslist.jpg" onclick="window.location.href='ProductServlet?pageNow=1&proName&proCategory'"></li>
            <li><input type="image" src="../images/ShowOrders.jpg" onclick="window.location.href='OrderManageServlet?pagenow=1&ornum&uid'"></li>
        </ul>
    </div>
    <hr style="height:5px;border:none;border-top:5px ridge #467ba7;margin-top: 140px" />
    <div>
        <h3 align="center">用户信息</h3>
        <table width="70%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#666666">
            <tr align="center">
                <th bgcolor="#FFFFFF">ID</th>
                <th bgcolor="#FFFFFF">用户名</th>
                <th bgcolor="#FFFFFF">昵称</th>
                <th bgcolor="#FFFFFF">电话</th>
                <th bgcolor="#FFFFFF">邮箱</th>
                <th bgcolor="#FFFFFF">身份</th>
                <th bgcolor="#FFFFFF">修改</th>
                <th bgcolor="#FFFFFF">删除</th>
            </tr>
            <%
                // 获取信息集合
                List<User> list = (List<User>) request.getAttribute("list");
                // 判断集合是否有效
                if (list == null || list.size() < 1) {
                    out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何用户信息！</td></tr>");
                } else {
                    // 遍历集合中的数据
                    for (User us : list) {
            %>
            <tr align="center">
                <td bgcolor="#FFFFFF" ><%=us.getId()%></td>
                <td bgcolor="#FFFFFF"><%=us.getUsername()%></td>
                <td bgcolor="#FFFFFF"><%=us.getFullname()%></td>
                <td bgcolor="#FFFFFF"><%=us.getTel()%></td>
                <td bgcolor="#FFFFFF"><%=us.getEmail()%></td>
                <td bgcolor="#FFFFFF"><%=us.getIdentify()%></td>
                <td bgcolor="#FFFFFF"><a style="color: crimson" href="UpdateUserServlet?username=<%=us.getUsername()%>&fullname&tel&email" >修改</a></td>
                <td bgcolor="#FFFFFF"><a style="color: crimson" name="<%=us.getId()%>" href="#" onclick="deleteuser(this)" >删除</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <div width="98%" align="center" style="padding-top:10px;">
            <%=request.getAttribute("bar")%>
        </div>
        <div>
            <table width="15%" align="center">
                <tr>
                    <td><p>查询用户名：</p></td>
                    <td><input type="text" name="username" id="username" size="8" >
                        &nbsp;&nbsp;
                        <button type="button" onclick="findName()">查询</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div id="footer">
    <p><a class="lin" href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司&copy;2004-2008|京ICP备05005681</a></p>
</div>
<script src="../js/jquery-3.2.1.min.js"></script>
<script language="javascript">
    function findName() {
        var username = document.getElementById("username").value;
        $.ajax({
            url:'http://localhost:8080/UserServlet',
            data:{
                pageNow : 1,
                userName : username
            },
            methods:'POST',
            success:function (data) {
                window.location.href="http://localhost:8080/UserServlet?pageNow=1&userName="+ username +"";
            }
        });
    }
    
    function deleteuser(node) {
        var uid = node.getAttribute('name');//获取a标签的name属性值
        //console.log(uid);
        $.ajax({
           url:'http://localhost:8080/DeUserServlet',
           data:{
               id : uid
           },
           methods:'POST',
           success:function (data) {
               //console.log(data);
               //var da = JSON.parse(data);
               var flag = data;
               //console.log(flag);
               if (flag=="true"){
                   alert("删除用户成功！");
                   window.location.href="http://localhost:8080/UserServlet?pageNow=1&userName";
               }else {
                   alert("删除用户失败!");
                   window.location.href="http://localhost:8080/UserServlet?pageNow=1&userName";
               }
           }
        });
    }
/*    function findAll(pageNow,userName) {
        /!*var pageNow = 1;//初始化当前页面
        var userName = null;*!/
        console.log(userName);
        $.ajax({
            url:'http://localhost:8080/UserServlet',
            data:{
                pageNow : pageNow,
                userName : userName
            },
            methods:'POST',
            success:function(data){
                //console.log(data.id);
                var promess = JSON.parse(data);
                //console.log(promess[0]);
                if ($.isEmptyObject(promess)){//判断json对象是否为空
                    html = "<td bgcolor='#FFFFFF' colspan='5'>没有任何用户信息！</td>";
                    $("tr:eq(1)").html(html);
                }else {
                    if (userName==null){
                        var a = 1;
                        for (var i in promess){//遍历json对象
                            html = "                         <td bgcolor=\"#FFFFFF\" >"+ promess[i].id +"</td>\n" +
                                "                            <td bgcolor=\"#FFFFFF\">"+ promess[i].username +"</td>\n" +
                                "                            <td bgcolor=\"#FFFFFF\">"+ promess[i].fullname +"</td>\n" +
                                "                            <td bgcolor=\"#FFFFFF\">"+ promess[i].tel +"</td>\n" +
                                "                            <td bgcolor=\"#FFFFFF\">"+ promess[i].email +"</td>\n" +
                                "                            <td bgcolor=\"#FFFFFF\">"+ promess[i].identify +"</td>\n" +
                                "                            <td bgcolor=\"#FFFFFF\">"+ promess[i].id +"</td>" +
                                "                            <td bgcolor=\"#FFFFFF\">"+ promess[i].page +"</td>";
                            $("tr:eq("+a+")").html(html);
                            a++;
                        }
                        if (a<=6){
                            for (var i=a;i<7;i++){
                                html = "";
                                $("tr:eq("+i+")").html(html);
                            }
                        }
                        if (promess[0].page>1){
                            var sb = "";
                            for (var i=1;i<=promess[0].page;i++){
                                if(i == promess[0].pageNow){ // 判断是否为当前页
                                    sb+="『" + i + "』";		// 构建分页导航条
                                }else{
                                    // 构建分页导航条
                                    sb+="<a href='javascript:void(0);'onclick='findAll("+i+","+null+")'>" + i + "</a>";
                                }
                                sb+="&nbsp&nbsp";
                            }
                            //console.log(sb);
                            $("div:eq(7)").html(sb);
                        }
                    }

                }
            }
        });
    }*/
/*    $(function(){//跳转后加载JS
        //console.log(1);
        findAll(1,null);
    });*/
</script>
</body>
</html>
