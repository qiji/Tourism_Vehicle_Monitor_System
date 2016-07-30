using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_statCountycartype : System.Web.UI.Page
{
    protected string CountyTypeName = "";
    protected string CountyTypeCount = "";
    protected string ScenicTypeName = "";
    protected string ScenicTypeCount = "";

    string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {
        unitid =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();

        statdateselect1.onQuery += new admin_statdateselect.QueryDelegate(statdateselect1_onQuery);

    }

    void statdateselect1_onQuery()
    {
        bool sqlexec;
        string sqlresult;
        DataSet ds = MySQL.ExecProc("usp_Stat_County_CarTypeCount",
            new string[] { statdateselect1.BeginTime, statdateselect1.EndTime, unitid },
            out sqlexec, out sqlresult);
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            CountyTypeName += ((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString() + ",";
            CountyTypeCount += dr["TypeCount"].ToString() + ",";
        }

        if (!string.IsNullOrEmpty(CountyTypeName))
        {
            CountyTypeName = CountyTypeName.Substring(0, CountyTypeName.Length - 1);
            CountyTypeCount = CountyTypeCount.Substring(0, CountyTypeCount.Length - 1);
        }

        GridView2.DataSource = ds.Tables[1];
        GridView2.DataBind();

        foreach (DataRow dr in ds.Tables[1].Rows)
        {
            ScenicTypeName += ((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString() + ",";
            ScenicTypeCount += dr["TypeCount"].ToString() + ",";
        }

        if (!string.IsNullOrEmpty(ScenicTypeName))
        {
            ScenicTypeName = ScenicTypeName.Substring(0, ScenicTypeName.Length - 1);
            ScenicTypeCount = ScenicTypeCount.Substring(0, ScenicTypeCount.Length - 1);
        }
    }

    protected string GetCarType(object cartype)
    {
        return ((CarEnum.CarType)Convert.ToInt32(cartype)).ToString();
    }


}