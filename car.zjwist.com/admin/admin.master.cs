using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UserCookieInfo uc = CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName);
            imgunitlogo.Src = "http://car.zjwist.com/uploadfile/160831/pcusercarlogo.png";
            spanusername.InnerText = uc.TrueName;
            devicecount.InnerText = "监控点" + uc.MonitorCount + "个";
            divTopDate.InnerText = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }
}
