<%@ page import="com.sun.java.swing.plaf.windows.resources.windows" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String USER = (String)session.getAttribute("username");
  String email = (String)session.getAttribute("email");
%>
<html>
<head>
  <title>AscentSys医药商务系统</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="description" content="Your website description goes here"/>
  <meta name="keywords" content="your,keywords,goes,here"/>
  <link rel="stylesheet" id="styles" type="text/css" href="./css/index.css" media="screen,projection">
</head>
<body>
<div id="container">
  <div id="header">
  </div>
  <div id="navigation">
    <ul>
      <li><a class="lin" href="index.jsp">首页</a></li>
      <li><a class="lin" href="product/itservice.html">IT服务</a></li>
      <%
        if (USER!=null&&email!=null){
      %>
      <li><a class="lin" href="ShopServlet?pageNow=1&proName&proCategory">医药商城</a></li>
      <%
        }else {
      %>
      <li><a class="lin" href="#" onclick="load()">医药商城</a></li>
      <%
        }
      %>
      <li><a class="lin" href="product/employee.html">员工招聘</a></li>
      <li><a class="lin" href="product/ContactUs.html">关于我们</a></li>
    </ul>
  </div>
  <div id="content">
    <h2>Welcome To Ascent Technologies</h2>
    <div class="splitcontentleft">
      <div class="box">
        <h3><img src="images/lxrycyy.gif" alt="" width="240" height="180"></h3>
      </div>
    </div>
    <div class="splitcontentright">
      <p>亚思晟商务科技有限公司(简称&quot;亚思晟科技&quot;),是由海外归国IT专业技术人士在中关村海淀留学生创业园创办成立。公司总部位于北京,在加拿大,美国,日本及国内的石家庄,长春,秦皇岛,吉林,廊坊等地设有分部。凭借着卓越的技术水平、经验丰富的管理团队,强大的资源整合能力和“诚信、开放、创新、卓越”的经营理念,亚思晟科技奠定了公司在本地和海外IT服务市场的优势地位,获得了客户的一致认可和好评,并与客户建立了长期的战略合作伙伴关系。公司立足于中国IT的现实和特点,利用国际先进成熟的技术和经验，提供高端优质的IT服务,包括软件高端培训、软件开发及维护、软件外包、软件产品研发和本地化等。公司具有突出的技术优势,包括：具备北美电子应用平台技术;通过北京中关村科技园高科技产品认证,公司还具有突出的人才优势,拥有美国MBA,纽约华尔街及加拿大证券交易中心认证管理专家;以及其他加拿大IT技术移民和海外留学人员。</p>
      <p><strong>Good luck with your new design!</strong></p>
    </div>
  </div>
  <div id="subcontent">
      <div class="small box">
        <table id="Login" style="border: 2px solid;" width="150" border="0" cellspacing="0" cellspacing="0">
          <%
            if (USER!=null&&email!=null){
          %>
          <tr>
            <td width="30%" valign="middle">
              <p>欢迎您！<%=USER%> </p>
              <P>邮箱：<%=email%></P>
              <a href="exit.jsp"><font color="#b22222" >[注销]</font></a>
              <a href="/product/updatelogin.jsp"><font color="#b22222" >[修改密码]</font></a>
            </td>
          </tr>
          <%
            }else{
          %>
          <tr>
          <td width="30%" valign="middle">
            <img src="images/username.jpg" width="61" height="17" align="bottom"/>
            <input type="text" name="username" id="username" size="7">
          </td>
        </tr>
          <tr>
            <td valign="middle">
              <img src="images/password.jpg" width="61" height="17" />
              <input type="password" name="password" id="password" size="7">
            </td>
          </tr>
          <tr>
            <td height="30" valign="bottom" >
              <%--<input type="submit" value="登录" onClick="login()" width="44" height="17" border="0">--%>
              <button type="button" onclick="login()">登录</button>
              &nbsp;&nbsp;
              <button type="button" onclick="window.location.href='register.jsp'">注册</button>
              <%--<input type="button" value="注册" onclick="window.location.href='register.jsp'"  width="44" height="17" border="0">--%>
            </td>
          </tr>
          <%
          }
          %>
        </table>
      </div>
    <h2>最新商品列表</h2>
    <ul class="menublock">
      <li><a href="#">西药</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0"></a></li>
      <li><a href="#">生化药</a><a href="#"><img src="images/buy.gif" width="20" height="16" border="0"></a></li>
    </ul>
    <h2>友情链接</h2>
    <ul class="menublock">
      <li><a href="http://www.ascenttech.cn" target="_blank">亚思晟视频在线</a></li>
      <li><a href="http://www.ascenttech.com.cn/" target="_blank">亚思晟公司主页</a></li>
    </ul>
  </div>
  <div id="footer">
    <p><a class="lin" href="http://www.ascenttech.com.cn/" target="_blank">版权所有：北京亚思晟商务科技有限公司&copy;2004-2008|京ICP备05005681</a></p>
  </div>
</div>
<script src="./js/jquery-3.2.1.min.js"></script>
<script language="javascript">
    function login(){//传入表单参数
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        if(username==""){       //验证用户名是否为空
            alert("请输入用户名！");
            //username.focus();
            return false;
        }
        if(password==""){       //验证密码是否为空
            alert("请输入密码！");
            //password.focus();
            return false;
        }
        $.ajax({
            url:'http://localhost:8080/LoginServlet',
            data:{
                username : username,
                password : password
            },
            methods:'POST',
            //contentType: 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
            success:function(data){
                var d = JSON.parse(data);
                if (d.state == 200){
                    if (d.identify == 1){
/*                        var html = "<tr>\n" +
                            "            <td width=\"30%\" valign=\"middle\">\n" +
                            "              <p>欢迎您！" + username + "</p>\n" +
                            "              <P>邮箱：" + d.email + "</P>\n" +
                            "<a href=\"exit.jsp\"><font color=\"#b22222\" >[注销]</font></a>\n" +
                            "            </td>\n" +
                            "      </tr>\n"*/
                        //console.log(html);
                        //$("table").html(html);
                        window.location.href="index.jsp";
                    }else {
                        window.location.href=d.url;
                    }
                }else {
                    alert(d.mess);
                    window.location.href="index.jsp";
                }
            }
        });
    }

    function load() {
        alert("请先登录注册！");
    }
</script>
</body>
</html>
