<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="SysLog.aspx.cs" Inherits="admin_SysLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="../js/datePicker/WdatePicker.js" type="text/javascript"></script>
    <div class="mainNav">
        日志信息</div>
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
        <div class="cilr" >
            <input id="tbEndTime" runat="server" name="tbEndTime" class="tbEndTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                readonly="readonly" stle="width: 145px" type="text" />
        </div>
        <div class="cilr">
           <asp:Button ID="Button1" runat="server" Text="确认" onclick="Button1_Click" />
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            <a href="SysUnitInfo.aspx">返回</a>
        </div>
        <div class="cilr">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" PageSize="31"
                AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                <Columns>
                    <asp:BoundField DataField="logtime" HeaderText="日志时间" />
                    <asp:BoundField DataField="addemployeecount" HeaderText="设置的内部车辆" />
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
