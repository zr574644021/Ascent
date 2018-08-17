<%@ page import="com.zou.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <li><a class="lin" href="../index.jsp">首页</a></li>
            <li><a class="lin" href="product/itservice.html">IT服务</a></li>
            <li><a class="lin" href="ShopServlet?pageNow=1&proName&proCategory">医药商城</a></li>
            <li><a class="lin" href="product/employee.html">员工招聘</a></li>
            <li><a class="lin" href="product/ContactUs.html">关于我们</a></li>
        </ul>
    </div>
    <div style="margin:10px;position: absolute">当前位置->医药商城</div>
    <div id="left">
        <%
            //获取保存在session范围内的用户
            String user=(String)session.getAttribute("username");
            String email=(String)session.getAttribute("email");
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
            <h3 align="center">商品信息</h3>
            <table width="98%" border="0" align="center" cellpadding="0"
                   cellspacing="1" bgcolor="#666666">
                <tr align="center">
                    <th bgcolor="#FFFFFF">ID</th>
                    <th bgcolor="#FFFFFF">商品编号</th>
                    <th bgcolor="#FFFFFF">商品名称</th>
                    <th bgcolor="#FFFFFF">分类编号</th>
                    <th bgcolor="#FFFFFF">类别</th>
                    <th bgcolor="#FFFFFF">图片</th>
                    <th bgcolor="#FFFFFF">新商品</th>
                    <th bgcolor="#FFFFFF">价格</th>
                    <th bgcolor="#FFFFFF">会员价格</th>
                    <th bgcolor="#FFFFFF">剩余量</th>
                    <th bgcolor="#FFFFFF">药品摘要</th>
                    <th bgcolor="#FFFFFF">mdl编</th>
                    <th bgcolor="#FFFFFF">化学方程式</th>
                    <th bgcolor="#FFFFFF">备注</th>
                    <th bgcolor="#FFFFFF">购买数量</th>
                    <th bgcolor="#FFFFFF">购买</th>
                </tr>
                <%
                    // 获取信息集合
                    List<Product> list = (List<Product>) request.getAttribute("list");
                    // 判断集合是否有效
                    if (list == null || list.size() < 1) {
                        out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何商品信息！</td></tr>");
                    } else {
                        // 遍历集合中的数据
                        for (Product pr : list) {
                %>
                <tr align="center">
                    <td bgcolor="#FFFFFF"><input type="text" id="input-<%=pr.getId()%>" style="border:0px solid" readonly="readonly" value="<%=pr.getId()%>"></td>
                    <td bgcolor="#FFFFFF"><%=pr.getProductnum()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getProductname()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getCatrgoryno()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getCategory()%></td>
                    <td bgcolor="#FFFFFF"><img src="../images/ss.jpg" alt="图片"/></td>
                    <td bgcolor="#FFFFFF"><%=pr.getIsnewproduct()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getPrice1()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getPrice2()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getStock()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getCas()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getMdlint()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getFormula()%></td>
                    <td bgcolor="#FFFFFF"><%=pr.getNote()%></td>
                    <td bgcolor="#FFFFFF"><input type="text" id="many-<%=pr.getId()%>" size="6" value="1"></td>
                    <td bgcolor="#FFFFFF"><button type="button" name="<%=pr.getId()%>" onclick="add(this)">购买</button><%--<a style="color: crimson" href="#" onclick="add()">购买</a>--%></td>
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
                    <td><p>查询商品名：</p></td>
                    <td><input type="text" name="proname" id="proname" size="8" >
                        &nbsp;&nbsp;
                        <input type="submit" value="查询" onClick="findName()" width="44" height="17" border="0">
                    </td>
                </tr>
                <tr>
                    <td><p>查询商品类别：</p></td>
                    <td>
                        <input type="text" name="protype" id="protype" size="8" >
                        &nbsp;&nbsp;
                        <input type="submit" value="查询" onClick="findType()" width="44" height="17" border="0">
                    </td>
                </tr>
            </table>
        </div>
</div>
<div id="footer">
    <p><a class="lin" href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司&copy;2004-2008|京ICP备05005681</a></p>
</div>
<script src="../js/jquery-3.2.1.min.js"></script>
<script language="JavaScript">
    function add(node) {
        var name = node.getAttribute("name");
        var id = document.getElementById("input-"+name).value;
        var many = document.getElementById("many-"+name).value;
        var pmany = Number(many);
        if (many=="") {
            alert("请输入购买数量!");
        }else if (pmany>0){
            $.ajax({
                url:'http://localhost:8080/ShopCarServlet',
                data:{
                    action : "buy",
                    id : id,
                    many : many
                },
                methods:'POST',
                success:function (data) {
                    alert("成功添加至购物车");
                }
            });
        }else {
            alert("请输入正确的数字!");
        }
    }

    function findName() {
        var proName = document.getElementById("proname").value;
        $.ajax({
            url:'http://localhost:8080/ShopServlet',
            data:{
                pageNow : 1,
                proName : proName,
                proCategory : ""
            },
            methods:'POST',
            success:function (data) {
                window.location.href="http://localhost:8080/ShopServlet?pageNow=1&proName="+ proName +"&proCategory";
            }
        });
    }
    function findType() {
        var proCategory = document.getElementById("protype").value;
        $.ajax({
            url:'http://localhost:8080/ShopServlet',
            data:{
                pageNow : 1,
                proName : "",
                proCategory : proCategory
            },
            methods:'POST',
            success:function (data) {
                window.location.href="http://localhost:8080/ShopServlet?pageNow=1&proName&proCategory="+ proCategory +"";
            }
        });
    }
</script>
</body>
</html>