var ChartsCurrInfo;
var ChartsCurrCount;
var ChartsCarType;
var ChartsMap;
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
            text: '今日车辆变化情况',
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
            //smooth:true,
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
            text: '今日进出车辆',
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
            text: '今日车辆类型',
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
                        name: '车辆类型',
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
        tooltip: {
            trigger: 'item',
            formatter: function (param) {
                return '车辆数量：'+param.value[2];
            }
        },

        geo: {
            map: 'china',
            label: {
                emphasis: {
                    show: true
                },
                normal: {
                    show: true
                }
            },
            center: [114.87, 30.44],
            zoom: 5,
            roam: true,
            itemStyle: {
                normal: {
                    areaColor: '#323c48',
                    borderColor: '#404a59'
                },
                emphasis: {
                    areaColor: '#323c48',
                    borderColor: '#404a59'
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
            //smooth: true,
            name: '车辆数量',
            type: 'line',
            data: CarData.ChartCurrCount
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
    for (var i = 0; i < CarData.ChartTypeName.length; i++) {
        CarTypedata.push({ value: CarData.ChartTypeCount[i], name: CarData.ChartTypeName[i] });
    }

    //设置图形中的数据！
    ChartsCarType.setOption({
        series: [
                    {
                        name: '车辆类型',
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

            if (CarData.ShowAllCity || CarData.ChartCityCount[i] > 5) {
                if (fromCoord && toCoord) {
                    res.push([{
                        coord: fromCoord
                    }, {
                        coord: toCoord
                    }]);
                }
            }
        }
        return res;
    };

    var ComeFromDataMore = [];
    var ComeFromDataLess = [];

    ComeFromDataMore.push([{ name: CarData.UnitName }, { name: CarData.UnitName, value: 1}]);
    
    
    for (var i = 0; i < CarData.ChartCityName.length; i++) {
        //处理：省外数据和省内数据！
        //如果省外数据，使用迁徙图，如果是省内数据，使用散点图！
        //本市的数据不计算在内
        if (CarData.ChartCityName[i] != CarData.CityName) {
            ComeFromDataMore.push([{ name: CarData.ChartCityName[i] }, { name: CarData.UnitName, value: CarData.ChartCityCount[i]}]);
        }
    }
    
    for (var i = 0; i < CarData.ChartCityNameLess.length; i++) {
        //处理：省外数据和省内数据！
        //如果省外数据，使用迁徙图，如果是省内数据，使用散点图！
        //本市的数据不计算在内
        if (CarData.ChartCityNameLess[i] != CarData.CityName) {
            if (CarData.ChartCityName.Length < 10) {
                ComeFromDataMore.push([{ name: CarData.ChartCityNameLess[i] }, { name: CarData.UnitName, value: CarData.ChartCityCountLess[i]}]);
            }
            else {
                ComeFromDataLess.push([{ name: CarData.ChartCityNameLess[i] }, { name: CarData.UnitName, value: CarData.ChartCityCountLess[i]}]);
            }
            
        }
    }

   // var mapcolor = ['#a6c84c', '#ffa022', '#46bee9'];
    var mapseries = [];

    mapseries.push(
				{
				    name: '车辆来源name',
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
				            color: '#ffa022',
				            width: 2,
				            opacity: 0.5,
				            curveness: 0.2
				        }
				    },
				    data: convertData(ComeFromDataMore)
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
				    symbolSize: 3,
				    itemStyle: {
				        normal: {
				            color:'gray'
				        }
				    },
				    data: ComeFromDataLess.map(function (dataItem) {
				        return {
				            name: dataItem[0].name,
				            value: MapData[dataItem[0].name].concat([dataItem[1].value])
				        };
				    })
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
				    symbolSize: 5,
				    itemStyle: {
				        normal: {
				            color: '#ffa022'
				        }
				    },
				    data: ComeFromDataMore.map(function (dataItem) {
				        return {
				            name: dataItem[0].name,
				            value: MapData[dataItem[0].name].concat([dataItem[1].value])
				        };
				    })
				}
				);


    ChartsMap.setOption({
        series: mapseries
    });

}

function GetData() {


    $.getJSON("WelcomeScenic.ashx", {
        unitid: scenicid
    }, function (data) {
        CarData = data;
        $(".ssjct_tl").html(CarData.UnitName + "旅游车辆监测统计分析系统");
        $(".ssjct_jk").html("共" + CarData.DeviceCount + "个监控点");
        $(".sp_red_big").html(CarData.CurrCount);
        $(".spLevel").html(CarData.Level);
        $(".spStayNight").html(CarData.StayNightCount);
        $(".spCarEnter").html(CarData.EnterCount);
        $(".spCarLeave").html(CarData.LeaveCount);

        var comefromhtml = "";

        for (var i = 0; i < CarData.ChartCityName.length; i++) {
            if (i < 9) {
                comefromhtml += "<div class='ssjcr_li'><div class='cityname'>"
                + CarData.ChartCityName[i] + "</div><div class='citycardata'>"
                + CarData.ChartCityCount[i] + "</div></div>";
            }
        }

        $(".ssjcr_list").html(comefromhtml);

        //今日车辆变化情况
        SetCurrInfoData();
        //今日进出车辆
        SetCurrCountData();
        //车辆类型处理
        SetCarTypeData();
        //画地图
        SetMapData();
    });
    //5分钟以后刷新一次
    setTimeout("GetData()", 5 * 60 * 1000);
}



function TimeShow() {
    $(".ssjct_time").html(new Date().toLocaleString());
    setTimeout("TimeShow()", 1000);
}

TimeShow();

