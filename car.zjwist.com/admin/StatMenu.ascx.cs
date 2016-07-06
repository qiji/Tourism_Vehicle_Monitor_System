using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_StatMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["ScenicID"]))
        {
            asmcomefrom.HRef = "statcomefrom.aspx?ScenicID=" + Request["ScenicID"];
            astatflow.HRef = "statflow.aspx?ScenicID=" + Request["ScenicID"];
            asmcartype.HRef = "statcartype.aspx?ScenicID=" + Request["ScenicID"];

        }
    }
}