<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hint.aspx.cs" Inherits="Hint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>提示信息</title>
    <style type="text/css">
        body
        {
            background-color: #525252;
            margin-top: 0px;
            margin-bottom: 0px;
            margin-left: auto;
            margin-right: auto;
            width: 480px;
            color: #2F2F2F;
            font-size: 14px;
            line-height: 30px;
            font-family: "微软雅黑" , Dotum, sans-serif;
        }
        .hintbox
        {
            background-color: #FFFFFF;
            border-radius: 10px;
            margin-top: 20%;
            width: auto;
            padding-top: 40px;
            padding-bottom: 40px;
        }
        .bigred
        {
            font-size: 100px;
            background-color: #E35757;
            margin-top: 0px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 0px;
            height: 100px;
            width: 100px;
            border-radius: 200px;
            color: #FFFFFF;
            line-height: 85px;
            text-align: center;
        }
        .biggreen
        {
            font-size: 80px;
            background-color: #62BB58;
            margin-top: 0px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 0px;
            height: 100px;
            width: 100px;
            border-radius: 200px;
            color: #FFFFFF;
            line-height: 100px;
            text-align: center;
        }
        .info
        {
            padding-left: 40px;
            padding-top: 20px;
            padding-right: 20px;
            padding-bottom: 20px;
        }
        
        .wrong
        {
            clear: both;
            display: block;
            text-align: center;
            font-size: 16px;
            line-height: 50px;
            color: #E35757;
            font-weight: bold;
        }
        .right
        {
            clear: both;
            display: block;
            text-align: center;
            font-size: 16px;
            line-height: 50px;
            color: #62BB58;
            font-weight: bold;
        }
        .more
        {
            text-align: center;
            color: #888888;
        }
        .more a
        {
            text-decoration: none;
            color: #FF5700;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="hintbox">
        <div class="bigred" runat="server" id="divFlag">
            ×</div>
        <div class="info" id="divInfo" runat="server">
            <span class="wrong">操作错误</span> 
        </div>
        <%--<div class="biggreen">
            √</div>
        <div class="info">
            <span class="right">操作成功</span> 成功提示
        </div>--%>
        <div class="more" runat="server" id="divBack">
            3秒后，系统将自动跳转到原来的页面<br>
            如果系统未跳转请<a href="javascript:void(0);" onclick="window.history.back()">点击这里</a>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        window.onload = function () {
            setInterval("redirect();", 3000);            
        }

        function redirect() {
            window.location.href = '<%=urlreferrer %>';
        }
    </script>
    </form>
</body>
</html>
