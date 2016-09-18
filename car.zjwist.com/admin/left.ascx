<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="admin_left" %>
<div runat="server" id="divAdmin">
    <div class="menulevel1 mdataana">
        数据分析
    </div>
    <ul>
        <li id="liactdata" class="menulevel2 mactdata"><a href="WelCome.aspx" id="aWelCome">
            实时数据</a></li>
        <li id="lisumdata" class="menulevel2 msumdata"><a href="statcomefrom.aspx" id="aStatInfo">
            统计数据</a></li>
    </ul>
    <div class="menulevel1 mdataquery">
        数据查询
    </div>
    <ul>
        <li id="licarquery" class="menulevel2 mcarquery"><a href="carcountinfo.aspx">车辆查询</a></li>
        <li id="licarpass" class="menulevel2 mcarpass"><a href="carPassinfo.aspx">过车查询</a></li>
        <li id="licarinner" class="menulevel2 mcarinner"><a href="EmployeeCarNo.aspx">内部车辆</a></li>
    </ul>
    <div class="menulevel1 msysset">
        系统设置
    </div>
    <ul>
        <li id="lisysuser" class="menulevel2 msysuser"><a href="SysUser.aspx">用户管理</a></li>
        <li id="lisyspwd" class="menulevel2 msyspwd"><a href="Pwd.aspx">修改密码</a></li>
    </ul>
</div>
<div runat="server" id="divManage">
    <div class="menulevel1 msysmanage">
        系统设置
    </div>
    <ul>
        <li id="licartemp" class="menulevel2 mcartemp"><a href="CarTemp.aspx">待处理车辆</a></li>
        <li id="liexeclog" class="menulevel2 mexeclog"><a href="ExecutionLog.aspx">执行日志</a></li>
        <li id="lierrorlog" class="menulevel2 merrorlog"><a href="ErrorLog.aspx">错误日志</a></li>
        <li id="liunitinfo" class="menulevel2 munitinfo"><a href="SysUnitInfo.aspx">单位管理</a></li>
        <li id="liareacode" class="menulevel2 mareacode"><a href="CarNoArea.aspx">车牌地区</a></li>
        <li id="liadminpwd" class="menulevel2 madminpwd"><a href="Pwd.aspx">修改密码</a></li>
    </ul>
</div>
<script>
    $(".menulevel2").on("click", function () {
        SetMenuSelect(this.id)
    });

    function SetMenuSelect(menuid) {
        $(".menulevel2 a").removeClass("menuselect");
        $("#" + menuid + " a").addClass("menuselect");
        SetCookie("CarMainMenu", menuid);
    }
</script>
