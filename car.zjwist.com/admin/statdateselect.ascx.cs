using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_statdateselect : System.Web.UI.UserControl
{

    public bool ButtonVisible
    {
        get { return (bool)ViewState["ButtonVisible"]; }
        set
        {
            ViewState["ButtonVisible"] = value;
            divButton.Visible = value;
        }
    }

    public delegate void QueryDelegate();
    public event QueryDelegate onQuery;


    public string BeginTime
    {
        get { return tbBeginTime.Value; }
    }

    public string EndTime
    {
        get { return Convert.ToDateTime(tbEndTime.Value).AddDays(1).ToString("yyyy-MM-dd"); }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tbBeginTime.Value = DateTime.Now.ToString("yyyy-MM-dd");
            BtnClick(btnToday);
        }
    }

    private void BtnClick(LinkButton sender)
    {
        divToday.Attributes["class"] = "slttq";
        divWeek.Attributes["class"] = "slttq";
        divMonth.Attributes["class"] = "slttq";
        divYear.Attributes["class"] = "slttq";

        btnToday.ForeColor = System.Drawing.Color.Black;
        btnWeek.ForeColor = System.Drawing.Color.Black;
        btnMonth.ForeColor = System.Drawing.Color.Black;
        btnYear.ForeColor = System.Drawing.Color.Black;

        ((System.Web.UI.HtmlControls.HtmlGenericControl)(sender.Parent)).Attributes["class"] += " slt_on";
        sender.ForeColor = System.Drawing.Color.White;

        tbEndTime.Value = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
        if (onQuery != null)
        {
            onQuery();
        }
    }

    protected void btnToday_Click(object sender, EventArgs e)
    {
        tbBeginTime.Value = DateTime.Now.ToString("yyyy-MM-dd");
        BtnClick(btnToday);
    }

    protected void btnWeek_Click(object sender, EventArgs e)
    {
        tbBeginTime.Value = (DateTime.Now.AddDays(1 - Convert.ToInt32(DateTime.Now.DayOfWeek.ToString("d")))).ToString("yyyy-MM-dd");
        BtnClick(btnWeek);

    }
    protected void btnMonth_Click(object sender, EventArgs e)
    {
        tbBeginTime.Value = DateTime.Now.ToString("yyyy-MM") + "-01";
        BtnClick(btnMonth);
    }
    protected void btnYear_Click(object sender, EventArgs e)
    {
        tbBeginTime.Value = DateTime.Now.Year.ToString() + "-01-01";
        BtnClick(btnYear);
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (onQuery != null)
        {
            onQuery();
        }
    }
}