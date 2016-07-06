<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StatMenu.ascx.cs" Inherits="admin_StatMenu" %>
<div class="con_buts">
    <div class="buttoms">
        <ul>
            <li class="statmenu"><a href="statcomefrom.aspx" runat="server" id="asmcomefrom"
                class="smcomefrom" onclick="SetStatMenu('smcomefrom')">来源统计</a></li>
            <li class="statmenu"><a href="statflow.aspx" runat="server" id="astatflow" class="statflow"
                onclick="SetStatMenu('statflow')">流量统计</a></li>
            <li class="statmenu"><a href="statcartype.aspx" runat="server" id="asmcartype" class="smcartype"
                onclick="SetStatMenu('smcartype')">车型统计</a></li>
            <%--<li class="statmenu"><a href="statunitrelate.aspx" id="smunitrelate" onclick="SetStatMenu('smunitrelate')">
                景区关联度</a></li>--%>
        </ul>
    </div>
</div>
<script src="http://cdn.tourzj.com/js/jquery.table2excel.js" type="text/javascript"></script>
<script>
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
            //            $("#smpassinfo").addClass("statmenuliselect");
            //            $("#smpassinfo").css("color", "white");
            SetCookie("StatMenu", "smcomefrom");
        }
    }
    SetStateMenuColor();
</script>
