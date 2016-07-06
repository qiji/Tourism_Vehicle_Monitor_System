<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <title>登录</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="logcpname">
        旅游车辆监测统计分析系统
    </div>
    <div class="clear">
    </div>
    <div>
        <div id="logincontent">
            <div class="logblock">
                <div class="logcinput" style="height: 50px">
                    <input runat="server" type="text" class="logintinput" id="tbusername" name="UserName"
                        placeholder="用户名" />
                </div>
                <div class="clear">
                </div>
                <div class="logcinput">
                    <input type="password" runat="server" class="logintinput" id="tbpwd" name="Pwd" placeholder="密码" />
                </div>
                <div class="clear">
                </div>
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="登  录" CssClass="bulogin" OnClick="btnLogin_Click" />
        </div>
    </div>
    </form>
    <div class="clear">
    </div>
    <%-- <div style="text-align: center; padding-top: 5em;">
        技术支持： 浙江省旅游信息中心
    </div>--%>
</body>
</html>
