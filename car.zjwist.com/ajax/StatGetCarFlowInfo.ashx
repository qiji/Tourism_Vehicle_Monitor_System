<%@ WebHandler Language="C#" Class="SetGetCarFlowInfo" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class SetGetCarFlowInfo : IHttpHandler
{



    public void ProcessRequest(HttpContext context)
    {
        bool sqlexec;
        string sqlresult;

        DataTable dt;

        CSData csd = new CSData();

        DateTime monthbegin = Convert.ToDateTime(context.Request["monthbegin"] + "-01");

        dt = MySQL.ExecProc("usp_stat_Flow_ByMonth",
            new string[] { monthbegin.ToString("yyyy-MM-dd"),
                                   monthbegin.AddMonths(1).ToString("yyyy-MM-dd"),
                                   context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];

        foreach (DataRow dr in dt.Rows)
        {
            csd.SDate.Add(dr["SDate"].ToString());
            csd.FCount.Add(dr["Fcount"].ToString());
        }

        if (!string.IsNullOrEmpty(context.Request["monthend"]))
        {
            DateTime monthend = Convert.ToDateTime(context.Request["monthend"] + "-01");

            dt = MySQL.ExecProc("usp_stat_Flow_ByMonth",
                new string[] { monthend.ToString("yyyy-MM-dd"),
                                       monthend.AddMonths(1).ToString("yyyy-MM-dd"),
                                       context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];

            foreach (DataRow dr in dt.Rows)
            {
                csd.CompareSDate.Add(dr["SDate"].ToString());
                csd.CompareFCount.Add(dr["Fcount"].ToString());
            }
        }

        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(csd));
    }


    public class CSData
    {
        public CSData()
        {

            SDate = new List<string>();
            FCount = new List<string>();
            CompareSDate = new List<string>();
            CompareFCount = new List<string>();

        }



        /// <summary>
        /// 流量统计日期
        /// </summary>
        public List<string> SDate { get; set; }
        /// <summary>
        /// 流量统计数量
        /// </summary>
        public List<string> FCount { get; set; }
        /// <summary>
        /// 流量统计对比日期
        /// </summary>
        public List<string> CompareSDate { get; set; }
        /// <summary>
        /// 流量统计数量
        /// </summary>
        public List<string> CompareFCount { get; set; }


    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}