<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Mobile_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>旅游车辆监测统计分析系统</title>
    <link href="css/jcwap.css" rel="stylesheet" type="text/css">
    <link type="text/css" href="http://weui.github.io/weui/weui.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        (function () {
            var phoneWidth = parseInt($(window).width()),
				phoneScale = phoneWidth / 640,
				ua = navigator.userAgent;

            if (/Android (\d+\.\d+)/.test(ua)) {
                var version = parseFloat(RegExp.$1);
                // andriod 2.3
                if (version > 2.3) {
                    document.write('<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">');
                    $(window).bind('resize load', function () {
                        $("body").css("zoom", $(window).width() / 640);
                        $("body").css("display", "block");
                    });
                    // andriod 2.3以上
                } else {
                    document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
                }
                // 其他系统
            } else {
                document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
            }
        })();
    </script>
</head>
<body>
<!--头部-->
   <div class="logintl">
      旅游车辆监测统计分析系统
   </div>
   <div class="clear"></div>
<!--主体-->
<div id="logincontent">
    <div class="logblock">
      <div class="logcname">用户名</div>
      <div class="logcinput">
        <form name="form1" method="post" action="">
           <label for="textfield"></label>
           <input class="textfield" type="text" id="tbusername"/>
         </form>
       </div>
       <div class="clear"></div>
    </div>
    <div class="blankline"></div>
    <div class="logblock">
      <div class="logcname">密&nbsp;&nbsp;&nbsp;码</div>
      <div class="logcinput">
        <form name="form1" method="post" action="">
           <label for="textfield"></label>
           <input class="textfield" type="password" id="tbpwd"/>
         </form>
       </div>
       <div class="clear"></div>
    </div>
    <a class="bulogin" href="#" onclick="userlogin()">登&nbsp;&nbsp; 录</a>
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
                        window.location.href = "oldindex.aspx";
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
