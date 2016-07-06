using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_StatFlow : System.Web.UI.Page
{
    protected string ChartTitle = "";

    protected string ChartDate = "";
    protected string ChartData = "";

    protected string unitid;

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

        if (!IsPostBack)
        {
            for (int i = DateTime.Now.Year; i > 2015; i--)
            {
                ddlYear.Items.Add(i.ToString());
                ddlCompareYear.Items.Add(i.ToString());
            }
            Query(DateTime.Now.Month);
        }
    }

    private void Query(int month)
    {
        div1.Attributes["class"] = "slttq";
        div2.Attributes["class"] = "slttq";

        div3.Attributes["class"] = "slttq";

        div4.Attributes["class"] = "slttq";

        div5.Attributes["class"] = "slttq";

        div6.Attributes["class"] = "slttq";

        div7.Attributes["class"] = "slttq";

        div8.Attributes["class"] = "slttq";

        div9.Attributes["class"] = "slttq";

        div10.Attributes["class"] = "slttq";

        div11.Attributes["class"] = "slttq";

        div12.Attributes["class"] = "slttq";


        //((System.Web.UI.HtmlControls.HtmlGenericControl)(sender.Parent)).Attributes["class"] += " slt_on";
        //sender.ForeColor = System.Drawing.Color.White;

        ((System.Web.UI.HtmlControls.HtmlGenericControl)divMonth.FindControl("div" + month.ToString())).Attributes["class"] += " slt_on";

        //查询数据！！！

        bool sqlexec;
        string sqlresult;
        DateTime MonthBegin = Convert.ToDateTime(ddlYear.SelectedValue + "-" + month.ToString() + "-01");
        DateTime MonthEnd = MonthBegin.AddMonths(1);
        ChartTitle = MonthBegin.ToString("yyyy年MM月") + "车辆变化情况";
        DataTable dt = MySQL.ExecProc("usp_stat_Flow_ByMonth", new string[] { MonthBegin.ToString("yyyy-MM-dd"), MonthEnd.ToString("yyyy-MM-dd"), unitid }, out sqlexec, out sqlresult).Tables[0];




        foreach (DataRow dr in dt.Rows)
        {
            ChartDate += "\"" + dr["SDate"].ToString() + "日\",";
            if (dr["fCount"].ToString() == "0")
            {
                ChartData += "null,";
            }
            else
            {
                ChartData += dr["FCount"].ToString() + ",";
            }
        }

        if (!string.IsNullOrEmpty(ChartDate))
        {
            ChartDate = ChartDate.Substring(0, ChartDate.Length - 1);
            ChartData = ChartData.Substring(0, ChartData.Length - 1);
        }


    }

    protected void btn1Month_Click(object sender, EventArgs e)
    {
        Query(1);
    }
    protected void btn2Month_Click(object sender, EventArgs e)
    {
        Query(2);
    }
    protected void btn3Month_Click(object sender, EventArgs e)
    {
        Query(3);
    }
    protected void btn4Month_Click(object sender, EventArgs e)
    {
        Query(4);
    }
    protected void btn5Month_Click(object sender, EventArgs e)
    {
        Query(5);
    }
    protected void btn6Month_Click(object sender, EventArgs e)
    {
        Query(6);
    }
    protected void btn7Month_Click(object sender, EventArgs e)
    {
        Query(7);
    }
    protected void btn8Month_Click(object sender, EventArgs e)
    {
        Query(8);
    }
    protected void btn9Month_Click(object sender, EventArgs e)
    {
        Query(9);
    }
    protected void btn10Month_Click(object sender, EventArgs e)
    {
        Query(10);
    }
    protected void btn11Month_Click(object sender, EventArgs e)
    {
        Query(11);
    }
    protected void btn12Month_Click(object sender, EventArgs e)
    {
        Query(12);
    }



}