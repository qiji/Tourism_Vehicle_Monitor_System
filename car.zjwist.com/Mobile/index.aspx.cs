using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class car_index : System.Web.UI.Page
{
    public string unitid;
    public string datayesterday;

    protected void Page_Load(object sender, EventArgs e)
    {
        datayesterday = Request["d"];

        if (!string.IsNullOrEmpty(Request["unitid"]))
        {
            unitid = Request["unitid"];
        }
        else
        {
            unitid = new AdminCookie(AdminCookie.CookierUser).GetCookiesValues().UnitID.ToString();
        }
    }
}