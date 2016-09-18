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
        DataSet ds = MySQL.ExecProc("usp_Sys_UserInfo_Login",
                        new string[] { tbusername.Value, tbpwd.Value },
                        out sqlexec,
                        out sqlresult);

        DataTable dt = ds.Tables[0];

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

            uc.UnitLogo = string.IsNullOrEmpty(dt.Rows[0]["UnitLogo"].ToString())
                ? "http://" + Request.Url.Host + "/Images/zllogobigimg.png"
                : dt.Rows[0]["UnitLogo"].ToString();

            uc.MonitorCount = ds.Tables[1].Rows[0]["DeviceCount"].ToString();

            CookierManage.CookierAPI<UserCookieInfo>.WriteCookierObject(uc);

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