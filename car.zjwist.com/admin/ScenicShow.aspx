<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ScenicShow.aspx.cs" Inherits="admin_ScenicShow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="http://cdn.bootcss.com/echarts/3.2.2/echarts.min.js"></script>
    <script src="http://echarts.baidu.com/asset/map/js/china.js"></script>
    <script src="../js/screenfull.js" type="text/javascript"></script>
    <script src="../js/jsdate.js" type="text/javascript"></script>
    <script>
        SetMenuSelect("liactdata");
        $("#divbody").height(document.documentElement.clientHeight);
    </script>
    
    <div class="actdata">
        <div class="centertop">
            <div class="centertop1">
                <div class="ct1datechange">
                    <span>日期选择</span>
                    <div>
                        <input type='date' id="datechange"/>
                    </div>
                    <div class="divdatechange" onclick="datechangeonclick()">确定</div>
                </div>
                
            </div>
            <div class="centertop2">
                <div class="ct2left">
                    <div class="ct2leftimg">
                        &nbsp;</div>
                    <div class="ct2text">
                        <span class="ct2value" id="entercount"></span>
                        <br />
                        <span class="ct2title">今日进入车辆</span>
                    </div>
                    <div class="ct2leftflag">
                    &nbsp;
                    </div>
                </div>
                <div class="ct2right">
                    <div class="ct2rightimg">
                        &nbsp;</div>
                    <div class="ct2text">
                        <span class="ct2value" id="staynightcount"></span>
                        <br />
                        <span class="ct2title">昨日过夜车辆</span>
                    </div>
                    <div class="ct2rightflag">
                    &nbsp;
                    </div>
                </div>
            </div>
            
            <div class="centertop4">
                <div class="ct2left">
                    <div class="typecarimg">
                        &nbsp;</div>
                    <div class="ct2text">
                        <span class="ct2value" id="typebycar"></span>
                        <br />
                        <span class="ct2title">轿车数量</span>
                    </div>
                    <div class="ct2leftflag"></div>
                </div>
                <div class="ct2right">
                    <div class="typebusimg">
                        &nbsp;</div>
                    <div class="ct2text">
                        <span class="ct2value" id="typebybus">0</span>
                        <br />
                        <span class="ct2title">客车数量</span>
                    </div>
                    <div class="ct2rightflag"></div>
                </div>
            </div>
        </div>
        <div class="blankheight1">
        </div>
        <div class="bodycenter">
            <div class="charttop">
                <div class="charttopleft charttitle4">
                    旅游车辆迁徙图</div>
                <div class="changescreenmode">
                </div>
            </div>
            <div class="chartcenterdiv" id="divchart4">
                中间
            </div>
        </div>
        <div class="bodyright">
            <div class="bodyrighttop">
                <div class="charttop">
                    <div class="charttopleft charttitle1">
                        各点位进出情况</div>
                </div>
                <div class="chartdiv" style="padding:50px">
                    <table  class="deviceinfoexeclstyle" id="deviceinfoexcel" cellspacing="0" cellpadding="0"  >
                    </table>
                </div>
            </div>
            <div class="blankheight1">
            </div>
            <div class="bodyrightcenter">
                <div class="charttop">
                    <div class="charttopleft charttitle2">
                        当日进入车辆</div>
                   <%-- <div class="charttopright" onclick="ChartChange(1)">
                    </div>--%>
                </div>
                <div class="chartdiv" id="divchart2">
                    右2
                </div>
            </div>
            <div class="blankheight1">
            </div>
            <div class="bodyrightbottom">
                <div class="charttop">
                    <div class="charttopleft charttitle3">
                        当日车辆来源</div>
                    <%--<div class="charttopright" onclick="ChartChange(2)">
                    </div>--%>
                </div>
                <div class="chartdiv" id="divchart3">
                    右3
                </div>
            </div>
        </div>
    </div>
   
    <script>

        var unitid = "<%=unitid %>";
        var centerlat = "<%=centerlat %>";
        var centerlnt = "<%=centerlnt %>";
        var unitzoom = "<%=unitzoom %>";


        $(".leftmenu").hide();
        $(".rightbody").css("width", "100%");
       
        $("#divbody").height($("#divbody").height() + 100);

    </script>
    <script src="welcomeScenic.js" type="text/javascript"></script>
</asp:Content>

