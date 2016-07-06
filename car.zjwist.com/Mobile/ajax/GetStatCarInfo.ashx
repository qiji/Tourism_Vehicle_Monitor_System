<%@ WebHandler Language="C#" Class="GetStatCarInfo" %>

using System;
using System.Web;
using System.Data;
public class GetStatCarInfo : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        bool sqlexec;
        string sqlresult;
        context.Response.ContentType = "text/plain";

        if (context.Request["type"] == "1")
        {
            DataSet ds = MySQL.ExecProc("usp_Stat_Car_ComeFrom", new string[] { context.Request["BeginDate"], Convert.ToDateTime(context.Request["EndDate"]).AddDays(1).ToString(), context.Request["AreaType"], context.Request["UnitID"] }, out sqlexec, out sqlresult);
           
            string tbcarfrom = "";
            string DestComeCount = "";
            string DataComeCount = "";
            int i = 0;
            int m = 1;
            tbcarfrom += "<tr><td colspan=\"2\" style=\"text-align:center;font-size:17px;\">车辆来源地分析</td></tr>";
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (ds.Tables[0].Rows.Count > 10)
                {
                    if (m <= 10)
                    {
                        if (i % 2 == 0)
                        {
                            tbcarfrom += "<tr>";
                        }
                        tbcarfrom += "<td>" + dr["DestName"].ToString() + "：" + dr["ComeCount"].ToString() + "辆</td>";
                        if (i == ds.Tables[0].Rows.Count - 1 && i % 2 == 0)
                        {
                            tbcarfrom += "<td></td></tr>";
                        }
                        if (i % 2 != 0)
                        {
                            tbcarfrom += "</tr>";
                        }
                        i++;
                    }
                    m++;
                }
                else
                {
                    if (i % 2 == 0)
                    {
                        tbcarfrom += "<tr>";
                    }
                    tbcarfrom += "<td>" + dr["DestName"].ToString() + "：" + dr["ComeCount"].ToString() + "辆</td>";
                    if (i == ds.Tables[0].Rows.Count - 1 && i % 2 == 0)
                    {
                        tbcarfrom += "<td></td></tr>";
                    }
                    if (i % 2 != 0)
                    {
                        tbcarfrom += "</tr>";
                    }
                    i++;
                }
            }
            int n = 1;
            foreach (DataRow drv in ds.Tables[0].Select("1=1", "ComeCount"))
            {
                if (ds.Tables[0].Rows.Count > 10)
                {
                    if (n >= ds.Tables[0].Rows.Count-9)
                    {
                        DestComeCount += drv["DestName"].ToString() + ",";
                        DataComeCount += drv["ComeCount"].ToString() + ",";
                    }
                    n++;
                }
                else
                {
                    DestComeCount += drv["DestName"].ToString() + ",";
                    DataComeCount += drv["ComeCount"].ToString() + ",";
                }
            }
            if (!string.IsNullOrEmpty(DestComeCount))
            {
                DestComeCount = DestComeCount.Substring(0, DestComeCount.Length - 1);
                DataComeCount = DataComeCount.Substring(0, DataComeCount.Length - 1);
            }

            string tbcarstay = "";
            string DestStayHour = "";
            string DataStayHour = "";
            int j = 0;
            tbcarstay += "<tr><td colspan=\"2\"></td></tr><tr><td colspan=\"2\" style=\"text-align:center;font-size:17px;\">逗留时间分析</td></tr>";
            foreach (DataRow dr in ds.Tables[1].Rows)
            {
                if (j % 2 == 0)
                {
                    tbcarstay += "<tr>";
                }
                tbcarstay += "<td>" + dr["DestName"].ToString() + "：" + dr["StayTime"].ToString() + "小时</td>";
                if (j == ds.Tables[1].Rows.Count - 1 && j % 2 == 0)
                {
                    tbcarstay += "<td></td></tr>";
                }
                if (j % 2 != 0)
                {
                    tbcarstay += "</tr>";
                }
                j++;
            }
            foreach (DataRow drv in ds.Tables[1].Select("1=1", "StayTime desc"))
            {
                DestStayHour += drv["DestName"].ToString() + ",";
                DataStayHour += drv["StayTime"].ToString() + ",";
            }

            if (!string.IsNullOrEmpty(DestStayHour))
            {
                DestStayHour = DestStayHour.Substring(0, DestStayHour.Length - 1);
                DataStayHour = DataStayHour.Substring(0, DataStayHour.Length - 1);
            }
            context.Response.Write(tbcarfrom + "|" + DestComeCount + "|" + DataComeCount + "|" + tbcarstay + "|" + DestStayHour + "|" + DataStayHour);
        }
        else if (context.Request["type"] == "2")
        {
            string ChartTitle = "";
            string ChartDate = "";
            string ChartData = "";

            DateTime MonthBegin = Convert.ToDateTime(context.Request["MonthBegin"] + "-01");
            DateTime MonthEnd = MonthBegin.AddMonths(1);
            ChartTitle = MonthBegin.ToString("yyyy年MM月") + "车辆变化情况";
            DataTable dt = MySQL.ExecProc("usp_stat_Flow_ByMonth", new string[] { MonthBegin.ToString("yyyy-MM-dd"), MonthEnd.ToString("yyyy-MM-dd"), context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                ChartDate += dr["SDate"].ToString() + "日,";
                if (dr["FCount"].ToString() == "0")
                {
                    ChartData += "null,";
                }
                else
                {
                    ChartData += dr["FCount"].ToString() + ",";
                }
            }

            if (!string.IsNullOrEmpty(ChartDate))
            {
                ChartDate = ChartDate.Substring(0, ChartDate.Length - 1);
                ChartData = ChartData.Substring(0, ChartData.Length - 1);
            }
            context.Response.Write(ChartTitle + "|" + ChartDate + "|" + ChartData);
        }
        else if (context.Request["type"] == "3")
        {
            string tbcartype = "";
            string NameCarType = "";
            string CountCarType = "";

            DataTable dt = MySQL.ExecProc("usp_Stat_Car_TypeCount", new string[] { context.Request["BeginDate"], context.Request["EndDate"], context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];
            int i = 0;
            tbcartype += "<tr><td colspan=\"2\" style=\"text-align:center;font-size:17px;\">车辆类型</td></tr>";
            foreach (DataRow dr in dt.Rows)
            {
                NameCarType += ((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString() + ",";
                CountCarType += dr["TypeCount"].ToString() + ",";
                if (i % 2 == 0)
                {
                    tbcartype += "<tr>";
                }
                tbcartype += "<td>" + ((CarEnum.CarType)Convert.ToInt32(dr["CarType"].ToString())).ToString() + "：" + dr["TypeCount"].ToString() + "辆</td>";
                if (i == dt.Rows.Count - 1 && i % 2 == 0)
                {
                    tbcartype += "<td></td></tr>";
                }
                if (i % 2 != 0)
                {
                    tbcartype += "</tr>";
                }
                i++;
            }
            if (!string.IsNullOrEmpty(NameCarType))
            {
                NameCarType = NameCarType.Substring(0, NameCarType.Length - 1);
                CountCarType = CountCarType.Substring(0, CountCarType.Length - 1);
            }
            context.Response.Write(tbcartype + "|" + NameCarType + "|" + CountCarType);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}