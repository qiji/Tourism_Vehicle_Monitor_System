using System;
using System.Collections.Generic;
using System.Web;


public class UserCookieInfo : CookierManage.BaseUser
{
    public const string UserCookierName = "CarUserCookier";

    public UserCookieInfo()
        : base(UserCookierName)
    {

    }

    public UserCookieInfo(string username, string truename, int unitid, int unittype, string unitname)
        : base(UserCookierName)
    {
        UserName = username;
        TrueName = truename;
        UnitID = unitid;
        UnitType = unittype;
        UnitName = unitname;
    }

    public string TrueName { get; set; }
    public string UserName { get; set; }
    public int UnitID { get; set; }
    public int UnitType { get; set; }
    public string UnitName { get; set; }

    public string MonitorCount { get; set; }
    public string UnitLogo { get; set; }


}
