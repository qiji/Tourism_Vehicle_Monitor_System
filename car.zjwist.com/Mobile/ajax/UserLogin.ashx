<%@ WebHandler Language="C#" Class="UserLogin" %>

using System;
using System.Web;
using System.Data;

public class UserLogin : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Sys_UserInfo_Login",
                        new string[] { context.Request["tbusername"], context.Request["tbpwd"] },
                        out sqlexec,
                        out sqlresult).Tables[0];

        if (dt.Rows.Count == 0)
        {
            context.Response.Write("F");
        }
        else
        {
            UserCookieInfo uc = new UserCookieInfo(dt.Rows[0]["UserName"].ToString(),
                dt.Rows[0]["TrueName"].ToString(),
                Convert.ToInt32(dt.Rows[0]["UnitID"]),
                Convert.ToInt32(dt.Rows[0]["UnitType"]),
                dt.Rows[0]["UnitName"].ToString());

            CookierManage.CookierAPI<UserCookieInfo>.WriteCookierObject(uc);

            if (uc.UnitID != 0)
            {
                switch ((CarEnum.UnitType)uc.UnitType)
                {
                    case CarEnum.UnitType.景区:
                        context.Response.Write("0");
                        break;
                    case CarEnum.UnitType.县:
                        context.Response.Write("1");
                        break;
                    default:
                        context.Response.Write("2");
                        break;
                }
            }
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