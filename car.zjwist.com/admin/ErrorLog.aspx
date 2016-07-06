<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ErrorLog.aspx.cs" Inherits="admin_ErrorLog" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="http://cdn.tourzj.com/css/weui.min.css">
    <script src="../js/datePicker/WdatePicker.js" type="text/javascript"></script>
    <div class="mainNav">
        错误日志
    </div>
    <div class="ciline">
        <div class="cill">
            日期：
        </div>
        <div class="cilr">
            <input id="tbBeginTime" runat="server" name="tbBeginTime" class="tbBeginTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                readonly="readonly" style="width: 145px" type="text" />
        </div>
        <div class="cilr">
            --
        </div>
        <div class="cilr" >
            <input id="tbEndTime" runat="server" name="tbEndTime" class="tbEndTime" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
                readonly="readonly" stle="width: 145px" type="text" />
        </div>
        <div class="cilr">
           <asp:Button ID="Button1" runat="server" Text="确认" onclick="Button1_Click" />
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
                                    <asp:BoundField DataField="CarNo" HeaderText="车牌号" />
                                    <asp:BoundField DataField="DeviceName" HeaderText="抓拍设备" />
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
                                    <asp:TemplateField HeaderText="方向">
                                        <ItemTemplate>
                                            <%# GetCarDirection(Eval("CarDirection"))%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PassTime" HeaderText="过车时间" />
                                    <asp:BoundField DataField="ErrorMsg" HeaderText="错误信息" />
                                    <asp:TemplateField HeaderText="过车图片" ShowHeader="False">
                                        <ItemTemplate>
                                            <a href="javascript:;" onclick="ShowCarImage('<%# Eval("CarImg") %>',this)">图片</a>
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
    <div class="weui_dialog_alert" id="divalert" style="display: none">
        <div class="weui_mask" onclick="cls()">
        </div>
        <div class="weui_dialog"  onclick="cls()">
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
        $(window).on("load", function () {
            //设置div 的高度
            $("#divCountInfo").height($(".content").height() - 90);
        });


        function ShowCarImage(imgurl) {
            $("#imgShow")[0].src = imgurl;
            $("#divalert").show();
        }
        function cls() {
            $("#divalert").hide();
        }
    </script>
</asp:Content>

