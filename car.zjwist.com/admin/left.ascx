<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="admin_left" %>
<div class="aside">
    <div runat="server" id="divadmin">
        <div class="sidetl stldata">
            数据分析</div>
        <ul>
            <li class="sideoff classmenu Welcome"><a href="Welcome.aspx" runat="server" id="aWelCome"
                onclick="SetSideMenu('Welcome')">实时数据 </a></li>
            <li class="sideoff classmenu SumData"><a href="statinfo.aspx" runat="server" id="aStatInfo"
                onclick="SetSideMenu('SumData')">统计数据</a></li>
        </ul>
        <div runat="server" id="divScenic">
            <div class="sidetl stlsetting">
                系统管理</div>
            <ul>
                <li class="sideoff classmenu liCountTop"><a href="carcountinfo.aspx" onclick="SetSideMenu('liCountTop')">
                    车辆查询</a></li>
                <li class="sideoff classmenu liPassInfo"><a href="carPassinfo.aspx" onclick="SetSideMenu('liPassInfo')">
                    过车查询</a></li>
                <li class="sideoff classmenu liEmployee"><a href="EmployeeCarNo.aspx" onclick="SetSideMenu('liEmployee')">
                    内部车辆</a></li>
            </ul>
            <div class="sidetl stlsetting">
                系统设置</div>
            <ul>
                <li class="sideoff classmenu SysUser"><a href="SysUser.aspx" onclick="SetSideMenu('SysUser')">
                    用户管理</a></li>
                <li class="sideoff classmenu Pwd"><a href="Pwd.aspx" onclick="SetSideMenu('Pwd')">修改密码</a></li>
            </ul>
        </div>
    </div>
    <div runat="server" id="divManage">
        <div class="sidetl stlsetting">
            系统设置</div>
        <ul>
            <li class="sideoff classmenu CarTemp"><a href="CarTemp.aspx" onclick="SetSideMenu('CarTemp')">
                待处理车辆</a></li>
            <li class="sideoff classmenu ExecutionLog"><a href="ExecutionLog.aspx" onclick="SetSideMenu('ExecutionLog')">
                执行日志</a></li>
            <li class="sideoff classmenu ErrorLog"><a href="ErrorLog.aspx" onclick="SetSideMenu('ErrorLog')">
                错误日志</a></li>
            <li class="sideoff classmenu UnitInfo"><a href="SysUnitInfo.aspx" onclick="SetSideMenu('UnitInfo')">
                单位管理</a></li>
            <li class="sideoff classmenu CarAreaCode"><a href="CarNoArea.aspx" onclick="SetSideMenu('CarAreaCode')">
                车牌地区</a></li>
            <li class="sideoff classmenu ManagePwd"><a href="Pwd.aspx" onclick="SetSideMenu('ManagePwd')">
                修改密码</a></li>
        </ul>
    </div>
</div>
<script>
    function SetSideColor() {
        $(".classmenu").removeClass("sideon");
        $(".classmenu").addClass("sideoff");

        var liid = GetCookie("SideMenu");
        if (liid != null) {
            $("." + liid).removeClass("sideoff");
            $("." + liid).addClass("sideon");
        }
    }

    function SetSideMenu(menuname) {
        SetCookie("SideMenu", menuname);
        SetSideColor();
    }
    SetSideColor();
</script>
