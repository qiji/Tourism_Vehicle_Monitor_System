using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_StatFlow : System.Web.UI.Page
{
    protected string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = DateTime.Now.Year; i > 2015; i--)
            {
                ddlYear.Items.Add(i.ToString());
                ddlYearbalance.Items.Add(i.ToString());
            }

            if (string.IsNullOrEmpty(Request["ScenicID"]))
            {
                unitid = CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
            }
            else
            {
                unitid = Request["ScenicID"];
            }
        }
    }
}