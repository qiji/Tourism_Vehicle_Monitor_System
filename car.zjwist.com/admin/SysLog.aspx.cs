using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_SysLog : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;

    

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if(!IsPostBack)
        {
            tbBeginTime.Value = System.DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");
            tbEndTime.Value = System.DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            getData();
        }
    }

    private void getData() 
    {
        DataTable dt = MySQL.ExecProc("usp_car_log_GetByUnitID",
                    new string[] { Request["UnitID"], tbBeginTime.Value, tbEndTime.Value },
                    out sqlexec, out sqlresult).Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        getData();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        getData();
    }
}