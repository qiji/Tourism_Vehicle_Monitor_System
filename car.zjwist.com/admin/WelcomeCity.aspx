<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="WelcomeCity.aspx.cs" Inherits="admin_WelcomeCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/stylejc2.css" rel="stylesheet" type="text/css" />
    <script src="http://cdn.tourzj.com/js/echarts.min.js" type="text/javascript"></script>
    <script src="http://cdn.tourzj.com/js/china.js" type="text/javascript"></script>
    <script src="../js/screenfull.js" type="text/javascript"></script>
    <script>
        SetSideMenu("Welcome");
    </script>
    <div class="ssjiance">
        <div class="ssjcblock">
            <div id="divScenicTop">
                <div class="ssjc_top">
                    <div class="ssjct_tl">
                        旅游车辆监控系统</div>
                    <div class="ssjct_right">
                        <div class="ssjct_jk">
                            共300个监控点</div>
                        <div class="ssjct_time">
                            2016.04.01 15:20:38</div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="ssjct_coner">
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="blackline">
                </div>
            </div>
            <div class="ssjc_switch">
                <div class="ssw_00">
                    <div class="bt_line btl_blue">
                    </div>
                    <div class="ssw00_pre">
                        <a href="javascript:;" id="btn_Pre" onclick="SummaryInfoClick(-1)"></a>
                    </div>
                    <div class="ssw00_main">
                        <%-- <div id="divSummaryInfo1" class="SummaryInfo" style="display: block">
                            <a href="javascript:;" class="sswm_tl">标题</a> 当前景区车辆： <span class="sp_red_big">8</span>
                            <br />
                            其中外地车辆总数：<span class="sp_green">100</span>
                            <br />
                            高速进入总数：<span class="sp_green">0</span> &nbsp;&nbsp;&nbsp; 高速离开总数：<span class="sp_green">0</span>
                        </div>
                        <div id="divSummaryInfo2" class="SummaryInfo" style="display: none">
                            <a href="javascript:;" class="sswm_tl">标题</a> 当前车辆： <span class="sp_red_big">8</span>
                            &nbsp;&nbsp;&nbsp;饱和 度：<span class="sp_green">8.00% </span>
                            <br />
                            平均逗留时间(小时)：<span class="sp_green">220.4小时</span><br>
                            进入车辆总数：<span class="sp_green">0</span> &nbsp;&nbsp;&nbsp; 离开车辆总数：<span class="sp_green">0</span>
                        </div>--%>
                    </div>
                    <div class="ssw00_next">
                        <a href="javascript:;" id="btn_Next" onclick="SummaryInfoClick(1)"></a>
                    </div>
                    <div class="clear">
                    </div>
                </div>
                <div class="ssw_01">
                    <div class="ssw_tl" id="divChart1">
                    </div>
                    <a class="sswtl_bu" onclick="ChartChange(0)"></a>
                    <div class="ssw_con">
                    </div>
                </div>
                <div class="ssw_02">
                    <div class="ssw_tl" id="divChart2">
                        表格名称</div>
                    <a class="sswtl_bu" onclick="ChartChange(1)"></a>
                    <div class="ssw_con">
                    </div>
                </div>
                <div class="ssw_03">
                    <div class="ssw_tl" id="divChart3">
                        表格名称</div>
                    <a class="sswtl_bu" onclick="ChartChange(2)"></a>
                    <div class="ssw_con">
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
            <div class="ssjc_main">
                <div class="ssjc_right_in">
                    <div class="ssjcr_tl">
                        <div class="ssjcrtl_txt">
                            今日车辆来源</div>
                        <div class="clear">
                        </div>
                    </div>
                    <div class="ssjcr_list">
                        <%-- <div class="ssjcr_li">
                            <div class="cityname">
                                上海</div>
                            <div class="citycardata">
                                25</div>
                        </div>
                        <div class="ssjcr_li">
                            <div class="cityname">
                                上海</div>
                            <div class="citycardata">
                                25</div>
                        </div>
                        <div class="ssjcr_li">
                            <div class="cityname">
                                上海</div>
                            <div class="citycardata">
                                25</div>
                        </div>
                        <div class="ssjcr_li">
                            <div class="cityname">
                                上海</div>
                            <div class="citycardata">
                                25</div>
                        </div>
                        <div class="ssjcr_li">
                            <div class="cityname">
                                上海</div>
                            <div class="citycardata">
                                25</div>
                        </div>
                        <div class="ssjcr_li">
                            <div class="cityname">
                                上海</div>
                            <div class="citycardata">
                                25</div>
                        </div>
                        <div class="ssjcr_li">
                            <div class="cityname">
                                上海</div>
                            <div class="citycardata">
                                25</div>
                        </div>
                        <div class="ssjcr_li">
                            <div class="cityname">
                                上海</div>
                            <div class="citycardata">
                                25</div>
                        </div>
                        <div class="ssjcr_li">
                            <div class="cityname">
                                上海</div>
                            <div class="citycardata">
                                25</div>
                        </div>--%>
                    </div>
                </div>
                <div class="ssw_04" id="divChart4">
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="ssScreen">
            <img src="../images/icon_zoomin.png" id="imgzoom" />
        </div>
    </div>
    <script>
        var IsScreen;
        var countyid = "<%= unitid %>";
        $(window).on("load", function () {
            //设置div 的高度

            $(".ssjiance").height($(".content").height() - 20);
            $(".ssjc_main").height($(".ssjiance").height() - 200);
            //$(".ssw_04").height($(".ssjc_main").height());

            IsScreen = GetCookie("IsScreen");
            if (IsScreen == null) {
                IsScreen = 0;
            }
            ShowInfo();
            ChartsInit();
        });

        $(".ssScreen").click(function () {
            IsScreen = 1 - IsScreen;
            SetCookie("IsScreen", IsScreen);
            ShowInfo();

        });

        function ShowInfo() {
            var elem = document.getElementsByClassName('ssjiance')[0];
            if (IsScreen == 1) {
                screenfull.request(elem);
                $("#divScenicTop").show();
                $(".ssjiance").height(document.documentElement.clientHeight - 20);

            }
            else {
                screenfull.exit();
                $("#divScenicTop").hide();
                $(".ssjiance").height($(".content").height() - 20);
            }
        }
    </script>
    <script src="welcomeCity.js" type="text/javascript"></script>
</asp:Content>
