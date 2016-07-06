<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="SysUser.aspx.cs" Inherits="admin_SysUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/List.css" rel="Stylesheet" type="text/css" />
    <div class="mainNav">
        用户管理 <a href="SysUnitInfo.aspx" runat="server" id="aBack">返回</a>
    </div>
    <div class="ciline">
        <div class="cill">
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">新增</asp:LinkButton>
        </div>
        <div class="cilineforgridview">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" PageSize="20">
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                <Columns>
                    <asp:TemplateField HeaderText="用户">
                        <ItemTemplate>
                            <%# GetEditURL(Eval("UserName"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TrueName" HeaderText="姓名" />
                    <asp:BoundField DataField="LastLoginTime" HeaderText="登录时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
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
