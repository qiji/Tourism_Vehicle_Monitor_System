using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_DeviceList : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    string UnitID;

    protected void Page_Load(object sender, EventArgs e)
    {
        UnitID = Request["UnitID"];
        if (!IsPostBack)
        {
            aAdd.HRef = "DeviceEdit.aspx?UnitID=" + UnitID;
            GetData();

        }
    }

    private void GetData()
    {
        DataTable dt = MySQL.ExecProc("usp_Sys_UnitInfo_GetByUnitID", new string[] { UnitID }, out sqlexec, out sqlresult).Tables[0];
        lbUnitName.Text = dt.Rows[0]["UnitName"].ToString();

        dt = MySQL.ExecProc("usp_Sys_DeviceInfo_GetByUnitID",
            new string[] { UnitID }, out sqlexec, out sqlresult).Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected string GetDeviceARC(object devicearc)
    {
        return ((CarEnum.DeviceArithmetic)Convert.ToInt32(devicearc.ToString())).ToString();
    }

    protected string GetDeviceState(object devicestate)
    {
        return ((CarEnum.DeviceState)Convert.ToInt32(devicestate.ToString())).ToString();
    }



    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (((System.Data.DataRowView)e.Row.DataItem).Row["State"].ToString() == "1")            
            {
                e.Row.BackColor = System.Drawing.Color.Red;
            }
        }
    }
}