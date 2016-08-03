var CarData;
var divChart = [1,2,3,4];



function ChartChange(ChangeID) {    
    var TempChart = divChart[ChangeID];
    divChart[ChangeID] = divChart[3];
    divChart[3] = TempChart;
    
    SetChart(ChangeID);
    SetChart(3);
       
}

function SetChart(divid)
{
    switch(divChart[divid])
    {
        case 1:
           CurrInfoData();
        break;
        case 2:
            CurrCountData();
        break;
        case 3:
            CharCityFrom();
        break;
        case 4:
            ChartShowMap();
        break;
    }
}


function GetChartdiv(divvalue)
{
    for (var i = 0; i < divChart.length; i++) {
        if (divChart[i] == divvalue)    
          return i+1;
    }   
    
}

//今日车辆变化
function CurrInfoData(){
    var divorder = GetChartdiv(1);
    $(".charttitle"+divorder).html("今日车辆变化");
    var CurrInfoData = echarts.init(document.getElementById("divchart" + divorder));



    CurrInfoData.setOption({
        tooltip: {
            trigger: 'axis',
            formatter: '{b0}<br />数量:{c0}',
            borderWidth:1,
            borderColor: '#000000',
            textStyle:{
                fontWeight:'100',
                fontSize:13
            }
        },
         grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: CarData.ChartFivMinute,
            splitLine:{
                show:true,
                lineStyle:{
                    color:'rgb(96,68,136)'
                }
            },
            axisLabel:{
                show:true,
                textStyle:{
                    color:'#fff'
                }
            }
        },
        yAxis: {
            type: 'value',
            data: CarData.ChartCurrCount,
            splitLine:false,
            axisLabel:{
                show:true,
                textStyle:{
                    color:'#fff'
                }
            }
        },
        series: [
        {
            type:'line',
            smooth:true,
            sampling: 'average',
            itemStyle: {
                normal: {
                    color:'rgb(111, 255, 219)'
                }
            },
            areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color:'rgb(91, 19, 207)'
                        }, {
                        offset: 1,
                            color: 'rgb(33, 9, 67)'
                        }])
                    }
                },
            data:CarData.ChartCurrCount,
        }]
    });
}


//今日进出车辆
function CurrCountData(){
    var divorder = GetChartdiv(2);
    $(".charttitle"+divorder).html("今日进出车辆");
    var CurrCountData = echarts.init(document.getElementById("divchart" + divorder));

        function gettooltipstring(params)
        {
            if (params[0].value==null)
            {
                return params[0].name+'<br /><span style="color:#47fad0">∨</span> <br /><span style="color:red">∧</span>';
            }
            else
            {
                return params[0].name+'<br /><span style="color:#47fad0">∨</span>'+params[0].value+'<br /><span style="color:red">∧</span>'+params[1].value;
            }
        }

    CurrCountData.setOption({
        tooltip: {
            trigger: 'axis',
            formatter: function(params){
                return  gettooltipstring(params);
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
            data: CarData.ChartFivMinute,
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
                    color:  '#fff'
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
                    color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgb(91, 19, 207)'
                            }, {
                            offset: 1,
                                color:'rgb(49, 14, 72)'
                            }])
                } 
            },
            data: CarData.ChartEnterCount
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
                    color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgb(152, 86, 124)'
                            }, {
                            offset: 1,
                                color: 'rgb(49, 14, 72)'
                            }])
                } 
            },
            data: CarData.ChartLeaveCount
        }]
    });

}

//今日车辆来源柱形图
function CharCityFrom(){
    var divorder = GetChartdiv(3);
    $(".charttitle"+divorder).html("今日车辆来源");
    var CharCityFrom = echarts.init(document.getElementById("divchart" + divorder));

    
    CharCityFrom.setOption({
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
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
        {
            type : 'category',
            data : CarData.ChartCityName,
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
        yAxis : [
        {
            type : 'value',
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
        series : [
        {
            name:'来源地',
            type:'bar',
            barWidth: '60%',
            data:CarData.ChartCityCount
        }]
    });
}

var ChartsMap;

function ChartShowMap() {

    var divorder = GetChartdiv(4);
    $(".charttitle"+divorder).html("旅游车辆迁徙图");
    ChartsMap = echarts.init(document.getElementById("divchart" + divorder));

    function getcenter(){
        if(divorder==4){
            return [centerlat,centerlnt];
        }
        else{
            return [rightlat,rightlnt];
        }
    }

    function getzoom(){
        if(divorder==4){
            return unitzoom;
        }
        else{
            return rightunitzoom;
        }
    }


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
				            color: 'rgb(111, 255, 219)',
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
           
            center:getcenter(),
            zoom: getzoom(),
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
        series: mapseries,
    });
}


function GetData() {
    $.getJSON("WelcomeScenic.ashx", {
        unitid: unitid,
        r:Math.random()
    }, function (data) {
        CarData = data;

        $("#nowcount").text(CarData.CurrCount);
        $("#nowlevel").text(CarData.Level);
        $(".scalebarflat").width(CarData.Level);
        $("#entercount").text(CarData.EnterCount);
        $("#staynightcount").text(CarData.StayNightCount);
        $("#carennercount").text(CarData.EnterCount);
        $("#carleavecount").text(CarData.LeaveCount);

        for(var i = 0; i<CarData.ChartTypeName.length;i++) {
            switch(CarData.ChartTypeName[i])
            {
                case "客车":
                    $("#typebybus").text(CarData.ChartTypeCount[i]);
                break;
                case "轿车":
                    $("#typebycar").text(CarData.ChartTypeCount[i]);
                break;
            }
        }

        CurrInfoData();
        CurrCountData();
        CharCityFrom();
        ChartShowMap();
    });
    //5分钟以后刷新一次
    setTimeout("GetData()", 5 * 60 * 1000);
}


GetData();

