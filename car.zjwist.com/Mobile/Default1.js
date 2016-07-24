
//车辆总数颜色控制
function getCurritemStylecolor(){
    if(cssmodelonclick){
        return 'rgb(84, 110, 255)'
    }else{
        return 'rgb(111, 255, 219)'
    }
}

function getCurrareaStylecolor1(){
    if(cssmodelonclick){
        return 'rgb(108, 128, 241)'
    }else{
        return 'rgb(91, 19, 207)'
    }
}
function getCurrareaStylecolor2(){
    if(cssmodelonclick){
        return 'rgb(255, 255, 255)'
    }else{
        return 'rgb(33, 9, 67)'
    }
}


//进入车辆颜色
function getCountinitemStylecolor(){
    if(cssmodelonclick){
        return 'rgb(124, 144, 255)'
    }else{
        return 'rgb(111, 255, 219)'
    }
}

function getCountinareaStylecolor1(){
    if(cssmodelonclick){
        return 'rgb(119, 94, 242)'
    }else{
        return 'rgb(91, 19, 207)'
    }
}


function getCountinareaStylecolor2(){
    if(cssmodelonclick){
        return 'rgb(255, 255, 255)'
    }else{
        return 'rgb(49, 14, 72)'
    }
} 
 

//离开车辆颜色控制
function getCountoutitemStylecolor(){
    if(cssmodelonclick){
        return 'rgb(216, 30, 191)'
    }else{
        return 'rgb(202, 67, 125)'
    }
}

function getCountoutareaStylecolor1(){
    if(cssmodelonclick){
        return 'rgb(244, 114, 212)'
    }else{
        return 'rgb(152, 86, 124)'
    }
}

function getCountoutareaStylecolor2(){
    if(cssmodelonclick){
        return 'rgb(255, 255, 255)'
    }else{
        return 'rgb(49, 14, 72)'
    }
}

  function GetData() {
        $.getJSON("ajax/WelComeMobile.ashx",
            {
                UnitID: 3,
                r: Math.random()
            },
            function (e) {
                $("#nowcount").text(e.CurrCount);
                $("#nowlevel").text(e.Level);
                $("#entercount").text(e.EnterCount);
                $("#staynightcount").text(e.StayNightCount);
                CharCurr(e.ChartFivMinute, e.ChartCurrCount);
                CarCountChange(e.ChartFivMinute, e.ChartEnterCount, e.ChartLeaveCount);
                CharCityFrom(e.ChartCityName, e.ChartCityCount);
                $("#cartypebycar").text(e.ChartTypeCount[1]);
                $("#cartypebybus").text(e.ChartTypeCount[0]);

            });
    }

     //今日车辆变化折线图
        function CharCurr(CharCurrTime, CharCurrCount) {
            var ChartComeCount = echarts.init(document.getElementById('CharCurr'));
            ChartComeCount.setOption({
                tooltip: {
                   trigger: 'axis',
                   formatter:'{b0}<br />数量{c0}',
                   borderWidth:2,
                   borderColor: '#ffffff',
                   textStyle:{
                        fontWeight:'100',
                        fontSize:8
                   }
                },
//                title: {
//                   left: 'left',
//                   text: '今日车辆变化',
//                   textStyle:{
//                        color:'#ffffff'
//                   }
//                },
                
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

    
    

    //今日进出车辆折线图
    function CarCountChange(ChartFivMinute, ChartEnterCount, ChartLeaveCount) {
        
        var lineChart = echarts.init(document.getElementById('divCarCountChange'));

        lineChart.setOption({
//            title: {
//                left: 'left',
//                text: '今日进出车辆',
//                textStyle: {
//                    color: '#ffffff'
//                }
//            },
            tooltip: {
                trigger: 'axis',
                formatter: '{b0}<br /><span style="color:#47fad0">∨</span>{c0}<br /><span style="color:red">∧</span>{c1}',
                borderWidth: 2,
                borderColor: '#ffffff',
                textStyle: {
                    fontWeight: '100',
                    fontSize: 8
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


    //今日车辆来源柱形图
    function CharCityFrom(ChartCityName, ChartCityCount){
         var pieChart = echarts.init(document.getElementById('divCharCityFrom'));

         pieChart.setOption({
//            title:{
//                text:'今日车辆来源',
//                left: 'left',
//                textStyle: {
//                    color: '#ffffff'
//                }
//            },
            color: ['#6fffdc'],
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
   

    var myScroll,
	pullDownEl, pullDownOffset,
	pullUpEl, pullUpOffset,
	generatedCount = 0;

    function pullDownAction() {
        setTimeout(function () {
            var el;
            el = document.getElementById('thelist');
            myScroll.refresh();
            GetData();
        }, 1000);
    }


    function loaded() {
        pullDownEl = document.getElementById('pullDown');
        pullDownOffset = pullDownEl.offsetHeight;

        myScroll = new iScroll('wrapper', {
            useTransition: true,
            topOffset: pullDownOffset,
            onRefresh: function () {
                if (pullDownEl.className.match('loading')) {
                    pullDownEl.className = '';
                    pullDownEl.querySelector('.pullDownLabel').innerHTML = '更新完成...';
                }
            },
            onScrollMove: function () {
                if (this.y > 5 && !pullDownEl.className.match('flip')) {
                    pullDownEl.className = 'flip';
                    pullDownEl.querySelector('.pullDownLabel').innerHTML = '放开刷新...';
                    this.minScrollY = 0;
                } else if (this.y < 5 && pullDownEl.className.match('flip')) {
                    pullDownEl.className = '';
                    pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
                    this.minScrollY = -pullDownOffset;
                }
            },
            onScrollEnd: function () {
                if (pullDownEl.className.match('flip')) {
                    pullDownEl.className = 'loading';
                    pullDownEl.querySelector('.pullDownLabel').innerHTML = '等待更新...';
                    pullDownAction();
                }
            }
        });

        setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
    }
    document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);

    GetData();