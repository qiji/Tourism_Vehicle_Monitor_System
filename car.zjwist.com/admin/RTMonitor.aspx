<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RTMonitor.aspx.cs" Inherits="admin_RTMonitor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>景区旅游车辆实时监测</title>
    <link href="../css/stylejc.css" rel="stylesheet" type="text/css">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js" type="text/javascript"></script>
    <script src="http://cdn.tourzj.com/js/echarts.min.js" type="text/javascript"></script>
    <script src="http://ecomfe.github.io/echarts-builder-web/map/js/china.js" type="text/javascript"></script>
</head>
<body class="jiance">
    <form id="form1" runat="server">
    <div class="jcblock">
        <div class="jc_left" id="divMigration">
            <%--<div class="jc_left_in">
                ssd</div>--%>
        </div>
        <div class="jc_right">
            <div class="jc_ra">
                <div class="jcr_single" id="divCurrData">
                </div>
            </div>
            <div class="jc_rb" id="divCarCurrChange">
            </div>
            <div class="jc_rc" id="divCarCountChange">
            </div>
            <div class="jc_rd" id="divCarType">
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    </form>
    <script>
        $(window).on("load", function () {
            $(".jcblock").height(document.documentElement.clientHeight - 30);
        });
        $(window).on("resize", function () {
            $(".jcblock").height(document.documentElement.clientHeight - 30);
        });

        var DestName = "<%=DestName %>";
    </script>
    <script src="RTMonitor.js" type="text/javascript"></script>
</body>
</html>
