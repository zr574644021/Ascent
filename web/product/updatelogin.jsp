<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码修改</title>
</head>
<body>
<table id="Login" style="border: 2px solid;" width="30%" align="center" border="0" cellspacing="0" cellspacing="0">
    <tr>
        <td width="30%" valign="middle">
            原密码：<input type="password" name="oldpass" id="oldpass" size="7">
        </td>
    </tr>
    <tr>
        <td valign="middle">
            新密码：<input type="password" name="newpass" id="newpass" size="7">
        </td>
    </tr>
    <tr>
        <td valign="middle">
            再次输入新密码：<input type="password" name="newpass1" id="newpass1" size="7">
        </td>
    </tr>
    <tr>
        <td height="30" valign="bottom" >
            <button type="button" onclick="uppass()">修改</button>
            &nbsp;&nbsp;
            <button type="button" onclick="window.location.href='../index.jsp'">返回</button>
        </td>
    </tr>
</table>
<script src="../js/jquery-3.2.1.min.js"></script>
<script language="javascript">
    function uppass() {
        var oldpass = document.getElementById("oldpass").value;
        var newpass = document.getElementById("newpass").value;
        var newpass1 = document.getElementById("newpass1").value;
        console.log(newpass);
        console.log(newpass1);
        if(oldpass==""){       //验证密码是否为空
            alert("输入不能为空！");
            return false;
        }
        if(newpass==""){       //验证密码是否为空
            alert("输入不能为空！");
            return false;
        }
        if(newpass1==""){       //验证密码是否为空
            alert("输入不能为空！");
            return false;
        }
        if(newpass!=newpass1){
            alert("两次密码不一致！");
            return false;
        }
        $.ajax({
           url:'http://localhost:8080/UpPassServlet',
           data:{
               newpass : newpass,
               oldpass : oldpass
           },
            methods:'POST',
            success:function (data) {
                var d = data;
                if (d=="true"){
                    alert("修改成功,请重新登陆!");
                    window.location.href="http://localhost:8080/exit.jsp";
                }
                else {
                    alert("原密码错误！");
                }
            }
        });
    }
</script>
</body>
</html>
