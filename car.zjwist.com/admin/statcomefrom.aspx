<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="statcomefrom.aspx.cs" Inherits="admin_statcomefrom" %>

<%@ Register Src="StatMenu.ascx" TagName="StatMenu" TagPrefix="uc1" %>
<%@ Register Src="statdateselect.ascx" TagName="statdateselect" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/List.css" rel="Stylesheet" type="text/css" />
    <script>
        SetCookie("StatMenu", "smcomefrom");
    </script>
    <uc1:StatMenu ID="StatMenu1" runat="server" />
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
                    <div class="slt_type" >
                        <asp:CheckBox ID="cblocal" runat="server" Text="包含本地区" Checked="false" />
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="ct_block">
            <div class="ctb_07" id="divComeCount">
            </div>
            <div class="ctb_08">
                <a href="javascript:;" onclick="ExportToExcel('GridView1','来源地分析')">导出Excel</a><br />
                <div class="cilineforgridview" style="color: Black; margin: 10px; height: 90%">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        class="GridView1" GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3"
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
            <div class="ctb_07" id="divStayHour">
            </div>
            <div class="ctb_08">
                <a href="javascript:;" onclick="ExportToExcel('GridView2','逗留时间')">导出Excel</a><br />
                <div class="cilineforgridview" style="color: Black; margin: 10px; height: 90%">
                    <asp:GridView ID="GridView2" class="GridView2" runat="server" AutoGenerateColumns="False"
                        BackColor="White" GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3"
                        BorderStyle="Solid" BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据"
                        PageSize="20">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:BoundField DataField="DestName" HeaderText="来源" />
                            <asp:BoundField DataField="StayTime" HeaderText="时间（小时）" />
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
    <script src="http://cdn.tourzj.com/js/echarts.min.js" type="text/javascript"></script>
    <script>
        

        $(window).on("load", function () {
            $(".content").css({ "height": "auto" });
            ChartInit();
        });

        function ChartInit() {
           var ChartComeCount = echarts.init(document.getElementById('divComeCount'));
            ChartComeCount.setOption({
                title: {
                    text: '车辆来源地分析',
                    x: 'center'
                },
                backgroundColor: '#FF',
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data:  [<%= DestComeCount %>]
                }],
                yAxis: [{
                    min: 1,
                    type: 'value',
                    name: '数量'
                }],
                series: [{
                    name: '数量',
                    type: 'bar',
                    data: [<%= DataComeCount %>]
                }]
            });

           var ChartStayHour = echarts.init(document.getElementById('divStayHour'));
            ChartStayHour.setOption({
                title: {
                    text: '逗留时间分析',
                    x: 'center'
                },
                backgroundColor: '#FF',
                tooltip: {
                    trigger: 'axis'
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data: [<%= DestStayHour %>]
                }],
                yAxis: [{
                    min: 0,
                    type: 'value',
                    name: '逗留时间'
                }],
                series: [{
                    name: '逗留时间',
                    type: 'bar',
                    data: [<%= DataStayHour %>]
                }]
            });
        }
    </script>
</asp:Content>
