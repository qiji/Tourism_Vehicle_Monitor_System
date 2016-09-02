<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="statCountyCF.aspx.cs" Inherits="admin_statCountyCF" %>

<%@ Register Src="StatCountyMenu.ascx" TagName="StatCountyMenu" TagPrefix="uc1" %>
<%@ Register Src="statdateselect.ascx" TagName="statdateselect" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/List.css" rel="Stylesheet" type="text/css" />
    <script>
        SetCookie("StatMenu", "smcomefrom");
    </script>
    <uc1:StatCountyMenu ID="StatCountyMenu1" runat="server" />
    <div class="con_tables">
        <div class="ct_block">
            <uc2:statdateselect ID="statdateselect1" runat="server" ButtonVisible="false" />
            <div class="slt">
                <div class="slt_cars">
                    <div class="slt_tl" style="margin-top: 2px">
                        统计类型：</div>
                    <div class="slt_type">
                        <asp:RadioButtonList runat="server" ID="rblSumType" RepeatDirection="Horizontal"
                            AutoPostBack="True" OnSelectedIndexChanged="rblSumType_SelectedIndexChanged">
                        </asp:RadioButtonList>
                    </div>
                    <div class="sltc_input" style="margin-top: 14px; margin-left: 20px">
                        <asp:Button runat="server" ID="btnOK" Text="查询" OnClick="btnOK_Click" />
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="ct_block">
            <div class="ctb_07" id="divCountyCF">
            </div>
            <div class="ctb_08">
                <a href="javascript:;" onclick="ExportToExcel('GridView1','高速来源地分析')">导出Excel</a><br />
                <div class="cilineforgridview" style="color: Black; margin: 10px; height: 90%">
                    <asp:GridView ID="GridView1" class="GridView1" runat="server" AutoGenerateColumns="False"
                        BackColor="White" GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3"
                        BorderStyle="Solid" BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据"
                        PageSize="20">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:BoundField DataField="DestName" HeaderText="来源地" />
                            <asp:BoundField DataField="ComeCount" HeaderText="数量" />
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" CssClass="cigvp"
                            Font-Size="15px" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle Height="25px" BackColor="#EDF4FC" Font-Bold="True" ForeColor="Black"
                            HorizontalAlign="Center"></HeaderStyle>
                        <AlternatingRowStyle BackColor="#EDF4FC" />
                    </asp:GridView>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="ct_block">
            <div class="ctb_07" id="divCountySH">
            </div>
            <div class="ctb_08">
                <a href="javascript:;" onclick="ExportToExcel('GridView2','高速逗留时间分析')">导出Excel</a><br />
                <div class="cilineforgridview" style="color: Black; margin: 10px; height: 90%">
                    <asp:GridView ID="GridView2" class="GridView2" runat="server" AutoGenerateColumns="False"
                        BackColor="White" GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3"
                        BorderStyle="Solid" BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据"
                        PageSize="20">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:BoundField DataField="StayTime" HeaderText="时间（小时）" />
                            <asp:BoundField DataField="CarCount" HeaderText="车辆数" />
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" CssClass="cigvp"
                            Font-Size="15px" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle Height="25px" BackColor="#EDF4FC" Font-Bold="True" ForeColor="Black"
                            HorizontalAlign="Center"></HeaderStyle>
                        <AlternatingRowStyle BackColor="#EDF4FC" />
                    </asp:GridView>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="ct_block">
            <div class="ctb_07" id="divScenicCF">
            </div>
            <div class="ctb_08">
                <a href="javascript:;" onclick="ExportToExcel('GridView3','景区来源地分析')">导出Excel</a><br />
                <div class="cilineforgridview" style="color: Black; margin: 10px; height: 90%">
                    <asp:GridView ID="GridView3" class="GridView3" runat="server" AutoGenerateColumns="False"
                        BackColor="White" GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3"
                        BorderStyle="Solid" BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据"
                        PageSize="20">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:BoundField DataField="DestName" HeaderText="来源地" />
                            <asp:BoundField DataField="ComeCount" HeaderText="数量" />
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" CssClass="cigvp"
                            Font-Size="15px" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle Height="25px" BackColor="#EDF4FC" Font-Bold="True" ForeColor="Black"
                            HorizontalAlign="Center"></HeaderStyle>
                        <AlternatingRowStyle BackColor="#EDF4FC" />
                    </asp:GridView>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="ct_block">
            <div class="ctb_07" id="divScenicSH">
            </div>
            <div class="ctb_08">
                <a href="javascript:;" onclick="ExportToExcel('GridView4','景区逗留时间分析')">导出Excel</a><br />
                <div class="cilineforgridview" style="color: Black; margin: 10px; height: 90%">
                    <asp:GridView ID="GridView4" class="GridView4" runat="server" AutoGenerateColumns="False"
                        BackColor="White" GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3"
                        BorderStyle="Solid" BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据"
                        PageSize="20">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:BoundField DataField="StayTime" HeaderText="时间（小时）" />
                            <asp:BoundField DataField="CarCount" HeaderText="车辆数" />
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" CssClass="cigvp"
                            Font-Size="15px" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle Height="25px" BackColor="#EDF4FC" Font-Bold="True" ForeColor="Black"
                            HorizontalAlign="Center"></HeaderStyle>
                        <AlternatingRowStyle BackColor="#EDF4FC" />
                    </asp:GridView>
                </div>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <script src="http://cdn.bootcss.com/echarts/3.2.2/echarts.min.js" type="text/javascript"></script>
    <script>
        $(window).on("load", function () {
            $(".content").css({ "height": "auto" });
            ChartInit();
        });
        function ChartInit() {
            var ChartCountyCC = echarts.init(document.getElementById('divCountyCF'));
            ChartCountyCC.setOption({
                title: {
                    text: '高速车辆来源地分析',
                    x: 'center'
                },
                backgroundColor: '#FF',
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data:  [<%= CountyCCX %>]
                }],
                yAxis: [{
                    min: 0,
                    interval: 10,
                    type: 'value',
                    name: '数量'
                }],
                series: [{
                    name: '数量',
                    type: 'bar',
                    data: [<%= CountyCCY %>]
                }]
            });

           var ChartCountySH = echarts.init(document.getElementById('divCountySH'));
            ChartCountySH.setOption({
                title: {
                    text: '高速逗留时间分析',
                    x: 'center'
                },
                backgroundColor: '#FF',
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data: [<%= CountySHX %>]
                }],
                yAxis: [{
                    min: 0,
                    interval: 10,
                    type: 'value',
                    name: '逗留时间'
                }],
                series: [{
                    name: '逗留时间',
                    type: 'bar',
                    data: [<%= CountySHY %>]
                }]
            });

            var ChartScenicCC = echarts.init(document.getElementById('divScenicCF'));
            ChartScenicCC.setOption({
                title: {
                    text: '景区车辆来源地分析',
                    x: 'center'
                },
                backgroundColor: '#FF',
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data:  [<%= ScenicCCX %>]
                }],
                yAxis: [{
                    min: 0,
                    interval: 10,
                    type: 'value',
                    name: '数量'
                }],
                series: [{
                    name: '数量',
                    type: 'bar',
                    data: [<%= ScenicCCY %>]
                }]
            });

           var ChartScenicSH = echarts.init(document.getElementById('divScenicSH'));
            ChartScenicSH.setOption({
                title: {
                    text: '景区逗留时间分析',
                    x: 'center'
                },
                backgroundColor: '#FF',
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data: [<%= ScenicSHX %>]
                }],
                yAxis: [{
                    min: 0,
                    interval: 10,
                    type: 'value',
                    name: '逗留时间'
                }],
                series: [{
                    name: '逗留时间',
                    type: 'bar',
                    data: [<%= ScenicSHY %>]
                }]
            });
        }
    </script>
</asp:Content>
