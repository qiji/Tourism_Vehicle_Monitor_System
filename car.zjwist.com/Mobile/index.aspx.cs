using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mobile_index : System.Web.UI.Page
{
    public string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(Request["unitid"]))
        {
            unitid = Request["unitid"];
        }
        else
        {
            UserCookieInfo uc =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName);
            if (uc == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                unitid =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
            }
        }
    }
}