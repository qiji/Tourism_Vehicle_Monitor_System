using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_CarNoArea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bool sqlexec;
            string sqlresult;
            DataTable dt = MySQL.ExecProc("usp_Sys_CarPlace_GetAll", new string[] { }, out sqlexec, out sqlresult).Tables[0];
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}