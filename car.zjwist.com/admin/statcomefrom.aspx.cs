using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_statcomefrom : System.Web.UI.Page
{
    protected string DestComeCount = "";
    protected string DestStayHour = "";
    protected string DataComeCount = "";
    protected string DataStayHour = "";

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
        DataSet ds = MySQL.ExecProc("usp_Stat_Car_ComeFrom_withoutlocal",
            new string[] {
                statdateselect1.BeginTime, 
                statdateselect1.EndTime, 
                rblSumType.SelectedValue, 
                unitid,
                cblocal.Checked ? "0" : "1"
            },
            out sqlexec, out sqlresult);
        //DataView dvCount = dt.DefaultView;
        //dvCount.Sort = "ComeCount desc";
        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();

        //这里需要考虑是否只获取 Top 20 或者是 Top 50 的数据？！
        //至少是在图表上这样处理！
        //是否可以考虑做同比？
        foreach (DataRow dr in ds.Tables[0].Rows)
        {

            DestComeCount += "\"" + dr["DestName"].ToString() + "\",";
            DataComeCount += dr["ComeCount"].ToString() + ",";
        }

        if (!string.IsNullOrEmpty(DestComeCount))
        {
            DestComeCount = DestComeCount.Substring(0, DestComeCount.Length - 1);
            DataComeCount = DataComeCount.Substring(0, DataComeCount.Length - 1);
        }
        //DestComeCount = "[" + DestComeCount + "]";
        //DataComeCount = "[" + DataComeCount + "]";


        GridView2.DataSource = ds.Tables[1];
        GridView2.DataBind();

        foreach (DataRow dr in ds.Tables[1].Rows)
        {
            DestStayHour += "\"" + dr["DestName"].ToString() + "\",";
            DataStayHour += dr["StayTime"].ToString() + ",";
        }

        if (!string.IsNullOrEmpty(DestStayHour))
        {


            DestStayHour = DestStayHour.Substring(0, DestStayHour.Length - 1);
            DataStayHour = DataStayHour.Substring(0, DataStayHour.Length - 1);
        }
        //DestStayHour = "[" + DestStayHour + "]";
        //DataStayHour = "[" + DataStayHour + "]";

    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        statdateselect1_onQuery();
    }

    protected void rblSumType_SelectedIndexChanged(object sender, EventArgs e)
    {
        statdateselect1_onQuery();
    }
}