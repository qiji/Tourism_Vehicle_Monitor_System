<%@ WebHandler Language="C#" Class="StatGetCarTypeInfo" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;

public class StatGetCarTypeInfo : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
        
        bool sqlexec;
        string sqlresult;
        context.Response.ContentType = "text/plain";
        
        CSData csd = new CSData();
        
        DataTable dt = MySQL.ExecProc("usp_Stat_Car_TypeCount",
                    new string[] { context.Request["BeginDate"], 
                        context.Request["EndDate"], 
                        context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];

        foreach (DataRow dr in dt.Rows)
        {
            csd.CarType.Add(((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString());
            
            csd.TypeCount.Add(dr["TypeCount"].ToString());
        }


        context.Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(csd));
    }

   
    

    public class CSData
    {
        public CSData()
        {
            CarType = new List<string>();
            TypeCount = new List<string>();
        }


        /// <summary>
        /// 车型统计
        /// </summary>
        public List<string> CarType { get; set; }
        /// <summary>
        /// 车型数量
        /// </summary>
        public List<string> TypeCount { get; set; }

    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}