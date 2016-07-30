<%@ WebHandler Language="C#" Class="LoginFromWX" %>

using System;
using System.Web;
using System.Data;

public class LoginFromWX : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        bool sqlexec;
        string sqlresult;

        string d = context.Request["d"];
        string dp = string.IsNullOrEmpty(d) ? "" : "?d=" + d;
            
        DataTable dt = MySQL.ExecProc("usp_Sys_UserInfo_LoginByWX", new string[] { context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];

        CookierManage.CookierAPI<UserCookieInfo>.WriteCookierObject(new UserCookieInfo(dt.Rows[0]["UserName"].ToString(),
              dt.Rows[0]["TrueName"].ToString(),
              Convert.ToInt32(dt.Rows[0]["UnitID"]),
              Convert.ToInt32(dt.Rows[0]["UnitType"]),
              dt.Rows[0]["UnitName"].ToString()));

        switch ((CarEnum.UnitType)Convert.ToInt32(dt.Rows[0]["UnitType"]))
        {
            case CarEnum.UnitType.景区:
                context.Response.Redirect("Mobile/index.aspx" + dp);
                break;
            case CarEnum.UnitType.县:
                context.Response.Write("Mobile/county.aspx" + dp);
                break;
            default:
                context.Response.Redirect("Mobile/index.aspx" + dp);
                break;

        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}