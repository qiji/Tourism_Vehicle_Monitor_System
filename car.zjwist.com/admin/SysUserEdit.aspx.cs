using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_SysUserEdit : System.Web.UI.Page
{
    string username;
    bool sqlexec;
    string sqlresult;
    string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {
        username = Request["username"];

        if (string.IsNullOrEmpty(Request["UnitID"]))
        {
            UserCookieInfo uc = new AdminCookie(AdminCookie.CookierUser).GetCookiesValues();
            unitid = uc.UnitID.ToString();
            aBack.HRef = "SysUser.aspx";
        }
        else
        {
            unitid = Request["UnitID"];
            aBack.HRef = "SysUser.aspx?UnitID=" + unitid;
        }

        if (!IsPostBack)
        {
            DataTable dt = MySQL.ExecProc("usp_Sys_UnitInfo_GetByUnitID", new string[] { unitid }, out sqlexec, out sqlresult).Tables[0];
            lbUnitName.Text = dt.Rows[0]["UnitName"].ToString();

            if (string.IsNullOrEmpty(username))
            {
                btnDelete.Visible = false;
                btnRePwd.Visible = false;
            }
            else
            {
                
                dt = MySQL.ExecProc("usp_Sys_UserInfo_GetByUserName", new string[] { username }, out sqlexec, out sqlresult).Tables[0];
                tbUserName.Text = dt.Rows[0]["UserName"].ToString();
                tbTrueName.Text = dt.Rows[0]["TrueName"].ToString();
                tbUserName.ReadOnly = true;

            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_Sys_UserInfo_Save", new string[] { tbUserName.Text, tbTrueName.Text, unitid }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            string rURL = "admin/SysUser.aspx";
            if (!string.IsNullOrEmpty(Request["UnitID"]))
            {
                rURL += "?UnitID=" + unitid;
            }

            Session[WebHint.Web_Hint] = new WebHint("保存成功", rURL, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败," + sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_Sys_UserInfo_Delete", new string[] { username }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            string rURL = "admin/SysUser.aspx";
            if (!string.IsNullOrEmpty(Request["UnitID"]))
            {
                rURL += "?UnitID=" + unitid;
            }
            Session[WebHint.Web_Hint] = new WebHint("删除成功", rURL, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("删除失败," + sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }

    protected void btnRePwd_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_Sys_UserInfo_RePwd", new string[] { username }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            string rURL = "admin/SysUser.aspx";
            if (!string.IsNullOrEmpty(Request["UnitID"]))
            {
                rURL += "?UnitID=" + unitid;
            }
            Session[WebHint.Web_Hint] = new WebHint("密码重置成功", rURL, HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("密码重置失败", "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}