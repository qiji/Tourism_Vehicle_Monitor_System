using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_WelcomeScenic : System.Web.UI.Page
{
    protected string unitid;

    public string centerlat = "";
    public string centerlnt = "";
    public string unitzoom = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["ScenicID"]))
        {
            unitid = CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
        }
        else
        {
            unitid = Request["UnitID"];
        }
        bool sqlexec;
        string sqlresult;

        DataTable dt = MySQL.ExecProc("usp_sys_unitinfo_getbyunitid", new string[] { unitid }, out sqlexec, out sqlresult).Tables[0];

        centerlat = dt.Rows[0]["centerlat"].ToString();
        centerlnt = dt.Rows[0]["centerlnt"].ToString();
        unitzoom = dt.Rows[0]["zoom"].ToString();

    }
}