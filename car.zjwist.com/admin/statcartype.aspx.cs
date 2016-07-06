using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_statcartype : System.Web.UI.Page
{
    protected string NameCarType = "";
    protected string CountCarType = "";

    string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["ScenicID"]))
        {
            unitid = new AdminCookie(AdminCookie.CookierUser).GetCookiesValues().UnitID.ToString();
        }
        else
        {
            unitid = Request["ScenicID"];
        }

        statdateselect1.onQuery += new admin_statdateselect.QueryDelegate(statdateselect1_onQuery);

    }

    void statdateselect1_onQuery()
    {
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Stat_Car_TypeCount", 
            new string[] { statdateselect1.BeginTime, statdateselect1.EndTime, unitid }, 
            out sqlexec, out sqlresult).Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();

        foreach (DataRow dr in dt.Rows)
        {
            NameCarType += ((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString() + ",";
            CountCarType += dr["TypeCount"].ToString() + ",";
        }

        if (!string.IsNullOrEmpty(NameCarType))
        {
            NameCarType = NameCarType.Substring(0, NameCarType.Length - 1);
            CountCarType = CountCarType.Substring(0, CountCarType.Length - 1);
        }
    }

    protected string GetCarType(object cartype)
    {
        return ((CarEnum.CarType)Convert.ToInt32(cartype)).ToString();
    }


}