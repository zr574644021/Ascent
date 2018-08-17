<%@ page import="com.zou.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取保存在session范围内的用户昵称
    String username=(String)session.getAttribute("username");
    String email=(String)session.getAttribute("email");
%>
<html>
<head>
    <title>订单管理</title>
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
    <div style="margin:10px;position: absolute">当前位置->医药商务系统后台->订单管理</div>
    <div id="left">
        <ul>
            <li><P>欢迎您！<%=username%></P></li>
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
        <table border="1" width="60%" align="center"  cellspacing="0" cellpadding="0">
            <tr align="center">
                <th bgcolor="#FFFFFF">订单ID</th>
                <th bgcolor="#FFFFFF">订单编号</th>
                <th bgcolor="#FFFFFF">用户ID</th>
                <th bgcolor="#FFFFFF">创建时间</th>
                <th bgcolor="#FFFFFF">订单状态</th>
                <th bgcolor="#FFFFFF">处理</th>
                <th bgcolor="#FFFFFF">订单明细</th>
            </tr>
            <%
                List<Order> list = (List<Order>)request.getAttribute("list");
                if (list == null || list.size()==0){
                    out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何订单信息！</td></tr>");
                }else {
                    for (Order or : list){
            %>
            <tr align="center">
                <td bgcolor="#FFFFFF"><%=or.getId()%></td>
                <td bgcolor="#FFFFFF"><%=or.getOrdernum()%></td>
                <td bgcolor="#FFFFFF"><%=or.getUid()%></td>
                <td bgcolor="#FFFFFF"><%=or.getCreatetime()%></td>
                <%
                    if (or.getState().equals("0")){
                %>
                <td bgcolor="#FFFFFF">未处理</td>
                <td bgcolor="#FFFFFF"><a style="color: crimson"  name="<%=or.getId()%>" href="#" onclick="sure(this)" >确认订单</a></td>
                <%
                }else{
                %>
                <td bgcolor="#FFFFFF" colspan="2">已处理</td>
                <%
                    }
                %>
                <td bgcolor="#FFFFFF"><a style="color: crimson" id="<%=or.getId()%>" href="#" onclick="window.location.href='/DealOrderServlet?action=item&id=<%=or.getId()%>'" >订单明细</a></td>
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
                    <td><p>订单编号：</p></td>
                    <td><input type="text" name="ornum" id="ornum" size="8" >
                        &nbsp;&nbsp;
                        <button type="button" onclick="findNum()">查询</button>
                    </td>
                </tr>
                <tr>
                    <td><p>用户ID：</p></td>
                    <td>
                        <input type="text" name="uid" id="uid" size="8" >
                        &nbsp;&nbsp;
                        <button type="button" onclick="findUid()">查询</button>
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
    function findNum() {
        var ornum = document.getElementById("ornum").value;
        $.ajax({
            url:'http://localhost:8080/OrderUserServlet',
            data:{
                pagenow : 1,
                ornum : ornum,
                uid : ""
            },
            methods:'POST',
            success:function (data) {
                window.location.href="http://localhost:8080/OrderManageServlet?pagenow=1&ornum="+ornum+"&uid";
            }
        });
    }
    
    function findUid() {
        var uid = document.getElementById("uid").value;
        $.ajax({
            url:'',
            data:{
                pagenow : 1,
                ornum : "",
                uid : uid
            },
            methods:'POST',
            success:function (data) {
                window.location.href="http://localhost:8080/OrderManageServlet?pagenow=1&ornum=&uid="+uid;
            }
        });
    }

    function sure(node) {
        console.log(node);
        var orid = node.getAttribute('name');//获取a标签的name属性值
        $.ajax({
            url:'http://localhost:8080/DealOrderServlet',
            data:{
                action : "sure",
                id : orid
            },
            methods:'POST',
            success:function (data) {
                var a = data;
                if (a=="true"){
                    alert("处理成功！");
                    window.location.href="http://localhost:8080/OrderManageServlet?pagenow=1&ornum&uid";
                }else {
                    alert("处理失败！");
                }
            }
        });
    }

</script>
</body>
</html>
