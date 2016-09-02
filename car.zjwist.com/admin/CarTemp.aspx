<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="CarTemp.aspx.cs" Inherits="admin_CarTemp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link rel="stylesheet" type="text/css" href="https://res.wx.qq.com/open/libs/weui/0.4.3/weui.min.css">
    
    <div class="mainNav">
        待处理的车辆信息
    </div>
    <div class="ciline">
        <div class="cill">
            显示方式
        </div>
        <div class="cilr">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                <asp:ListItem Value="0" Selected="True">网格</asp:ListItem>
                <asp:ListItem Value="1" >列表</asp:ListItem>
                
            </asp:RadioButtonList>
        </div>
        <div class="cill">
            &nbsp;
        </div>
        <div class="cilr">
            <asp:CheckBox ID="cbshowtruck" runat="server" Text="显示货车" />
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            设备名称
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbDeviceName" placeholder="过滤的设备号"></asp:TextBox>
        </div>
    </div>
    <div class="ciline CountInfoTable" id="divCountInfo">
        <div class="cill">
            <asp:LinkButton ID="lbRefresh" runat="server" OnClick="lbRefresh_Click">刷新</asp:LinkButton>
        </div>
        <div class="cilr" runat="server" id="divlist">
            <div class="cilineforgridview" style="color: Black; margin: 10px; height: 95%">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                    GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                    BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" PageSize="20">
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                    <Columns>
                        <asp:BoundField DataField="CarNo" HeaderText="车牌号" />
                        <asp:BoundField DataField="DeviceName" HeaderText="抓拍设备" />
                        <asp:TemplateField HeaderText="颜色">
                            <ItemTemplate>
                                <%# GetCarColor(Eval("CarColor")) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="类型">
                            <ItemTemplate>
                                <%# GetCarType(Eval("CarType"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="方向">
                            <ItemTemplate>
                                <%# GetCarDirection(Eval("CarDirection"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="PassTime" HeaderText="过车时间" />
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
        <div class="cilr" runat="server" id="divgrid" style="height: 95%">
            <asp:Table ID="tbarea" runat="server" BorderColor="#AAAAAA" BorderStyle="Double"
                BorderWidth="1px" CellPadding="1" CellSpacing="1" Width="98%" AllowPaging="True"
                PageSize="15">
            </asp:Table>
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
        

        function ShowCarImage(imgurl) {
            $("#imgShow")[0].src = imgurl;
            $("#divalert").show();
        }
        function cls() {
            $("#divalert").hide();
        }
    </script>
</asp:Content>
