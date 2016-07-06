using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataTable dt = MySQL.ExecProc("usp_Sys_UserInfo_Login",
                        new string[] { tbusername.Value, tbpwd.Value },
                        out sqlexec,
                        out sqlresult).Tables[0];

        if (dt.Rows.Count == 0)
        {
            Session[WebHint.Web_Hint] = new WebHint("用户名或者密码错误", "#", HintFlag.错误);
            Response.Redirect("Hint.aspx");
        }
        else
        {
            UserCookieInfo uc = new UserCookieInfo(dt.Rows[0]["UserName"].ToString(),
                dt.Rows[0]["TrueName"].ToString(),
                Convert.ToInt32(dt.Rows[0]["UnitID"]),
                Convert.ToInt32(dt.Rows[0]["UnitType"]),
                dt.Rows[0]["UnitName"].ToString());

            new AdminCookie(AdminCookie.CookierUser).WriteCookies(uc);
            if (uc.UnitID == 0)
            {
                Response.Redirect("admin/SysUnitInfo.aspx");
            }
            else
            {
                Response.Redirect("admin/WelCome.aspx");
            }
        }
    }
}