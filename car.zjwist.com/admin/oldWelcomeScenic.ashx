<%@ WebHandler Language="C#" Class="WelcomeScenic" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class WelcomeScenic : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;

      
        
        WSData wsd = new WSData();

        DataSet ds = MySQL.ExecProc("usp_WelcomeScenic_PCold", new string[] { context.Request["UnitID"] }, out sqlexec, out sqlresult);
        wsd.UnitName = ds.Tables[0].Rows[0]["UnitName"].ToString();
        wsd.CityName = ds.Tables[0].Rows[0]["CityName"].ToString();
        wsd.DeviceCount = Convert.ToInt32(ds.Tables[1].Rows[0]["DeviceCount"]);
        wsd.CurrCount = Convert.ToInt32(ds.Tables[2].Rows[0]["CurrCount"]);


        double level = wsd.CurrCount * 100.0 / Convert.ToInt32(ds.Tables[0].Rows[0]["CarMaxCount"]);
        if (level > 100)
        {
            wsd.Level = "100%";
        }
        else
        {
            wsd.Level = level.ToString("F1") + "%";
        }   
        
        wsd.StayNightCount = ds.Tables[7].Rows[0]["StayNightCount"].ToString();
        wsd.EnterCount = ds.Tables[3].Rows[0]["EnterCount"].ToString();
        wsd.LeaveCount = ds.Tables[3].Rows[0]["LeaveCount"].ToString();

        int entercount, leavecount;
        entercount = 0;
        leavecount = 0;

        foreach (DataRow dr in ds.Tables[4].Rows)
        {
            wsd.ChartFivMinute.Add(dr["rTime"].ToString());
            if (string.IsNullOrEmpty(dr["CurrCount"].ToString()))
            {
                wsd.ChartCurrCount.Add(null);
            }
            else
            {
                //wsd.ChartCurrCount.Add(Convert.ToInt32(dr["CurrCount"]));
                wsd.ChartCurrCount.Add(dr["CurrCount"].ToString());
            }
            if (string.IsNullOrEmpty(dr["EnterCount"].ToString()))
            {
                wsd.ChartEnterCount.Add(null);
            }
            else
            {
                entercount += Convert.ToInt32(dr["EnterCount"]);
                wsd.ChartEnterCount.Add(entercount.ToString());
            }

            if (string.IsNullOrEmpty(dr["LeaveCount"].ToString()))
            {
                wsd.ChartLeaveCount.Add(null);
            }
            else
            {
                leavecount += Convert.ToInt32(dr["LeaveCount"]);
                wsd.ChartLeaveCount.Add(leavecount.ToString());
            }
        }

        foreach (DataRow dr in ds.Tables[5].Rows)
        {
            wsd.ChartTypeName.Add(((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString());
            wsd.ChartTypeCount.Add(Convert.ToInt32(dr["TypeCount"]));
        }

        wsd.MapData = "{\"" + ds.Tables[0].Rows[0]["UnitName"].ToString() + "\":[" + ds.Tables[0].Rows[0]["lat"].ToString() + "," + ds.Tables[0].Rows[0]["lnt"].ToString() + "],"; ;

        //int MoreFiveCity = 0;
        
        int  citycount= 0;
        foreach (DataRow dr in ds.Tables[6].Rows)
        {
            if (dr["CityName"].ToString() != "丽水")
            {

                if ( Convert.ToInt32(dr["MCount"])>5 || citycount < 11)
                {
                    wsd.ChartCityName.Add(dr["CityName"].ToString());
                    wsd.ChartCityCount.Add(Convert.ToInt32(dr["MCount"]));
                }
                else
                {
                    wsd.ChartCityNameLess.Add(dr["CityName"].ToString());
                    wsd.ChartCityCountLess.Add(Convert.ToInt32(dr["MCount"]));
                }
            }
            wsd.MapData += "\"" + dr["CityName"].ToString() + "\":[" + dr["lon"].ToString() + "," + dr["lat"].ToString() + "],";
            
            citycount++;
        }

        wsd.MapData = wsd.MapData.Substring(0, wsd.MapData.Length - 1) + "}";


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
            ChartCurrCount = new List<string>();
            ChartEnterCount = new List<string>();
            ChartLeaveCount = new List<string>();
            ChartTypeName = new List<string>();
            ChartTypeCount = new List<int>();
            ChartCityName = new List<string>();
            ChartCityCount = new List<int>();
            ChartCityNameLess = new List<string>();
            ChartCityCountLess = new List<int>();

        }
        /// <summary>
        /// 单位名称
        /// </summary>
        public string UnitName { get; set; }
        /// <summary>
        /// 当前地区的车辆前缀
        /// </summary>
        public string CityName { get; set; }
        /// <summary>
        /// 设备数量
        /// </summary>
        public int DeviceCount { get; set; }
        /// <summary>
        /// 当前车辆数量
        /// </summary>
        public int CurrCount { get; set; }
        /// <summary>
        /// 当前车辆饱和度
        /// </summary>
        public string Level { get; set; }
        /// <summary>
        /// 过夜车辆数量
        /// </summary>
        public string StayNightCount { get; set; }
        /// <summary>
        /// 本日进入车辆总数
        /// </summary>
        public string EnterCount { get; set; }
        /// <summary>
        /// 本日离开车辆总数
        /// </summary>
        public string LeaveCount { get; set; }
        /// <summary>
        /// 5分钟的时间刻度！
        /// </summary>
        public List<string> ChartFivMinute { get; set; }
        /// <summary>
        /// 当前车辆变化
        /// </summary>
        public List<string> ChartCurrCount { get; set; }
        /// <summary>
        /// 进入车辆数量变化
        /// </summary>
        public List<string> ChartEnterCount { get; set; }
        /// <summary>
        /// 离开车辆数量变化
        /// </summary>
        public List<string> ChartLeaveCount { get; set; }
        /// <summary>
        /// 车辆类型
        /// </summary>
        public List<string> ChartTypeName { get; set; }
        /// <summary>
        /// 类型数量
        /// </summary>
        public List<int> ChartTypeCount { get; set; }

        /// <summary>
        /// 来源地名称
        /// </summary>
        public List<string> ChartCityName { get; set; }
        /// <summary>
        /// 来源地数量大于5
        /// </summary>
        public List<int> ChartCityCount { get; set; }

        /// <summary>
        /// 来源地名称
        /// </summary>
        public List<string> ChartCityNameLess { get; set; }
        /// <summary>
        /// 来源地数量小于5
        /// </summary>
        public List<int> ChartCityCountLess { get; set; }
        
        
        /// <summary>
        /// 地图的数据！
        /// </summary>
        public string MapData { get; set; }



    }
}