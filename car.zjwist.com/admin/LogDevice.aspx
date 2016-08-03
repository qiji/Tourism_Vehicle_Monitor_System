<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="LogDevice.aspx.cs" Inherits="admin_LogDevice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <link href="../css/List.css" rel="stylesheet" type="text/css" />
    <div class="mainNav">
        设备日志
    </div>
    <div class="ciline">
        <div class="cill">
            年份
        </div>
        <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True">
        </asp:DropDownList>
    </div>
    <div class="ciline">
        <div class="cill">
            <a id="iback" runat="server">返回</a>
        </div>
        <div class="cilineforgridview">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据">
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                <Columns>
                    <asp:BoundField DataField="DeviceName" HeaderText="设备" />
                    <asp:BoundField DataField="LogTime" HeaderText="记录日期" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
                    <asp:BoundField DataField="LogText" HeaderText="日志内容" />
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
