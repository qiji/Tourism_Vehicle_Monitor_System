<%@ Page Language="C#" AutoEventWireup="true" CodeFile="oldindex.aspx.cs" Inherits="car_oldindex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=false">
    <link type="text/css" href="css/car.css" rel="stylesheet">
    <link type="text/css" href="http://weui.github.io/weui/weui.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <script src="http://echarts.baidu.com/dist/echarts.min.js"></script>
</head>
<body>
    <ul class="title">
        <li class='t menu1' onclick='redirct(1)'>实时数据</li>
        <li class='t menu2' onclick='redirct(2)'>统计数据</li>
    </ul>
    <div id="divindex">
        <div class="weui_cells" style="margin-top: 10px">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                        当前景区逗留车辆：<span id="nowcount" style="font-size: 23px; color: #009100;"></span><a style="margin-left:10px;top:-3px;" href="javascript:;" class="weui_btn weui_btn_mini weui_btn_primary" onclick="GetData()">刷新</a></p>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                        饱和度：<span id="nowlevel" style="font-size: 23px; color: #00688B;"></span></p>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                        今日进入车辆：<span id="entercount" style="font-size: 23px; color: #00688B;"></span></p>
                </div>
            </div>
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <p>
                        昨日过夜车辆：<span id="staynightcount" style="font-size: 23px; color: #00688B;"></span></p>
                </div>
            </div>
        </div>
        <div class="linediv">
            <div id="linemain" style="height: 210px; width: 98%;">
            </div>
        </div>
        <div class="linediv">
            <div id="divCarCountChange" style="height: 210px; width: 98%;">
            </div>
        </div>
        <div class="piediv">
            <div id="piemain" style="height: 210px; width: 98%;">
            </div>
            <table id="stattable" class="stattable">
            </table>
        </div>
        <div class="piediv">
            <div id="divCarType" style="height: 210px; width: 98%;">
            </div>
            <table id="CarTypeTable" class="stattable">
            </table>
        </div>
    </div>
    <div id="divstatinfo" style="display: none;">
            <table id="tbStatType" class="hovertable" style="margin-top:10px;margin-bottom:0px;">
                <tr>
                    <td onclick="stattype(1)">
                        来源统计
                    </td>
                    <td onclick="stattype(2)">
                        流量统计
                    </td>
                    <td onclick="stattype(3)">
                        车型统计
                    </td>
                </tr>
            </table>
            <input id="hidStatType" type="hidden" value="1" />
            <div id="divdatetime1" style="width: 100%">
                <input type="date" name="SDateTime" id="SDateTime" class="leftbox" /><span class="datespan">至</span><input
                    type="date" name="EDateTime" id="EDateTime" class="rightbox" />
            </div>
            <table id="hovertable" class="hovertable">
                <tr>
                    <td onclick="datetype(1)">
                        今天
                    </td>
                    <td onclick="datetype(7)">
                        本周
                    </td>
                    <td onclick="datetype(30)">
                        本月
                    </td>
                    <td onclick="datetype(365)">
                        本年
                    </td>
                </tr>
            </table>
            <table id="tbAreaType" class="hovertable">
                <tr>
                    <td onclick="SelAreaType(0)">
                        按省份
                    </td>
                    <td onclick="SelAreaType(1)">
                        按城市
                    </td>
                    <td onclick="SelAreaType(2)">
                        省内城市
                    </td>
                    <td onclick="SelAreaType(3)">
                        省外城市
                    </td>
                </tr>
            </table>
            <input id="AreaType" type="hidden" value="1" />
            <div id="divdatetime2" style="width: 100%">
                <input type="month" name="MonthBegin" id="MonthBegin" class="fullmonth"/>
                <input type="month" name="MonthCompare" id="MonthCompare" class="rightmonth" style="display:none"/>
                <a href="javascript:;" class="weui_btn weui_btn_primary" style="width:90%" onclick="showcompare(this)">对比</a>
            </div>
            <div id="divcategory" class="categorybtn">
                <ul class="category">
                    <li id="categorymenu2" class='t menu2' onclick='showdata()'>
                        <img src="image/icon1.png" class="i2"><span class="spancat">图形</span></li>
                    <li id="categorymenu1" class='t menu1' onclick='showdata()'>
                        <img src="image/icon2.png" class="i1"><span class="spancat">数据</span></li>
                </ul>
            </div>
            <table id="tbstat" class="stattable">
            </table>
            <div id="divstat1" style="height: 500px; width: 98%;">
            </div>
            <div id="divstat2" style="height: 500px; width: 98%;">
            </div>
    </div>
</body>
</html>
<script>
    var unitid = "<%=unitid %>";
    var datayesterday = "<%=datayesterday %>";
</script>
<script src="oldindex.js" type="text/javascript"></script>

