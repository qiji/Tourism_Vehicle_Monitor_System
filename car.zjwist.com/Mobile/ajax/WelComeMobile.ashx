<%@ WebHandler Language="C#" Class="WelComeMobile" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class WelComeMobile : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        double coefficient;

        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;

        WSData wsd = new WSData();
        DataSet ds = MySQL.ExecProc("usp_WelcomeScenic_Mobile", new string[] { context.Request["UnitID"], context.Request["beginday"] }, out sqlexec, out sqlresult);
        wsd.UnitName = ds.Tables[0].Rows[0]["UnitName"].ToString();
        wsd.MaxELCount = 0;
        wsd.CityName = ds.Tables[0].Rows[0]["CityName"].ToString();
        coefficient = Convert.ToDouble(ds.Tables[1].Rows[0]["Coefficient"]);
        wsd.EnterCount = ds.Tables[2].Rows[0]["EnterCount"].ToString();
        wsd.LeaveCount = ds.Tables[2].Rows[0]["LeaveCount"].ToString();
        //wsd.DeviceCount = Convert.ToInt32(ds.Tables[1].Rows[0]["DeviceCount"]);
        //wsd.CurrCount = Convert.ToInt32(ds.Tables[2].Rows[0]["CurrCount"]);
        //wsd.AvgStayTime = ds.Tables[7].Rows[0]["StayTime"].ToString();
        wsd.StayNightCount = ds.Tables[6].Rows[0]["StayNightCount"].ToString();

        int carMaxCount = Convert.ToInt32(ds.Tables[0].Rows[0]["CarMaxCount"]);
        int dateCount = Convert.ToInt32(ds.Tables[7].Rows[0]["datecount"]);

        int entercount, leavecount, totalentercount, totalleavecount, chartcurrcount;
        entercount = leavecount = totalentercount = totalleavecount = chartcurrcount = 0;

        int j = 0;

        foreach (DataRow dr in ds.Tables[3].Rows)
        {
            if (!string.IsNullOrEmpty(dr["entercount"].ToString()))
            {
                totalentercount += Convert.ToInt32(dr["EnterCount"]);
            }
            if (!string.IsNullOrEmpty(dr["leavecount"].ToString()))
            {
                totalleavecount += Convert.ToInt32(dr["LeaveCount"]);
            }

            chartcurrcount = totalentercount - Convert.ToInt32(Math.Truncate(totalleavecount * coefficient));

            if (j % 2 == 0)
            {
                wsd.ChartFivMinute.Add(dr["rTime"].ToString());

                if (context.Request["beginday"] == DateTime.Now.ToString("yyyy-MM-dd") &&
                    Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd") + " " + dr["rtime"].ToString() + ":00") > DateTime.Now)
                {
                    wsd.ChartEnterCount.Add(null);
                    wsd.ChartLeaveCount.Add(null);
                    wsd.ChartCurrCount.Add(null);
                }
                else
                {
                    int leavecountchange = Convert.ToInt32(Math.Truncate(leavecount * coefficient));
                    
                    wsd.ChartEnterCount.Add(entercount.ToString());
                    wsd.ChartLeaveCount.Add(leavecountchange.ToString());

                    if (wsd.MaxELCount < entercount)
                    {
                        wsd.MaxELCount = entercount;
                    }
                    if (wsd.MaxELCount < leavecountchange)
                    {
                        wsd.MaxELCount = leavecountchange;
                    }

                    if (chartcurrcount < 0)
                    {
                        wsd.ChartCurrCount.Add("0");
                    }
                    else
                    {
                        wsd.ChartCurrCount.Add(chartcurrcount.ToString("F0"));
                    }
                }

                if (string.IsNullOrEmpty(dr["EnterCount"].ToString()))
                {
                    entercount = 0;
                }
                else
                {
                    entercount = Convert.ToInt32(dr["EnterCount"]);
                }
                if (string.IsNullOrEmpty(dr["LeaveCount"].ToString()))
                {
                    leavecount = 0;
                }
                else
                {
                    leavecount = Convert.ToInt32(dr["LeaveCount"]);
                }

            }

            else
            {
                if (!string.IsNullOrEmpty(dr["EnterCount"].ToString()))
                {
                    entercount += Convert.ToInt32(dr["EnterCount"]);
                }
                if (!string.IsNullOrEmpty(dr["LeaveCount"].ToString()))
                {
                    leavecount += Convert.ToInt32(dr["LeaveCount"]);
                }
            }
            j++;
        }

        //获取饱和度，如果选择的是当天，就用当前时间点进入总数-离开总数*系数来计算 
        if (context.Request["beginday"].ToString() == DateTime.Now.ToString("yyyy-MM-dd"))
        {
            //离开总数*系数大于进入车辆
            if (chartcurrcount < 0)
            {
                wsd.Level = "0%";
            }
            else
            {
                if (chartcurrcount < carMaxCount)
                {
                    wsd.Level = (chartcurrcount * 100.0 / carMaxCount).ToString("F1") + "%";
                }
                else
                {
                    wsd.Level = "100%";
                }
            }
        }
        else
        {
            if (dateCount < carMaxCount)
            {
                wsd.Level = (dateCount * 100.0 / carMaxCount).ToString("F1") + "%";
            }
            else
            {
                wsd.Level = "100%";
            }
        }



        foreach (DataRow dr in ds.Tables[4].Rows)
        {
            wsd.ChartTypeName.Add(((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString());
            wsd.ChartTypeCount.Add(Convert.ToInt32(dr["TypeCount"]));
        }
        int i = 1;

        foreach (DataRow dr in ds.Tables[5].Rows)
        {
            if (dr["CityName"].ToString() != "丽水")
            {
                if (ds.Tables[5].Rows.Count > 10)
                {
                    if (i <= 10)
                    {
                        wsd.ChartCityName.Add(dr["CityName"].ToString());
                        wsd.ChartCityCount.Add(Convert.ToInt32(dr["MCount"]));
                    }

                    i++;
                }
                else
                {
                    wsd.ChartCityName.Add(dr["CityName"].ToString());
                    wsd.ChartCityCount.Add(Convert.ToInt32(dr["MCount"]));
                }
            }
        }

        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(wsd));
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
        }
        /// <summary>
        /// 单位名称
        /// </summary>
        public string UnitName { get; set; }
        /// <summary>
        /// 当前地区的车辆前缀
        /// </summary>
        public string CityName { get; set; }
        ///// <summary>
        ///// 设备数量
        ///// </summary>
        //public int DeviceCount { get; set; }
        ///// <summary>
        ///// 当前车辆数量
        ///// </summary>
        //public int CurrCount { get; set; }

        /// <summary>
        /// 进入/离开的车辆最大值
        /// </summary>
        public int MaxELCount { get; set; }

        /// <summary>
        /// 当前车辆饱和度
        /// </summary>
        public string Level { get; set; }
        /// <summary>
        /// 过夜车辆数量
        /// </summary>
        public string StayNightCount { get; set; }
        /// <summary>
        /// 当前车辆平均停留时间
        /// </summary>
        //public string AvgStayTime { get; set; }
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
        /// 来源地数量
        /// </summary>
        public List<int> ChartCityCount { get; set; }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}