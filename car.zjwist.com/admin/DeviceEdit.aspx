<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="DeviceEdit.aspx.cs" Inherits="admin_DeviceEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="mainNav">
        设备编辑 -
        <asp:Label ID="lbUnitName" runat="server" Text="Label"></asp:Label>
    </div>
    <div class="ciline">
        <div class="cill">
            设备ID
        </div>
        <div class="cilr">
            <asp:Label runat="server" ID="lbDeviceID"></asp:Label>
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            设备名称
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbDeviceName"></asp:TextBox>
        </div>
        <div class="cill">
            安装地址
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbDeviceInstall"></asp:TextBox>
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            设备IP
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbIPAddress"></asp:TextBox>
        </div>
        <div class="cill">
            设备端口
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbDevicePort"></asp:TextBox>
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            用户名
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbDeviceUserID"></asp:TextBox>
        </div>
        <div class="cill">
            密码
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbDevicePWD"></asp:TextBox>
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            监听IP
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbListenIP"></asp:TextBox>
        </div>
        <div class="cill">
            监听端口
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbListenPort"></asp:TextBox>
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            抓拍起始时间
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbTimeBegin"></asp:TextBox>
        </div>
        <div class="cill">
            抓拍结束时间
        </div>
        <div class="cilr">
            <asp:TextBox runat="server" ID="tbtimeEnd"></asp:TextBox>
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            计算逻辑
        </div>
        <div class="cilr">
            <asp:DropDownList runat="server" ID="ddlDeviceArc">
            </asp:DropDownList>
        </div>
        <div class="cill">
            关联景区
        </div>
        <div class="cilr">
            <asp:DropDownList runat="server" ID="ddlLeaveUnitID">
            </asp:DropDownList>
        </div>
    </div>
    <div class="ciline">
        <div class="cill">
            <a href="DeviceList.aspx" runat="server" id="aBack">返回</a>
        </div>
        <div class="cilr">
            <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
            <asp:Button runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_Click" />
            <asp:Button ID="btnClear" runat="server" Text="清除过车数据" OnClick="btnClear_Click" />
        </div>
    </div>
</asp:Content>
