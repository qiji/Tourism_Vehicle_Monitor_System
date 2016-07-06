<%@ WebHandler Language="C#" Class="WelComePC" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class WelComePC : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        
        
        WelcomeData wd = new WelcomeData();

        DataSet ds = MySQL.ExecProc("usp_WelCome_PC", new string[] { }, out sqlexec, out sqlresult);
        wd.CurrCount = Convert.ToInt32(ds.Tables[0].Rows[0]["CurrCount"]);
        //wd.Level = ((wd.CurrCount * 1.0 / ConfigSet.GetConfig().CarLimit) * 100).ToString("0.00");
        wd.AvgStayTime = ds.Tables[0].Rows[0]["StayTime"].ToString();
        wd.EnterCount = ds.Tables[1].Rows[0]["EnterCount"].ToString();
        wd.LeaveCount = ds.Tables[2].Rows[0]["LeaveCount"].ToString();
        wd.CharCurrTime = new List<string>();
        wd.CharCurrCount = new List<int>();
        wd.CharEnterTime = new List<string>();
        wd.CharEnterCount = new List<int>();
        wd.CharLeaveTime = new List<string>();
        wd.CharLeaveCount = new List<int>();
        wd.CharCity = new List<string>();
        wd.CharCityCount = new List<int>();
        wd.MigrationCity = new List<string>();
        wd.MigrationCount = new List<int>();
        wd.CharTypeName = new List<string>();
        wd.CharTypeCount = new List<int>();

        foreach (DataRow dr in ds.Tables[3].Rows)
        {
            if (string.IsNullOrEmpty(dr["ChangeType"].ToString()))
            {
                wd.CharCurrTime.Add(dr["rTime"].ToString());
                wd.CharCurrCount.Add(0);
                wd.CharEnterTime.Add(dr["rTime"].ToString());
                wd.CharEnterCount.Add(0);
                wd.CharLeaveTime.Add(dr["rTime"].ToString());
                wd.CharLeaveCount.Add(0);
            }
            else
            {
                switch ((CarEnum.CarChangeType)Convert.ToInt32(dr["ChangeType"]))
                {
                    case CarEnum.CarChangeType.当前车辆:
                        {
                            wd.CharCurrTime.Add(dr["rTime"].ToString());
                            wd.CharCurrCount.Add(Convert.ToInt32(dr["CarCount"]));

                        }
                        break;
                    case CarEnum.CarChangeType.进入车辆:
                        {
                            wd.CharEnterTime.Add(dr["rTime"].ToString());
                            wd.CharEnterCount.Add(Convert.ToInt32(dr["CarCount"]));
                        }
                        break;
                    case CarEnum.CarChangeType.离开车辆:
                        {
                            wd.CharLeaveTime.Add(dr["rTime"].ToString());
                            wd.CharLeaveCount.Add(Convert.ToInt32(dr["CarCount"]));
                        }
                        break;
                }
            }
        }

        int TopCount = 0;
        foreach (DataRow dr in ds.Tables[4].Rows)
        {
            wd.CharCity.Add(dr["City"].ToString());
            wd.CharCityCount.Add(Convert.ToInt32(dr["CityCount"]));
            TopCount += Convert.ToInt32(dr["CityCount"]);
        }

        if (wd.CurrCount > TopCount)
        {
            wd.CharCity.Add("其他");
            wd.CharCityCount.Add(wd.CurrCount - TopCount);
        }

        foreach (DataRow dr in ds.Tables[5].Rows)
        {
            wd.CharTypeName.Add(((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString());
            wd.CharTypeCount.Add(Convert.ToInt32(dr["TypeCount"]));
        }
        //ConfigClass c = ConfigSet.GetConfig();
        //wd.MapData = "{\"" + c.DestName + "\":[" + c.Lon + "," + c.Lat + "],";
        foreach (DataRow dr in ds.Tables[6].Rows)
        {
            wd.MigrationCity.Add(dr["City"].ToString());
            wd.MigrationCount.Add(Convert.ToInt32(dr["MCount"]));
            wd.MapData += "\"" + dr["City"].ToString() + "\":[" + dr["lon"].ToString() + "," + dr["lat"].ToString() + "],";
        }

        wd.MapData = wd.MapData.Substring(0, wd.MapData.Length - 1) + "}";



        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(wd));
    }

    public class WelcomeData
    {
        public int CurrCount { get; set; }
        public string Level { get; set; }
        public string AvgStayTime { get; set; }
        public string EnterCount { get; set; }
        public string LeaveCount { get; set; }
        public List<string> CharCurrTime { get; set; }
        public List<int> CharCurrCount { get; set; }
        public List<string> CharEnterTime { get; set; }
        public List<int> CharEnterCount { get; set; }
        public List<string> CharLeaveTime { get; set; }
        public List<int> CharLeaveCount { get; set; }
        public List<string> CharCity { get; set; }
        public List<int> CharCityCount { get; set; }
        public string MapData { get; set; }
        public List<string> MigrationCity { get; set; }
        public List<int> MigrationCount { get; set; }
        public List<string> CharTypeName { get; set; }
        public List<int> CharTypeCount { get; set; }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}