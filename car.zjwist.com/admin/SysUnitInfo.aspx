<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="SysUnitInfo.aspx.cs" Inherits="admin_SysUnitInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="mainNav">
        单位管理&nbsp;&nbsp;&nbsp;<a href="SysUnitEdit.aspx?pid=0">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton
            ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">导出设备信息</asp:LinkButton>
    </div>
    <div class="ciline" style="width: 80%">
        <div class="type">
            <div class="types_s" style="background-color: #edf4fc; width: 30%; text-align: center">
                单位名称</div>
            <div class="types_s" style="background-color: #edf4fc; width: 30%; text-align: center">
                单位类型</div>
            <div class="types_s" style="background-color: #edf4fc; width: 40%; text-align: center">
                操作</div>
        </div>
        <div id="divList" runat="server">
            <div class="type">
                <div class="types_s" style="width: 10%">
                    <div class="types_s">
                        1.0</div>
                </div>
                <div class="types_s" style="width: 60%; text-align: center;">
                    电商看浙里</div>
                <div class="types_s" style="width: 26%; text-align: center">
                    <a href="#">编辑</a>||<a href="#">添加题目</a>||<a href="#">问题列表</a></div>
                <div class="clear">
                </div>
            </div>
            <div class="type">
                <div class="types_s" style="cursor: pointer; width: 10%">
                    <div class="types_s" style="width: 20px">
                        &nbsp;
                    </div>
                    <div class="types_s">
                        1.0</div>
                </div>
                <div class="types_s" style="width: 60%; text-align: center;">
                    <div class="types_s" style="width: 20px">
                        &nbsp;
                    </div>
                    <div class="types_s">
                        大卖场</div>
                </div>
                <div class="types_s" style="width: 26%; text-align: center">
                    <a href="#">编辑</a>||<a href="#">添加题目</a>||<a href="#">问题列表</a></div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
</asp:Content>
