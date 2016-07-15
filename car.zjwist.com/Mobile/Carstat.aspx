<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Carstat.aspx.cs" Inherits="Mobile_Carstat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=false">
    <link type="text/css" href="css/car.css" rel="stylesheet">
    <link type="text/css" href="http://weui.github.io/weui/weui.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
    <%--echarts 引入--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/3.2.2/echarts.min.js"></script>
    <script src="iscroll.js"></script>
</head>
<body>
    <div class="linediv" id="wrapper">
       <div id="scroller">
            <div id="pullDown">
			    <span class="pullDownIcon"></span><span class="pullDownLabel">Pull down to refresh...</span>
		    </div>
                <ul id="thelist">
                    <div id="divcarstat" style="height: 310px; width: 98%; margin: auto;">
                    </div>
                </ul>
           
        </div>
    </div>

    <div id="wrapper1">
        <div id="scroller1">
            <div id="pullDown1">
			    <span class="pullDownIcon"></span><span class="pullDownLabel">Pull down to refresh...</span>
		    </div>
                <ul id="thelist1">
			        <li>Pretty row 1</li>
		        </ul>
            <div id="pullUp1">
			    <span class="pullUpIcon"></span><span class="pullUpLabel">Pull up to refresh...</span>
		    </div>
        </div>
    </div>

</body>
</html>
<script>
    
    function GetData() {
        $.getJSON("ajax/WelComeMobile.ashx",
            {
                UnitID: 3,
                r: Math.random()
            },
            function (e) {
                CharCurr(e.ChartFivMinute, e.ChartCurrCount);
            });
    }

    function CharCurr(CharCurrTime, CharCurrCount) {
        var ChartComeCount = echarts.init(document.getElementById('divcarstat'));
        ChartComeCount.setOption({
            tooltip: {
               trigger: 'axis'
            },
            backgroundColor: 'rgb(0, 0, 0)',
            title: {
               left: 'center',
               text: '今日车辆变化',
               textStyle:{
                    color:'rgb(102,94,118)'
               }
            },
            
            xAxis: {
               type: 'category',
               boundaryGap: true,
               data: CharCurrTime,
               splitLine:{
                    show:true,
                    lineStyle:{
                        color:'rgb(60,50,50)'
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
          dataZoom: [{
              type: 'inside',
              start: 0,
              end: 100
          }],
           series: [
           {
                name:'数量',
                type:'line',
                smooth:true,
                sampling: 'average',
                itemStyle: {
               	    normal: {
                        color: 'rgb(255, 255, 255)'
                    }
                },
                areaStyle: {
                     normal: {
                         color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgb(89, 30, 201)'
                            }, {
                            offset: 1,
                                color: 'rgb(0, 0, 80)'
                            }])
                        }
                    },
                data:CharCurrCount,
            }    
           ]
        });
    };

    var myScroll,
	pullDownEl, pullDownOffset,
	pullUpEl, pullUpOffset,
	generatedCount = 0;

    function pullDownAction () {
	setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
		var el, li, i;
		el = document.getElementById('thelist');
		alert("2222");
		myScroll.refresh();
        GetData();		// Remember to refresh when contents are loaded (ie: on ajax completion)
	}, 1000);	// <-- Simulate network congestion, remove setTimeout from production!
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
				pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Pull down to refresh...';
			}
		},
		onScrollMove: function () {
			if (this.y > 5 && !pullDownEl.className.match('flip')) {
				pullDownEl.className = 'flip';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Release to refresh...';
				this.minScrollY = 0;
			} else if (this.y < 5 && pullDownEl.className.match('flip')) {
				pullDownEl.className = '';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Pull down to refresh...';
				this.minScrollY = -pullDownOffset;
			} 
		},
		onScrollEnd: function () {
			if (pullDownEl.className.match('flip')) {
				pullDownEl.className = 'loading';
				pullDownEl.querySelector('.pullDownLabel').innerHTML = 'Loading...';				
				pullDownAction();	// Execute custom function (ajax call?)
			} 
		}
	});
	
	setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
}
    document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);

    GetData();
</script>
