<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true"
    CodeFile="EmployeeCarNo.aspx.cs" Inherits="admin_EmployeeCarNo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="http://cdn.tourzj.com/css/weui.min.css" rel="stylesheet" type="text/css" />
    <div class="mainNav">
        内部车辆设置&nbsp;&nbsp;<a href="javascript:;" onclick="EmployeeAdd()">新增</a>
    </div>
    <div runat="server" id="divEmployeeCarNO">
    </div>
    <div class="weui_dialog_confirm" style="display: none;">
        <div class="weui_mask">
        </div>
        <div class="weui_dialog" style="width: 25%">
            <div class="weui_dialog_hd">
                <strong class="weui_dialog_title">新增内部车辆</strong></div>
            <div class="weui_dialog_bd">
                车牌号:<input type="text" id="tbCarNo" />
            </div>
            <div class="weui_dialog_ft">
                <a href="javascript:;" class="weui_btn_dialog default">取消</a> <a href="javascript:;"
                    class="weui_btn_dialog primary">确定</a>
            </div>
        </div>
    </div>
    <script>
        function EmployeeAdd() {
            $("#tbCarNo").val("");
            $(".weui_dialog_confirm").show();
        }

        $(".default").click(function () {
            $(".weui_dialog_confirm").hide();
        });

        $(".primary").click(function () {
            if ($("#tbCarNo").val() == "") {
                alert("请输入车牌号！");
            }
            else {
                $.get("../ajax/EmployeeCarNoSave.ashx", {
                    carno: $("#tbCarNo").val(),
                    unitid:<%= unitid %>,
                    r: Math.random()
                }, function (e) {
                    if (e == "T") {
                        alert("增加成功");
                        window.location.reload();
                    }
                    else {
                        alert(e);
                    }
                });
            }
        });

    </script>
</asp:Content>
