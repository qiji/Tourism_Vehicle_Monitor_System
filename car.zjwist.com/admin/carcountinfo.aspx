<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="carcountinfo.aspx.cs" Inherits="admin_carcountinfo" %>

<%@ Register Src="statdateselect.ascx" TagName="statdateselect" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../css/List.css" rel="Stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="https://res.wx.qq.com/open/libs/weui/0.4.3/weui.min.css">
    <div class="con_tables">
        <div class="ct_block">
            <uc2:statdateselect ID="statdateselect1" runat="server" ButtonVisible="false" />
            <div class="slt">
                <div class="slt_cars">
                    <div class="slt_tl">
                        车牌号：</div>
                    <div class="slt_type">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" class="sltcall slt_on">所有车辆</asp:LinkButton>
                    </div>
                    <div class="sltc_input">
                        <asp:TextBox runat="server" ID="tbCarNo" placeholder="请输入需要查询的车牌号"></asp:TextBox>
                        <asp:Button runat="server" ID="btnOK" Text="查询" OnClick="btnOK_Click" />
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="ct_block">
            <div class="ctb_06" id="divCountInfo">
                <div class="ciline" style="height: 100%">
                    <div class="cill">
                        &nbsp;
                    </div>
                    <div class="cilr">
                        <div class="cilineforgridview" style="color: Black; margin: 10px; height: 95%">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                                GridLines="Vertical" BorderColor="#C2D3ED" CellPadding="3" BorderStyle="Solid"
                                BorderWidth="1px" HeaderStyle-Height="25" EmptyDataText="没有相关数据" PageSize="20"
                                AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <RowStyle Height="25px" BorderColor="#C2D3ED" BorderStyle="Solid" BorderWidth="1px" />
                                <Columns>
                                    <asp:TemplateField HeaderText="车牌号" ShowHeader="False">
                                        <ItemTemplate>
                                            <a href="javascript:;" onclick="CarPassInfo('<%# Eval("CarNO") %>',this)">
                                                <%# Eval("CarNO") %></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="颜色">
                                        <ItemTemplate>
                                            <%# GetCarColor(Eval("CarColor")) %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="类型">
                                        <ItemTemplate>
                                            <%# GetCarType(Eval("CarType"))%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Province" HeaderText="省份" />
                                    <asp:BoundField DataField="City" HeaderText="城市" />
                                    <asp:BoundField DataField="EnterCount" HeaderText="进出次数" />
                                    <asp:BoundField DataField="StayHour" HeaderText="停留时间(小时)" />
                                    <asp:TemplateField HeaderText="设置" ShowHeader="False">
                                        <ItemTemplate>
                                            <a href="javascript:;" onclick="EmployeeCarAdd('<%# Eval("CarNO") %>',this)">内部车辆</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                </div>
            </div>
        </div>
    </div>
    <div class="weui_dialog_alert" id="divPassInfo" style="display: none">
        <div class="weui_mask">
        </div>
        <div class="weui_dialog" style="width: 30%;">
            <div class="weui_dialog_hd">
                <strong class="weui_dialog_title" id="divCarNo"></strong>
            </div>
            <div class="weui_dialog_bd" style="text-align: center">
                <div class="cilineforgridview" style="width: 100%; text-align: center; height: 500px"
                    id="divTablePassInfo">
                </div>
            </div>
            <div class="weui_dialog_ft">
                <a href="javascript:;" class="weui_btn_dialog primary" onclick="closepassinfo()">关闭</a>
            </div>
        </div>
    </div>
    <div class="weui_dialog_alert" id="divalert" style="display: none">
        <div class="weui_mask" onclick="cls()">
        </div>
        <div class="weui_dialog" onclick="cls()">
            <div class="weui_dialog_hd">
                <strong class="weui_dialog_title"></strong>
            </div>
            <div class="weui_dialog_bd" id="tsword">
                <div style="width: 100%; text-align: center">
                    <img src="" id="imgShow" style="width: 90%" />
                </div>
                <div style="width: 100%; font-size: 1.5em; text-align: center">
                    &nbsp;
                </div>
            </div>
        </div>
    </div>
    <script>
       
        function EmployeeCarAdd(carno, a) {
            if (confirm("要设置为内部车辆吗？")) {
                $.get("../ajax/EmployeeCarNoSave.ashx", {
                    unitid:<%= UnitID %>,
                    carno: encodeURI(carno) ,
                    r: Math.random()
                }, function (e) {
                    if (e == "T") {
                        alert("增加成功");
                        //删除掉当前行！！！
                        a.parentNode.parentNode.remove()
                    }
                    else {
                        alert(e);
                    }
                });
           }
        }

        function CarPassInfo(carno) {
            $("#divCarNo").html("[" + carno + "]的过车记录");
            $.get("../ajax/GetPassInfoByCarNO.ashx", {
                unitid:<%= UnitID %>,
                carno: carno,
                begindate: $(".tbBeginTime").val(),
                enddate: $(".tbEndTime").val(),
                r: Math.random()
            }, function (e) {
                $("#divTablePassInfo").html(e);
                $("#divPassInfo").show();
                //获得数据，显示在Table上！
            });

        }

        function closepassinfo() {
            $("#divPassInfo").hide();
        }

        function ShowCarImage(imgurl) {
            $("#imgShow")[0].src = imgurl;
            $("#divalert").show();
        }
        function cls() {
            $("#divalert").hide();
        }
    </script>
</asp:Content>
