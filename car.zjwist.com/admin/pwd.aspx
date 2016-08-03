<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="pwd.aspx.cs" Inherits="admin_pwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="mainNav">
        修改密码</div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                原密码</div>
            <div class="blkl_02">
                <asp:TextBox runat="server" ID="tbOldPwd" TextMode="Password"></asp:TextBox>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                新密码</div>
            <div class="blkl_02">
                <asp:TextBox runat="server" ID="tbNewPwd" TextMode="Password"></asp:TextBox>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                确认密码</div>
            <div class="blkl_02">
                <asp:TextBox runat="server" ID="tbNewPwd2" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次密码不一致"
                    ControlToCompare="tbNewPwd" ControlToValidate="tbNewPwd2"></asp:CompareValidator>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                &nbsp;</div>
            <div class="blkl_02">
                <asp:Button runat="server" ID="btnSave" Text="确定" OnClick="btnSave_Click" />
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
