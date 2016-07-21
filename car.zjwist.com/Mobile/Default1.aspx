<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="Mobile_Default1" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=false">
    <link href="css/Default1.css" type="text/css" rel="stylesheet">
</head>
<body>
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
            <div class="svleftimg">
                <img src="images/svday.png" />
            </div>
            <div class="svleftdiv">
                <div class="svlefttvalue">
                    942</div>
                <div class="svlefttext">
                    今日进入车辆</div>
            </div>
            <div class="svleftflag">
                &nbsp;<img src="images/svdayflag.png" />
            </div>
        </div>
        <div class="csssvright">
            <div class="svleftimg">
                <img src="images/svnight.png" />
            </div>
            <div class="svleftdiv">
                <div class="svlefttvalue">
                    942</div>
                <div class="svlefttext">
                    昨日过夜车辆</div>
            </div>
            <div class="svrightflag">
                &nbsp;<img src="images/svnightflag.png" />
            </div>
        </div>
    </div>
    <div class="clear">
    </div>
</body>
</html>
