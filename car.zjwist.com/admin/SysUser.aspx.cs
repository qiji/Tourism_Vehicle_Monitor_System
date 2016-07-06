using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_SysUser : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["UnitID"]))
        {
            UserCookieInfo uc = new AdminCookie(AdminCookie.CookierUser).GetCookiesValues();
            unitid = uc.UnitID.ToString();
            aBack.Visible = false;
        }
        else
        {
            unitid = Request["UnitID"];
        }
        if (!IsPostBack)
        {
            GetData();
        }
    }

    private void GetData()
    {
        DataTable dt = MySQL.ExecProc("usp_Sys_UserInfo_GetByUnitID",
                new string[] { unitid },
                out sqlexec, out sqlresult).Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["UnitID"]))
        {
            Response.Redirect("SysUserEdit.aspx");
        }
        else
        {
            Response.Redirect("SysUserEdit.aspx?UnitID=" + unitid);
        }
    }

    protected string GetEditURL(object username)
    {
        if (string.IsNullOrEmpty(Request["UnitID"]))
        {
            return "<a href='SysUserEdit.aspx?UserName=" + username.ToString() + "'>" + username.ToString() + "</a>";
        }
        else
        {
            return "<a href='SysUserEdit.aspx?UserName=" + username.ToString() + "&UnitID=" + Request["UnitID"] + "'>" + username.ToString() + "</a>";


        }
    }
}