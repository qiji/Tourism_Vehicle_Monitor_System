<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="EmployeePassInfo.aspx.cs" Inherits="admin_EmployeePassInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/List.css" rel="Stylesheet" type="text/css" />
    <script src="../js/datePicker/WdatePicker.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="http://cdn.tourzj.com/css/weui.min.css">
    <div class="mainNav">
        内部车辆过车记录
    </div>
    <div class="ciline">
        <div class="cill">
            车牌号
        </div>
        <div class="cilr">
            <asp:Label runat="server" ID="lbCarNo"></asp:Label>
        </div>
        <div class="cilr">
            <asp:Button ID="btnDelete" runat="server" Text="从内部车牌中移除" OnClientClick="javascript:return confirm('真的要移除吗？')"
                OnClick="btnDelete_Click" />
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            时间范围</div>
        <div class="cilr">
            <input id="tbBeginTime" runat="server" class="ctextboxdate" name="tbBeginTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                readonly="readonly" style="width: 145px" type="text" /></div>
        <div class="cilr">
            <img alt="date" onclick="WdatePicker({el:'<%= tbBeginTime.ClientID %>',dateFmt:'yyyy-MM-dd'})"
                src="../images/date.png" style="cursor: pointer" />
        </div>
        <div class="cilr">
            --</div>
        <div class="cilr">
            <input id="tbEndTime" runat="server" class="ctextboxdate" name="tbEndTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                readonly="readonly" style="width: 145px" type="text" /></div>
        <div class="cilr">
            <img alt="date" onclick="WdatePicker({el:'<%= tbEndTime.ClientID %>',dateFmt:'yyyy-MM-dd'})"
                src="../images/date.png" style="cursor: pointer" />
        </div>
        <div class="cilr">
            <asp:Button ID="btnQuery" runat="server" Text="查询" OnClick="Button1_Click" />
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            <a href="EmployeeCarNo.aspx">返回</a>
        </div>
        <div class="cilineforgridview">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" PageSize="20"
                AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                <Columns>
                    <asp:BoundField DataField="DeviceID" HeaderText="设备ID" />
                    <asp:BoundField DataField="PassTime" HeaderText="通过时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                    <asp:TemplateField HeaderText="方向">
                        <ItemTemplate>
                            <%# GetCarDirection(Eval("CarDirection"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="过车图片" ShowHeader="False">
                        <ItemTemplate>
                            <a href="javascript:;" onclick="ShowCarImage('<%# Eval("CarImg") %>',this)">图片</a>
                        </ItemTemplate>
                    </asp:TemplateField>
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
    <div class="weui_dialog_alert" id="divalert" style="display: none">
        <div class="weui_mask" onclick="cls()">
        </div>
        <div class="weui_dialog" onclick="cls()">
            <div class="weui_dialog_hd">
                <strong class="weui_dialog_title"></strong>
            </div>
            <div class="weui_dialog_bd" id="tsword">
                <div style="width: 100%; text-align: center">
                    <img src="" id="imgShow" style="width: 90%" />
                </div>
                <div style="width: 100%; font-size: 1.5em; text-align: center">
                    &nbsp;
                </div>
            </div>
        </div>
    </div>
    <script>
        $(window).on("load", function () {
            //设置div 的高度
            $("#divCountInfo").height($(".content").height() - 165);
        });


        function ShowCarImage(imgurl) {
            $("#imgShow")[0].src = imgurl;
            $("#divalert").show();
        }
        function cls() {
            $("#divalert").hide();
        }
    </script>
</asp:Content>
