<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="Mobile_Default1" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=false">
    <link id="cssid" href="css/Default1_N.css" type="text/css" rel="stylesheet">    
    <script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.2.2/echarts.min.js"></script>
    <script src="iscroll.js"></script>
</head>
<body>
    <div class="linediv" id="wrapper" style="overflow: hidden; left: 0px; background-color: rgb(36, 8, 77);
        height: auto">
        <div id="scroller">
            <div id="pullDown" style="text-align: center;">
                <div style="display: inline-block">
                    <span class="pullDownIcon"></span><span class="pullDownLabel">下拉刷新...</span>
                </div>
            </div>
            <ul id="thelist">
                <div class="csstitle">
                    <div class="csstitletext">
                        实时数据</div>
                    <div class="csstitletext">
                        统计数据</div>
                    <div class="csstitletext">
                        <div class="csstitleimg">
                            <img src="images/Night.png">
                        </div>
                        <div class="cssmodel">
                            夜间<br />
                            模式
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
                <div class="csscurrdata">
                    <div class="csscurrdataimg">
                        <img src="images/staynow.png" />
                    </div>
                    <div class="csscurrdatatext">
                        当前景区停留
                    </div>
                    <div class="csscurrdatavalue">
                        888
                    </div>
                </div>
                <div class="clear">
                </div>
                <div class="csscurrdata">
                    <div class="csscurrdataimg">
                        <img src="images/scale.png" />
                    </div>
                    <div class="csscurrdatatext">
                        当前饱和度
                    </div>
                    <div class="csscurrdatavalue">
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
                            &nbsp;<img src="images/svdayflag.png" />
                        </div>
                        <div class="svleftdiv">
                            <div class="svlefttvalue">
                                942</div>
                            <div class="svlefttext">
                                今日进入车辆</div>
                        </div>
                        <div class="svleftimg">
                            <img src="images/svday.png" />
                        </div>
                    </div>
                    <div class="csssvright">
                        <div class="svrightflag">
                            &nbsp;<img src="images/svnightflag.png" />
                        </div>
                        <div class="svleftdiv">
                            <div class="svlefttvalue">
                                942</div>
                            <div class="svlefttext">
                                昨日过夜车辆</div>
                        </div>
                        <div class="svleftimg">
                            <img src="images/svnight.png" />
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
                <%--折线图--%>
                <div class="titlepostion">
                    <div class="titleimg">
                        <img src="images/title.png">
                        <span>今日车辆变化</span>
                    </div>
                    <div id="CharCurr" class="CurrChart">
                    </div>
                </div>
                <div class="clear">
                </div>
                <div class="titlepostion">
                    <div class="titleimg">
                        <img src="images/title.png">
                        <span>今日进出车辆</span>
                    </div>
                    <div id="divCarCountChange" class="CountChangChart">
                    </div>
                </div>
                <div class="clear">
                </div>
                <div class="countchang">
                    <div class="countchangenter">
                        <img src="images/carenter.png" />
                        <span class="cartext">进入车辆</span>
                        <div class="carentervalue">
                            467</div>
                    </div>
                    <div class="countchangleave">
                        <img src="images/carleave.png" />
                        <span class="cartext">离去车辆</span>
                        <div class="carleavevalue">
                            467</div>
                    </div>
                </div>
                <div class="clear">
                </div>
                <div class="titletypepostion">
                    <div class="cartypetitleimg">
                        <img src="images/title.png">
                        <span>今日车辆类型</span>
                    </div>
                    <div class="cartypebycar">
                        <img src="images/cartype.png" /><br />
                        <span class="cartypetext">轿车</span><br />
                        <span class="cartypevalue">593</span>
                    </div>
                    <div class="cartypebybus">
                        <img src="images/bustype.png" /><br />
                        <span class="cartypetext">客车</span><br />
                        <span class="cartypevalue">593</span>
                    </div>
                </div>
                <div class="clear">
                </div>
                <div class="titlepostion">
                    <div class="titleimg">
                        <img src="images/title.png">
                        <span>今日车辆来源</span>
                    </div>
                    <div id="divCharCityFrom" class="CityFromChart">
                    </div>
                </div>
                <div class="carfrom">
                    <div class="provincein">
                        省内城市
                    </div>
                    <div class="provinceout">
                        省外城市
                    </div>
                </div>
            </ul>
        </div>
    </div>
    <script src="Default1.js" type="text/javascript"></script>
    <script>
        $(".cssmodel").on("click", function () {
            $("#cssid").attr("href", "css/Default1_D.css");
        });

    </script>
</body>
</html>
