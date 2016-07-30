using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_carPassinfo : System.Web.UI.Page
{
    string UnitID;

    protected void Page_Load(object sender, EventArgs e)
    {
        UnitID =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
        statdateselect1.onQuery += new admin_statdateselect.QueryDelegate(GetData);
    }

    private void GetData()
    {

        bool sqlexec;
        string sqlresult;
        DataTable dt;
        if (string.IsNullOrEmpty(tbCarNo.Text))
        {
            dt = MySQL.ExecProc("usp_Car_PassInfo_GetByUnitID", new string[] { UnitID, statdateselect1.BeginTime, statdateselect1.EndTime, }, out sqlexec, out sqlresult).Tables[0];
        }
        else
        {
            dt = MySQL.ExecProc("usp_Car_PassInfo_GetByUnitIDAndCarNo", new string[] { UnitID, statdateselect1.BeginTime, statdateselect1.EndTime, tbCarNo.Text }, out sqlexec, out sqlresult).Tables[0];

        }
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetData();
    }

    protected string GetCarColor(object nocolor)
    {
        return ((CarEnum.CarColor)Convert.ToInt32(nocolor)).ToString();
    }

    protected string GetCarType(object cartype)
    {
        return ((CarEnum.CarType)Convert.ToInt32(cartype)).ToString();
    }

    protected string GetCarDirection(object cardirection)
    {
        return ((CarEnum.CarDirection1)Convert.ToInt32(cardirection)).ToString();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        GetData();
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        GetData();
    }
}