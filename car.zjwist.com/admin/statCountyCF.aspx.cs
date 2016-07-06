using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_statCountyCF : System.Web.UI.Page
{
    //高速数据
    protected string CountyCCX = "";
    protected string CountyCCY = "";
    protected string CountySHX = "";
    protected string CountySHY = "";
    //景区数据
    protected string ScenicCCX = "";
    protected string ScenicCCY = "";
    protected string ScenicSHX = "";
    protected string ScenicSHY = "";

    string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {
        unitid = new AdminCookie(AdminCookie.CookierUser).GetCookiesValues().UnitID.ToString();

        statdateselect1.onQuery += new admin_statdateselect.QueryDelegate(statdateselect1_onQuery);
        if (!IsPostBack)
        {
            foreach (CarEnum.AreaType at in Enum.GetValues(typeof(CarEnum.AreaType)))
            {
                rblSumType.Items.Add(new ListItem(at.ToString(), ((int)at).ToString()));
            }
            rblSumType.SelectedValue = ((int)CarEnum.AreaType.按城市).ToString();
        }
    }

    void statdateselect1_onQuery()
    {
        bool sqlexec;
        string sqlresult;

        DataSet ds = MySQL.ExecProc("usp_Stat_County_ComeFrom",
            new string[] {
                statdateselect1.BeginTime, 
                statdateselect1.EndTime, 
                rblSumType.SelectedValue,
                unitid}, out sqlexec, out sqlresult);

        GridViewBind(ds.Tables[0], GridView1, out CountyCCX, out CountyCCY);
        GridViewBind(ds.Tables[1], GridView2, out CountySHX, out CountySHY);
        GridViewBind(ds.Tables[2], GridView3, out ScenicCCX, out ScenicCCY);
        GridViewBind(ds.Tables[3], GridView4, out ScenicSHX, out ScenicSHY);
    }

    private void GridViewBind(DataTable dt, GridView gv, out string x, out string y)
    {
        x = "";
        y = "";

        gv.DataSource = dt;
        gv.DataBind();

        foreach (DataRow dr in dt.Rows)
        {
            x += "\"" + dr["ChartX"].ToString() + "\",";
            x += dr["ChartY"].ToString() + ",";
        }

        if (!string.IsNullOrEmpty(x))
        {
            x = x.Substring(0, x.Length - 1);
            y = y.Substring(0, y.Length - 1);
        }
    }

    protected void rblSumType_SelectedIndexChanged(object sender, EventArgs e)
    {
        statdateselect1_onQuery();
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        statdateselect1_onQuery();
    }
}