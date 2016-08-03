<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="WelcomeScenic.aspx.cs" Inherits="admin_WelcomeScenic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="http://cdn.bootcss.com/echarts/3.2.2/echarts.min.js"></script>
    <script src="http://echarts.baidu.com/asset/map/js/china.js"></script>
    

    <script src="../js/screenfull.js" type="text/javascript"></script>
    <script>
        SetMenuSelect("liactdata");
        $("#divbody").height(document.documentElement.clientHeight);
    </script>
    <div class="actdata">
        <div class="centertop">
            <div class="centertop1">
                <div class="ct1top">
                    <div class="ct1topleft ct1topimage1">
                        <div class="currdatatext">
                            当前景区停留
                        </div>
                    </div>
                    <div class="ct1topright">
                        <div class="currdatavalue" id="nowcount">
                            888
                        </div>
                    </div>
                </div>
                <div class="ct1top">
                    <div class="ct1topleft ct1topimage2">
                        <div class="currdatatext">
                            当前饱和度
                        </div>
                    </div>
                    <div class="ct1topright">
                        <div class="currdatavalue" id="nowlevel">
                            888
                        </div>
                    </div>
                </div>
                <div class="ct1bottom">
                    <div class="scalebarbackground">
                        <div class="scalebarflat">
                        </div>
                    </div>
                </div>
            </div>
            <div class="centertop2">
                <div class="ct2left">
                    <div class="ct2leftimg">
                        &nbsp;</div>
                    <div class="ct2text">
                        <span class="ct2value" id="entercount">999</span>
                        <br />
                        <span class="ct2title">今日进入车辆</span>
                    </div>
                    <div class="ct2leftflag">
                    </div>
                </div>
                <div class="ct2right">
                    <div class="ct2rightimg">
                        &nbsp;</div>
                    <div class="ct2text">
                        <span class="ct2value" id="staynightcount">999</span>
                        <br />
                        <span class="ct2title">昨日过夜车辆</span>
                    </div>
                    <div class="ct2rightflag">
                    </div>
                </div>
            </div>
            <div class="centertop3">
                <div class="ct3line">
                </div>
                <div class="ct3top">
                    <div class="ct3imgtop">
                    </div>
                    <div class="ct3title">
                        进入车辆
                    </div>
                    <div class="ct3valuetop" id="carennercount">
                        333
                    </div>
                </div>
                <div class="ct3top ct3bottom">
                    <div class="ct3imgbottom">
                    </div>
                    <div class="ct3title">
                        离开车辆
                    </div>
                    <div class="ct3valuebottom" id="carleavecount">
                        333
                    </div>
                </div>
            </div>
            <div class="centertop4">
                <div class="ct4line">
                </div>
                <div class="ct4content">
                    <div class="ct4imgleft">
                    </div>
                    <div class="ct4table">
                        <div class="ct4title">
                            轿车
                        </div>
                    </div>
                    <div class="ct4table">
                        <div class="ct4value" id="typebycar">
                            1200
                        </div>
                    </div>
                </div>
                <div class="ct4content ct4contentright">
                    <div class="ct4imgright">
                    </div>
                    <div class="ct4table">
                        <div class="ct4title">
                            客车
                        </div>
                    </div>
                    <div class="ct4table">
                        <div class="ct4value" id="typebybus">
                            1200
                        </div>
                    </div>
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
                        今日车辆变化</div>
                    <div class="charttopright" onclick="ChartChange(0)">
                    </div>
                </div>
                <div class="chartdiv" id="divchart1">
                    右1
                </div>
            </div>
            <div class="blankheight1">
            </div>
            <div class="bodyrightcenter">
                <div class="charttop">
                    <div class="charttopleft charttitle2">
                        今日进出车辆</div>
                    <div class="charttopright" onclick="ChartChange(1)">
                    </div>
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
                        今日车辆来源</div>
                    <div class="charttopright" onclick="ChartChange(2)">
                    </div>
                </div>
                <div class="chartdiv" id="divchart3">
                    右3
                </div>
            </div>
        </div>
    </div>
    <script src="../js/screenfull.js" type="text/javascript"></script>
    <script>

        var unitid = "<%=unitid %>";
        var centerlat = "<%=centerlat %>";
        var centerlnt = "<%=centerlnt %>";
        var unitzoom = "<%=unitzoom %>";

        var rightlat = "<%=rightlat %>";
        var rightlnt = "<%=rightlnt %>";
        var rightunitzoom = "<%=rightunitzoom %>";

        var IsFullScreen = 0;
        $(".changescreenmode").on("click", function () {

            IsFullScreen = 1 - IsFullScreen;
            ShowInfo();

        });

        function ShowInfo() {
            var elem = document.getElementsByClassName('form1')[0];

            if (IsFullScreen == 1) {
                $(".leftmenu").hide();
                $(".rightbody").css("width", "100%");
                screenfull.request(elem);
                $("#divbody").height($("#divbody").height() + 100);
                $(".changescreenmode").css("background-image", "url(../images/screenrestore.png)");
            }
            else {
                screenfull.exit();
                $(".leftmenu").show();
                $(".rightbody").css("width", "87.5%");
                $("#divbody").height($("#divbody").height() - 100);
                $(".changescreenmode").css("background-image", "url(../images/screenfull.png)");
            }
        };
        
    </script>
    <script src="welcomeScenic.js" type="text/javascript"></script>
</asp:Content>
