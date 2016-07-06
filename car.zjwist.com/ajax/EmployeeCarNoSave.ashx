<%@ WebHandler Language="C#" Class="EmployeeCarNoSave" %>

using System;
using System.Web;
using System.Data;

public class EmployeeCarNoSave : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        string carno = context.Server.UrlDecode(context.Request["CarNo"]);
        string unitid = context.Request["UnitID"];
        MySQL.ExecProc("usp_Car_EmployeeNo_Add", new string[] { unitid, carno }, out sqlexec, out sqlresult);
        if (!sqlexec)
        {
            context.Response.Write(sqlresult);
        }
        else
        {
            context.Response.Write("T");
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