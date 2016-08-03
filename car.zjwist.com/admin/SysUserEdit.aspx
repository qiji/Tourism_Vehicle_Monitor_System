<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="SysUserEdit.aspx.cs" Inherits="admin_SysUserEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="mainNav">
        用户编辑
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                单位名称</div>
            <div class="blkl_02">
                <asp:Label ID="lbUnitName" runat="server" Text="lbUnitName"></asp:Label>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                用户名</div>
            <div class="blkl_02">
                <asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="tbUserName"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                姓名</div>
            <div class="blkl_02">
                <asp:TextBox ID="tbTrueName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="tbTrueName"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                <a href="SysUser.aspx?UnitID=XXX" runat="server" id="aBack">返回</a>
            </div>
            <div class="blkl_02">
                <asp:Button runat="server" ID="btnSave" Text="保存" OnClick="btnSave_Click" />
                <asp:Button runat="server" ID="btnDelete" Text="删除" OnClick="btnDelete_Click" />
                <asp:Button runat="server" ID="btnRePwd" Text="重置密码" OnClick="btnRePwd_Click" />
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
