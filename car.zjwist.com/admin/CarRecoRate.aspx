<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="CarRecoRate.aspx.cs" Inherits="admin_CarRecoRate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="../js/datePicker/WdatePicker.js" type="text/javascript"></script>
    <div class="mainNav">
        车牌识别率
    </div>
    <div class="ciline">
        <div class="cill">
            日期范围</div>
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
    <div class="ciline" style="height: 80%">
        <div class="cill">
            <a href="SysUnitInfo.aspx">返回</a>
        </div>
        <div class="cilineforgridview" style="height: 90%">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据">
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                <Columns>
                    <asp:BoundField DataField="logtime" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="passCount" HeaderText="总数" />
                    <asp:BoundField DataField="WithOutCount" HeaderText="无法识别" />
                    <asp:BoundField DataField="RecoRate" HeaderText="识别率(%)" />
                    <asp:BoundField DataField="passcarcount" HeaderText="过路车" />
                    <asp:BoundField DataField="addemployeecount" HeaderText="内部车辆" />
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
