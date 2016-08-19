<%@ Page Language="C#" AutoEventWireup="true" CodeFile="statcarcount.aspx.cs" Inherits="statcarcount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <title>车辆进出统计</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js" type="text/javascript"></script>   
    <script src="http://cdn.bootcss.com/echarts/3.2.2/echarts.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="ciline">
           
            <input id="Begin" type="button" value="前一天" style=" width:100px; height:30px;"/>

            <input id="End" type="button" value="后一天" style=" width:100px; height:30px;"/>

            <input id="tbBeginTime" name="tbBeginTime" class="tbBeginTime" type="date" style="width: 145px" />
        </div>
        <div id="CurrCountData" style="height: 300px">
        </div>
        <div id="DifferenceData1" style="height: 300px">
        </div>
        <div id="DifferenceData2" style="height: 300px">
        </div>
    </div>
    </form>

    
    <script>

        function DifferenceData2(FiveMinute, CarCount) {

            var DifferenceData = echarts.init(document.getElementById('DifferenceData2'));

            DifferenceData.setOption({
                tooltip: {
                    trigger: 'axis',

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
                    data: FiveMinute,
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: 'rgb(89,65,123)'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#000'
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
                            color: '#000'
                        }
                    }
                }],
                series: [
                {
                    name: '差值',
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
                    data: CarCount
                }]

            });
        }

        function DifferenceData1(FiveMinute, CarCount) {

            var DifferenceData = echarts.init(document.getElementById('DifferenceData1'));

            DifferenceData.setOption({
                tooltip: {
                    trigger: 'axis',
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
                    data: FiveMinute,
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: 'rgb(89,65,123)'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#000'
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
                            color: '#000'
                        }
                    }
                }],
                series: [
                {
                    name: '差值',
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
                    data: CarCount
                }]

            });
        }

        function CurrCountData(FiveMinute, EnterCount, LeaveCount) {

            var CurrCountData = echarts.init(document.getElementById('CurrCountData'));


            function gettooltipstring(params) {
                if (params[0].value == null) {
                    return params[0].name + '<br /><span style="color:#47fad0">∨</span> <br /><span style="color:red">∧</span>';
                }
                else {
                    return params[0].name + '<br /><span style="color:#47fad0">∨</span>' + params[0].value + '<br /><span style="color:red">∧</span>' + params[1].value;
                }
            }

            CurrCountData.setOption({
                tooltip: {
                    trigger: 'axis',
                    formatter: function (params) {
                        return gettooltipstring(params);
                    },
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
                    data: FiveMinute,
                    splitLine: {
                        show: true,
                        lineStyle: {
                            color: 'rgb(89,65,123)'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#000'
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
                            color: '#000'
                        }
                    }
                }],
                series: [
                {
                    name: '进入',
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
                    data: EnterCount
                },
                {
                    name: '离开',
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
                    data: LeaveCount
                }]
            });

        }




        var str;


        //格局化日期：yyyy-MM-dd 
        function formatDate(date) {
            var myyear = date.getFullYear();
            var mymonth = date.getMonth() + 1;
            var myweekday = date.getDate();

            if (mymonth < 10) {
                mymonth = "0" + mymonth;
            }
            if (myweekday < 10) {
                myweekday = "0" + myweekday;
            }
            return (myyear + "-" + mymonth + "-" + myweekday);
        }


        //获取当天
        function getToday() {
            var dd = new Date();
            return formatDate(dd);
        }


        //获得当天 + 1
        function getTodayAfter(d) {
            var dd = new Date(d);
            dd.setDate(dd.getDate() + 1); //获取AddDayCount天后的日期
            return formatDate(dd);
        }

        //获得当天 - 1
        function getTodayBefore(d) {
            var dd = new Date(d);
            dd.setDate(dd.getDate() - 1); //获取AddDayCount天后的日期
            return formatDate(dd);
        }

        function GetData() {
            $.getJSON("statcarcount.ashx", {
                UnitID: 3,
                begintime: str,
                endtime: getTodayAfter(str),
                r: Math.random()
            }, function (data) {
                CarCount1 = [];
                CarCount2 = [];
                for (var i = 0; i < data.EnterCount.length; i++) {
                    var count1 = data.EnterCount[i] - data.LeaveCount[i] * 2;
                    var count2 = data.EnterCount[i] - data.LeaveCount[i] * 1.86;
                    if (count1 < 0) {
                        count1 = 0;
                    }
                    CarCount1.push(count1);

                    if (count2 < 0) {
                        count2 = 0;
                    }
                    CarCount2.push(count2);
                }
                CurrCountData(data.FiveMinute, data.EnterCount, data.LeaveCount);
                DifferenceData1(data.FiveMinute, CarCount1);
                DifferenceData2(data.FiveMinute, CarCount2);
            });

        }

        $("#Begin").on("click", function () {
            var daynow = $("#tbBeginTime").val();
            $("#tbBeginTime").val(getTodayBefore(daynow));
            $("#tbBeginTime").html(getTodayBefore(daynow));
            str = $("#tbBeginTime").val();
            GetData();
        });

        $("#End").on("click", function () {
            var daynow = $("#tbBeginTime").val();
            $("#tbBeginTime").val(getTodayAfter(daynow));
            $("#tbBeginTime").html(getTodayAfter(daynow));
            str = $("#tbBeginTime").val();
            GetData();
        });

        
            $("#tbBeginTime").val(getToday());
            $("#tbBeginTime").html(getToday());
            str = $("#tbBeginTime").val();
            GetData();
        

    </script>
</body>
</html>
