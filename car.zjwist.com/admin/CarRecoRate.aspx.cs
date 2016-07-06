using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_CarRecoRate : System.Web.UI.Page
{
    string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {
        unitid = Request["UnitID"];

        if (!IsPostBack)
        {
            tbBeginTime.Value = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");
            tbEndTime.Value = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            getdata();
        }
    }

    private void getdata()
    {
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Car_RecoRate_ByUnitID", new string[] { unitid, tbBeginTime.Value, tbEndTime.Value }, out sqlexec, out sqlresult).Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        getdata();
    }
}