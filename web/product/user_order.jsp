<%@ page import="java.util.List" %>
<%@ page import="com.zou.model.Order" %>
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
    <div style="margin:10px;position: absolute">当前位置->医药商城->订单管理</div>
    <div id="left">
        <%
            if (user!=null&&user!=null){
        %>
        <ul>
            <li><P>欢迎您！<%=user%></P></li>
            <li><P>邮箱：<%=email%></P></li>
            <li>
                <a href="../exit.jsp"><font color="#b22222" >[注销]</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="../exit.jsp"><font color="#b22222" >[修改密码]</font></a>
            </li>
        </ul>
        <%
            }
        %>
    </div>
    <div id="right">
        <ul>
            <li><input type="image" src="../images/商品列表.png" onclick="window.location.href='/ShopServlet?pageNow=1&proName&proCategory'"></li>
            <li><input type="image" src="../images/订单管理.png" onclick="window.location.href='/OrderUserServlet?pagenow=1&ornum'"></li>
            <li><input type="image" src="../images/购物车.png" onclick="window.location.href='/product/shopcar.jsp'"></li>
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
                <th bgcolor="#FFFFFF">删除</th>
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
                <%
                    }else{
                %>
                <td bgcolor="#FFFFFF">已处理</td>
                <%
                    }
                %>
                <td bgcolor="#FFFFFF"><a style="color: crimson"  name="<%=or.getId()%>" href="#" onclick="deleteOr(this)" >删除</a></td>
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
                ornum : ornum
            },
            methods:'POST',
            success:function (data) {
                window.location.href="http://localhost:8080/OrderUserServlet?pagenow=1&ornum="+ornum+"";
            }
        });
    }
    
    function deleteOr(node){
        console.log(node);
        var oid = node.getAttribute('name');
        $.ajax({
            url:'http://localhost:8080/DealOrderServlet',
            data:{
                action : "dele",
                id : oid
            },
            methods:'POST',
            success:function (data) {
                var a = data;
                if (a=="true"){
                    alert("删除成功！");
                    window.location.href="http://localhost:8080/OrderUserServlet?pagenow=1&ornum";
                }else {
                    alert("删除失败！");
                }
            }
        });
    }
</script>
</body>
</html>
