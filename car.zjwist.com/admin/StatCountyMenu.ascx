<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StatCountyMenu.ascx.cs"
    Inherits="admin_StatCountyMenu" %>
<div class="con_buts">
    <div class="buttoms">
        <ul>
            <li class="statmenu"><a href="statCountyCF.aspx" class="smcomefrom" id="asmcomefrom"
                runat="server" onclick="SetStatMenu('smcomefrom')">来源统计</a></li>
            <li class="statmenu"><a href="statCountyFlow.aspx" class="statflow" id="astatflow"
                runat="server" onclick="SetStatMenu('statflow')">流量统计</a></li>
            <li class="statmenu"><a href="statCountyCarType.aspx" class="smcartype" id="asmcartype"
                runat="server" onclick="SetStatMenu('smcartype')">车型统计</a></li>
            <%-- <li class="statmenu"><a href="statCountyunitrelate.aspx" id="smunitrelate" onclick="SetStatMenu('smunitrelate')">
                景区关联度</a></li>--%>
        </ul>
    </div>
</div>
<script src="http://qy.zjwist.com/js/jquery.table2excel.js" type="text/javascript"></script>
<script>
    //导出到Excel
    function ExportToExcel(grid, file) {
        $("." + grid).table2excel({
            exclude: ".noExl", // 不被导出的表格行的CSS class类
            name: "Sheet0",  // 导出的Excel文档的名称
            filename: file,    // Excel文件的名称
            exclude_img: false, //包含图片
            exclude_links: false,   //包含链接
            exclude_inputs: false   //包含输入框
        });
    }

    function SetStatMenu(liname) {
        SetCookie("StatMenu", liname);
    }

    function SetStateMenuColor() {
        //$(".statmenu").removeClass("statmenuliselect");

        var liid = GetCookie("StatMenu");
        if (liid != null) {
            $("." + liid).addClass("statmenuliselect");
            $("." + liid).css("color", "white");

        }
        else {
            SetCookie("StatMenu", "smcomefrom");
        }
    }
    SetStateMenuColor();
</script>
