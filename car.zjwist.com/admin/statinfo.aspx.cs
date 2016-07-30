using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_statinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["ScenicID"]))
        {
            Response.Redirect("statcomefrom.aspx?ScenicID=" + Request["ScenicID"]);
        }
        else
        {
            UserCookieInfo uc =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName);
            switch ((CarEnum.UnitType)uc.UnitType)
            {
                case CarEnum.UnitType.景区:
                    Response.Redirect("statcomefrom.aspx");
                    break;
                case CarEnum.UnitType.县:
                    Response.Redirect("statcountyCF.aspx");
                    break;
                case CarEnum.UnitType.市:
                    Response.Redirect("statcity.aspx");
                    break;

            }
        }
    }
}