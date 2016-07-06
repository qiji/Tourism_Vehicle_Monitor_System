using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class admin_DeviceEdit : System.Web.UI.Page
{
    string deviceid;
    bool sqlexec;
    string sqlresult;
    string unitid;


    protected void Page_Load(object sender, EventArgs e)
    {
        deviceid = Request["DeviceID"];
        unitid = Request["UnitID"];
        if (!IsPostBack)
        {
            aBack.HRef = "DeviceList.aspx?UnitID=" + unitid;

            foreach (CarEnum.DeviceArithmetic dv in Enum.GetValues(typeof(CarEnum.DeviceArithmetic)))
            {
                ddlDeviceArc.Items.Add(new ListItem(dv.ToString(), ((int)dv).ToString()));
            }
            ddlLeaveUnitID.Items.Add(new ListItem("无", "0"));

            DataTable dt = MySQL.ExecProc("usp_Sys_UnitInfo_GetOtherSenic", new string[] { unitid }, out sqlexec, out sqlresult).Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                ddlLeaveUnitID.Items.Add(new ListItem(dr["UnitName"].ToString(), dr["UnitID"].ToString()));
            }
            dt = MySQL.ExecProc("usp_Sys_UnitInfo_GetByUnitID", new string[] { unitid }, out sqlexec, out sqlresult).Tables[0];

            lbUnitName.Text = dt.Rows[0]["UnitName"].ToString();
            if (string.IsNullOrEmpty(deviceid))
            {
                btnDelete.Visible = false;
            }
            else
            {
                dt = MySQL.ExecProc("usp_Sys_DeviceInfo_GetByDeviceID", new string[] { deviceid }, out sqlexec, out sqlresult).Tables[0];
                lbDeviceID.Text = dt.Rows[0]["DeviceID"].ToString();
                tbDeviceName.Text = dt.Rows[0]["DeviceName"].ToString();
               
                tbDeviceInstall.Text = dt.Rows[0]["DeviceInstall"].ToString();
                tbIPAddress.Text = dt.Rows[0]["IPAddress"].ToString();
                ddlDeviceArc.SelectedValue = dt.Rows[0]["DeviceArc"].ToString();
                ddlLeaveUnitID.SelectedValue = dt.Rows[0]["LeaveUnitID"].ToString();

                tbDeviceUserID.Text = dt.Rows[0]["DeviceUserID"].ToString();
                tbDevicePWD.Text = dt.Rows[0]["DevicePWD"].ToString();
                tbDevicePort.Text = dt.Rows[0]["DevicePort"].ToString();
                tbListenIP.Text = dt.Rows[0]["ListenIP"].ToString();
                tbListenPort.Text = dt.Rows[0]["ListenPort"].ToString();
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string LeaveUnitID = "0";
        if ((CarEnum.DeviceArithmetic)Convert.ToInt32(ddlDeviceArc.SelectedValue) == CarEnum.DeviceArithmetic.景区双向算法)
        {
            LeaveUnitID = ddlLeaveUnitID.SelectedValue;
            if (LeaveUnitID == "0")
            {
                Session[WebHint.Web_Hint] = new WebHint("保存失败,请选择关联景区" + sqlresult, "#", HintFlag.错误);
                Response.Redirect(WebHint.HintURL);
                return;
            }
        }

        MySQL.ExecProc("usp_Sys_DeviceInfo_Save", new string[] { 
                deviceid, 
                tbDeviceName.Text,
                tbDeviceInstall.Text, 
                tbIPAddress.Text, 
                unitid,
                ddlDeviceArc.SelectedValue, 
                LeaveUnitID,
                tbDevicePort.Text,
                tbListenIP.Text,
                tbListenPort.Text,
                tbDeviceUserID.Text,
                tbDevicePWD.Text
        }, out sqlexec, out sqlresult);

        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "admin/DeviceList.aspx?UnitID=" + unitid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败," + sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_Sys_DeviceInfo_Delete", new string[] { deviceid }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("删除成功", "admin/DeviceList.aspx?UnitID=" + unitid, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("删除失败," + sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        DataSet ds = MySQL.ExecProc("usp_Car_PassInfo_GetByDeviceID_ForClear", new string[] { deviceid }, out sqlexec, out sqlresult);
        BFService.BigFileService bs = new BFService.BigFileService(CarEnum.BigServiceSysID);

        foreach (DataTable dt in ds.Tables)
        {
            foreach (DataRow dr in dt.Rows)
            {
                try
                {
                    string bfidstring = dr["CarImg"].ToString();
                    string bfid = bfidstring.Substring(bfidstring.LastIndexOf("/") + 1);

                    if (string.IsNullOrEmpty(bs.Delete(bfid)))
                    {
                        MySQL.ExecProc("usp_Car_PassInfo_ClearImg",
                            new string[] { dr["id"].ToString(), dr["TableName"].ToString() },
                            out sqlexec, out sqlresult);
                    }
                }
                catch
                {
                }
            }
        }

        Session[WebHint.Web_Hint] = new WebHint("清除成功." + sqlresult, Request.Url.ToString(), HintFlag.跳转);
        Response.Redirect(WebHint.HintURL);
    }
}