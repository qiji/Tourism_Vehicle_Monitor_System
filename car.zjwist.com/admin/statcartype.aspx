<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="statcartype.aspx.cs" Inherits="admin_statcartype" %>

<%@ Register Src="StatMenu.ascx" TagName="StatMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        SetCookie("SetStatformatSelect", "statmenu1");
    </script>
    <div class="actdata">
        <uc1:StatMenu ID="StatMenu1" runat="server" />
        <div class="centerdivleft">
            <div class="cttopleft">
                <div class="cttimg">
                </div>
                <div class="cttdatechang">
                    <input type="date" class="sumdateinput" id="datetimebengin">
                    <div class="sumdatetexttable">
                        <div class="sumdatetextcell">
                            至
                        </div>
                    </div>
                    <input type="date" class="sumdateinput" id="datetimeend">
                </div>
                <div class="ctttimechang2">
                    <div class="statformatdate2 statformatdateselect2" onclick="statcarformatdate(1,this)">
                        今日
                    </div>
                    <div class="statformatdate2" onclick="statcarformatdate(2,this)">
                        本周
                    </div>
                    <div class="statformatdate2" onclick="statcarformatdate(3,this)">
                        本月
                    </div>
                    <div class="statformatdate2" onclick="statcarformatdate(4,this)">
                        本年
                    </div>
                </div>
            </div>
            <div class="ctbottom">
                <div class="statdivcharttitletable">
                    <div class="statdivcharttitle">
                        车辆类型
                    </div>
                </div>
                <div class="statcartypechart" id="sumChartCarType">
                </div>
                <div class="statdivcartype">
                    <div class="statcenterdivcartype">
                        <div class="sccartypetext">
                            轿车</div>
                        <div class="sccartypevalue" id="sccartypevalue">
                            536</div>
                    </div>
                    <div class="statcenterdivbustype">
                        <div class="scbustypetext">
                            客车</div>
                        <div class="scbustypevalue" id="scbustypevalue">
                            456</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="centerdivright">
            <div class="stattabletitle">
                <span class="statexecltitle">车辆类型分析表格</span> <span class="statexeclopt" onclick="ExportToExcel('gridview1','来源地分析')">导出</span>
            </div>
           
            <div class="comefromtable">
                <div class="statexecl">
                    <table class="gridview1 statexeclstyle" id="cartypeexecl" cellspacing="0" cellpadding="0">
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        $("#divbody").height(document.documentElement.clientHeight);
    </script>
    <script>

        var table = document.getElementById("cartypeexecl");

        function addRow(cellvalue1, cellvalue2) {
            var newRow = table.insertRow(); //创建新行
            var newCell1 = newRow.insertCell(); //创建新单元格
            newCell1.innerHTML = cellvalue1; //单元格内的内容
            newCell1.setAttribute("align", "center"); //设置位置
            var newCell2 = newRow.insertCell(); //创建新单元格
            newCell2.innerHTML = cellvalue2; //单元格内的内容
            newCell2.setAttribute("align", "center"); //设置位置

        }

        function sumChartCarType(CarType, TypeCount) {
            
            
            var sumpieChart = echarts.init(document.getElementById('sumChartCarType'));
            option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                series: [
                    {
                        type: 'pie',
                        radius: ['10%', '50%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                show: true,
                                textStyle: {
                                    color: 'rgb(255, 255, 255)',
                                    fontSize: 18
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: true,
                                lineStyle: {
                                    type: 'solid'
                                },
                                length: 20,
                                length2: 60
                            }
                        },
                        data: []
                    }]
            }

            //根据车辆类型定义扇形区域颜色
            function getpiecolor(sumcartype) {
                if (sumcartype == "客车") {
                    return 'rgb(125,62,231)'
                } else {
                    return 'rgb(83,34,159)';
                }
            }
            for (var i = 0; i < CarType.length; i++) {
                option.series[0].data.push({
                    value: TypeCount[i],
                    name: CarType[i],
                    itemStyle: {
                        normal: {
                            color: getpiecolor(CarType[i])
                        }
                    }
                });
            }
            sumpieChart.setOption(option);
        }

        function getData() {
            $.getJSON("../ajax/StatGetCarTypeInfo.ashx",
                     {
                         BeginDate: $("#datetimebengin").val(),
                         EndDate: $("#datetimeend").val(),
                         UnitID: "<%=unitid %>",
                         r: Math.random()
                     },
                     function (e) {
                         $("#sccartypevalue").text("");
                         $("#scbustypevalue").text("");

                         sumChartCarType(e.CarType, e.TypeCount);
                         for (var i = table.rows.length - 1; i >= 0; i--) {
                             document.getElementById("cartypeexecl").deleteRow(0);
                         }
                         addRow("车型", '数量');
                         for (var i = 0; i < e.CarType.length; i++) {
                             addRow(e.CarType[i], e.TypeCount[i]);
                             switch (e.CarType[i]) {
                                 case "客车":
                                     $("#scbustypevalue").text(e.TypeCount[i]);
                                     break;
                                 case "轿车":
                                     $("#sccartypevalue").text(e.TypeCount[i]);
                                     break;
                             }
                         }
                     })
        }


        function statcarformatdate(datetype, divobj) {
            $(".statformatdate2").removeClass("statformatdateselect2");
            divobj.className += " statformatdateselect2";


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

            $("#statformatdate2").addClass("statformatdateselect2");
            //需要立即查询
            getData();
        }

        function cartypeinit() {
            $("#datetimebengin").val(getTodayBegin());
            $("#datetimeend").val(getTodayEnd());
            getData();

        }

        cartypeinit();
    </script>
</asp:Content>
