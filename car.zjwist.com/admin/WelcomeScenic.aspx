<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="WelcomeScenic.aspx.cs" Inherits="admin_WelcomeScenic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/echarts/3.2.2/echarts.common.min.js"></script>
   
    <script src="../js/screenfull.js" type="text/javascript"></script>
    <script>
        SetMenuSelect("liactdata");
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
                        <div class="currdatavalue">
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
                        <div class="currdatavalue">
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
                        <span class="ct2value">999</span>
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
                        <span class="ct2value">999</span>
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
                    <div class="ct3valuetop">
                        333
                    </div>
                </div>
                <div class="ct3top ct3bottom">
                    <div class="ct3imgbottom">
                    </div>
                    <div class="ct3title">
                        离开车辆
                    </div>
                    <div class="ct3valuebottom">
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
                        <div class="ct4value">
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
                        <div class="ct4value">
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
                <div class="charttopleft">
                    旅游车辆迁徙图</div>
                <div class="charttopright">
                </div>
            </div>
            <div class="chartcenterdiv">
                中间
            </div>
        </div>
        <div class="bodyright">
            <div class="bodyrighttop">
                <div class="charttop">
                    <div class="charttopleft">
                        今日车辆变化</div>
                    <div class="charttopright">
                    </div>
                </div>
                <div class="chartdiv">
                </div>
            </div>
            <div class="blankheight1">
            </div>
            <div class="bodyrightcenter">
                <div class="charttop">
                    <div class="charttopleft">
                        今日进出车辆</div>
                    <div class="charttopright">
                    </div>
                </div>
                <div class="chartdiv">
                </div>
            </div>
            <div class="blankheight1">
            </div>
            <div class="bodyrightbottom">
                <div class="charttop">
                    <div class="charttopleft">
                        今日车辆来源</div>
                    <div class="charttopright">
                    </div>
                </div>
                <div class="chartdiv">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
