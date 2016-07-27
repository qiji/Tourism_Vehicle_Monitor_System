var now = new Date(); //当前日期 
var nowDayOfWeek = now.getDay(); //今天本周的第几天 
var nowDay = now.getDate(); //当前日 
var nowMonth = now.getMonth(); //当前月 
var nowYear = now.getYear(); //当前年 

nowYear += (nowYear < 2000) ? 1900 : 0; //


//格局化日期：yyyy-MM-dd 
function formatDate(date) {
    var myyear = date.getFullYear();
    var mymonth = date.getMonth() + 1;
    var myweekday = date.getDate();

    if (mymonth < 10) {
        mymonth = "0" + mymonth;
    }
    if (myweekday < 10) {
        myweekday = "0" + myweekday;
    }
    return (myyear + "-" + mymonth + "-" + myweekday);
}

function getmonthBegin() { 
    var dd = formatDate(now);
    return dd.substr(0,7);
}

//获得当天
function getTodayBegin() {
    return formatDate(now);
}
//获得当天 + 1
function getTodayEnd() {
    var dd = new Date();
    dd.setDate(dd.getDate() + 1); //获取AddDayCount天后的日期
    return formatDate(dd);
}

//获得本周的开始日期 
function getWeekBegin() {
    var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek + 1);
    return formatDate(weekStartDate);
}

//获得本周的停止日期 
function getWeekEnd(type) {
    var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek + 2));
    return formatDate(weekEndDate);
}

//获得本月的开始日期 
function getMonthBegin() {
    var monthStartDate = new Date(nowYear, nowMonth, 1);
    return formatDate(monthStartDate);
}

//获得本月的结束日期 
function getMonthEnd(type) {
    var monthEndDate = new Date(nowYear, nowMonth + 1, 1);
    return formatDate(monthEndDate);
}

//获得本年的开始日期 
function getYearBegin() {
    var monthStartDate = new Date(nowYear, 0, 1);
    return formatDate(monthStartDate);
}

//获得本年的结束日期 
function getYearEnd() {
    var monthEndDate = new Date(nowYear + 1,  0, 1);
    return formatDate(monthEndDate);
}