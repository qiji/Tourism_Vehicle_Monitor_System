<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UpLoadFile.ascx.cs" Inherits="uc_UpLoadFile" %>
<div id="upload" runat="server" style="float: left;">
    <div id="upfile" runat="server">
        <div style="float: left; line-height: 35px;">
            <asp:FileUpload ID="fp" runat="server" />
        </div>
    </div>
</div>
<div style="padding-top: 5px;">
    <asp:Button ID="btnUpLoad" runat="server" Text="上传" OnClick="btnUpLoad_Click" />
    <asp:Label ID="lb" runat="server" Text="Label"></asp:Label>
</div>
<br />
<div id="divView" runat="server" visible="false">
    <asp:Image runat="server" ID="ImgShow" ImageUrl="#" />
    <asp:HyperLink ID="FileView" runat="server" Target="_blank">查看文件</asp:HyperLink>
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">删除文件</asp:LinkButton>
    <asp:HiddenField ID="HFID" runat="server" />
</div>
