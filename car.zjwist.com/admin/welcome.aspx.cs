using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["ScenicID"]))
        {
            Response.Redirect("WelcomeScenic.aspx?ScenicID=" + Request["ScenicID"]);
        }
        else
        {
            UserCookieInfo uc = new AdminCookie(AdminCookie.CookierUser).GetCookiesValues();
            switch ((CarEnum.UnitType)uc.UnitType)
            {

                case CarEnum.UnitType.景区:
                    Response.Redirect("WelcomeScenic.aspx");
                    break;
                case CarEnum.UnitType.县:
                    Response.Redirect("WelcomeCounty.aspx");
                    break;
                case CarEnum.UnitType.市:
                    Response.Redirect("WelcomeCity.aspx");
                    break;
            }
        }
    }
}