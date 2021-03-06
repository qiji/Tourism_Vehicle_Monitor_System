﻿
var cssmodelonclick = "1";
var showactdata = true;
var sumareatype = 0;
var sumColumnChart;
var sumlineChart;
var sumpieChart;

    $("#dayCurrEnd").on("click", function () {

        GetData();
    });

function GetData() {
    $.getJSON("../ajax/WelCome.ashx",
        {
            UnitID: unitid,
            datechange:$("#datechooseinput").val(),
            r: Math.random()
        },
        function (e) {
            document.title= e.UnitName + "旅游车辆监测统计分析系统";

            $(".titlesumpostion").css("height", "140px");


            CharCityFrom(e.ChartCityName, e.ChartCityCount);
            CarEnterCount(e.ChartFivMinute, e.ChartEnterCount,e.MaxELCount);

            var entercount = 0;
            for(var i = 0; i<e.ChartTypeName.length;i++) {
                switch(e.ChartTypeName[i])
                {
                    case "客车":
                            $("#cartypebybus").text(e.ChartTypeCount[i]);
                    break;
                    case "轿车":
                        $("#cartypebycar").text(e.ChartTypeCount[i]);
                    break;
                }
                entercount += e.ChartTypeCount[i];
            }

            $("#entercount").text(entercount);
            $("#staynightcount").text(e.StayNightCount);
        });
}

    $(".domodelchange").on("click", function () {
        if (cssmodelonclick == "1")
        {
            cssmodelonclick = "0"
        }
        else
        {
            cssmodelonclick = "1";
        }
        SetModalType();
    });

    $("#titleactdata").on("click",function(){
        if (showactdata)
        {
            return;
        }
        else
        {
            showactdata = true;
        }
        ActSumChange();
        GetData();
    });

     $("#titlesumdata").on("click",function(){
        if (!showactdata)
        {
            return;
        }
        else
        {
            showactdata = false;
        }
        ActSumChange();
        DoStat1();

    });

    //设置模式
    function SetModalType1()
    {
        if (cssmodelonclick == "1") {
            $("#cssid").attr("href", "css/Default1_N.css");
            $(".cssmodel").html("夜间<br/>模式");
            SetCookie("CarShowModal", "1");
        }
        else {
            $("#cssid").attr("href", "css/Default1_D.css");
            $(".cssmodel").html("日间<br/>模式");
            SetCookie("CarShowModal", "0");
        }
    }
    function SetModalType() 
    {
        sumColumnChart = null;
        sumpieChart = null;        
        sumlineChart = null;

        SetModalType1();

        GetData();

        if ($("#divsumcomefrom").is(":visible"))
        {
            DoStat1();
        }
        if ($("#divsumcarchange").is(":visible"))
        {
            DoStat2();
        }
        if ($("#divsumcartype").is(":visible"))
        {
            DoStat3();
        }
    }

    function SysInit(){
        cssmodelonclick = GetCookie("CarShowModal");
        if (cssmodelonclick == null)
        {
            cssmodelonclick = "1";
        }

        $("#monthbegin").val(getMonthBegin());

        

        $("#dateBegin").val(getTodayBegin());
        $("#dateEnd").val(getTodayEnd());

        $("#datebeginshow").html(getTodayBegin());
        $("#dateendshow").html(getTodayEnd());


         $("#datetypebegin").val(getTodayBegin());
        $("#datetypeend").val(getTodayEnd());

        $("#datetypebeginshow").html(getTodayBegin());
        $("#datetypeendshow").html(getTodayEnd());


         $("#monthbegin").val(getmonthBegin());
         $("#monthend").val(getmonthBegin());

          $("#monthbeginshow").html($("#monthbegin").val());
         $("#monthendshow").html($("#monthend").val());

         $("#divmonthend").hide();
         $("#divmonthbalance").html("对比&nbsp;+");
         $("#divmonthbalance").css("width","90%");


          HideSumDiv();
          $("#divsumformatdate").show();
          $("#divsumarea").show();
          $("#divsumdate").show();
          $("#divsumcomefrom").show();
        
        
        $("#datechooseinput").attr("max",getTodayBegin());

        $("#datechooseinput").val(dateparam);
        $("#datechoosespanshow").html(dateparam);
//        NextDateButtonSet();
    

        ActSumChange();
        SetModalType1();
        GetData();

    }
      SysInit();

    function HideSumDiv()
    {
    
         $("#divsumformatdate").hide();
        $("#divsumcartypedate").hide();
        
        $("#divsumarea").hide();
        $("#divsumdate").hide();        
        $("#divsummonth").hide();
        $("#divsumtypedate").hide();
        

        $("#divsumcomefrom").hide();
        $("#divsumcarchange").hide();
        $("#divsumcartype").hide();
    }

  
    
    $("#divmonthbalance").on("click",function(){
        if ($("#divmonthend").is(":hidden"))
        {
            $("#divmonthend").show();
            $("#divmonthbalance").html("取消对比");
            $("#divmonthbalance").css("width","30%");
        }
        else
        {
            $("#divmonthend").hide();
            $("#divmonthbalance").html("对比");
            $("#divmonthbalance").css("width","90%");
            DoStat2();
        }
    });

    $("#divsumdatebtn").on("click",function(){   
       DoStat1(); 
    });

    function ActSumChange()
    {
        $(".titletext").removeClass("titletextselect");
        if(showactdata)
        {
            $("#divsumdata").hide();
            $("#divactdata").show();

            $("#titleactdata").addClass("titletextselect");
        }
        else
        { 
            $("#divsumdata").show();
            $("#divactdata").hide();
            $("#titlesumdata").addClass("titletextselect");
        }
        
    }

   

    function statcarsum(sumtype,divobj)
    {
        $(".sumtitletext").removeClass("titletextselect");
        divobj.className += " titletextselect";
        
        HideSumDiv();
        //不需要立即查询
        switch(sumtype){
            case 1:
                $("#divsumformatdate").show();
                $("#divsumarea").show();
                $("#divsumdate").show();
                $("#divsumcomefrom").show();
                if(sumColumnChart==null){
                    DoStat1();
                }
             break;
            case 2:
                $("#divsummonth").show();
                $("#divsumcarchange").show();
                if(sumlineChart==null){
                    DoStat2();
                }
            break;
            case 3:
                $("#divsumcartypedate").show();
                $("#divsumtypedate").show();                
                $("#divsumcartype").show();
                if(sumpieChart==null){
                    DoStat3();
                }
            break;
        }
    }

    
    function statcartypedate(datetype,divobj)
    {
        $(".sumdatetypetext").removeClass("titletextselect");
        divobj.className += " titletextselect";

         switch(datetype)
            {
                case 1:
                    $("#datetypebegin").val(getTodayBegin());
                    $("#datetypeend").val(getTodayEnd());
                    $("#datetypebeginshow").html(getTodayBegin());
                    $("#datetypeendshow").html(getTodayEnd());
                break;
                case 2:
                    $("#datetypebegin").val(getWeekBegin());
                    $("#datetypeend").val(getWeekEnd());
                    $("#datetypebeginshow").html(getWeekBegin());
                    $("#datetypeendshow").html(getWeekEnd());
                break;
                case 3:
                    $("#datetypebegin").val(getMonthBegin());
                    $("#datetypeend").val(getMonthEnd());
                    $("#datetypebeginshow").html(getMonthBegin());
                    $("#datetypeendshow").html(getMonthEnd());
                break;
                case 4:
                   $("#datetypebegin").val(getYearBegin());
                   $("#datetypeend").val(getYearEnd()); 
                    $("#datetypebeginshow").html(getYearBegin());
                    $("#datetypeendshow").html(getYearEnd());
                break;
            }        
        //需要立即查询
        DoStat3();
    }

    //根据时间查询
    function statcarformatdate(datetype,divobj)
    {
        $(".sumdatetext").removeClass("titletextselect");
        divobj.className += " titletextselect";

         switch(datetype)
            {
                case 1:
                    $("#dateBegin").val(getTodayBegin());
                    $("#dateEnd").val(getTodayEnd());
                    $("#datebeginshow").html(getTodayBegin());
                    $("#dateendshow").html(getTodayEnd());
                break;
                case 2:
                    $("#dateBegin").val(getWeekBegin());
                    $("#dateEnd").val(getWeekEnd());
                    $("#datebeginshow").html(getWeekBegin());
                    $("#dateendshow").html(getWeekEnd());
                break;
                case 3:
                    $("#dateBegin").val(getMonthBegin());
                    $("#dateEnd").val(getMonthEnd());
                    $("#datebeginshow").html(getMonthBegin());
                    $("#dateendshow").html(getMonthEnd());
                break;
                case 4:
                   $("#dateBegin").val(getYearBegin());
                   $("#dateEnd").val(getYearEnd()); 
                    $("#datebeginshow").html(getYearBegin());
                    $("#dateendshow").html(getYearEnd());
                break;
            }
       
        //需要立即查询
        DoStat1();
    }

    //根据区域查询
    function statcarareatype(areatype,divobj)
    {
        $(".sumareatext").removeClass("titletextselect");
        divobj.className += " titletextselect";

        sumareatype = areatype;
       
        //需要立即查询
        DoStat1();
    }
    
    
    //获取查询数据(来源统计，车型统计)
    function DoStat1()
    {
        $.getJSON("../ajax/StatGetCarComeFrom.ashx",
        {
            BeginDate: $("#dateBegin").val(),
            EndDate: $("#dateEnd").val(),
            AreaType: sumareatype,
            UnitID: unitid,
            r: Math.random()
        },
        function(e){
            sumCarComeFrom(e.CityName,e.ComeCount);
            sumChartStayTime(e.STCityName,e.StayTime);
                   
        });
    }

    function DoStat3() {

        $.getJSON("../ajax/StatGetCarTypeInfo.ashx",
            {
                BeginDate: $("#datetypebegin").val(),
                EndDate: $("#datetypeend").val(),
                UnitID: unitid,
                r: Math.random(),
            },
            function(e){
                sumChartCarType(e.CarType,e.TypeCount);
            });
    }

    //获取查询数据(流量统计)
    function DoStat2(){
        var monthend = "";
        if ($("#divmonthend").is(":visible"))
        {
            monthend = $("#monthend").val()
        }

        $.getJSON("../ajax/StatGetCarFlowInfo.ashx",
                {
                    MonthBegin:$("#monthbegin").val(),
                    MonthEnd:monthend,
                    UnitID: unitid,
                    r: Math.random()
                },
                function(e){
                    sumChartCarChange(e.SDate,e.FCount,e.CompareFCount,$("#monthbegin").val(),monthend);
                });
    }


//下拉刷新
var myScroll,
pullDownEl, pullDownOffset;
//pullUpEl, pullUpOffset,
//generatedCount = 0;

/**
    * 下拉刷新 （自定义实现此方法）
    * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
    */
function pullDownAction () {
    setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!

        GetData();
        DoStat1();
        DoStat2();
        DoStat3();

//        var el, li, i;
//        el = document.getElementById('thelist');

//        for (i=0; i<3; i++) {
//            li = document.createElement('li');
//            li.innerText = 'Generated row ' + (++generatedCount);
//            el.insertBefore(li, el.childNodes[0]);
//        }

        myScroll.refresh();		//数据加载完成后，调用界面更新方法   Remember to refresh when contents are loaded (ie: on ajax completion)
    }, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
}

/**
    * 滚动翻页 （自定义实现此方法）
    * myScroll.refresh();		// 数据加载完成后，调用界面更新方法
    */
//function pullUpAction () {
//    setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
//        GetData();
////        var el, li, i;
////        el = document.getElementById('thelist');

////        for (i=0; i<3; i++) {
////            li = document.createElement('li');
////            li.innerText = 'Generated row ' + (++generatedCount);
////            el.appendChild(li, el.childNodes[0]);
////        }

//        myScroll.refresh();		// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
//    }, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
//}

/**
    * 初始化iScroll控件
    */
function loaded() {
    pullDownEl = document.getElementById('pullDown');
    pullDownOffset = pullDownEl.offsetHeight;
//    pullUpEl = document.getElementById('pullUp');
//    pullUpOffset = pullUpEl.offsetHeight;

    myScroll = new iScroll('wrapper', {
        scrollbarClass: 'myScrollbar', /* 重要样式 */
        useTransition: false, /* 此属性不知用意，本人从true改为false */
        topOffset: pullDownOffset,
        onRefresh: function () {
            if (pullDownEl.className.match('loading')) {
                pullDownEl.className = '';
                pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
            }
//             else if (pullUpEl.className.match('loading')) {
//                pullUpEl.className = '';
//                pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
//            }
        },
        onScrollMove: function () {
            if (this.y > 5 && !pullDownEl.className.match('flip')) {
                pullDownEl.className = 'flip';
                pullDownEl.querySelector('.pullDownLabel').innerHTML = '松手开始更新...';
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
                pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';
                pullDownAction();	// Execute custom function (ajax call?)
            } 
//            else if (pullUpEl.className.match('flip')) {
//                pullUpEl.className = 'loading';
//                pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';
//                pullUpAction();	// Execute custom function (ajax call?)
//            }
        }
    });

    setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
}

//初始化绑定iScroll控件
document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
document.addEventListener('DOMContentLoaded', loaded, false);