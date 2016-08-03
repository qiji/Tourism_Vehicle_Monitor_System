<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="CarNoAreaEdit.aspx.cs" Inherits="admin_CarNoAreaEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="mainNav">
        车牌归属编辑
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                行政区划</div>
            <div class="blkl_02">
                <asp:TextBox ID="tbAreaCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="tbAreaCode"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                省份</div>
            <div class="blkl_02" style="width: 29%; float: left">
                <asp:TextBox ID="tbProvince" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="tbProvince"></asp:RequiredFieldValidator>
            </div>
            <div class="blkl_01">
                城市</div>
            <div class="blkl_02" style="width: 29%">
                <asp:TextBox ID="tbCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                    ControlToValidate="tbCity"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                车牌前缀</div>
            <div class="blkl_02" style="width: 29%; float: left">
                <asp:TextBox ID="tbCarNoPre" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                    ControlToValidate="tbCarNoPre"></asp:RequiredFieldValidator>
            </div>
            <div class="blkl_01">
                省份简称</div>
            <div class="blkl_02" style="width: 29%">
                <asp:TextBox ID="tbProvinceShort" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                    ControlToValidate="tbProvinceShort"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                经度</div>
            <div class="blkl_02" style="width: 29%; float: left">
                <asp:TextBox ID="tbLon" runat="server"></asp:TextBox>
            </div>
            <div class="blkl_01">
                维度</div>
            <div class="blkl_02" style="width: 29%">
                <asp:TextBox ID="tbLat" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                <a href="CarNoArea.aspx">返回</a>
            </div>
            <div class="blkl_02">
                <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
                <asp:Button runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_Click" />
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
