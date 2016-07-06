<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="CarNoArea.aspx.cs" Inherits="admin_CarNoArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/List.css" rel="Stylesheet" type="text/css" />
    <div class="mainNav">
        车牌归属
    </div>
    <div class="ciline" style="height: 95%; overflow: hidden">
        <div class="cill">
            <a href="CarNoAreaEdit.aspx">新增</a>
        </div>
        <div class="cilineforgridview" style="height: 100%">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" PageSize="20">
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="CarNoAreaEdit.aspx?ID={0}"
                        DataTextField="AreaCode" HeaderText="行政区划" />
                    <asp:BoundField DataField="Province" HeaderText="省" />
                    <asp:BoundField DataField="City" HeaderText="市" />
                    <asp:BoundField DataField="CarNoPre" HeaderText="车牌前缀" />
                    <asp:BoundField DataField="ProvinceShort" HeaderText="省简称" />
                    <asp:BoundField DataField="Lon" HeaderText="经度" />
                    <asp:BoundField DataField="Lat" HeaderText="维度" />
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
