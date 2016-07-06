$(document).ready(function () {
    $('.title li').click(function () {
        $(this).addClass('active').siblings().removeClass('active');
    });
    $('.category li').click(function () {
        $(this).addClass('active').siblings().removeClass('active');
    });
    $(".hovertable td").click(function () {
        $(this).addClass('tableactive').siblings().removeClass('tableactive');
    });
    $(".menu1").addClass('active');
    $(".hovertable td:first").addClass('tableactive');
    $("#tbAreaType td:eq(1)").addClass('tableactive');
    $('#SDateTime').val(ChangeDateFormat(1));
    $('#EDateTime').val(ChangeDateFormat(1));
    $('#MonthBegin').val(ChangeDateFormat(2));
    GetData();
});

setTimeout("GetData()", 5 * 60 * 1000);

function GetData() {
    $.getJSON("ajax/WelcomeCounty.ashx",
            {
                UnitID: unitid,
                r: Math.random()
            },
            function (e) {
                $(document).attr("title",e.UnitName+"旅游车辆监测统计分析系统");
                var summaryinfohtml = "";
                summaryinfohtml += "<div class=\"swiper-slide\"><div class=\"content-slide\"><div class=\"weui_cells\" style=\"margin-top: 10px;\">";
                summaryinfohtml += "<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>" + e.UnitName + "</p></div></div>";
                summaryinfohtml += "<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>当前景区车辆：<span style=\"font-size: 23px; color: #009100;\">" +                   e.CurrSummaryInfo.CurrCount + "</span></p></div></div>";
                summaryinfohtml += "<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>平均逗留时间：<span style=\"font-size: 23px; color: #009100;\">" +                   e.CurrSummaryInfo.AvgStayTime + "小时</span></p></div></div>";
                summaryinfohtml += "<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>其中外地车辆总数：<span style=\"font-size: 23px; color: #009100;\">"                 + e.CurrSummaryInfo.OtherPlaceCount + "</span></p></div></div>";
                summaryinfohtml += "<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>高速进入总数：<span style=\"font-size: 23px; color: #009100;\">" +                   e.CurrSummaryInfo.EnterCount + "</span></p></div></div>";
                summaryinfohtml+="<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>高速离开总数：<span style=\"font-size: 23px; color: #009100;\">" +                     e.CurrSummaryInfo.LeaveCount + "</span></p></div></div>";
                summaryinfohtml += "</div></div></div>";

                for (var i = 0; i < e.SummaryInfos.length; i++) {
                    summaryinfohtml += "<div class=\"swiper-slide\"><div class=\"content-slide\"><div class=\"weui_cells\" style=\"margin-top: 10px;\" onclick=\"redirctSite                           ("+e.SummaryInfos[i].UnitID+")\">";
                    summaryinfohtml += "<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>"
                        + e.SummaryInfos[i].UnitName + "</p></div></div>";
                    summaryinfohtml+="<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>当前车辆：<span style=\"font-size: 23px; color: #009100;\">"
                        + e.SummaryInfos[i].CurrCount + "</span></p></div></div>";
                    summaryinfohtml += "<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>饱和度：<span style=\"font-size: 23px; color: #009100;\">" +                         e.SummaryInfos[i].Level + "</span></p></div></div>";
                    summaryinfohtml += "<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>平均逗留时间：<span style=\"font-size: 23px; color: #009100;\">"                     + e.SummaryInfos[i].AvgStayTime + "小时</span></p></div></div>";
                    summaryinfohtml += "<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>进入车辆总数：<span style=\"font-size: 23px; color: #009100;\">"                     + e.SummaryInfos[i].EnterCount + "</span></p></div></div>";
                    summaryinfohtml+="<div class=\"weui_cell\"><div class=\"weui_cell_bd weui_cell_primary\"><p>离开车辆总数：<span style=\"font-size: 23px; color: #009100;\">" +                     e.SummaryInfos[i].LeaveCount + "</span></p></div></div>";
                    summaryinfohtml += "</div></div></div>";
                }
                $(".swiper-wrapper").html(summaryinfohtml);
                //initialize swiper when document ready
                var mySwiper = new Swiper ('.swiper-container', {
                // Optional parameters
                //direction: 'vertical',
                pagination: '.pagination',
                paginationClickable: true,
                grabCursor: true,
                loop: true
                })
                CharCurr(e.ChartFivMinute, e.ChartScenicCurrCount);
                CharCityFrom(e.ChartCityName, e.ChartCityCount);
                CarCountChange(e.ChartFivMinute, e.ChartEnterCount, e.ChartLeaveCount);
                CarTypePie(e.SummaryInfos);
            })
}

function redirctSite(unitid)
{
    window.location.href = "index.aspx?unitid="+unitid;
}

function CharCurr(CharCurrTime, CharCurrCount) {
    var lineChart = echarts.init(document.getElementById('linemain'));

    var lineoption = {
        title: {
            text: '今日景区车辆变化情况'
        },
        tooltip: {
            trigger: 'axis'
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
                        splitLine: {
                            show: false
                        },
                        data: CharCurrTime
                    }
                    ],
        yAxis: [
                    {
                        type: 'value',
                        splitLine: {
                            show: false
                        }
                    }
                    ],
        series: [
                    {
                        name: '车辆数量',
                        type: 'line',
                        data: CharCurrCount
                    }
                    ]
    };

    lineChart.setOption(lineoption);
}

function CarCountChange(CharEnterTime, CharEnterCount, CharLeaveCount) {
    var lineChart = echarts.init(document.getElementById('divCarCountChange'));

    var lineoption = {
        title: {
            text: '今日高速进出车辆'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['进', '出'],
            top: 28
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
                        splitLine: {
                            show: false
                        },
                        data: CharEnterTime
                    }
                    ],
        yAxis: [
                    {
                        type: 'value',
                        splitLine: {
                            show: false
                        }
                    }
                    ],
        series: [
                    {
                        name: '进',
                        type: 'line',
                        data: CharEnterCount
                    },
                    {
                        name: '出',
                        type: 'line',
                        data: CharLeaveCount
                    }
                    ]
    };

    lineChart.setOption(lineoption);
}

function CharCityFrom(CharCity, CharCityCount) {
    var pieChart = echarts.init(document.getElementById('piemain'));

    var pieoption = {
        title: {
            text: '今日车辆来源',
            x: 'left'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: [
                    {
                        name: '车辆来源地',
                        type: 'pie',
                        radius: '65%',
                        center: ['50%', '60%'],
                        data: [],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
                };
                var html = "";
    for (var i = 0; i < CharCity.length; i++) {
        pieoption.series[0].data.push({ value: CharCityCount[i], name: CharCity[i] });
        if (i%2 == 0) {
            html += "<tr>";
        }
        html += "<td>" + CharCity[i] + " : " + CharCityCount[i] + "辆</td>";
        if (i == CharCity.length - 1 && i % 2 == 0) {
            html += "<td></td></tr>";
        }
        if (i % 2 != 0) {
            html += "</tr>";
        }
    }
    $("#stattable").html(html);
    pieChart.setOption(pieoption);
}

function CarTypePie(SummaryInfos) {
    var pieChart = echarts.init(document.getElementById('divCarType'));

    var pieoption = {
        title: {
            text: '当前景区车辆',
            x: 'left'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: [
                    {
                        name: '当前车辆',
                        type: 'pie',
                        radius: '65%',
                        center: ['50%', '60%'],
                        data: [],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
    };
    var html = "";
    for (var i = 0; i < SummaryInfos.length; i++) {
        pieoption.series[0].data.push({ value: SummaryInfos[i].CurrCount, name: SummaryInfos[i].UnitName });
        if (i % 2 == 0) {
            html += "<tr>";
        }
        html += "<td>" + SummaryInfos[i].UnitName + " : " + SummaryInfos[i].CurrCount + "辆</td>";
        if (i == SummaryInfos.length - 1 && i % 2 == 0) {
            html += "<td></td></tr>";
        }
        if (i % 2 != 0) {
            html += "</tr>";
        }
    }
    $("#CarTypeTable").html(html);
    pieChart.setOption(pieoption);
}

function redirct(type) {
    if (type == 1) {
        $("#divindex").show();
        $("#divstatinfo").hide();
    }
    else {
        $("#divstatinfo").show();
        $("#divindex").hide();
        $("#statname").text("来源统计");
        statinfo(1);
    }
}

function showstat(type) {
    if (type == 1) {
        $("#mask").addClass("weui_fade_toggle");
        $("#mask").show();
        $("#weui_actionsheet").addClass("weui_actionsheet_toggle");
    }
    else {
        $("#mask").removeClass("weui_fade_toggle");
        $("#mask").hide();
        $("#weui_actionsheet").removeClass("weui_actionsheet_toggle");
    }
}

var now = new Date(); //当前日期 
var nowDayOfWeek = now.getDay(); //今天本周的第几天 
var nowDay = now.getDate(); //当前日 
var nowMonth = now.getMonth(); //当前月 
var nowYear = now.getYear(); //当前年 
nowYear += (nowYear < 2000) ? 1900 : 0; //

function ChangeDateFormat(type) {
    var date = new Date();
    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
    if(type==1)
    {
        return date.getFullYear() + "-" + month + "-" + currentDate;
    }
    else
    {
        return date.getFullYear() + "-" + month ;
    }
}

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
//获得本周的开端日期 
function getWeekStartDate() {
    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 1);
    return formatDate(weekStartDate);
}

//获得本周的停止日期 
function getWeekEndDate(type) {
    var weekEndDate;
    if (type == 1) {
        weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek + 2));
    }
    else {
        weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek + 1));
    }
    return formatDate(weekEndDate);
}

//获得本月的开端日期 
function getMonthStartDate() {
    var monthStartDate = new Date(nowYear, nowMonth, 1);
    return formatDate(monthStartDate);
}

//获得本月的停止日期 
function getMonthEndDate(type) {
    var monthEndDate
    if (type == 1) {
        monthEndDate = new Date(nowYear, nowMonth + 1, 1);
    }
    else {
        monthEndDate = new Date(nowYear, nowMonth, getMonthDays(nowMonth));
    }
    return formatDate(monthEndDate);
}

//获得某月的天数 
function getMonthDays(myMonth) {
    var monthStartDate = new Date(nowYear, myMonth, 1);
    var monthEndDate = new Date(nowYear, myMonth + 1, 1);
    var days = (monthEndDate - monthStartDate) / (1000 * 60 * 60 * 24);
    return days;
}

function datetype(day) {
    if (day == 7) {
        $('#SDateTime').val(getWeekStartDate());
        $('#EDateTime').val(getWeekEndDate(0));
    }
    else if (day == 30) {
        $('#SDateTime').val(getMonthStartDate());
        $('#EDateTime').val(getMonthEndDate(0));
    }
    else if (day == 1) {
        $('#SDateTime').val(ChangeDateFormat(1));
        $('#EDateTime').val(ChangeDateFormat(1));
    }
    else if (day == 365) {
        $('#SDateTime').val(nowYear + "-01-01");
        $('#EDateTime').val(nowYear + "-12-31");
    }
    if ($.trim($("#statname").text()) == "来源统计") {
        statinfo(1);
    }
    else if ($.trim($("#statname").text()) == "车型统计") {
        statinfo(3);
    }
}

function checkindex(e) {
    $("#statname").text($(e).text());
    $("#mask").removeClass("weui_fade_toggle");
    $("#mask").hide();
    $("#weui_actionsheet").removeClass("weui_actionsheet_toggle");
    if ($.trim($("#statname").text()) == "来源统计") {
        statinfo(1);
    }
    else if ($.trim($("#statname").text()) == "车型统计") {
        statinfo(3);
    }
    else if ($.trim($("#statname").text()) == "流量统计") {
        statinfo(2);
    }
}

function refsh() {
    if ($.trim($("#statname").text()) == "来源统计") {
        statinfo(1);
    }
    else if ($.trim($("#statname").text()) == "车型统计") {
        statinfo(3);
    }
    else if ($.trim($("#statname").text()) == "流量统计") {
        statinfo(2);
    }
}

function SelAreaType(areatype) {
    $("#AreaType").val(areatype);
    statinfo(1);
}

$("#SDateTime").on('input', function (e) {
    if ($.trim($("#statname").text()) == "来源统计") {
        statinfo(1);
    }
    else if ($.trim($("#statname").text()) == "车型统计") {
        statinfo(3);
    }
});

$("#EDateTime").on('input', function (e) {
    if ($.trim($("#statname").text()) == "来源统计") {
        statinfo(1);
    }
    else if ($.trim($("#statname").text()) == "车型统计") {
        statinfo(3);
    }
});

$("#MonthBegin").on('input', function (e) {
    statinfo(2);
});

$("#MonthCompare").on('input', function (e) {
    statinfo(2);
});

function piestat1(type, CharTypeName, CharTypeCount,tbTitle,oldcount) {
    var piestat = echarts.init(document.getElementById('divstat1'));

    if(type==1)
    {
        var piestoption = {
            title: {
                        text: '高速车辆来源地分析',
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'axis',
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
                    yAxis: [{
                        type: 'category',
                        data:  []
                    }],
                    xAxis: [{
                        type: 'value',
                        splitLine: {
                            show: false
                        },
                    }],
                    series: [{
                        name: '数量',
                        type: 'bar',
                        data: []
                    }]
                    };
                    for (var i = 0; i < CharTypeName.length; i++) {
                        piestoption.yAxis[0].data.push(CharTypeName[i]);
                        piestoption.series[0].data.push(CharTypeCount[i]);
                    }
        window.onresize = piestat.resize;
        piestat.setOption(piestoption);
    }
    else if(type==3)
    {
        var pieoption = {
        title: {
            text: '高速车辆类型',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: [
                    {
                        name: '车辆类型',
                        type: 'pie',
                        radius: '65%',
                        center: ['50%', '45%'],
                        data: [],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
                };
        for (var i = 0; i < CharTypeName.length; i++) {
        pieoption.series[0].data.push({ value: CharTypeCount[i], name: CharTypeName[i] });
        }
        window.onresize = piestat.resize;
        piestat.setOption(pieoption);
    }
    else if(type==2)
    {
        if(oldcount!="")
        {
           var compoption = {
            title: {
                        text:"",
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    backgroundColor: '#FF',
                    legend: {
                        data: ['进入','离开','对比进入','对比离开'],
                        top: 28
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [{
                        type: 'category',
                        boundaryGap: false,
                        splitLine: {
                            show: false
                        },
                        data: []
                    }],
                    yAxis: [{
                        splitLine: {
                            show: false
                        },
                        type: 'value'
                    }],
                    series: [{
                        name: '进入数量',
                        type: 'line',
                        data: []
                    },
                    {
                        name: '离开数量',
                        type: 'line',
                        data: []
                    },
                    {
                        name: '对比进入',
                        type: 'line',
                        data: []
                    },
                    {
                        name: '对比离开',
                        type: 'line',
                        data: []
                    }]
                    };
            compoption.title.text=tbTitle;
            for (var i = 0; i < CharTypeName.length; i++) {
                compoption.series[1].data.push(oldcount.split('+')[1].split(',')[i]);
                compoption.series[0].data.push(oldcount.split('+')[0].split(',')[i]);
                compoption.series[2].data.push(CharTypeCount.split('+')[0].split(',')[i]);
                compoption.series[3].data.push(CharTypeCount.split('+')[1].split(',')[i]);
                compoption.xAxis[0].data.push(CharTypeName[i]);
            }
            window.onresize = piestat.resize;
            piestat.setOption(compoption);
        }
        else
        {
            var compoption = {
            title: {
                        text:"",
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    backgroundColor: '#FF',
                    legend: {
                        data: ['进入数量','离开数量'],
                        top: 28
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [{
                        type: 'category',
                        boundaryGap: false,
                        splitLine: {
                            show: false
                        },
                        data: []
                    }],
                    yAxis: [{
                        splitLine: {
                            show: false
                        },
                        type: 'value'
                    }],
                    series: [{
                        name: '进入数量',
                        type: 'line',
                        data: []
                    },
                    {
                        name: '离开数量',
                        type: 'line',
                        data: []
                    }]
                    };
            compoption.title.text=tbTitle;
            for (var i = 0; i < CharTypeName.length; i++) {
                compoption.series[0].data.push(CharTypeCount.split('+')[0].split(',')[i]);
                compoption.series[1].data.push(CharTypeCount.split('+')[1].split(',')[i]);
                compoption.xAxis[0].data.push(CharTypeName[i]);
            }
            window.onresize = piestat.resize;
            piestat.setOption(compoption);
        }
    }
}

function piestat2(type, CharTypeName, CharTypeCount,tbTitle,oldcount) {
    var piestat = echarts.init(document.getElementById('divstat2'));

    if(type==1)
    {
        var piestoption = {
        title: {
                        text: '高速逗留时间分析(小时)',
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'axis',
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
                    yAxis: [{
                        type: 'category',
                        data:  []
                    }],
                    xAxis: [{
                        type: 'value',
                        splitLine: {
                                show: false
                            }
                    }],
                    series: [{
                        name: '逗留时间',
                        type: 'bar',
                        data: []
                    }]
                    };
                    for (var i = 0; i < CharTypeName.length; i++) {
                        piestoption.yAxis[0].data.push(CharTypeName[i]);
                        piestoption.series[0].data.push(CharTypeCount[i]);
                    }
        window.onresize = piestat.resize;
        piestat.setOption(piestoption);
    }
    else if(type==3)
    {
        var pieoption = {
        title: {
            text: '景区车辆类型',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: [
                    {
                        name: '车辆类型',
                        type: 'pie',
                        radius: '65%',
                        center: ['50%', '45%'],
                        data: [],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
                };
        for (var i = 0; i < CharTypeName.length; i++) {
        pieoption.series[0].data.push({ value: CharTypeCount[i], name: CharTypeName[i] });
        }
        window.onresize = piestat.resize;
        piestat.setOption(pieoption);
    }
    else if(type==2)
    {
        if(oldcount!="")
        {
           var compoption = {
            title: {
                        text:"",
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    backgroundColor: '#FF',
                    legend: {
                        data: ['车辆数量','对比数量'],
                        top: 28
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [{
                        type: 'category',
                        boundaryGap: false,
                        splitLine: {
                            show: false
                        },
                        data: []
                    }],
                    yAxis: [{
                        splitLine: {
                            show: false
                        },
                        type: 'value'
                    }],
                    series: [{
                        name: '车辆数量',
                        type: 'line',
                        data: []
                    },
                    {
                        name: '对比数量',
                        type: 'line',
                        data: []
                    }]
                    };
            compoption.title.text=tbTitle;
            for (var i = 0; i < CharTypeName.length; i++) {
                compoption.series[1].data.push(CharTypeCount[i]);
                compoption.series[0].data.push(oldcount[i]);
                compoption.xAxis[0].data.push(CharTypeName[i]);
            }
            window.onresize = piestat.resize;
            piestat.setOption(compoption);
        }
        else
        {
            var compoption = {
            title: {
                        text:"",
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    backgroundColor: '#FF',
                    legend: {
                        data: ['车辆数量'],
                        top: 28
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [{
                        type: 'category',
                        boundaryGap: false,
                        splitLine: {
                            show: false
                        },
                        data: []
                    }],
                    yAxis: [{
                        splitLine: {
                            show: false
                        },
                        type: 'value'
                    }],
                    series: [{
                        name: '车辆数量',
                        type: 'line',
                        data: []
                    }]
                    };
            compoption.title.text=tbTitle;
            for (var i = 0; i < CharTypeName.length; i++) {
                compoption.series[0].data.push(CharTypeCount[i]);
                compoption.xAxis[0].data.push(CharTypeName[i]);
            }
            window.onresize = piestat.resize;
            piestat.setOption(compoption);
        }
    }
}

function piestat3(CharTypeName, CharTypeCount) {
    var piestat = echarts.init(document.getElementById('divstat3'));

    var piestoption = {
    title: {
                    text: '景区车辆来源地分析',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'axis',
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
                yAxis: [{
                    type: 'category',
                    data:  []
                }],
                xAxis: [{
                    type: 'value',
                    splitLine: {
                            show: false
                        }
                }],
                series: [{
                    name: '逗留时间',
                    type: 'bar',
                    data: []
                }]
                };
                for (var i = 0; i < CharTypeName.length; i++) {
                    piestoption.yAxis[0].data.push(CharTypeName[i]);
                    piestoption.series[0].data.push(CharTypeCount[i]);
                }
    window.onresize = piestat.resize;
    piestat.setOption(piestoption);
}

function piestat4(CharTypeName, CharTypeCount) {
    var piestat = echarts.init(document.getElementById('divstat4'));

    var piestoption = {
    title: {
                    text: '景区逗留时间分析(小时)',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'axis',
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
                yAxis: [{
                    type: 'category',
                    data:  []
                }],
                xAxis: [{
                    type: 'value',
                    splitLine: {
                            show: false
                        }
                }],
                series: [{
                    name: '逗留时间',
                    type: 'bar',
                    data: []
                }]
                };
                for (var i = 0; i < CharTypeName.length; i++) {
                    piestoption.yAxis[0].data.push(CharTypeName[i]);
                    piestoption.series[0].data.push(CharTypeCount[i]);
                }
    window.onresize = piestat.resize;
    piestat.setOption(piestoption);
}

function statinfo(type) {
    $.get("ajax/GetCountryStatInfo.ashx",
            {
                type: type,
                BeginDate: $("#SDateTime").val(),
                EndDate: $("#EDateTime").val(),
                AreaType: $("#AreaType").val(),
                MonthBegin:$("#MonthBegin").val(),
                UnitID: unitid,
                r: Math.random()
            },
            function (e) {
                if (type == 1) {
                    $("#tbAreaType").show();
                    $("#divdatetime1").show();
                    $("#hovertable").show();
                    $("#divdatetime2").hide();
                    $("#divcategory").show();
                    if ($('.category li').attr('class') == "t menu1 active") {
                        $("#tbstat").html(e.split('|')[0] + e.split('|')[3]+ e.split('|')[6]+ e.split('|')[9]);
                        $("#tbstat").show();
                        $("#divstat1").hide();
                        $("#divstat2").hide();
                        $("#divstat3").hide();
                        $("#divstat4").hide();
                    }
                    else {
                        $("#divstat1").css("width", $(window).width());
                        $("#divstat2").css("width", $(window).width());
                        $("#divstat3").css("width", $(window).width());
                        $("#divstat4").css("width", $(window).width());
                        piestat1(type, e.split('|')[1].split(','), e.split('|')[2].split(','),"","");
                        piestat2(type,e.split('|')[4].split(','), e.split('|')[5].split(','),"","");
                        piestat3(e.split('|')[7].split(','), e.split('|')[8].split(','));
                        piestat4(e.split('|')[10].split(','), e.split('|')[11].split(','));
                        $("#tbstat").hide();
                        $("#divstat1").show();
                        $("#divstat2").show();
                        $("#divstat3").show();
                        $("#divstat4").show();
                    }
                }
                else if (type==3)
                {
                    $("#tbAreaType").hide();
                    $("#divdatetime1").show();
                    $("#hovertable").show();
                    $("#divdatetime2").hide();
                    $("#divcategory").show();
                    if ($('.category li').attr('class') == "t menu1 active") {
                        $("#tbstat").html(e.split('|')[0]+e.split('|')[3]);
                        $("#tbstat").show();
                        $("#divstat1").hide();
                        $("#divstat2").hide();
                        $("#divstat3").hide();
                        $("#divstat4").hide();
                    }
                    else {
                        $("#divstat1").css("width", $(window).width());
                        $("#divstat2").css("width", $(window).width());
                        piestat1(type, e.split('|')[1].split(','), e.split('|')[2].split(','),"","");
                        piestat2(type,e.split('|')[4].split(','), e.split('|')[5].split(','),"","");
                        $("#tbstat").hide();
                        $("#divstat1").show();
                        $("#divstat2").show();
                        $("#divstat3").hide();
                        $("#divstat4").hide();
                    }
                }
                else if (type==2)
                {
                    $("#tbAreaType").hide();
                    $("#divdatetime1").hide();
                    $("#hovertable").hide();
                    $("#divdatetime2").show();
                    $("#divcategory").hide();
                    $("#tbstat").hide();
                    $("#divstat2").show();
                    $("#divstat1").show();
                    $("#divstat3").hide();
                    $("#divstat4").hide();
                    var oldcount=e.split('|')[2];
                    var oldtitle=e.split('|')[0];
                    var gsoldcount=e.split('|')[4];
                    var gsoldtitle=e.split('|')[3];
                    piestat1(type, e.split('|')[1].split(','), e.split('|')[4],e.split('|')[3],"");
                    piestat2(type, e.split('|')[1].split(','), e.split('|')[2].split(','),e.split('|')[0],"");
                    if(!$("#MonthCompare").is(":hidden"))
                    {
                        $.get("ajax/GetCountryStatInfo.ashx",
                        {
                            type: type,
                            BeginDate: $("#SDateTime").val(),
                            EndDate: $("#EDateTime").val(),
                            AreaType: $("#AreaType").val(),
                            MonthBegin:$("#MonthCompare").val(),
                            UnitID: unitid,
                            r: Math.random()
                        },
                        function (e) {
                            piestat1(type, e.split('|')[1].split(','), e.split('|')[4],gsoldtitle,gsoldcount);
                            piestat2(type, e.split('|')[1].split(','), e.split('|')[2].split(','),oldtitle,oldcount.split(','));
                        })
                    }
                }
            })
        }

        function showdata() {
            if ($.trim($("#statname").text()) == "来源统计") {
                statinfo(1);
            }
            else if ($.trim($("#statname").text()) == "车型统计") {
                statinfo(3);
            }
        }

        function showcompare(e)
        {
            if($('#MonthBegin').attr('class') == "fullmonth")
            {
                $("#MonthBegin").removeClass("fullmonth").addClass("leftmonth");
                var beginYear=parseInt($("#MonthBegin").val().split('-')[0]);
                var beginMonth=parseInt($("#MonthBegin").val().split('-')[1]);
                if(beginMonth<=10)
                {
                    if(beginMonth!=1)
                    {
                       beginMonth=beginMonth-1;
                       $("#MonthCompare").val(beginYear+"-0"+beginMonth);
                    }
                    else
                    {
                       beginYear=beginYear-1;
                       $("#MonthCompare").val(beginYear+"-12");
                    }
                }
                else
                {
                    beginMonth=beginMonth-1;
                    $("#MonthCompare").val(beginYear+"-"+beginMonth);
                }
                $("#MonthCompare").show();
                $(e).text("取消对比");
            }
            else
            {
                $("#MonthBegin").removeClass("leftmonth").addClass("fullmonth");
                $("#MonthCompare").hide();
                $(e).text("对比");
            }
            statinfo(2);
        }