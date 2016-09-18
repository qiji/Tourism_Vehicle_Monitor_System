<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="SysUnitEdit.aspx.cs" Inherits="admin_SysUnitEdit" %>

<%@ Register Src="../uc/UpLoadFile.ascx" TagName="UpLoadFile" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="mainNav">
        单位信息
    </div>
    <div class="ciline" style="height: 50px">
        <div class="cill">
            上级单位</div>
        <div class="cilr">
            <asp:Label ID="lbpName" runat="server" Text="lbpName"></asp:Label>
        </div>
        <div class="cill">
            单位类型</div>
        <div class="cilr">
            <asp:Label ID="lbUnitType" runat="server" Text="lbUnitType"></asp:Label>
        </div>
        <div class="cill">
            单位名称</div>
        <div class="cilr">
            <asp:TextBox ID="tbUnitName" runat="server"></asp:TextBox>
        </div>
        <div class="cill">
            地区车辆前缀</div>
        <div class="cilr">
            <asp:TextBox ID="tbCarNoPre" runat="server"></asp:TextBox>
        </div>
        <div class="cilr">
            <asp:CheckBox runat="server" ID="cbUsedLocal" Text="不排除本地车辆" />
        </div>
    </div>
    <div class="ciline" style="height: 50px">
        <div class="cill">
            景区经度</div>
        <div class="cilr">
            <asp:TextBox ID="tbLat" runat="server"></asp:TextBox>
        </div>
        <div class="cill">
            景区纬度</div>
        <div class="cilr">
            <asp:TextBox ID="tbLnt" runat="server"></asp:TextBox>
        </div>
        <div class="cill">
            通过时间</div>
        <div class="cilr">
            <asp:TextBox ID="tbPassTime" runat="server"></asp:TextBox>分钟
        </div>
        <div class="cill">
            车辆承载量</div>
        <div class="cilr">
            <asp:TextBox ID="tbCarMaxCount" runat="server"></asp:TextBox>
            <asp:Button ID="btnGetMaxCarCount" runat="server" Text="自动获取" OnClick="btnGetMaxCarCount_Click" />
        </div>
    </div>
    <div class="ciline" style="height: 50px">
        <div class="cill">
            企业号APPID</div>
        <div class="cilr">
            <asp:TextBox ID="tbappid" runat="server"></asp:TextBox>
        </div>
        <div class="cilr">
            <asp:CheckBox ID="cbsend" Text="发送信息" runat="server" />
        </div>
        <div class="cill">
            报警接收人</div>
        <div class="cilr">
            <asp:TextBox ID="tbmobile" runat="server" Width="300px"></asp:TextBox>
        </div>
    </div>
    <div class="ciline" style="height: 50px">
        <div class="cill">
            Token</div>
        <div class="cilr">
            <asp:TextBox ID="tbToken" runat="server" Width="357px"></asp:TextBox>
        </div>
        <div class="cill">
            ASEKey</div>
        <div class="cilr">
            <asp:TextBox ID="tbAESKey" runat="server" Width="300px"></asp:TextBox>
        </div>
    </div>
    <div class="ciline" style="height: 50px">
        <div class="cill">
            中心经度</div>
        <div class="cilr">
            <asp:TextBox ID="tbcenterlat" runat="server"></asp:TextBox>
        </div>
        <div class="cill">
            中心纬度</div>
        <div class="cilr">
            <asp:TextBox ID="tbcenterlnt" runat="server"></asp:TextBox>
        </div>
        <div class="cill">
            地图缩放比例</div>
        <div class="cilr">
            <asp:TextBox ID="tbcenterzoom" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            归零时间点</div>
        <div class="cilr">
            <asp:TextBox ID="tbCarClearTime" runat="server"></asp:TextBox>
        </div>
        <div class="cilr">
            <asp:CheckBox ID="cbNight" Text="夜间车辆记录" runat="server" /></div>
        <div class="cill">
            单位Logo</div>
        <div class="cilr">
            <uc1:UpLoadFile ID="UpLoadFile1" runat="server" ShowImage="false" IsSaveToOSS="true" />
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                <a href="SysUnitInfo.aspx">返回</a>
            </div>
            <div class="blkl_02">
                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="删除" OnClick="btnDelete_Click" />
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
