<%@ WebHandler Language="C#" Class="WelcomeCounty" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class WelcomeCounty : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;

        WSData wsd = new WSData();
        DataSet ds = MySQL.ExecProc("usp_WelcomeCounty_PC", new string[] { context.Request["UnitID"] }, out sqlexec, out sqlresult);

        wsd.UnitName = ds.Tables[0].Rows[0]["UnitName"].ToString();
        wsd.DeviceCount = Convert.ToInt32(ds.Tables[1].Rows[0]["DeviceCount"]);

        wsd.CurrSummaryInfo.CurrCount = Convert.ToInt32(ds.Tables[2].Compute("Sum(CurrCount)", ""));
        wsd.CurrSummaryInfo.OtherPlaceCount = Convert.ToInt32(ds.Tables[3].Rows[0]["OtherPlaceCount"]);
        wsd.CurrSummaryInfo.AvgStayTime = ds.Tables[7].Rows[0]["StayTime"].ToString();

        if (ds.Tables[4].Rows.Count > 0)
        {
            wsd.CurrSummaryInfo.EnterCount = ds.Tables[4].Rows[0]["EnterCount"].ToString();
            wsd.CurrSummaryInfo.LeaveCount = ds.Tables[4].Rows[0]["LeaveCount"].ToString();
        }
        else
        {
            wsd.CurrSummaryInfo.EnterCount = "0";
            wsd.CurrSummaryInfo.LeaveCount = "0";
        }


        for (int i = 0; i < ds.Tables[2].Rows.Count; i++)
        {
            WSData.SummaryInfo smi = new WSData.SummaryInfo();
            smi.UnitID = Convert.ToInt32(ds.Tables[2].Rows[i]["UnitID"]);
            smi.UnitName = ds.Tables[2].Rows[i]["UnitName"].ToString();
            smi.CurrCount = Convert.ToInt32(ds.Tables[2].Rows[i]["CurrCount"]);
            smi.Level = (smi.CurrCount * 1.0 / Convert.ToInt32(ds.Tables[2].Rows[i]["CarMaxCount"]) * 100).ToString("0.00") + "%";
            smi.AvgStayTime = ds.Tables[2].Rows[i]["StayTime"].ToString();
            smi.EnterCount = ds.Tables[2].Rows[i]["EnterCount"].ToString();
            smi.LeaveCount = ds.Tables[2].Rows[i]["LeaveCount"].ToString();
            wsd.SummaryInfos.Add(smi);
        }

        int entercount, leavecount;
        entercount = 0;
        leavecount = 0;
        
        foreach (DataRow dr in ds.Tables[5].Rows)
        {
            wsd.ChartFivMinute.Add(dr["rTime"].ToString());
            wsd.ChartScenicCurrCount.Add(Convert.ToInt32(dr["CurrCount"]));
            entercount += Convert.ToInt32(dr["EnterCount"]);
            leavecount += Convert.ToInt32(dr["LeaveCount"]);

            wsd.ChartEnterCount.Add(entercount);
            wsd.ChartLeaveCount.Add(leavecount);
        }
        
        foreach (DataRow dr in ds.Tables[6].Rows)
        {
            wsd.ChartCityName.Add(dr["City"].ToString());
            wsd.ChartCityCount.Add(Convert.ToInt32(dr["MCount"]));
        }


        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(wsd));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    public class WSData
    {


        public WSData()
        {
            ChartFivMinute = new List<string>();
            ChartScenicCurrCount = new List<int>();
            ChartEnterCount = new List<int>();
            ChartLeaveCount = new List<int>();

            ChartCityName = new List<string>();
            ChartCityCount = new List<int>();
            CurrSummaryInfo = new CurrUnitSummaryInfo();
            SummaryInfos = new List<SummaryInfo>();
        }

        /// <summary>
        /// 当前县级单位的概要信息
        /// </summary>
        public class CurrUnitSummaryInfo
        {
            /// <summary>
            /// 当前景区车辆
            /// </summary>
            public int CurrCount { get; set; }
            /// <summary>
            /// 外地车辆
            /// </summary>
            public int OtherPlaceCount { get; set; }
            /// <summary>
            /// 高速本日进入车辆总数
            /// </summary>
            public string EnterCount { get; set; }
            /// <summary>
            /// 高速本日离开车辆总数
            /// </summary>
            public string LeaveCount { get; set; }
            /// <summary>
            /// 高速平均逗留时间
            /// </summary>
            public string AvgStayTime { get; set; }
        }

        /// <summary>
        /// 概要信息
        /// </summary>
        public class SummaryInfo
        {

            /// <summary>
            /// 单位ID
            /// </summary>
            public int UnitID { get; set; }
            /// <summary>
            /// 单位名称
            /// </summary>
            public string UnitName { get; set; }
            /// <summary>
            /// 当前车辆数量
            /// </summary>
            public int CurrCount { get; set; }
            /// <summary>
            /// 外地车辆
            /// </summary>
            public int OtherPlaceCount { get; set; }
            /// <summary>
            /// 当前车辆饱和度
            /// </summary>
            public string Level { get; set; }
            /// <summary>
            /// 当前车辆平均停留时间
            /// </summary>
            public string AvgStayTime { get; set; }
            /// <summary>
            /// 本日进入车辆总数
            /// </summary>
            public string EnterCount { get; set; }
            /// <summary>
            /// 本日离开车辆总数
            /// </summary>
            public string LeaveCount { get; set; }
        }

        /// <summary>
        /// 单位名称
        /// </summary>
        public string UnitName { get; set; }
        /// <summary>
        /// 设备数量
        /// </summary>
        public int DeviceCount { get; set; }

        public CurrUnitSummaryInfo CurrSummaryInfo { get; set; }
        /// <summary>
        /// 景区概要信息
        /// </summary>
        public List<SummaryInfo> SummaryInfos { get; set; }

        /// <summary>
        /// 5分钟的时间刻度！
        /// </summary>
        public List<string> ChartFivMinute { get; set; }
        /// <summary>
        /// 景区当前车辆数量
        /// </summary>
        public List<int> ChartScenicCurrCount { get; set; }
        /// <summary>
        /// 高速进入车辆数量变化
        /// </summary>
        public List<int> ChartEnterCount { get; set; }
        /// <summary>
        /// 高速离开车辆数量变化
        /// </summary>
        public List<int> ChartLeaveCount { get; set; }

        /// <summary>
        /// 来源地名称
        /// </summary>
        public List<string> ChartCityName { get; set; }
        /// <summary>
        /// 来源地数量
        /// </summary>
        public List<int> ChartCityCount { get; set; }
    }
}