<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="statcomefrom.aspx.cs" Inherits="admin_statcomefrom" %>

<%@ Register Src="StatMenu.ascx" TagName="StatMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        SetCookie("StatMenuSelect", "statmenu1");
    </script>
    <div class="actdata">
        <uc1:StatMenu ID="StatMenu1" runat="server" />
        <div class="clear">
        </div>
        <div class="centerdivleft">
            <div class="cttopleft">
                <div class="cttimg">
                </div>
                <div class="cttdatechang">
                    <input type="date" class="sumdateinput" id="datetimebengin">
                    <div class="sumdatetexttable">
                        <div class="sumdatetextcell">
                            至</div>
                    </div>
                    <input type="date" class="sumdateinput" id="datetimeend">
                </div>
                <div class="ctttimechang1">
                    <div class="statformatdate1 statformatdateselect" onclick="statcarformatdate(1,this)">
                        今日
                    </div>
                    <div class="statformatdate1" onclick="statcarformatdate(2,this)">
                        本周
                    </div>
                    <div class="statformatdate1" onclick="statcarformatdate(3,this)">
                        本月
                    </div>
                    <div class="statformatdate1" onclick="statcarformatdate(4,this)">
                        本年
                    </div>
                </div>
                <div class="cttcomefromtype">
                    <div class="sumareatext sumareatextselect" onclick="statcarareatype(0,this)">
                        按省份
                    </div>
                    <div class="sumareatext" onclick="statcarareatype(1,this)">
                        按城市
                    </div>
                    <div class="sumareatext" onclick="statcarareatype(2,this)">
                        省内城市
                    </div>
                    <div class="sumareatext" onclick="statcarareatype(3,this)">
                        省外城市
                    </div>
                </div>
            </div>
            <div class="ctbottom">
                <div class="statdivcharttitletable">
                    <div class="statdivcharttitle">
                        车辆来源分析
                    </div>
                </div>
                <div class="statdivcharts1" id="sumChartComeFrom">
                </div>
                <div class="statdivcharttitletable">
                    <div class="statdivcharttitle">
                        逗留时间分析
                    </div>
                </div>
                <div class="statdivcharts1" id="sumChartStayTime">
                </div>
            </div>
        </div>
        <div class="centerdivright">
            <div class="stattabletitle">
                <span class="statexecltitle">车辆来源地分析表格</span> <span class="statexeclopt" onclick="ExportToExcel('gridview1','来源地分析')">导出</span>
            </div>
            <div class="comefromtable">
                <div class="statexecl">
                    <table class="gridview1 statexeclstyle" id="carcomefromexecl" cellspacing="0" cellpadding="0">
                    </table>
                </div>
            </div>
            <div class="stattabletitle">
                <span class="statexecltitle">逗留时间分析表格</span> <span class="statexeclopt" onclick="ExportToExcel('gridview1','来源地分析')">导出</span>
            </div>
            <div class="stayhourtable">
                <div class="statexecl">
                    <table class="gridview1 statexeclstyle" id="carstayhourexecl" cellspacing="0" cellpadding="0">
                    </table>
                </div>
            </div>
        </div>
    </div>
     <script>
         $("#divbody").height(document.documentElement.clientHeight);
    </script>
    <script>

        var sumareatype;


        var comefrom = document.getElementById("carcomefromexecl");
        
        function CFaddRow(cellvalue1, cellvalue2) {
            
            var newRow = comefrom.insertRow(); //创建新行
            var newCell1 = newRow.insertCell(); //创建新单元格
            newCell1.innerHTML = cellvalue1; //单元格内的内容
            newCell1.setAttribute("align", "center"); //设置位置
            var newCell2 = newRow.insertCell(); //创建新单元格
            newCell2.innerHTML = cellvalue2; //单元格内的内容
            newCell2.setAttribute("align", "center"); //设置位置

        }

        var stayhour = document.getElementById("carstayhourexecl");
        function SHaddRow(cellvalue1, cellvalue2) {
            var newRow = stayhour.insertRow(); //创建新行
            var newCell1 = newRow.insertCell(); //创建新单元格
            newCell1.innerHTML = cellvalue1; //单元格内的内容
            newCell1.setAttribute("align", "center"); //设置位置
            var newCell2 = newRow.insertCell(); //创建新单元格
            newCell2.innerHTML = cellvalue2; //单元格内的内容
            newCell2.setAttribute("align", "center"); //设置位置

        }

        function sumCarComeFrom(ChartCityName, ChartCityCount) {
            sumColumnChart = echarts.init(document.getElementById('sumChartComeFrom'));

            for (var i = 0; i < 20; i++) {
                while (ChartCityName[i] == null) {
                    ChartCityCount.push("0");
                    ChartCityName.push(" ");
                }
            }

            sumColumnChart.setOption({
                color: ["#6fffdc"],
                tooltip: {
                    trigger: 'axis',
                    formatter: '{b0}<br />{c0}',
                    borderWidth: 2,
                    borderColor: '#ffffff',
                    textStyle: {
                        fontWeight: '100',
                        fontSize: 8
                    },
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
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
                data: ChartCityName,
                axisTick: {
                    alignWithLabel: true
                },
                splitLine: false,
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
                series: [
            {
                name: '来源地',
                type: 'bar',
                barWidth: '40%',
                itemStyle: {
                    normal: {
                        shadowBlur: 30,
                        shadowColor: 'rgba(0, 255, 169,1)'
                    }
                },
                data: ChartCityCount
            }]
            });
        }

        //统计数据下逗留时长分析
        function sumChartStayTime(STCityName, StayTime) {
            var pieChart = echarts.init(document.getElementById('sumChartStayTime'));

            for (var i = 0; i < 20; i++) {
                while (StayTime[i] == null) {
                    StayTime.push("0");
                    STCityName.push(" ");
                }
            }

            pieChart.setOption({
                color: ["#6fffdc"],
                tooltip: {
                    trigger: 'axis',
                    formatter: '{b0}<br />{c0}',
                    borderWidth: 2,
                    borderColor: '#ffffff',
                    textStyle: {
                        fontWeight: '100',
                        fontSize: 8
                    },
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
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
            data: STCityName,
            axisTick: {
                alignWithLabel: true
            },
            splitLine: false,
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
                series: [
        {
            name: '来源地',
            type: 'bar',
            barWidth: '40%',
            itemStyle: {
                normal: {
                    shadowBlur: 30,
                    shadowColor: 'rgba(0, 255, 169,1)'
                }
            },
            data: StayTime
        }]
            });
        }
        
        function getData() {
            $.getJSON("../ajax/StatGetCarComeFrom.ashx",
                     {
                         BeginDate: $("#datetimebengin").val(),
                         EndDate: $("#datetimeend").val(),
                         AreaType: sumareatype,
                         UnitID: "<%=unitid %>",
                         r: Math.random()
                     },
                     function (e) {
                         for (var i = comefrom.rows.length - 1; i >= 0; i--) {
                             comefrom.deleteRow(0);
                         }
                         CFaddRow("来源地", "数量");
                         for (var i = 0; i < e.CityName.length; i++) {
                             CFaddRow(e.CityName[i], e.ComeCount[i]);
                         }

                         for (var i = stayhour.rows.length - 1; i >= 0; i--) {
                             stayhour.deleteRow(0);
                         }
                         SHaddRow("来源地", "时长");
                         for (var i = 0; i < e.STCityName.length; i++) {
                             SHaddRow(e.STCityName[i], e.StayTime[i]);
                         }


                         sumCarComeFrom(e.CityName, e.ComeCount);
                         sumChartStayTime(e.STCityName, e.StayTime);

                         
                     })
        }

        function statcarareatype(areatype, divobj) {
            $(".sumareatext").removeClass("sumareatextselect");
            divobj.className += " sumareatextselect";

            sumareatype = areatype;

            //需要立即查询
            getData();
        }


        function statcarformatdate(datetype, divobj) {
            $(".statformatdate1").removeClass("statformatdateselect");
            divobj.className += " statformatdateselect";


            switch (datetype) {
                case 1:
                    $("#datetimebengin").val(getTodayBegin());
                    $("#datetimeend").val(getTodayEnd());

                    break;
                case 2:
                    $("#datetimebengin").val(getWeekBegin());
                    $("#datetimeend").val(getWeekEnd());

                    break;
                case 3:
                    $("#datetimebengin").val(getMonthBegin());
                    $("#datetimeend").val(getMonthEnd());

                    break;
                case 4:
                    $("#datetimebengin").val(getYearBegin());
                    $("#datetimeend").val(getYearEnd());

                    break;
            }

            $("#statformatdate1").addClass("statformatdateselect1");
            //需要立即查询
            getData();
        }

        function cartypeinit() {
            $("#datetimebengin").val(getTodayBegin());
            $("#datetimeend").val(getTodayEnd());
            sumareatype = 0;
            getData();

        }

        cartypeinit();
    </script>
</asp:Content>
