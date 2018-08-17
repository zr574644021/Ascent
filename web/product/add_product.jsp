<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //获取保存在session范围内的用户
    String user=(String)session.getAttribute("username");
    String email=(String)session.getAttribute("email");
%>
<html>
<head>
    <title>商品添加</title>
    <link rel="stylesheet" id="styles" type="text/css" href="../css/index.css" media="screen,projection">
</head>
<body>
<div id="container">
    <div id="header">
    </div>
    <div id="navigation">
        <ul>
            <li><a class="lin" href="../index.jsp">首页</a></li>
            <li><a class="lin" href="itservice.html">IT服务</a></li>
            <li><a class="lin" href="../exit.jsp">医药商城</a></li>
            <li><a class="lin" href="employee.html">员工招聘</a></li>
            <li><a class="lin" href="ContactUs.html">关于我们</a></li>
        </ul>
    </div>
    <div style="margin:10px;position: absolute">当前位置->医药商务系统后台->添加商品</div>
    <div id="left">
        <ul>
            <li><P>欢迎您！<%=user%></P></li>
            <li><P>邮箱：<%=email%></P></li>
            <li><a href="../exit.jsp"><font color="#b22222" >[注销]</font></a></li>
        </ul>
    </div>
    <div id="right">
        <ul>
            <li><input type="image" src="../images/userlist.jpg" onclick="window.location.href='/UserServlet?pageNow=1&userName'"></li>
            <li><input type="image" src="../images/productslist.jpg" onclick="window.location.href='/ProductServlet?pageNow=1&proName&proCategory'"></li>
            <li><input type="image" src="../images/ShowOrders.jpg" onclick="window.location.href='/OrderServlet'"></li>
        </ul>
    </div>
    <hr style="height:5px;border:none;border-top:5px ridge #467ba7;margin-top: 140px" />
    <div>
        <table width="30%" class="mars" align="center" cellspacing="1" cellpadding="0" width="100%" border="0">
            <tbody>
            <tr>
                <td class="item">
                    <div align="right">商品编号:</div>
                </td>
                <td>
                    <input type="text" name="pronum" id="pronum">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">商品名称:</div>
                </td>
                <td>
                    <input type="text" name="proname" id="proname">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">分类编号:</div>
                </td>
                <td>
                    <input type="text" name="typenum" id="typenum">
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">分类:</div>
                </td>
                <td>
                    <input type="text" name="type" id="type">
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">价格:</div>
                </td>
                <td>
                    <input type="text" name="price1" id="price1">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">会员价格:</div>
                </td>
                <td>
                    <input type="text" name="price2" id="price2">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">库存:</div>
                </td>
                <td>
                    <input type="text" name="realstock" id="realstock">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">剩余量:</div>
                </td>
                <td>
                    <input type="text" name="stock" id="stock">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">药品摘要:</div>
                </td>
                <td>
                    <input type="text" name="cas" id="cas">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">mdl编:</div>
                </td>
                <td>
                    <input type="text" name="mdlint" id="mdlint">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">化学方程式:</div>
                </td>
                <td>
                    <input type="text" name="formula" id="formula">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">重量:</div>
                </td>
                <td>
                    <input type="text" name="weight" id="weight">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">备注:</div>
                </td>
                <td>
                    <input type="text" name="note" id="note">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="item">
                    <div align="right">新商品:</div>
                </td>
                <td>
                    <input type="text" name="pronew" id="pronew">&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <br>
                    <input type="submit" value="添加" onclick="add()">
                    <input type="button" value="返回" onclick="location.href='../ProductServlet?pageNow=1&proName&proCategory'">
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<div id="footer">
    <p><a class="lin" href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司&copy;2004-2008|京ICP备05005681</a></p>
</div>
<script src="../js/jquery-3.2.1.min.js"></script>
<script language="javascript">
    function add() {
        var pronum = document.getElementById("pronum").value;
        var proname = document.getElementById("proname").value;
        var typenum = document.getElementById("typenum").value;
        var type = document.getElementById("type").value;
        var price1 = document.getElementById("price1").value;
        var price2 = document.getElementById("price2").value;
        var realstock = document.getElementById("realstock").value;
        var stock = document.getElementById("stock").value;
        var cas = document.getElementById("cas").value;
        var mdlint = document.getElementById("mdlint").value;
        var formula = document.getElementById("formula").value;
        var weight = document.getElementById("weight").value;
        var note = document.getElementById("note").value;
        var pronew = document.getElementById("pronew").value;
        $.ajax({
           url:'http://localhost:8080/AddProServlet',
           data:{
               pronum : pronum,
               proname : proname,
               typenum : typenum,
               type : type,
               price1 : price1,
               price2 : price2,
               realstock : realstock,
               stock : stock,
               cas : cas,
               mdlint : mdlint,
               formula : formula,
               weight : weight,
               note : note,
               pronew : pronew
           },
           methods:'POST',
           success:function (data) {
               var flag = data;
               //console.log(flag);
               if (flag=="true"){
                   alert("添加商品成功！");
                   window.location.href="http://localhost:8080/ProductServlet?pageNow=1&proName="+proname+"&proCategory";
               }else if (flag="false"){
                   alert("添加商品失败!");
                   window.location.href="http://localhost:8080/product/add_product.jsp";
               }else {
                   alert("商品名称已存在!");
                   window.location.href="http://localhost:8080/product/add_product.jsp";
               }
           }
        });
    }
</script>
</body>
</html>
