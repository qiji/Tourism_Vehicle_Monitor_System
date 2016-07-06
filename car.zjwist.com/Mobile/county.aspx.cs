using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mobile_county : System.Web.UI.Page
{
    public string unitid;
    protected void Page_Load(object sender, EventArgs e)
    {
        unitid = new AdminCookie(AdminCookie.CookierUser).GetCookiesValues().UnitID.ToString();
    }
}