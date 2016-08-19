<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Mobile_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>旅游车辆监测分析系统</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="css/newlogin.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <header>
        <div class="container">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-xs-12">
            <span>古堰画乡旅游车辆检测</span>
            </div>
        </div>
        </div>
    </header>
    <div class="login">
        <div class="container">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-xs-12">
            <div class="login_box">
                <p><label for="zh">账号:</label><input type="text" id="tbusername" runat="server"></p>
                <p><label for="pw">密码:</label><input type="password" id="tbpwd" runat="server"></p>
            </div>
            <div class="loginbutton" ><input id="btnLogin" type="button" value="登录" class="btnlogin" onclick="userlogin()" /></div>
            </div>
        </div>
        </div>
    </div>
    <div class="copy">
        <span>技术支持:浙江智旅信息有限公司</span>
    </div>

    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            var h = $(window).height();
            $("body").height(h);
            if (h < 380) {
                $(".login_box").css("paddingTop", 30);
                $(".login_box > p").css("marginBottom", 28);
            }
        })
    </script>
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
