<%@ WebHandler Language="C#" Class="GetCarStatInfo" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class GetCarStatInfo : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {

        bool sqlexec;
        string sqlresult;
        context.Response.ContentType = "text/plain";

        DataTable dt;

        CSData csd = new CSData();


        switch (context.Request["type"])
        {
            case "1":
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

                break;
            case "2":
                DateTime monthbegin = Convert.ToDateTime(context.Request["monthbegin"] + "-01");

                dt = MySQL.ExecProc("usp_stat_Flow_ByMonth",
                    new string[] { monthbegin.ToString("yyyy-MM-dd"),
                                   monthbegin.AddMonths(1).ToString("yyyy-MM-dd"),
                                   context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    csd.SDate.Add(dr["SDate"].ToString());


                    if (context.Request["monthbegin"] == DateTime.Now.Date.ToString("yyyy-MM") &&
                        Convert.ToDateTime(DateTime.Now.Date.ToString("yyyy-MM") + "-" + (dr["SDate"]).ToString()) > DateTime.Now)
                    {
                        csd.FCount.Add("");
                    }

                    //if (string.IsNullOrEmpty(dr["Fcount"].ToString()))
                    //{
                    //    csd.FCount.Add("");
                    //}
                    else
                    {
                        csd.FCount.Add(dr["Fcount"].ToString());
                    }
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
                break;
            case "3":
                dt = MySQL.ExecProc("usp_Stat_Car_TypeCount",
                    new string[] { context.Request["BeginDate"], 
                        context.Request["EndDate"], 
                        context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];

                foreach (DataRow dr in dt.Rows)
                {
                    csd.CarType.Add(((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString());
                    csd.TypeCount.Add(dr["TypeCount"].ToString());
                }
                break;

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
            SDate = new List<string>();
            FCount = new List<string>();
            CompareSDate = new List<string>();
            CompareFCount = new List<string>();
            CarType = new List<string>();
            TypeCount = new List<string>();
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
        /// <summary>
        /// 车型统计
        /// </summary>
        public List<string> CarType { get; set; }
        /// <summary>
        /// 车型数量
        /// </summary>
        public List<string> TypeCount { get; set; }

    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}