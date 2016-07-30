using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_EmployeePassInfo : System.Web.UI.Page
{
    string carno;
    string unitid;

    bool sqlexec;
    string sqlresult;

    protected void Page_Load(object sender, EventArgs e)
    {
        carno = Request["carno"];
        unitid =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
        if (!IsPostBack)
        {
            lbCarNo.Text = carno;
            tbBeginTime.Value = DateTime.Now.ToString("yyyy-MM-dd").Substring(0, 8) + "01";
            tbEndTime.Value = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

            GetData();
        }
    }

    private void GetData()
    {
        DataTable dt = MySQL.ExecProc("usp_Car_EmployeePassInfo_GeByCarNo",
                new string[] { unitid, carno, tbBeginTime.Value, tbEndTime.Value },
                out sqlexec, out sqlresult).Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GetData();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_Car_EmployeeNO_Remove", new string[] { unitid, carno }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("移除成功", "admin/EmployeeCarNo.aspx", HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("移除失败," + sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }

    
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetData();
    }

    protected string GetCarDirection(object cardirection)
    {
        return ((CarEnum.CarDirection1)Convert.ToInt32(cardirection)).ToString();
    }


}