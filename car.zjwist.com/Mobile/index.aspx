<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Mobile_index" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <link id="cssid" href="css/Default1_N.css" type="text/css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/echarts/3.2.2/echarts.common.min.js"></script>
    <script src="http://cdn.tourzj.com/js/jscookier.js"></script>
</head>
<body>
    
                <div class="csstitle">
                    <div id="titleactdata" class="titletext">
                        实时数据</div>
                    <div id="titlesumdata" class="titletext">
                        统计数据</div>
                    <div class="titletext domodelchange">
                        <div class="csstitleimg">
                            &nbsp;
                        </div>
                        <div class="cssmodel">
                            夜间<br />
                            模式
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
                <div id="divactdata">
                    <div class="csscurrdata">
                        <div class="csscurrdataimg1">
                            &nbsp;
                        </div>
                        <div class="csscurrdatatext">
                            当前景区停留
                        </div>
                        <div class="csscurrdatavalue" id="nowcount">
                            888
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="csscurrdata">
                        <div class="csscurrdataimg2">
                            &nbsp;
                        </div>
                        <div class="csscurrdatatext">
                            当前饱和度
                        </div>
                        <div class="csscurrdatavalue" id="nowlevel">
                            80%
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="cssbarbackground">
                        <div class="cssbarflat">
                            <%--在js脚本中设置这个class 的宽度！--%>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="cssSumValue">
                        <div class="csssvleft">
                            <div class="svleftflag">
                                &nbsp;
                            </div>
                            <div class="svleftdiv">
                                <div class="svlefttvalue" id="entercount">
                                    942</div>
                                <div class="svlefttext">
                                    今日进入车辆</div>
                            </div>
                            <div class="svleftimg">
                                &nbsp;
                            </div>
                        </div>
                        <div class="csssvright">
                            <div class="svrightflag">
                                &nbsp;
                            </div>
                            <div class="svleftdiv">
                                <div class="svlefttvalue" id="staynightcount">
                                    942</div>
                                <div class="svlefttext">
                                    昨日过夜车辆</div>
                            </div>
                            <div class="svrightimg">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <%--折线图--%>
                    <div class="titlepostion">
                        <div class="titleimg">
                            <span>今日车辆变化</span>
                        </div>
                        <div id="CharCurr" class="CurrChart">
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="titlepostion">
                        <div class="titleimg">
                            <span>今日进出车辆</span>
                        </div>
                        <div id="divCarCountChange" class="CountChangChart">
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="countchang">
                        <div class="countchangenter">
                            <span class="cartext">进入车辆</span>
                            <div class="carentervalue" id="entercarcount">
                                467</div>
                        </div>
                        <div class="countchangleave">
                            <span class="cartext">离去车辆</span>
                            <div class="carleavevalue" id="leavecarcount">
                                467</div>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="titletypepostion">
                        <div class="titleimg">
                            <span>今日车辆类型</span>
                        </div>
                        <div class="cartypebycar">
                            <br />
                            <span class="cartypetext">轿车</span><br />
                            <span class="cartypevalue" id="cartypebycar">593</span>
                        </div>
                        <div class="cartypebybus">
                            <br />
                            <span class="cartypetext">客车</span><br />
                            <span class="cartypevalue" id="cartypebybus">593</span>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="titlepostion">
                        <div class="titleimg">
                            <span>今日车辆来源</span>
                        </div>
                        <div id="divCharCityFrom" class="CityFromChart">
                        </div>
                    </div>
                    <br />
                    <br />
                    &nbsp;
                </div>
                <div id="divsumdata">
                    <div class="sumtitle">
                        <div class="sumtitletext titletextselect" onclick="statcarsum(1,this)">
                            来源统计
                        </div>
                        <div class="sumtitletext sumtitletextcenter" onclick="statcarsum(2,this)">
                            流量统计
                        </div>
                        <div class="sumtitletext" onclick="statcarsum(3,this)">
                            车型统计
                        </div>
                    </div>
                    <div id="divsumformatdate" class="sumtitle">
                        <div class="sumdatetext titletextselect" onclick="statcarformatdate(1,this)">
                            今日
                        </div>
                        <div class="sumdatetext" onclick="statcarformatdate(2,this)">
                            本周
                        </div>
                        <div class="sumdatetext" onclick="statcarformatdate(3,this)">
                            本月
                        </div>
                        <div class="sumdatetext sumdatetextright" onclick="statcarformatdate(4,this)">
                            本年
                        </div>
                    </div>

                    <div id="divsumcartypedate" class="sumtitle">
                        <div class="sumdatetypetext titletextselect" onclick="statcartypedate(1,this)">
                            今日
                        </div>
                        <div class="sumdatetypetext" onclick="statcartypedate(2,this)">
                            本周
                        </div>
                        <div class="sumdatetypetext" onclick="statcartypedate(3,this)">
                            本月
                        </div>
                        <div class="sumdatetypetext sumdatetextright" onclick="statcartypedate(4,this)">
                            本年
                        </div>
                    </div>

                    <div id="divsumarea" class="sumtitle">
                        <div class="sumareatext titletextselect" onclick="statcarareatype(0,this)">
                            按省份
                        </div>
                        <div class="sumareatext" onclick="statcarareatype(1,this)">
                            按城市
                        </div>
                        <div class="sumareatext" onclick="statcarareatype(2,this)">
                            省内城市
                        </div>
                        <div class="sumareatext sumareatextright" onclick="statcarareatype(3,this)">
                            省外城市
                        </div>
                    </div>
                    <div id="divsumdate" class="sumdateselect">
                        <div class="sumdatebegin">
                            <span id="datebeginshow" class="sumdatespanshow">2016-05-01</span>
                            <input id="dateBegin" class="sumdateinput" type="date" onclick="datechanged(this)"
                                onblur="datechanged(this')" onchange="datechanged(this)" onmouseout="datechanged(this)" />
                        </div>
                        <div class="sumdateto">
                            至
                        </div>
                        <div class="sumdatebegin">
                            <span id="dateendshow" class="sumdatespanshow">2016-05-01</span>
                            <input id="dateEnd" class="sumdateinput" type="date" onclick="datechanged(this)"
                                onblur="datechanged(this)" onchange="datechanged(this)" onmouseout="datechanged(this)" />
                        </div>
                        <div id="divsumdatebtn" class="sumdatebtn">
                            确定
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div id="divsummonth" class="summonthselect">
                        <div class="summonthbegin">
                            <span id="monthbeginshow" class="summonthspanshow">2016-05</span>
                            <input id="monthbegin" class="sumdateinput" type="month" onclick="datechanged(this)"
                                onblur="datechanged(this)" onchange="datechanged(this)" onmouseout="datechanged(this)" />
                        </div>
                        <div class="summonthbtn" onclick="DoStat2()">
                            确定
                        </div>
                        <div id="divmonthend" class="summonthbegin summonthbtnend">
                            <span id="monthendshow" class="summonthspanshow">2016-05</span>
                            <input id="monthend" class="sumdateinput" type="month" onclick="datechanged(this)"
                                onblur="datechanged(this)" onchange="datechanged(this)" onmouseout="datechanged(this)" />
                        </div>
                        <div id="divmonthbalance" class="summonthbtn summonthbtnend">
                            取消对比
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div id="divsumtypedate" class="sumdateselect">
                        <div class="sumdatebegin">
                            <span id="datetypebeginshow" class="sumdatespanshow">2016-05-01</span>
                            <input id="datetypebegin" class="sumdateinput" type="date" onclick="datechanged(this)"
                                onblur="datechanged(this')" onchange="datechanged(this)" onmouseout="datechanged(this)" />
                        </div>
                        <div class="sumdateto">
                            至
                        </div>
                        <div class="sumdatebegin">
                            <span id="datetypeendshow" class="sumdatespanshow">2016-05-01</span>
                            <input id="datetypeend" class="sumdateinput" type="date" onclick="datechanged(this)"
                                onblur="datechanged(this)" onchange="datechanged(this)" onmouseout="datechanged(this)" />
                        </div>
                        <div id="divsumtypebtn" class="sumdatebtn">
                            确定
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div id="divsumcomefrom">
                        <div class="titlepostion">
                            <div class="titleimg">
                                <span>车辆来源分析</span>
                            </div>
                            <div id="sumChartComeFrom" class="CurrChart">
                            </div>
                        </div>
                        <div class="titlepostion">
                            <div class="titleimg">
                                <span>逗留时间分析(小时)</span>
                            </div>
                            <div id="sumChartStayTime" class="CurrChart">
                            </div>
                        </div>
                    </div>
                    <div id="divsumcarchange" class="titlepostion">
                        <div class="titleimg">
                            <span class="titleimgtypespan">车辆变化情况</span>
                        </div>
                        <div id="sumChartCarChange" class="CurrChart">
                        </div>
                    </div>
                    <div id="divsumcartype" class="titlepostion">
                        <div class="titleimgtype">
                            <span class="titleimgtypespan">车辆类型</span>
                            <div class="clear">
                                </div>
                            <div class="cartypebycar">
                                <br />
                                
                                <span class="cartypetext">轿车</span><br />
                                <span class="cartypevalue" id="sumcartypevalue">593</span>
                            </div>
                            <div class="cartypebybus">
                                <br />
                                <span class="cartypetext">客车</span><br />
                                <span class="cartypevalue" id="sumbustypevalue">593</span>
                            </div>
                        </div>
                        <div id="sumChartCarType" class="CurrChart sumPieCarType">
                        </div>
                    </div>
                </div>

    <script>
        function datechanged(dateobj) {
            dateobj.parentElement.getElementsByTagName('span')[0].innerHTML = dateobj.value;
        }
    </script>
    <script>
        var unitid = "<%=unitid %>";
    </script>
    <script src="js/jsdate.js" type="text/javascript"></script>
    <script src="js/JSEcharts.js" type="text/javascript"></script>
    <script src="js/index.js" type="text/javascript"></script>
</body>
</html>
