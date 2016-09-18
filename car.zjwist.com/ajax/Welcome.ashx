<%@ WebHandler Language="C#" Class="Welcome" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class Welcome : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;

        WSData wsd = new WSData();
        UserCookieInfo uc = CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName);


        DataSet ds = MySQL.ExecProc("usp_Welcome",
            new string[] { context.Request["UnitID"], context.Request["datechange"] },
            out sqlexec, out sqlresult);

        wsd.UnitName = ds.Tables[0].Rows[0]["UnitName"].ToString();
        wsd.CityName = ds.Tables[0].Rows[0]["CityName"].ToString();

        //wsd.EnterCount = ds.Tables[1].Rows[0]["EnterCount"].ToString();
        //wsd.LeaveCount = ds.Tables[1].Rows[0]["LeaveCount"].ToString();

        //wsd.StayNightCount = string.IsNullOrEmpty(ds.Tables[1].Rows[0]["StayNightCount"].ToString()) ? "0" : ds.Tables[2].Rows[0]["StayNightCount"].ToString();
        wsd.StayNightCount = ds.Tables[1].Rows[0]["StayNightCount"].ToString();


        int entercount = 0;
        int XMin = 0; //X轴的分钟的刻度

        foreach (DataRow dr in ds.Tables[2].Rows)
        {
            if (XMin % 2 == 0)
            {
                wsd.ChartFivMinute.Add(dr["rTime"].ToString());

                if (context.Request["datechange"] == DateTime.Now.ToString("yyyy-MM-dd") &&
                    Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd") + " " + dr["rtime"].ToString() + ":00") > DateTime.Now)
                {
                    wsd.ChartEnterCount.Add("");

                }
                else
                {
                    wsd.ChartEnterCount.Add(entercount.ToString());

                }

                if (string.IsNullOrEmpty(dr["EnterCount"].ToString()))
                {
                    entercount = 0;
                }
                else
                {
                    entercount = Convert.ToInt32(dr["EnterCount"]);
                }

            }

            else
            {
                if (!string.IsNullOrEmpty(dr["EnterCount"].ToString()))
                {
                    entercount += Convert.ToInt32(dr["EnterCount"]);
                }
            }
            XMin++;
        }

        foreach (DataRow dr in ds.Tables[3].Rows)
        {
            wsd.ChartTypeName.Add(((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString());
            wsd.ChartTypeCount.Add(Convert.ToInt32(dr["TypeCount"]));
        }

        wsd.MapData = "{\"" + ds.Tables[0].Rows[0]["UnitName"].ToString() + "\":[" + ds.Tables[0].Rows[0]["lat"].ToString() + "," + ds.Tables[0].Rows[0]["lnt"].ToString() + "],"; ;

        //来源地
        foreach (DataRow dr in ds.Tables[4].Rows)
        {

            wsd.ChartCityName.Add(dr["CityName"].ToString());
            wsd.ChartCityCount.Add(Convert.ToInt32(dr["MCount"]));

            wsd.MapData += "\"" + dr["CityName"].ToString() + "\":[" + dr["lon"].ToString() + "," + dr["lat"].ToString() + "],";
        }


        wsd.MapData = wsd.MapData.Substring(0, wsd.MapData.Length - 1) + "}";
        //6各点位进出信息
        foreach (DataRow dr in ds.Tables[5].Rows)
        {
            WSData.DeviceCountInfo di = new WSData.DeviceCountInfo();
            if ((CarEnum.UnitType)uc.UnitType == CarEnum.UnitType.县)
            {
                di.DeviceName = "<a href='ScenicShow.aspx?unitid=" + dr["UnitID"].ToString() + "' target='_blank' class='sceniclist'>" + dr["DeviceInstall"].ToString() + "</a>";
            }
            else
            {
                di.DeviceName = dr["DeviceInstall"].ToString();
            }
            di.EnterCount = Convert.ToInt32(dr["DeviceEnterCount"]);
            di.LeaveCount = Convert.ToInt32(dr["DeviceLeaveCount"]);

            wsd.deviceCountInfo.Add(di);
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
            //ChartCurrCount = new List<string>();
            ChartEnterCount = new List<string>();

            ChartTypeName = new List<string>();
            ChartTypeCount = new List<int>();
            ChartCityName = new List<string>();
            ChartCityCount = new List<int>();
            deviceCountInfo = new List<DeviceCountInfo>();

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
        /// 进入车辆数量变化
        /// </summary>
        public List<string> ChartEnterCount { get; set; }

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
        /// <summary>
        /// 地图的数据！
        /// </summary>
        public string MapData { get; set; }

        public List<DeviceCountInfo> deviceCountInfo { get; set; }

        public class DeviceCountInfo
        {
            public string DeviceName { get; set; }
            public int EnterCount { get; set; }
            public int LeaveCount { get; set; }

        }

    }


}