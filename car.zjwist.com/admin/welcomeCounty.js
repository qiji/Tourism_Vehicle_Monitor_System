var MaxUnitCount = 1;
var CurrUnitCount = 1;

function SummaryInfoClick(step) {
    CurrUnitCount = CurrUnitCount + step;
    if (CurrUnitCount > MaxUnitCount) {
        CurrUnitCount = 1;
    }
    if (CurrUnitCount < 1) {
        CurrUnitCount = MaxUnitCount;
    }

    $(".SummaryInfo").hide();
    $("#divSummaryInfo" + CurrUnitCount).show();
}

var ChartsCurrInfo; //今日景区车辆变化情况（所有景区合计）
var ChartsCurrCount; //今日高速车辆进出情况（不含景区）
var ChartsCarType;  //当前景区车辆比例
var ChartsMap;      //客源地？所有车辆的？高速的？
var TimeOutObject;
var CarData;

//var ChartArray = [ChartsCurrInfo, ChartsCurrCount, ChartsCarType, ChartsMap];
//var ChartArray = ["divChart1", "divChart2", "divChart3", "divChart4"];

var ChartArray = [1, 2, 3, 4];

function ChartsInit() {
    InitChart();
    InitCurrInfo();
    InitCurrCount();
    InitCarType();
    InitMap();
    //初始化完成，载入数据！
    GetData();
}

function InitChart() {
    for (var i = 0; i < ChartArray.length; i++) {
        switch (ChartArray[i]) {
            case 1:
                ChartsCurrInfo = echarts.init(document.getElementById("divChart" + (i + 1)));
                break;
            case 2:
                ChartsCurrCount = echarts.init(document.getElementById("divChart" + (i + 1)));
                break;
            case 3:
                ChartsCarType = echarts.init(document.getElementById("divChart" + (i + 1)));
                break;
            case 4:
                ChartsMap = echarts.init(document.getElementById("divChart" + (i + 1)));
                break;
        }
    }
}

function ChartChange(ChangeID) {
    //alert(ChangeID);
    //return;
    var TempChart = ChartArray[ChangeID];
    ChartArray[ChangeID] = ChartArray[3];
    ChartArray[3] = TempChart;

    InitChart();

    InitCurrInfo();
    InitCurrCount();
    InitCarType();
    InitMap();
    //重新刷新数据
    SetCurrInfoData();
    SetCurrCountData();
    SetCarTypeData();
    SetMapData();
}

function InitCurrInfo() {
    //初始化
    ChartsCurrInfo.setOption({
        color: ['#000000'],
        title: {
            text: '今日景区车辆变化情况',
            textStyle: {
                fontSize: 14
            },
            x: "center",
            y: "top"
        },
        tooltip: {
            trigger: 'axis'
        },
        backgroundColor: '#FF',

        grid: {
            top: 30,
            left: '3%',
            right: '4%',
            bottom: 10,
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
    });
}

function InitCurrCount() {
    // ChartsCurrCount = echarts.init(document.getElementById(ChartArray[1]));
    ChartsCurrCount.setOption({
        color: ['#000000', "#FFFF00"],
        title: {
            text: '今日高速进出车辆',
            textStyle: {
                fontSize: 14
            },
            x: "center",
            y: "top"
        },
        backgroundColor: '#FF',
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            top: "middle",
            left: "right",
            orient: "vertical",
            data: ['进', '出']
        },
        grid: {
            top: 30,
            left: '3%',
            right: '4%',
            bottom: 10,
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
        series:
                    [{
                        name: '进',
                        type: 'line',
                        data: []
                    },
                    {
                        name: '出',
                        type: 'line',
                        data: []
                    }]
    });
}

function InitCarType() {
    //车辆类型
    //ChartsCarType = echarts.init(document.getElementById(ChartArray[2]));
    ChartsCarType.setOption({
        title: {
            text: '当前景区车辆',
            textStyle: {
                fontSize: 14
            },
            x: "center",
            y: "top"
        },

        backgroundColor: '#FF',
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: [
                    {
                        name: '当前车辆',
                        type: 'pie',
                        radius: '60%',
                        center: ['50%', '50%'],
                        data: []
                    }
                ]
    });
}

function InitMap() {
    // ChartsMap = echarts.init(document.getElementById(ChartArray[3]));
    ChartsMap.setOption({
        title: {
            text: '车辆来源地',
            left: 'center'
        },
        backgroundColor: '#FF',
        geo: {
            map: 'china',
            label: {
                emphasis: {
                    show: false
                }
            },
            roam: true,
            itemStyle: {
                normal: {
                    areaColor: '#323c48',
                    borderColor: '#404a59'
                },
                emphasis: {
                    areaColor: '#2a333d'
                }
            }
        },
        series: []
    });
}



function SetCurrInfoData() {
    ChartsCurrInfo.setOption({
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: CarData.ChartFivMinute
        },
        series: [{
            name: '车辆数量',
            type: 'line',
            data: CarData.ChartScenicCurrCount
        }]
    });
}

function SetCurrCountData() {
    ChartsCurrCount.setOption({
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: CarData.ChartFivMinute
        },
        series: [
                    {
                        name: '进',
                        type: 'line',
                        data: CarData.ChartEnterCount
                    },
                    {
                        name: '出',
                        type: 'line',
                        data: CarData.ChartLeaveCount
                    }
                    ]
    });
}

function SetCarTypeData() {

    var CarTypedata = [];
    for (var i = 0; i < CarData.SummaryInfos.length; i++) {
        CarTypedata.push({ value: CarData.SummaryInfos[i].CurrCount, name: CarData.SummaryInfos[i].UnitName });
    }

    //设置图形中的数据！
    ChartsCarType.setOption({
        series: [
                    {
                        name: '当前景区车辆',
                        type: 'pie',
                        radius: '60%',
                        center: ['50%', '50%'],
                        data: CarTypedata
                    }]
    });
}



function SetMapData() {
    var MapData = $.parseJSON(CarData.MapData);

    var convertData = function (data) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var dataItem = data[i];
            var fromCoord = MapData[dataItem[0].name];
            var toCoord = MapData[dataItem[1].name];
            if (fromCoord && toCoord) {
                res.push([{
                    coord: fromCoord
                }, {
                    coord: toCoord
                }]);
            }
        }
        return res;

    };

    var ComeFromData = [];

    ComeFromData.push([{ name: CarData.UnitName }, { name: CarData.UnitName, value: 1}]);

    for (var i = 0; i < CarData.ChartCityName.length; i++) {
        //处理：省外数据和省内数据！
        //如果省外数据，使用迁徙图，如果是省内数据，使用散点图！
        ComeFromData.push([{ name: CarData.ChartCityName[i] }, { name: CarData.UnitName, value: CarData.ChartCityCount[i]}]);
    }
    var mapcolor = ['#a6c84c', '#ffa022', '#46bee9'];
    var mapseries = [];
    [[CarData.UnitName, ComeFromData]].forEach(function (item, i) {
        mapseries.push({
            name: '',
            type: 'lines',
            zlevel: 1,
            effect: {
                show: false,
                period: 6,
                trailLength: 0.9,
                color: '#fff',
                symbolSize: 4
            },
            lineStyle: {
                normal: {
                    color: mapcolor[i],
                    width: 0,
                    curveness: 0.2
                }
            },
            data: convertData(item[1])
        },
                    {
                        name: '',
                        type: 'lines',
                        zlevel: 2,
                        effect: {
                            show: true,
                            period: 6,
                            trailLength: 0,
                            symbolSize: 5
                        },
                        lineStyle: {
                            normal: {
                                color: mapcolor[i],
                                width: 2,
                                opacity: 0.5,
                                curveness: 0.2
                            }
                        },
                        data: convertData(item[1])
                    },
                    {
                        name: '',
                        type: 'effectScatter',
                        coordinateSystem: 'geo',
                        zlevel: 2,
                        rippleEffect: {
                            brushType: 'stroke'
                        },
                        label: {
                            normal: {
                                show: true,
                                position: 'right',
                                formatter: '{b}'
                            }
                        },
                        symbolSize: function (val) {
                            return val[2] / 8;
                        },
                        itemStyle: {
                            normal: {
                                color: mapcolor[i]
                            }
                        },
                        data: item[1].map(function (dataItem) {
                            return {
                                name: dataItem[0].name,
                                value: MapData[dataItem[0].name].concat([dataItem[1].value])
                            };
                        })
                    });
    });

    ChartsMap.setOption({
        series: mapseries
    });

}

function GetData() {
    $.getJSON("WelcomeCounty.ashx", {
        unitid: countyid
    }, function (data) {
        CarData = data;
        $(".ssjct_tl").html(CarData.UnitName + "旅游车辆监测统计分析系统");
        $(".ssjct_jk").html("共" + CarData.DeviceCount + "个监控点");
        var summaryinfohtml = "";
        summaryinfohtml += "<div id=\"divSummaryInfo1\" class=\"SummaryInfo\" style=\"display: block\">";
        summaryinfohtml += "<a href=\"javascript:;\" class=\"sswm_tl\">" + CarData.UnitName + "</a> 当前景区车辆： <span class=\"sp_red_big\">" + CarData.CurrSummaryInfo.CurrCount + "</span>";
        summaryinfohtml += "&nbsp;&nbsp;&nbsp;平均逗留时间：<span class=\"sp_green\">" + CarData.CurrSummaryInfo.AvgStayTime + "小时</span>";
        summaryinfohtml += "<br/>其中外地车辆总数：<span class=\"sp_green\">" + CarData.CurrSummaryInfo.OtherPlaceCount + "</span><br />";
        summaryinfohtml += "高速进入总数：<span class=\"sp_green\">" + CarData.CurrSummaryInfo.EnterCount + "</span> &nbsp;&nbsp;&nbsp; 高速离开总数：<span class=\"sp_green\">" + CarData.CurrSummaryInfo.LeaveCount + "</span>";
        summaryinfohtml += "</div>";

        MaxUnitCount = CarData.SummaryInfos.length + 1;

        for (var i = 0; i < CarData.SummaryInfos.length; i++) {
            summaryinfohtml += "<div id=\"divSummaryInfo" + (i + 2) + "\" class=\"SummaryInfo\" style=\"display: none\">";
            summaryinfohtml += "<a href=\"WelComeScenic.aspx?ScenicID=" + CarData.SummaryInfos[i].UnitID + "\" target=\"_blank\" class=\"sswm_tl\">"
                + CarData.SummaryInfos[i].UnitName + "</a> 当前车辆： <span class=\"sp_red_big\">"
                + CarData.SummaryInfos[i].CurrCount + "</span>&nbsp;&nbsp;&nbsp;饱和度：<span class=\"sp_green\">" + CarData.SummaryInfos[i].Level + "</span>";
            summaryinfohtml += " <br />:";
            summaryinfohtml += "平均逗留时间：<span class=\"sp_green\">" + CarData.SummaryInfos[i].AvgStayTime + "小时</span><br/>";
            summaryinfohtml += "进入车辆总数：<span class=\"sp_green\">" + CarData.SummaryInfos[i].EnterCount
                            + "</span> &nbsp;&nbsp;&nbsp; 离开车辆总数：<span class=\"sp_green\">" + CarData.SummaryInfos[i].LeaveCount + "</span>";
            summaryinfohtml += "</div>";
        }


        $(".ssw00_main").html(summaryinfohtml);
        SummaryInfoClick(0);


        var comefromhtml = "";
        for (var i = 0; i < CarData.ChartCityName.length; i++) {
            if (i < 9) {
                comefromhtml += "<div class='ssjcr_li'><div class='cityname'>"
                        + CarData.ChartCityName[i] + "</div><div class='citycardata'>"
                        + CarData.ChartCityCount[i] + "</div></div>";
            }
        }
        $(".ssjcr_list").html(comefromhtml);

        //今日景区车辆变化情况
        SetCurrInfoData();
        //高速今日进出车辆
        SetCurrCountData();
        //当前景区车辆对比！
        SetCarTypeData();
        //画地图
        SetMapData();
    });
}



function TimeShow() {
    $(".ssjct_time").html(new Date().toLocaleString());
    setTimeout("TimeShow()", 1000);
}

TimeShow();

