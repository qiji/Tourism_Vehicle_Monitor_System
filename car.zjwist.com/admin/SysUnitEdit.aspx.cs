﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_SysUnitEdit : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    int UnitID;
    int pid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["UnitID"]))
        {
            UnitID = 0;
        }
        else
        {
            UnitID = Convert.ToInt32(Request["UnitID"]);
        }
        pid = Convert.ToInt32(Request["pid"]);
        if (!IsPostBack)
        {
            if (pid == 0)
            {
                lbpName.Text = "无";
                lbUnitType.Text = CarEnum.UnitType.市.ToString();
            }
            else
            {
                DataTable dt = MySQL.ExecProc("usp_Sys_UnitInfo_GetByUnitID", new string[] { pid.ToString() }, out sqlexec, out sqlresult).Tables[0];
                lbpName.Text = dt.Rows[0]["UnitName"].ToString();
                lbUnitType.Text = ((CarEnum.UnitType)(Convert.ToInt32(dt.Rows[0]["UnitType"]) - 1)).ToString();
            }
            if (UnitID == 0)
            {
                btnDelete.Visible = false;
            }
            else
            {
                DataTable dt = MySQL.ExecProc("usp_Sys_UnitInfo_GetByUnitID", new string[] { UnitID.ToString() }, out sqlexec, out sqlresult).Tables[0];
                tbUnitName.Text = dt.Rows[0]["UnitName"].ToString();
                tbCarNoPre.Text = dt.Rows[0]["CarNoPre"].ToString();
                tbPassTime.Text = dt.Rows[0]["PassTime"].ToString();
                tbLat.Text = dt.Rows[0]["Lat"].ToString();
                tbLnt.Text = dt.Rows[0]["Lnt"].ToString();
                tbCarMaxCount.Text = dt.Rows[0]["CarMaxCount"].ToString();
                tbcoefficient.Text = dt.Rows[0]["Coefficient"].ToString();
                tbCarClearTime.Text = dt.Rows[0]["CarClearTime"].ToString();
                UpLoadFile1.FileName = dt.Rows[0]["UnitLogo"].ToString();
                tbcenterlat.Text = dt.Rows[0]["centerlat"].ToString();
                tbcenterlnt.Text = dt.Rows[0]["centerlnt"].ToString();
                tbcenterzoom.Text = dt.Rows[0]["zoom"].ToString();
                tbrightlat.Text = dt.Rows[0]["rightlat"].ToString();
                tbrightlnt.Text = dt.Rows[0]["rightlnt"].ToString();
                tbrightzoom.Text = dt.Rows[0]["rightzoom"].ToString();
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //@UnitID int,
        //@UnitName varchar(20),
        //@UnitType int,
        //@pUnitID int,
        //@Lat varchar(20),
        //@Lnt varchar(20),
        //@PassTime int,
        //@CarMaxCount int,
        //@CarClearTime varchar(20)

        MySQL.ExecProc("usp_Sys_UnitInfo_Save", new string[] { UnitID.ToString(),
        tbUnitName.Text,
        tbCarNoPre.Text,
        ((int)((CarEnum.UnitType)Enum.Parse(typeof(CarEnum.UnitType), lbUnitType.Text, true))).ToString(),
        pid.ToString(),
        tbLat.Text,
        tbLnt.Text,
        tbPassTime.Text,
        tbCarMaxCount.Text,
        tbcoefficient.Text,
        tbCarClearTime.Text,
        UpLoadFile1.FileName,
        tbcenterlat.Text,
        tbcenterlnt.Text,
        tbcenterzoom.Text,
        tbrightlat.Text,
        tbrightlnt.Text,
        tbrightzoom.Text
        }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "admin/SysUnitInfo.aspx", HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败," + sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_Sys_UnitInfo_Delete", new string[] { }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("删除成功", "admin/SysUnitInfo.aspx", HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("删除失败," + sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);

    }
    
    protected void btnGetMaxCarCount_Click(object sender, EventArgs e)
    {
        if (UnitID != 0)
        {
            DataTable dt = MySQL.ExecProc("usp_Sys_UnitInfo_GetMaxCarCount", 
                new string[] { UnitID.ToString() }, 
                out sqlexec, out sqlresult).Tables[0];
            tbCarMaxCount.Text = dt.Rows[0][0].ToString();
        }
    }
}