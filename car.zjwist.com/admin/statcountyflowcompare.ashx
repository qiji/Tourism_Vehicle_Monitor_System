<%@ WebHandler Language="C#" Class="statcountyflowcompare" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class statcountyflowcompare : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string year = context.Request["Year"];
        string month = context.Request["Month"];

        bool sqlexec;
        string sqlresult;
        DateTime MonthBegin = Convert.ToDateTime(year + "-" + month + "-01");
        DateTime MonthEnd = MonthBegin.AddMonths(1);

        DataTable dt = MySQL.ExecProc("usp_stat_CountyFlow_ByMonth",
            new string[] { MonthBegin.ToString("yyyy-MM-dd"), MonthEnd.ToString("yyyy-MM-dd"), context.Request["UnitID"] },
            out sqlexec, out sqlresult).Tables[0];

        FlowData fd = new FlowData();


        foreach (DataRow dr in dt.Rows)
        {
            fd.ChartDate.Add("\"" + dr["SDate"].ToString() + "日\",");
            fd.CountyEnter.Add(Convert.ToInt32(dr["EnterCount"].ToString()));
            fd.CountyLeave.Add(Convert.ToInt32(dr["LeaveCount"].ToString()));
            fd.ScenicCount.Add(Convert.ToInt32(dr["DateCount"].ToString()));
        }
        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(fd));
    }

    public class FlowData
    {
        public FlowData()
        {
            ChartDate = new List<string>();
            CountyEnter = new List<int>();
            CountyLeave = new List<int>();
            ScenicCount = new List<int>();
        }

        public List<string> ChartDate { get; set; }
        public List<int> CountyEnter { get; set; }
        public List<int> CountyLeave { get; set; }
        public List<int> ScenicCount { get; set; }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}