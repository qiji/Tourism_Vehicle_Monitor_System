<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="statCountycartype.aspx.cs" Inherits="admin_statCountycartype" %>

<%@ Register Src="StatCountyMenu.ascx" TagName="StatCountyMenu" TagPrefix="uc1" %>
<%@ Register Src="statdateselect.ascx" TagName="statdateselect" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/List.css" rel="Stylesheet" type="text/css" />
    <uc1:StatCountyMenu ID="StatMenu1" runat="server" />
    <div class="con_tables">
        <div class="ct_block">
            <uc2:statdateselect ID="statdateselect1" runat="server" ButtonVisible="true" />
        </div>
        <div class="ct_block">
            <div class="ctb_07" id="divCounty">
            </div>
            <div class="ctb_08">
                <a href="javascript:;" onclick="ExportToExcel('GridView1','高速车型分析')">导出Excel</a><br />
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
        <div class="ct_block">
            <div class="ctb_07" id="divScenic">
            </div>
            <div class="ctb_08">
                <a href="javascript:;" onclick="ExportToExcel('GridView2','景区车型分析')">导出Excel</a><br />
                <div class="cilineforgridview" style="color: Black; margin: 10px; height: 90%">
                    <asp:GridView ID="GridView2" class="GridView2" runat="server" AutoGenerateColumns="False"
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
            $(".content").css({ "height": "auto" });

            var countyname = "<%= CountyTypeName %>".split(',');
            var countycount = "<%= CountyTypeCount %>".split(',');
            var scenicname = "<%= ScenicTypeName %>".split(',');
            var sceniccount = "<%= ScenicTypeCount %>".split(',');

            var Countydata = [];
            var Scenicdata = [];

            for (var i = 0; i < countyname.length; i++) {
                Countydata.push({ value: countycount[i], name: countyname[i] });
            }

            for (var i = 0; i < scenicname.length; i++) {
                Scenicdata.push({ value: sceniccount[i], name: scenicname[i] });
            }

            var ChartCounty = echarts.init(document.getElementById('divCounty'));
            ChartCounty.setOption({
                title: {
                    text: '高速车辆类型',
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
                        data: Countydata
                    }
                ]
            });

            var ChartScenic = echarts.init(document.getElementById('divScenic'));
            ChartScenic.setOption({
                title: {
                    text: '景区车辆类型',
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
                        data: Scenicdata
                    }
                ]
            });
        });
    </script>
</asp:Content>
