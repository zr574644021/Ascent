<%@ page import="com.zou.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Order> list = (List)session.getAttribute("item");
    String ident=(String)session.getAttribute("ident");
    int orderid = 0;            //存储订单ID
    String ordernum = null;     //存储订单编号
    String address = null;      //存储地址
    String total = null;        //存储支付金额
%>
<html>
<head>
    <title>订单明细</title>
</head>
<body>
<div>
    <table border="1" width="70%" align="center"  cellspacing="0" cellpadding="0">
        <tr height="50"><td colspan="5" align="center">订单明细</td></tr>
        <tr align="center" height="50">
            <td width="25%">商品编号</td>
            <td>商品名称</td>
            <td>单价(元/个)</td>
            <td>数量</td>
            <td>总价</td>
        </tr>
        <%
            if (list==null||list.size()==0){
        %>
        <tr height="100"><td colspan="5" align="center">订单信息出错！</td></tr>
        <%  }else {
                for (Order order : list){
                    //Order order = (Order)list.get(i);
                    double price = Double.valueOf(order.getPrice1())*Integer.valueOf(order.getQuantity());
                    total = order.getTotal();
                    address = order.getAddress();
                    orderid = order.getId();
                    ordernum = order.getOrdernum();

        %>
        <tr align="center" height="50">
            <td><%=order.getPronum()%></td>
            <td><%=order.getProname()%></td>
            <td><%=order.getPrice1()%></td>
            <td><%=order.getQuantity()%></td>
            <td><%=price%></td>
        </tr>
        <%
                }
        }
        %>
        <tr height="50" align="center">
            <td colspan="2">应付金额：<%=total%></td>
            <td colspan="3">收货地址：<%=address%></td>
        </tr>
        <tr height="50" align="center">
            <td colspan="2">订单ID：<%=orderid%></td>
            <td colspan="3">订单编号：<%=ordernum%></td>
        </tr>
    </table>
    <div align="center" width="30%">
        <br>
        <%
            if (ident.equals("1")){
        %>
                <button type="button" onclick="window.location.href='/OrderUserServlet?pagenow=1&ornum'">返回</button>
        <%
            }else {
        %>
        <button type="button" onclick="window.location.href='/OrderManageServlet?pagenow=1&ornum&uid'">返回</button>
        <%
            }
        %>

    </div>
</div>
</body>
</html>
