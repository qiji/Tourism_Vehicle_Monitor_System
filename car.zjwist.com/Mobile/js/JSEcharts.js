//车辆总数颜色控制 =1为夜间模式
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

//返回坐标线字体颜色
function gettextstylecolor(){
    if (cssmodelonclick == "0") {
        return '#536fff';
    }
    else {
        return '#fff';
    }
}

//柱状图银光颜色控制
function getshadowcolor(){
    if(cssmodelonclick == "0"){
        return '#B8C2FF';
    }else{
        return 'rgba(0, 255, 169,1)';
    }
}


//实时统计今日进入车辆折线图
function CarEnterCount(ChartFivMinute,ChartEnterCount,MaxELCount) {
    var ChartComeCount = echarts.init(document.getElementById('divCarCountEnter'));


    function gettooltipstring(params)
    {
        if (params[0].value==null)
        {
            return params[0].name+'<br /><span style="color:rgb(111, 255, 219)">进入:</span>';
        }
        else
        {
            return params[0].name+'<br /><span style="color:rgb(111, 255, 219)">进入:</span>'+params[0].value;
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
        grid: {
            left: '1%',
            right: '6%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: ChartFivMinute,
            splitLine:{
                show:true,
                lineStyle:{
                    color:'rgb(96,68,136)'
                }
            },
            axisLabel:{
                show:true,
                textStyle:{
                    color:gettextstylecolor()
                }
            }
        },
        yAxis: {
            type: 'value',
            splitLine:false,
            max:MaxELCount,
            axisLabel:{
                show:true,
                textStyle:{
                    color:gettextstylecolor()
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
            lineStyle:{
                normal:{
                    width:1
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
            data:ChartEnterCount,
        }]
    });
};


//实时统计今日离开车辆折线图
function CarLeaveCount(ChartFivMinute,ChartLeaveCount,MaxELCount) {
        
    var lineChart = echarts.init(document.getElementById('divCarCountLeave'));

        function gettooltipstring(params)
        {
            if (params[0].value==null)
            {
                return params[0].name+'<br /><span style="color:red">离开:</span>';
            }
            else
            {
                return params[0].name+'<br /><span style="color:red">离开:</span>'+params[0].value;
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
            left: '1%',
            right: '6%',
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
                    color: gettextstylecolor()
                }
            }
        }],
        yAxis: [
        {
            type: 'value',
            splitLine: false,
            max:MaxELCount,
            axisLabel: {
                show: true,
                textStyle: {
                    color: gettextstylecolor()
                }
            }
        }],
        series: [
        
        {
            name: '离开',
            smooth:true,
            type: 'line',
            itemStyle: {
                   	normal: {
                        color: getCountoutitemStylecolor()
                    }
                },
            lineStyle:{
                normal:{
                    width:1
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
       
}

//实时车辆变化图
function CarCountChange(ChartFivMinute,CurrCarCount) {
    var ChartCurrChange = echarts.init(document.getElementById('divCarCountChange'));


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
            
    ChartCurrChange.setOption({
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
        grid: {
            left: '1%',
            right: '6%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'category',
            boundaryGap: true,
            data: ChartFivMinute,
            splitLine:{
                show:true,
                lineStyle:{
                    color:'rgb(96,68,136)'
                }
            },
            axisLabel:{
                show:true,
                textStyle:{
                    color:gettextstylecolor()
                }
            }
        },
        yAxis: {
            type: 'value',
            splitLine:false,
            axisLabel:{
                show:true,
                textStyle:{
                    color:gettextstylecolor()
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
            lineStyle:{
                normal:{
                    width:1
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
            data:CurrCarCount,
        }]
    });
};


//实时统计今日车辆来源柱形图
function CharCityFrom(ChartCityName, ChartCityCount){
        var pieChart = echarts.init(document.getElementById('divCharCityFrom'));
        
      
        var cityname = [];
        var citycount = [];

        for (var i = 0; i < 10; i++) {
        
            if (ChartCityName.length < i)
            {
                cityname.push("");
                citycount.push("");
            }
            else
            {
                cityname.push(ChartCityName[i]);
                citycount.push(ChartCityCount[i]);
            }
        }

        cityname.reverse();
        citycount.reverse();

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
            left: '1%',
            right: '6%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
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
                    color: gettextstylecolor()
                }
            }
        }],
        yAxis : [
        {
            type : 'category',
            data : cityname,
            
            axisTick: {
                alignWithLabel: true
            },
            splitLine: false,
            axisLabel: {
                show: true,
//                rotate: 90,
                textStyle: {
                    color: gettextstylecolor()
                }
            }
        }],
        series : [
        {
            name:'来源地',
            type:'bar',
            barWidth: '40%',
            itemStyle:{
                normal:{
                    shadowBlur: 30,
                    shadowColor: getshadowcolor()
                }
            },
            data:citycount
        }]
        });
}

//统计数据下的车辆来源分析
    function sumCarComeFrom(ChartCityName, ChartCityCount){
       sumColumnChart   = echarts.init(document.getElementById('sumChartComeFrom'));


       for(var i= 0;i<10;i++){
            while(ChartCityName[i]==null){
                ChartCityCount.push("0");
                ChartCityName.push(" ");
            }
        }

        ChartCityName.reverse();
        ChartCityCount.reverse();

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
                left: '1%',
                right: '6%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [
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
                        color:gettextstylecolor()
                    }
                }
            }],
            yAxis : [
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
                        color: gettextstylecolor()
                    }
                }
                
            }],
            series : [
            {
                name:'来源地',
                type:'bar',
                barWidth: '40%',
                itemStyle:{
                    normal:{
                        shadowBlur: 30,
                        shadowColor: getshadowcolor()
                    }
                },
                data:ChartCityCount
            }]
         });
    }

//统计数据下逗留时长分析
function sumChartStayTime(STCityName,StayTime){
    var pieChart = echarts.init(document.getElementById('sumChartStayTime'));

    if(STCityName.length>10){
        STCityName=STCityName.slice(0,10);
        StayTime=StayTime.slice(0,10);
    }
    else
    {
        for(var i= 0;i<10;i++){
            while(StayTime[i]==null){
                StayTime.push("0");
                STCityName.push(" ");
            }
        }
    }
    STCityName.reverse();
    StayTime.reverse();

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
            left: '1%',
            right: '6%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
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
                    color: gettextstylecolor()
                }
            }
        }],
        yAxis : [
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
                    color: gettextstylecolor()
                }
            }
        }],
        series : [
        {
            name:'来源地',
            type:'bar',
            barWidth: '40%',
            itemStyle:{
                normal:{
                    shadowBlur: 30,
                    shadowColor: getshadowcolor()
                }
            },
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
                        color: gettextstylecolor()
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
                        color: gettextstylecolor()
                    }
                }
            }],
            series: [
            {
                type: 'line',
                smooth:true,
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
                smooth:true,
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
                        color: gettextstylecolor()
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
                        color: gettextstylecolor()
                    }
                }
            }],
            series: [
            {
                name: '数量',
                type: 'line',
                smooth:true,
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