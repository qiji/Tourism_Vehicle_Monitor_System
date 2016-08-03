<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="StatFlow.aspx.cs" Inherits="admin_StatFlow" %>

<%@ Register Src="StatMenu.ascx" TagName="StatMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="actdata">
        <uc1:StatMenu ID="StatMenu1" runat="server" />
        <div class="StatMonth">
            <div class="statyear">
                <div class="statyeartable">
                    <asp:DropDownList runat="server" ID="ddlYear" CssClass="cssYear">
                    </asp:DropDownList>
                    年
                </div>
            </div>
            <div class="statyearmonthtable smbegintable">
                <%--<div class="statyearmonth statyearmonthselect">
                    一月
                </div>--%>
            </div>
            <div class="statmonthbalancebtntable">
                <div class="statmonthbalancebtn">
                    <%--对比--%>
                </div>
            </div>
        </div>
        <div class="smb_1">
            <div class="statmonthbalance">
                <div class="statyear">
                    <div class="statyeartable">
                        <asp:DropDownList runat="server" ID="ddlYearbalance" CssClass="cssYearBalance">
                        </asp:DropDownList>
                        年
                    </div>
                </div>
                <div class="statyearmonthtable smendtable">
                </div>
            </div>
        </div>
        <div class="statdivcharttitletable">
            <div class="statdivcharttitle">
                车辆来源分析
            </div>
        </div>
        <div class="statflowchart" id="sumChartCarChange">
        </div>
    </div>
    <script>
        $("#divbody").height(document.documentElement.clientHeight);
    
        var monthbegin = nowMonth;
        var monthend = nowMonth;


        function sumChartCarChange(SDate, FCount, CompareFCount) {

            lineChart = echarts.init(document.getElementById('sumChartCarChange'));

            if (CompareFCount.length != 0) { //需要对比
                lineChart.setOption({
                    tooltip: {
                        trigger: 'axis',
                        formatter: '{b0}日<br /><span style="color:rgb(111, 255, 219)">' + monthbegin + '月</span>:&nbsp{c0}<br /><span style="color:rgb(202, 67, 125)">' + monthend + '月</span>:&nbsp{c1}',
                        borderWidth: 1,
                        borderColor: '#ffffff',
                        textStyle: {
                            fontWeight: '100',
                            fontSize: 13
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: SDate,
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: 'rgb(89,65,123)'
                    }
                },
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff'
                    }
                }
            }],
                    yAxis: [
            {
                type: 'value',
                splitLine: false,
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff'
                    }
                }
            }],
                    series: [
            {
                type: 'line',
                itemStyle: {
                    normal: {
                        color: 'rgb(111, 255, 219)'
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgb(91, 19, 207)'
                        }, {
                            offset: 1,
                            color: 'rgb(49, 14, 72)'
                        }])
                    }
                },
                data: FCount
            },
            {
                type: 'line',
                itemStyle: {
                    normal: {
                        color: 'rgb(202, 67, 125)'
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgb(152, 86, 124)'
                        }, {
                            offset: 1,
                            color: 'rgb(49, 14, 72)'
                        }])
                    }
                },
                data: CompareFCount
            }]
                });
            } else {
                lineChart.setOption({
                    tooltip: {
                        trigger: 'axis',
                        formatter: '{b0}日<br /><span style="color:rgb(111, 255, 219)">' + monthbegin + '月</span>:&nbsp{c0}',
                        borderWidth: 1,
                        borderColor: '#ffffff',
                        textStyle: {
                            fontWeight: '100',
                            fontSize: 13
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [
            {
                type: 'category',
                boundaryGap: false,
                data: SDate,
                splitLine: {
                    show: true,
                    lineStyle: {
                        color: 'rgb(89,65,123)'
                    }
                },
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff'
                    }
                }
            }],
                    yAxis: [
            {
                type: 'value',
                splitLine: false,
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#fff'
                    }
                }
            }],
                    series: [
            {
                name: '数量',
                type: 'line',
                itemStyle: {
                    normal: {
                        color: 'rgb(111, 255, 219)'
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgb(91, 19, 207)'
                        }, {
                            offset: 1,
                            color: 'rgb(49, 14, 72)'
                        }])
                    }
                },
                data: FCount
            }]
                });
            }
        }


        function getData() {

            var monthendstr = "";
            if ($(".statmonthbalance").is(":visible")) {
                monthendstr = $(".cssYearBalance").find("option:selected").val() + "-" + monthend;
            }

            $.getJSON("../ajax/StatGetCarFlowInfo.ashx",
                {
                    MonthBegin: $(".cssYear").find("option:selected").val() + "-" + monthbegin,
                    MonthEnd: monthendstr,
                    UnitID: "<%=unitid %>",
                    r: Math.random()
                },
                function (e) {
                    sumChartCarChange(e.SDate, e.FCount, e.CompareFCount);

                });
        }

        function monthbeginonclick(Month, divobj) {

            $(".statyearmonthbegin").removeClass("statformatdateselect");
            divobj.className += " statformatdateselect";
            monthbegin = Month;
            getData();
        }

        function monthendonclick(Month, divobj) {

            $(".statyearmonthend").removeClass("monthendselect");
            divobj.className += " monthendselect";
            monthend = Month;
            getData();
        }

        

        function SetMonthDiv() {
            $(".statmonthbalancebtn").html("对比");

            var monthbeginhtml = "";
            var monthendhtml = "";
            var j;
            for (var i = 0; i < 12; i++) {
                if (i < 9) {
                    j = i + 1;
                    j = "0" + j;
                }
                else {
                    j = i + 1;
                }

                if (j==monthbegin)
                {
                    monthbeginhtml += "<div class='statyearmonthbegin statformatdateselect' onclick='monthbeginonclick("+j+",this)'>" + j + "月 </div>";
                    monthendhtml += "<div class='statyearmonthend statformatdateselect' onclick='monthendonclick("+j+",this)'>" + j + "月 </div>";
                }
                else
                {
                    monthbeginhtml += "<div class='statyearmonthbegin' onclick='monthbeginonclick("+j+",this)'>" + j + "月 </div>";
                    monthendhtml += "<div class='statyearmonthend'onclick='monthendonclick("+j+",this)'>" + j + "月 </div>";
                }

            }
            $(".smbegintable").html(monthbeginhtml);
            $(".smendtable").html(monthendhtml);
            getData();
        }
        SetMonthDiv();


        $(".statmonthbalancebtn").on("click", function () {
            if ($(".statmonthbalance").is(":hidden")) {
                $(".statmonthbalance").show();
                $(".statmonthbalancebtn").html("取消对比");
            }
            else {
                $(".statmonthbalance").hide();
                $(".statmonthbalancebtn").html("对比");
            }
        });
    </script>
</asp:Content>
