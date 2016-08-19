<%@ WebHandler Language="C#" Class="statcarcount" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class statcarcount : IHttpHandler {
    
    public void ProcessRequest (HttpContext context)
    {
        bool sqlexec;
        string sqlresult;

        DataTable dt = MySQL.ExecProc("usp_Car_ChangeInfo_getbyday", 
                                    new string[] { context.Request["UnitID"], context.Request["begintime"], context.Request["endtime"] }, 
                                    out sqlexec, out sqlresult).Tables[0];

        testDate td = new testDate();

        int entercount, leavecount;
        entercount = 0;
        leavecount = 0;
        
        foreach (DataRow dr in dt.Rows)
        {
            td.FiveMinute.Add(dr["rtime"].ToString());

            if (string.IsNullOrEmpty(dr["EnterCount"].ToString()))
            {
                td.EnterCount.Add(null);
            }
            else
            {
                entercount += Convert.ToInt32(dr["EnterCount"]);
                td.EnterCount.Add(entercount.ToString());
            }
            if (string.IsNullOrEmpty(dr["LeaveCount"].ToString()))
            {
                td.LeaveCount.Add(null);
            }
            else
            {
                leavecount += Convert.ToInt32(dr["LeaveCount"]);
                td.LeaveCount.Add(leavecount.ToString());
            }
        
        }
        
        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(td));
        
    }

    public class testDate
    {
        public testDate()
        {
            FiveMinute = new List<string>();
            LeaveCount = new List<string>();
            EnterCount = new List<string>();
        }
        
        public List<string> FiveMinute { get; set; }
        public List<string> LeaveCount { get; set; }
        public List<string> EnterCount { get; set; }
    }
    
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}