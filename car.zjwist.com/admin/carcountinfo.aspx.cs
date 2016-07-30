using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_carcountinfo : System.Web.UI.Page
{
    protected string UnitID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        UnitID =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
        statdateselect1.onQuery += new admin_statdateselect.QueryDelegate(statdateselect1_onQuery);
    }

    void statdateselect1_onQuery()
    {
        bool sqlexec;
        string sqlresult;
        DataTable dt;
        if (string.IsNullOrEmpty(tbCarNo.Text))
        {
            dt = MySQL.ExecProc("usp_Stat_Car_TopCount", new string[] { UnitID, statdateselect1.BeginTime, statdateselect1.EndTime, }, out sqlexec, out sqlresult).Tables[0];
        }
        else
        {
            dt = MySQL.ExecProc("usp_Stat_Car_TopCount_ByCarNo", new string[] { statdateselect1.BeginTime, statdateselect1.EndTime, tbCarNo.Text, UnitID }, out sqlexec, out sqlresult).Tables[0];

        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        statdateselect1_onQuery();
    }

    protected string GetCarColor(object nocolor)
    {
        return ((CarEnum.CarColor)Convert.ToInt32(nocolor)).ToString();
    }

    protected string GetCarType(object cartype)
    {
        return ((CarEnum.CarType)Convert.ToInt32(cartype)).ToString();
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        statdateselect1_onQuery();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        tbCarNo.Text = "";
        statdateselect1_onQuery();
    }
}