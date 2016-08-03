<%@ Control Language="C#" AutoEventWireup="true" CodeFile="statdateselect.ascx.cs"
    Inherits="admin_statdateselect" %>
<script src="../js/datePicker/WdatePicker.js" type="text/javascript"></script>


<div class="slt">
    <div class="slt_time">
        <div class="slt_tl">
            时&nbsp;&nbsp;间：
        </div>
        <div class="sltc_input" style="margin: 10px">
            <input id="tbBeginTime" runat="server" name="tbBeginTime" class="tbBeginTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                readonly="readonly" style="width: 145px" type="text" />
        </div>
        <div class="slt_tl">
            --
        </div>
        <div class="sltc_input" style="margin: 10px">
            <input id="tbEndTime" runat="server" name="tbEndTime" class="tbEndTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                readonly="readonly" style="width: 145px" type="text" />
        </div>
        <div class="sltc_input" runat="server" id="divButton" style="margin: 10px">
            <asp:Button runat="server" ID="btnOK" Text="确定" OnClick="btnOK_Click" />
        </div>
        <div class="sltt_quick">
            <div class="slttq" runat="server" id="divToday">
                <asp:LinkButton ID="btnToday" runat="server" OnClick="btnToday_Click">今天</asp:LinkButton></div>
            <div class="slttq" runat="server" id="divWeek">
                <asp:LinkButton ID="btnWeek" runat="server" OnClick="btnWeek_Click">本周</asp:LinkButton></div>
            <div class="slttq" runat="server" id="divMonth">
                <asp:LinkButton ID="btnMonth" runat="server" OnClick="btnMonth_Click">本月</asp:LinkButton></div>
            <div class="slttq" runat="server" id="divYear">
                <asp:LinkButton ID="btnYear" runat="server" OnClick="btnYear_Click">本年</asp:LinkButton></div>
        </div>
    </div>
    <div class="clear">
    </div>
</div>
