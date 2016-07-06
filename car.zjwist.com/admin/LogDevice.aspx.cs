using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_LogDevice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            iback.HRef = "DeviceList.aspx?unitid=" + Request["unitid"];
        
            for (int i = DateTime.Now.Year; i > 2015; i--)
            {
                ddlYear.Items.Add(i.ToString());
            }
            ddlYear.SelectedValue = DateTime.Now.Year.ToString();
            GetData();
        }
    }

    private void GetData()
    {
        bool sqlexec;
        string sqlresult;

        DataTable dt = MySQL.ExecProc("usp_Log_Device_GetByDeviceName", 
            new string[] { Request["DeviceName"], ddlYear.SelectedValue }, out sqlexec, out sqlresult).Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}