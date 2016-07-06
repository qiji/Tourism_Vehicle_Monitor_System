<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="SysUnitEdit.aspx.cs" Inherits="admin_SysUnitEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/Edit.css" rel="Stylesheet" type="text/css" />
    <div class="mainNav">
        单位信息
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                上级单位</div>
            <div class="blkl_02" style="width: 29%; float: left">
                <asp:Label ID="lbpName" runat="server" Text="lbpName"></asp:Label>
            </div>
            <div class="blkl_01">
                单位类型</div>
            <div class="blkl_02" style="width: 29%">
                <asp:Label ID="lbUnitType" runat="server" Text="lbUnitType"></asp:Label>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                单位名称</div>
            <div class="blkl_02" style="width: 29%; float: left">
                <asp:TextBox ID="tbUnitName" runat="server"></asp:TextBox>
            </div>
            <div class="blkl_01">
                地区车辆前缀</div>
            <div class="blkl_02" style="width: 29%">
                <asp:TextBox ID="tbCarNoPre" runat="server"></asp:TextBox>
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
                <asp:TextBox ID="tbLat" runat="server"></asp:TextBox>
            </div>
            <div class="blkl_01">
                纬度</div>
            <div class="blkl_02" style="width: 29%">
                <asp:TextBox ID="tbLnt" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                通过时间</div>
            <div class="blkl_02" style="width: 29%; float: left">
                <asp:TextBox ID="tbPassTime" runat="server"></asp:TextBox>分钟
            </div>
            <div class="blkl_01">
                车辆承载量</div>
            <div class="blkl_02" style="width: 29%">
                <asp:TextBox ID="tbCarMaxCount" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="block_list">
        <div class="blkl_left">
            <div class="blkl_01">
                景区车辆数据归零时间点</div>
            <div class="blkl_02">
                <asp:TextBox ID="tbCarClearTime" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="clear">
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
    <div class="con_ins">
        <div class="conins_block">
            <div class="conins_tl">
                说明</div>
            <div class="conins_txt">
                <p>
                    其中通过时间，景区一般为几个小时，而县级目的地，一般以天来计算
                    <br />
                </p>
            </div>
        </div>
    </div>
</asp:Content>
