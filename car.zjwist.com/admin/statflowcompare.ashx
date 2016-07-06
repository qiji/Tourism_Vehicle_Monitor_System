<%@ WebHandler Language="C#" Class="statflowcompare" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class statflowcompare : IHttpHandler
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

        DataTable dt = MySQL.ExecProc("usp_stat_Flow_ByMonth", new string[] { MonthBegin.ToString("yyyy-MM-dd"), MonthEnd.ToString("yyyy-MM-dd"), context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];
        StatFlowData sd = new StatFlowData();
        sd.ChartData = new List<string>();
        sd.ChartDate = new List<string>();

        foreach (DataRow dr in dt.Rows)
        {
            sd.ChartDate.Add("\"" + dr["SDate"].ToString() + "日\",");
            if (dr["FCount"].ToString() == "0")
            {
                sd.ChartData.Add(null);
            }
            else
            {
                sd.ChartData.Add(dr["FCount"].ToString());
            }
        }
        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(sd));
    }

    public class StatFlowData
    {

        public List<string> ChartDate { get; set; }
        public List<string> ChartData { get; set; }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}