<%@ WebHandler Language="C#" Class="StatGetCarComeFrom" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class StatGetCarComeFrom : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        

        bool sqlexec;
        string sqlresult;



        CSData csd = new CSData();
        DataSet ds = MySQL.ExecProc("usp_Stat_Car_ComeFrom",
        new string[] { 
            context.Request["BeginDate"], 
            context.Request["EndDate"],
            context.Request["AreaType"],
            context.Request["UnitID"] }, out sqlexec, out sqlresult);

        foreach (DataRow dr in ds.Tables[0].Rows)
        {
            csd.CityName.Add(dr["DestName"].ToString());
            csd.ComeCount.Add(dr["ComeCount"].ToString());   
        }

        ds.Tables[1].DefaultView.Sort = "StayTime desc";

        for (int i = 0; i < ds.Tables[1].DefaultView.Count; i++)
        {
            csd.STCityName.Add(ds.Tables[1].DefaultView[i].Row["DestName"].ToString());
            csd.StayTime.Add(ds.Tables[1].DefaultView[i].Row["StayTime"].ToString());

        }
        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(csd));
        
    }

    public class CSData
    {
        public CSData()
        {
            CityName = new List<string>();
            ComeCount = new List<string>();
            STCityName = new List<string>();
            StayTime = new List<string>();
        }


        /// <summary>
        /// 车辆数量最多来源地名称
        /// </summary>
        public List<string> CityName { get; set; }
        /// <summary>
        /// 来源地数量
        /// </summary>
        public List<string> ComeCount { get; set; }
        /// <summary>
        /// 逗留时间来源地
        /// </summary>
        public List<string> STCityName { get; set; }
        /// <summary>
        /// 车辆逗留时间
        /// </summary>
        public List<string> StayTime { get; set; }
    }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    
}