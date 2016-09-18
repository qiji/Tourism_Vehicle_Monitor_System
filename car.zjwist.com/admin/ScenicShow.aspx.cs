using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_ScenicShow : System.Web.UI.Page
{
    protected string unitid;
    protected string centerlat;
    protected string centerlnt;
    protected string unitzoom;

    protected void Page_Load(object sender, EventArgs e)
    {
        unitid = Request["UnitID"];

        bool sqlexec;
        string sqlresult;

        DataTable dt = MySQL.ExecProc("usp_sys_unitinfo_getbyunitid",
            new string[] { unitid },
            out sqlexec, out sqlresult).Tables[0];

        centerlat = dt.Rows[0]["centerlat"].ToString();
        centerlnt = dt.Rows[0]["centerlnt"].ToString();
        unitzoom = dt.Rows[0]["zoom"].ToString();



    }
}