<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DelCarImg.aspx.cs" Inherits="DelCarImg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="清除CarError" OnClick="Button1_Click" />
        &nbsp;<asp:Button ID="Button2" runat="server" Text="清除内部车辆" 
            onclick="Button2_Click"  />
    </div>
    </form>
</body>
</html>
