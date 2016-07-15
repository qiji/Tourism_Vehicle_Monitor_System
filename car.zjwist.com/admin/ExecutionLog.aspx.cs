using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_ExecutionLog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tbTime.Value = System.DateTime.Now.ToString("yyyy-MM-dd");
            GetData();
        }
    }

    private void GetData()
    {
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Car_LogInfo_GetByDate", new string[] { tbTime.Value }, out sqlexec, out sqlresult).Tables[0];

        GridView1.DataSource = dt;
        GridView1.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GetData();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (((System.Data.DataRowView)e.Row.DataItem).Row["ProcCount"].ToString() == "")
            {
                e.Row.BackColor = System.Drawing.Color.Red;
            }
        }
    }
}