<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Mobile_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>旅游车辆监测统计分析系统</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
  
    <script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <link type="text/css" href="http://weui.github.io/weui/weui.css" rel="stylesheet" />
    <link href="css/newlogin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="logintop">
        旅游车辆监测统计分析系统
    </div>
    <div class="logincontent">
        <div class="logintable">
            <div class="logininput">
                账号:
                <input  type="text" id="tbusername" />
            </div>
        </div>
        <div class="logintable">
            <div class="logininput">
                密码:
                <input type="password" id="tbpwd" />
            </div>
        </div>
        <div class="loginbutton ">
            <input id="btnLogin" type="button" value=" 登录" class="btnlogin" onclick="userlogin()" />
        </div>
    </div>
    <div class="weui_dialog_alert" id="divalert" style="display: none">
        <div class="weui_mask">
        </div>
        <div class="weui_dialog">
            <div class="weui_dialog_hd">
                <strong class="weui_dialog_title"></strong>
            </div>
            <div class="weui_dialog_bd" id="alertNote" style="font-size: 1.8em; text-align: center;
                line-height: 3em">
                弹窗内容，告知当前页面信息等</div>
            <div class="weui_dialog_ft">
                <a onclick="clsalert()" href="javascript:;" class="weui_btn_dialog primary" style="font-size: 1.5em;
                    line-height: 3em;">确定</a>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    function userlogin() {
        if ($.trim($("#tbusername").val()) == "") {
            $("#divalert").show();
            $("#alertNote").html("用户名不能为空");
        }
        else if ($.trim($("#tbpwd").val()) == "") {
            $("#divalert").show();
            $("#alertNote").html("密码不能为空");
        }
        else {
            $.get("ajax/UserLogin.ashx", { tbusername: $("#tbusername").val(), tbpwd: $("#tbpwd").val(), Time: Math.random() }, function (data) {
                if (data == "F") {
                    $("#divalert").show();
                    $("#alertNote").html("用户名或者密码错误");
                }
                else {
                    if (data == "0") {
                        window.location.href = "index.aspx";
                    }
                    else if (data == "1") {
                        window.location.href = "county.aspx";
                    }
                }
            })
        }
    }

    function clsalert() {
        $("#divalert").hide();
    }
</script>
