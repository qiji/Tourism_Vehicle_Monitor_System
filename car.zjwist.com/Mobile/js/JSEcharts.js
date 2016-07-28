//车辆总数颜色控制
function getCurritemStylecolor() {
    if (cssmodelonclick == "0") {
        return 'rgb(84, 110, 255)'
    } else {
        return 'rgb(111, 255, 219)'
    }
}

function getCurrareaStylecolor1() {
    if (cssmodelonclick == "0") {
        return 'rgb(108, 128, 241)'
    } else {
        return 'rgb(91, 19, 207)'
    }
}
function getCurrareaStylecolor2() {
    if (cssmodelonclick == "0") {
        return 'rgb(255, 255, 255)'
    } else {
        return 'rgb(33, 9, 67)'
    }
}


//进入车辆颜色
function getCountinitemStylecolor() {
    if (cssmodelonclick == "0") {
        return 'rgb(124, 144, 255)'
    } else {
        return 'rgb(111, 255, 219)'
    }
}

function getCountinareaStylecolor1() {
    if (cssmodelonclick == "0") {
        return 'rgb(119, 94, 242)'
    } else {
        return 'rgb(91, 19, 207)'
    }
}


function getCountinareaStylecolor2() {
    if (cssmodelonclick == "0") {
        return 'rgb(255, 255, 255)'
    } else {
        return 'rgb(49, 14, 72)'
    }
}


//离开车辆颜色控制
function getCountoutitemStylecolor() {
    if (cssmodelonclick == "0") {
        return 'rgb(216, 30, 191)'
    } else {
        return 'rgb(202, 67, 125)'
    }
}

function getCountoutareaStylecolor1() {
    if (cssmodelonclick == "0") {
        return 'rgb(244, 114, 212)'
    } else {
        return 'rgb(152, 86, 124)'
    }
}

function getCountoutareaStylecolor2() {
    if (cssmodelonclick == "0") {
        return 'rgb(255, 255, 255)'
    } else {
        return 'rgb(49, 14, 72)'
    }
}
//柱形图背景色
function getcityfromcolor() {
    if (cssmodelonclick == "0") {
        return ["#B8C2FF"];
    }
    else {
        return ["#6fffdc"];
    }
}



//实时统计今日车辆变化折线图
function CharCurr(CharCurrTime, CharCurrCount) {
    var ChartComeCount = echarts.init(document.getElementById('CharCurr'));

    function gettooltipstring(params)
    {
        if (params[0].value==null)
        {
            return params[0].name+'<br />数量:';
        }
        else
        {
            return params[0].name+'<br />数量:'+params[0].value;
        }
    }
            
    ChartComeCount.setOption({
        tooltip: {
            trigger: 'axis',
            formatter: function(params){
                return  gettooltipstring(params);
            },
            borderWidth:1,
            borderColor: '#ffffff',
            textStyle:{
                fontWeight:'100',
                fontSize:13
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: CharCurrTime,
            splitLine:{
                show:true,
                lineStyle:{
                    color:'rgb(96,68,136)'
                }
            },
            axisLabel:{
                show:true,
                textStyle:{
                    color:'rgb(102,94,118)'
                }
            }
        },
        yAxis: {
            type: 'value',
            data: CharCurrCount,
            splitLine:false,
            axisLabel:{
                show:true,
                textStyle:{
                    color:'rgb(102,94,118)'
                }
            }
        },
        series: [
        {
            //name:'数量',
            type:'line',
            smooth:true,
            sampling: 'average',
            itemStyle: {
                normal: {
                    color:getCurritemStylecolor()
                }
            },
            areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                        offset: 0,
                        color:getCurrareaStylecolor1()
                        }, {
                        offset: 1,
                            color: getCurrareaStylecolor2()
                        }])
                    }
                },
            data:CharCurrCount,
        }]
    });
};


//实时统计今日进出车辆折线图
function CarCountChange(ChartFivMinute, ChartEnterCount, ChartLeaveCount) {
        
    var lineChart = echarts.init(document.getElementById('divCarCountChange'));

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
    lineChart.setOption({
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
            data: ChartFivMinute,
            splitLine: {
                show: true,
                lineStyle: {
                    color: 'rgb(89,65,123)'
                }
            },
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'rgb(102,94,118)'
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
                    color: 'rgb(102,94,118)'
                }
            }
        }],
        series: [
        {
            name: '进入',
            type: 'line',
            itemStyle: {
                   	normal: {
                        color: getCountinitemStylecolor()
                    }
                },
            areaStyle: { 
                normal: {
                    color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: getCountinareaStylecolor1()
                            }, {
                            offset: 1,
                                color:getCountinareaStylecolor2()
                            }])
                } 
            },
            data: ChartEnterCount
        },
        {
            name: '离开',
            type: 'line',
            itemStyle: {
                   	normal: {
                        color: getCountoutitemStylecolor()
                    }
                },
            areaStyle: { 
                normal: {
                    color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: getCountoutareaStylecolor1()
                            }, {
                            offset: 1,
                                color: getCountoutareaStylecolor2()
                            }])
                } 
            },
            data: ChartLeaveCount
        }]
    });

    for(var i = 0; i < ChartFivMinute.length; i++){
        if(ChartEnterCount[i] != null){
            $("#entercarcount").text(ChartEnterCount[i]);
            $("#leavecarcount").text(ChartLeaveCount[i]);
        }else{
            return;
        } 
    }       
}

//实时统计今日车辆来源柱形图
function CharCityFrom(ChartCityName, ChartCityCount){
        var pieChart = echarts.init(document.getElementById('divCharCityFrom'));

        pieChart.setOption({
        color: getcityfromcolor(),
        tooltip : {
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
            data : ChartCityName,
            axisTick: {
                alignWithLabel: true
            },
            splitLine: false,
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'rgb(102,94,118)'
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
                    color: 'rgb(102,94,118)'
                }
            }
        }],
        series : [
        {
            name:'来源地',
            type:'bar',
            barWidth: '60%',
            data:ChartCityCount
        }]
        });
}



//统计数据下的车辆来源分析
    function sumCarComeFrom(ChartCityName, ChartCityCount){
       sumColumnChart   = echarts.init(document.getElementById('sumChartComeFrom'));

         sumColumnChart.setOption({
            color: getcityfromcolor(),
            tooltip : {
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
                data : ChartCityName,
                axisTick: {
                    alignWithLabel: true
                },
                splitLine: false,
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: 'rgb(102,94,118)'
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
                        color: 'rgb(102,94,118)'
                    }
                }
            }],
            series : [
            {
                name:'来源地',
                type:'bar',
                barWidth: '60%',
                data:ChartCityCount
            }]
         });
    }

//统计数据下逗留时长分析
function sumChartStayTime(STCityName,StayTime){
    var pieChart = echarts.init(document.getElementById('sumChartStayTime'));

    pieChart.setOption({
        color: getcityfromcolor(),
        tooltip : {
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
            data : STCityName,
            axisTick: {
                alignWithLabel: true
            },
            splitLine: false,
            axisLabel: {
                show: true,
                textStyle: {
                    color: 'rgb(102,94,118)'
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
                    color: 'rgb(102,94,118)'
                }
            }
        }],
        series : [
        {
            name:'来源地',
            type:'bar',
            barWidth: '60%',
            data:StayTime
        }]
        });
}


//统计数据流量统计对比
function sumChartCarChange(SDate,FCount,CompareFCount,MonthBegin,MonthEnd){
    
    lineChart = echarts.init(document.getElementById('sumChartCarChange'));
 
    if(CompareFCount.length!=0){ //需要对比
        lineChart.setOption({
            tooltip: {
                trigger: 'axis',
                formatter:'{b0}日<br /><span style="color:'+getCountinitemStylecolor()+'">'+MonthBegin+'</span>:&nbsp{c0}<br /><span style="color:'+getCountoutitemStylecolor()+'">'+MonthEnd+'</span>:&nbsp{c1}',
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
                        color: 'rgb(102,94,118)'
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
                        color: 'rgb(102,94,118)'
                    }
                }
            }],
            series: [
            {
                type: 'line',
                itemStyle: {
                   	    normal: {
                            color: getCountinitemStylecolor()
                        }
                    },
                areaStyle: { 
                    normal: {
                        color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: getCountinareaStylecolor1()
                                }, {
                                offset: 1,
                                    color:getCountinareaStylecolor2()
                                }])
                    } 
                },
                data: FCount
            },
            {
                type: 'line',
                itemStyle: {
                       	normal: {
                            color: getCountoutitemStylecolor()
                        }
                    },
                areaStyle: { 
                    normal: {
                        color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: getCountoutareaStylecolor1()
                                }, {
                                offset: 1,
                                    color: getCountoutareaStylecolor2()
                                }])
                    } 
                },
                data: CompareFCount
            }]
        });  
    }else{
        lineChart.setOption({
            tooltip: {
                trigger: 'axis',
                formatter:'{b0}日<br /><span style="color:'+getCountinitemStylecolor()+'">'+MonthBegin+'</span>:&nbsp{c0}',
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
                        color: 'rgb(102,94,118)'
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
                        color: 'rgb(102,94,118)'
                    }
                }
            }],
            series: [
            {
                name: '数量',
                type: 'line',
                itemStyle: {
                   	    normal: {
                            color: getCountinitemStylecolor()
                        }
                    },
                areaStyle: { 
                    normal: {
                        color : new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: getCountinareaStylecolor1()
                                }, {
                                offset: 1,
                                    color:getCountinareaStylecolor2()
                                }])
                    } 
                },
                data: FCount
            }]
        });  
    }
}

//统计数据下车辆类型分析
function sumChartCarType(CarType,TypeCount){
    $("#sumcartypevalue").text("");
    $("#sumbustypevalue").text("");

    for(var i = 0; i<CarType.length;i++) {
        switch(CarType[i])
        {
            case "客车":
                $("#sumbustypevalue").text(TypeCount[i]);
            break;
            case "轿车":
                $("#sumcartypevalue").text(TypeCount[i]);
            break;
        }
    }
        sumpieChart = echarts.init(document.getElementById('sumChartCarType'));

        function getsumChartCarTypeColor(){
        if(cssmodelonclick == "0"){
            return 'rgb(84, 110, 255)'
        }else{
            return 'rgb(255, 255, 255)'
        }
        }

        option={
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        series: [
        {
            type:'pie',
            radius: ['10%', '50%'],
            avoidLabelOverlap: false,
            label:{
                normal:{
                    show:true,
                    textStyle:{
                        color:getsumChartCarTypeColor(),
                        fontSize:18
                    }
                }
            },
            labelLine: {
                normal: {
                    show: true,
                    lineStyle:{
                        type:'solid'
                    },
                    length:20,
                    length2:60
                },
            },
            data:[]
        }]
        }
         
        //根据车辆类型定义扇形区域颜色
        function getpiecolor(sumcartype){
            if (sumcartype=="客车")
            {
                if(cssmodelonclick == "0"){
                    return 'rgb(184,194,255)'
                }else{    
                    return 'rgb(125,62,231)'
                }
            }else{
                if(cssmodelonclick == "0"){
                    return 'rgb(84,110,255)'
                }else{ 
                    return 'rgb(83,34,159)';
                }
            }
        }
        for(var i = 0; i<CarType.length;i++)
        {
            option.series[0].data.push({ 
                value: TypeCount[i], 
                name: CarType[i],
                itemStyle:{
                    normal:{
                    color:getpiecolor(CarType[i])
                    }
                }
            });
        }
    sumpieChart.setOption(option);
}