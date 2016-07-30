﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_WelcomeScenicold : System.Web.UI.Page
{
    protected string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["ScenicID"]))
        {
            unitid =  CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
        }
        else
        {
            unitid = Request["UnitID"];
        }

    }
}