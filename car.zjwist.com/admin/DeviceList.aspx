<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="DeviceList.aspx.cs" Inherits="admin_DeviceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/List.css" rel="Stylesheet" type="text/css" />
    <div class="mainNav">
        设备管理 -
        <asp:Label ID="lbUnitName" runat="server" Text="Label"></asp:Label>
        <a href="DeviceEdit.aspx" runat="server" id="aAdd">新增</a>
    </div>
    <div class="ciline">
        <div class="cill">
            <a href="SysUnitInfo.aspx">返回</a>
        </div>
        <div class="cilineforgridview">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" PageSize="20"
                OnRowDataBound="GridView1_RowDataBound">
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="DeviceID,UnitID" DataNavigateUrlFormatString="DeviceEdit.aspx?DeviceID={0}&UnitID={1}"
                        DataTextField="DeviceName" HeaderText="设备名称" />
                    <asp:BoundField DataField="DeviceInstall" HeaderText="安装地点" />
                    <asp:HyperLinkField DataNavigateUrlFields="IPAddress" Target="_blank" DataNavigateUrlFormatString="Http://{0}/doc/page/login.asp"
                        DataTextField="IPAddress" HeaderText="IP地址" />
                    <asp:TemplateField HeaderText="算法">
                        <ItemTemplate>
                            <%# GetDeviceARC(Eval("DeviceARC"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="lasttime" HeaderText="最近抓拍时间" />
                    <asp:BoundField DataField="intervaltime" HeaderText="抓拍间隔时间">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <%# GetDeviceState(Eval("State"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="UnitID,DeviceName," DataNavigateUrlFormatString="LogDevice.aspx?UnitID={0}&amp;devicename={1}"
                        HeaderText="设备日志" Text="设备日志" />
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
</asp:Content>
