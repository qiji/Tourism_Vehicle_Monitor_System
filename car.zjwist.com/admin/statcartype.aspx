<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="statcartype.aspx.cs" Inherits="admin_statcartype" %>

<%@ Register Src="StatMenu.ascx" TagName="StatMenu" TagPrefix="uc1" %>
<%@ Register Src="statdateselect.ascx" TagName="statdateselect" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/List.css" rel="Stylesheet" type="text/css" />
    <uc1:StatMenu ID="StatMenu1" runat="server" />
    <div class="con_tables">
        <div class="ct_block">
            <uc2:statdateselect ID="statdateselect1" runat="server" ButtonVisible="true" />
        </div>
        <div class="ct_block" id="divCarTypeBlock">
            <div class="ctb_07" style="height: 100%" id="divCarType">
            </div>
            <div class="ctb_08" style="height: 100%">
                <a href="javascript:;" onclick="ExportToExcel('GridView1','车型分析')">导出Excel</a><br />
                <div class="cilineforgridview" style="color: Black; margin: 10px; height: 90%">
                    <asp:GridView ID="GridView1" class="GridView1" runat="server" AutoGenerateColumns="False"
                        BackColor="White" GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3"
                        BorderStyle="Solid" BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据"
                        PageSize="20">
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                        <Columns>
                            <asp:TemplateField HeaderText="车型">
                                <ItemTemplate>
                                    <%# GetCarType(Eval("CarType"))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TypeCount" HeaderText="数量" />
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
            //设置div 的高度
            $("#divCarTypeBlock").height($(".content").height() - 275);

            var cartypename = "<%= NameCarType %>".split(',');
            var cartypecount = "<%= CountCarType %>".split(',');

            var CarTypedata = [];

            for (var i = 0; i < cartypename.length; i++) {
                CarTypedata.push({ value: cartypecount[i], name: cartypename[i] });
            }

            var ChartTypeCount = echarts.init(document.getElementById('divCarType'));
            ChartTypeCount.setOption({
                title: {
                    text: '今日车辆类型',
                    x: 'center'
                },
                backgroundColor: '#FF',
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                series: [
                    {
                        name: '车辆类型',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '40%'],
                        data: CarTypedata
                    }
                ]
            });
        });
    </script>
</asp:Content>
