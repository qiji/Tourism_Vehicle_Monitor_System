<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendToWS.aspx.cs" Inherits="SendToWS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        模拟数据测试
        <br />
        设备号:<asp:TextBox ID="tbDeviceNo" runat="server"></asp:TextBox>
        <br />
        号牌:<asp:TextBox ID="tbCarNo" runat="server"></asp:TextBox>
        <br />
        经过时间：<asp:Label runat="server" ID="lbpasstime"></asp:Label>
        <br />
        颜色<asp:DropDownList ID="DropDownList1" runat="server">
           
        </asp:DropDownList>
        <br />
        种类:<asp:DropDownList ID="DropDownList2" runat="server">
            
        </asp:DropDownList>
        <br />
        方向:
        <asp:DropDownList ID="DropDownList3" runat="server">
            
        </asp:DropDownList>
        <br/>
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
        <br />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Button" />
        </div>
    </form>
</body>
</html>
