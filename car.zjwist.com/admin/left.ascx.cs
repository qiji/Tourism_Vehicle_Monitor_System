﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_left : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!string.IsNullOrEmpty(Request["ScenicID"]))
        //{
        //    //带参数过来的！
        //    divManage.Visible = false;
        //    divAdmin.Visible = true;
        //    aWelCome.HRef = "WelCome.aspx?ScenicID=" + Request["ScenicID"];
        //    aStatInfo.HRef = "StatInfo.aspx?ScenicID=" + Request["ScenicID"];

        //}
        //else
        //{

            UserCookieInfo uc = CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName);
            if (uc.UnitID == 0)
            {
                divAdmin.Visible = false;
            }
            else
            {
                divManage.Visible = false;
            }
        //}
    }
}