<%@ page import="java.util.ArrayList" %>
<%@ page import="com.zou.model.ShopCar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
    <link rel="stylesheet" id="styles" type="text/css" href="../css/index.css" media="screen,projection">
</head>
<body>
<div id="container">
    <div id="header">
    </div>
    <div style="margin:10px;position: absolute">当前位置->医药商城->购物车</div>
    <div id="left">
        <%
            //获取保存在session范围内的用户
            String user=(String)session.getAttribute("username");
            String email=(String)session.getAttribute("email");
            //获取存储在session中用来存储用户已购买商品的buylist集合对象
            ArrayList buylist=(ArrayList)session.getAttribute("buylist");
            double total=0; 							//用来存储应付金额
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
            <tr height="50"><td colspan="5" align="center">购买的商品如下</td></tr>
            <tr align="center" height="30" bgcolor="lightgrey">
                <td width="25%">商品编号</td>
                <td>商品名称</td>
                <td>单价(元/个)</td>
                <td>数量</td>
                <td>总价</td>
                <td>移除</td>
            </tr>
            <%	if(buylist==null||buylist.size()==0){ %>
            <tr height="100"><td colspan="5" align="center">您的购物车为空！</td></tr>
            <%		}
            else{
                for(int i=0;i<buylist.size();i++){
                    ShopCar single=(ShopCar)buylist.get(i);
                    String pronum = single.getPronum();		//获取商品编号
                    String name = single.getName();			//获取商品名称
                    double price = single.getPrice();		//获取商品价格
                    int many = single.getMany();     		//获取购买数量
                    double allprice = price*many;           //获取总价
                    total+=allprice;                        //支付金额
            %>
            <tr align="center" height="50">
                <td><%=pronum%></td>
                <td><%=name%></td>
                <td><%=price%></td>
                <td><%=many%></td>
                <td><%=allprice%></td>
                <td><a href="../ShopCarServlet?action=remove&name=<%=single.getName() %>">移除</a></td>
            </tr>
            <%
                    }
                    session.setAttribute("total",String.valueOf(total));//存入session
                }

            %>
            <tr height="50" align="center">
                <td colspan="5">应付金额：<%=total%></td>
                <td colspan="5">收货地址：<input type="text" name="address" id="address" size="8"></td>
            </tr>
            <tr height="50" align="center">
                <td colspan="2"><a href="../ShopServlet?pageNow=1&proName&proCategory">继续购物</a></td>
                <td colspan="3"><a href="../ShopCarServlet?action=clear">清空购物车</a></td>
                <td colspan="4"><button type="button" name="提交" onclick="add()">提交订单</button></td>
            <%
                java.util.Date currentTime = new java.util.Date();//得到当前系统时间
                session.setAttribute("oedernum" ,String.valueOf(currentTime));
                session.setAttribute("time",String.valueOf(currentTime));
            %>
            </tr>
        </table>
    </div>
</div>
<div id="footer">
    <p><a class="lin" href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司&copy;2004-2008|京ICP备05005681</a></p>
</div>
<script src="../js/jquery-3.2.1.min.js"></script>
<script language="JavaScript">
    function add() {
        var address = document.getElementById("address").value;
        if (address=="") alert("收货地址不能为空!");
        else{
            $.ajax({
                url: 'http://localhost:8080/OrderServlet',
                data: {
                    address: address
                },
                methods: 'POST',
                success: function (data) {
                    var d = JSON.parse(data);
                    console.log(d);
                    if (d.flag == 0) {
                        alert(d.mess);
                        window.location.href = "../ShopServlet?pageNow=1&proName&proCategory";
                    } else {
                        alert(d.mess)
                        window.location.href = "../ShopServlet?pageNow=1&proName&proCategory";
                    }
                }
            });
        }
    }
</script>
</body>
</html>
