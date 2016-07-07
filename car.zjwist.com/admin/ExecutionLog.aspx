<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="ExecutionLog.aspx.cs" Inherits="admin_ExecutionLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="http://cdn.tourzj.com/css/weui.min.css">
    <script src="../js/datePicker/WdatePicker.js" type="text/javascript"></script>
    <div class="mainNav">
        执行日志
    </div>
    <div class="ciline">
        <div class="cill">
            日期：
        </div>
        <div class="cilr">
            <input id="tbBeginTime" runat="server" name="tbBeginTime" class="tbBeginTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                readonly="readonly" style="width: 145px" type="text" />
        </div>
        <div class="cilr">
            --
        </div>
        <div class="cilr">
            <input id="tbEndTime" runat="server" name="tbEndTime" class="tbEndTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                readonly="readonly" stle="width: 145px" type="text" />
        </div>
        <div class="cilr">
            <asp:Button ID="Button1" runat="server" Text="确认" OnClick="Button1_Click" />
        </div>
    </div>
    <div class="ct_block">
        <div class="ctb_06" id="divCountInfo">
            <div class="ciline" style="height: 100%">
                <div class="cill">
                    &nbsp;
                </div>
                <div class="cilr">
                    <div class="cilineforgridview" style="color: Black; margin: 10px; height: 95%">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                            GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                            BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据">
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                            <Columns>
                                <asp:BoundField DataField="ProcTime" HeaderText="处理时间" />
                                <asp:BoundField DataField="ProcCount" HeaderText="处理车辆" />
                                <asp:BoundField DataField="ErrorCount" HeaderText="错误数据" />
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
            </div>
        </div>
    </div>
    <script>
        $(window).on("load", function () {
            //设置div 的高度
            $("#divCountInfo").height($(".content").height() - 90);
        });
    </script>
</asp:Content>
