<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link href="css/newlogin.css" rel="stylesheet" type="text/css" />
    <title>登录</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="logintop">
        旅游车辆监测统计分析系统
    </div>
    <div class="logincontent">
        <div class="logintable">
            <div class="logininput">
                账号:
                <input runat="server" type="text" id="tbusername" />
            </div>
        </div>
        <div class="logintable">
            <div class="logininput">
                密码:
                <input type="password" runat="server" id="tbpwd" />
            </div>
        </div>
      
            <div class="loginbutton">
                <asp:Button ID="btnLogin" runat="server" Text=" 登录" CssClass="btnlogin" OnClick="btnLogin_Click" />
           </div>
       
    </div>
    </form>
</body>
</html>
