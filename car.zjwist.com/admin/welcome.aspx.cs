using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Welcome : System.Web.UI.Page
{
    protected string unitid;

    public string centerlat = "";
    public string centerlnt = "";
    public string unitzoom = "";

    public string rightlat = "";
    public string rightlnt = "";
    public string rightunitzoom = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        unitid = CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();

        bool sqlexec;
        string sqlresult;

        DataTable dt = MySQL.ExecProc("usp_sys_unitinfo_getbyunitid", new string[] { unitid }, out sqlexec, out sqlresult).Tables[0];

        centerlat = dt.Rows[0]["centerlat"].ToString();
        centerlnt = dt.Rows[0]["centerlnt"].ToString();
        unitzoom = dt.Rows[0]["zoom"].ToString();

        rightlat = dt.Rows[0]["rightlat"].ToString();
        rightlnt = dt.Rows[0]["rightlnt"].ToString();
        rightunitzoom = dt.Rows[0]["rightzoom"].ToString();


    }
}