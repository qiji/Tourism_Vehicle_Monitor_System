using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_EmployeeCarNo : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;
    protected string unitid = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        unitid =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
        if (!IsPostBack)
        {
            DataTable dt = MySQL.ExecProc("usp_Car_EmployeeNo_GetByUnitID", new string[] { unitid }, out sqlexec, out sqlresult).Tables[0];
            divEmployeeCarNO.InnerHtml = "";
            int i = 1;
            foreach (DataRow dr in dt.Rows)
            {
                divEmployeeCarNO.InnerHtml += "<div style='float:left;TEXT-ALIGN: center;width:9%'><a href='EmployeePassInfo.aspx?carno=" + dr["carno"].ToString() + "' target='_blank'>" + dr["CarNo"].ToString() + "</a></div>";
                if (i == 10)
                {
                    divEmployeeCarNO.InnerHtml += "<br/>";
                    i = 1;
                }
                else
                {
                    i++;
                }
            }
        }
    }
}