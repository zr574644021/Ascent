<%@ page import="com.zou.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取保存在session范围内的用户昵称
    String username=(String)session.getAttribute("username");
    String email=(String)session.getAttribute("email");
%>
<html>
<head>
    <title>商品管理</title>
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
    <div style="margin:10px;position: absolute">当前位置->医药商务系统后台->商品管理</div>
    <div id="left">
        <ul>
            <li><P>欢迎您！<%=username%></P></li>
            <li><P>邮箱：<%=email%></P></li>
            <li><a href="../exit.jsp"><font color="#b22222" >[注销]</font></a></li>
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
                <th bgcolor="#FFFFFF">库存</th>
                <th bgcolor="#FFFFFF">剩余量</th>
                <th bgcolor="#FFFFFF">药品摘要</th>
                <th bgcolor="#FFFFFF">mdl编</th>
                <th bgcolor="#FFFFFF">化学方程式</th>
                <th bgcolor="#FFFFFF">重量</th>
                <th bgcolor="#FFFFFF">备注</th>
                <th bgcolor="#FFFFFF">修改</th>
                <th bgcolor="#FFFFFF">删除</th>
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
                <td bgcolor="#FFFFFF" ><%=pr.getId()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getProductnum()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getProductname()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getCatrgoryno()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getCategory()%></td>
                <td bgcolor="#FFFFFF"><img src="../images/ss.jpg" alt="图片"/></td>
                <td bgcolor="#FFFFFF"><%=pr.getIsnewproduct()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getPrice1()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getPrice2()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getRealstock()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getStock()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getCas()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getMdlint()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getWeight()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getFormula()%></td>
                <td bgcolor="#FFFFFF"><%=pr.getNote()%></td>
                <td bgcolor="#FFFFFF"><a style="color: crimson" href="UpdateProServlet?pronum&proname=<%=pr.getProductname()%>&typenum&type&price1&price2&realstock&stock&cas&formula&mdlint&weight&note" >修改</a></td>
                <td bgcolor="#FFFFFF"><a style="color: crimson" name="<%=pr.getId()%>" href="#" onclick="deletepro(this)" >删除</a></td>
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
                        <button type="button" onclick="findName()">查询</button>
                    </td>
                </tr>
                <tr>
                    <td><p>查询商品类别：</p></td>
                    <td>
                        <input type="text" name="protype" id="protype" size="8" >
                        &nbsp;&nbsp;
                        <button type="button" onclick="findType()">查询</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" onclick="window.location.href='product/add_product.jsp'">商品添加</button>
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
        var proName = document.getElementById("proname").value;
        $.ajax({
            url:'http://localhost:8080/ProductServlet',
            data:{
                pageNow : 1,
                proName : proName,
                proCategory : ""
            },
            methods:'POST',
            success:function (data) {
                window.location.href="http://localhost:8080/ProductServlet?pageNow=1&proName="+ proName +"&proCategory";
            }
        });
    }

    function findType() {
        var proCategory = document.getElementById("protype").value;
        $.ajax({
            url:'http://localhost:8080/ProductServlet',
            data:{
                pageNow : 1,
                proName : "",
                proCategory : proCategory
            },
            methods:'POST',
            success:function (data) {
                window.location.href="http://localhost:8080/ProductServlet?pageNow=1&proName&proCategory="+ proCategory +"";
            }
        });
    }

    function deletepro(node) {
        var uid = node.getAttribute('name');//获取a标签的name属性值
        //console.log(uid);
        $.ajax({
            url:'http://localhost:8080/DeProServlet',
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
                    alert("删除商品成功！");
                    window.location.href="http://localhost:8080/ProductServlet?pageNow=1&proName&proCategory";
                }else {
                    alert("删除商品失败!");
                    window.location.href="http://localhost:8080/ProductServlet?pageNow=1&proName&proCategory";
                }
            }
        });
    }
</script>
</body>
</html>
