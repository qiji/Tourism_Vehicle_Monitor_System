<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StatMenu.ascx.cs" Inherits="admin_StatMenu" %>
<div class="StatMenu">
    <ul>
        <li><a id="statmenu1" href="statcomefrom.aspx" class="statmenua ">来源统计</a></li>
        <li><a id="statmenu2" href="statflow.aspx" class="statmenua ">流量统计</a></li>
        <li><a id="statmenu3" href="statcartype.aspx" class="statmenua ">车辆类型</a></li>
    </ul>
</div>
<script src="http://cdn.bootcss.com/echarts/3.2.2/echarts.min.js"></script>
<script src="http://qy.zjwist.com/js/jquery.table2excel.js" type="text/javascript"></script>
<script src="../js/jsdate.js" type="text/javascript"></script>
<script>

    function ExportToExcel(grid, file) {
        $("." + grid).table2excel({
            exclude: ".noExl", // 不被导出的表格行的CSS class类
            name: "Sheet0",  // 导出的Excel文档的名称
            filename: file+".xls",    // Excel文件的名称
            exclude_img: false, //包含图片
            exclude_links: false,   //包含链接
            exclude_inputs: false   //包含输入框
        });
    }

    function SetStatMenuSelect() {
        var statmenu = GetCookie("StatMenuSelect");
        if (statmenu == null) {
            statmenu = "a1";
        }
        $("#" + statmenu).addClass("statmenuhref");
    }

    $(".statmenua").on("click", function () {
        SetCookie("StatMenuSelect", this.id);
    });

    SetStatMenuSelect();
</script>
