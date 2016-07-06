<%@ WebHandler Language="C#" Class="GetCountryStatInfo" %>

using System;
using System.Web;
using System.Data;
public class GetCountryStatInfo : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        bool sqlexec;
        string sqlresult;
        context.Response.ContentType = "text/plain";

        if (context.Request["type"] == "1")
        {
            DataSet ds = MySQL.ExecProc("usp_Stat_County_ComeFrom", new string[] { context.Request["BeginDate"], Convert.ToDateTime(context.Request["EndDate"]).AddDays(1).ToString(), context.Request["AreaType"], context.Request["UnitID"] }, out sqlexec, out sqlresult);
           
            string tbcarfrom = "";
            string DestComeCount = "";
            string DataComeCount = "";
            int i = 0;
            tbcarfrom += "<tr><td colspan=\"2\" style=\"text-align:center;font-size:17px;\">高速车辆来源地分析</td></tr>";
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                if (i % 2 == 0)
                {
                    tbcarfrom += "<tr>";
                }
                tbcarfrom += "<td>" + dr["ChartX"].ToString() + "：" + dr["ChartY"].ToString() + "辆</td>";
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

            foreach (DataRow drv in ds.Tables[0].Rows)
            {
                DestComeCount += drv["ChartX"].ToString() + ",";
                DataComeCount += drv["ChartY"].ToString() + ",";
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
            tbcarstay += "<tr><td colspan=\"2\"></td></tr><tr><td colspan=\"2\" style=\"text-align:center;font-size:17px;\">高速逗留时间分析</td></tr>";
            foreach (DataRow dr in ds.Tables[1].Rows)
            {
                if (j % 2 == 0)
                {
                    tbcarstay += "<tr>";
                }
                tbcarstay += "<td>" + dr["ChartX"].ToString() + "小时：" + dr["ChartY"].ToString() + "辆</td>";
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
            foreach (DataRow drv in ds.Tables[1].Rows)
            {
                DestStayHour += drv["ChartX"].ToString() + ",";
                DataStayHour += drv["ChartY"].ToString() + ",";
            }

            if (!string.IsNullOrEmpty(DestStayHour))
            {
                DestStayHour = DestStayHour.Substring(0, DestStayHour.Length - 1);
                DataStayHour = DataStayHour.Substring(0, DataStayHour.Length - 1);
            }

            string jqcarfrom = "";
            string jqComeCount = "";
            string jqDataComeCount = "";
            int m = 0;
            jqcarfrom += "<tr><td colspan=\"2\"></td></tr><tr><td colspan=\"2\" style=\"text-align:center;font-size:17px;\">景区车辆来源地分析</td></tr>";
            foreach (DataRow dr in ds.Tables[2].Rows)
            {
                if (m % 2 == 0)
                {
                    jqcarfrom += "<tr>";
                }
                jqcarfrom += "<td>" + dr["ChartX"].ToString() + "小时：" + dr["ChartY"].ToString() + "辆</td>";
                if (m == ds.Tables[2].Rows.Count - 1 && m % 2 == 0)
                {
                    jqcarfrom += "<td></td></tr>";
                }
                if (m % 2 != 0)
                {
                    jqcarfrom += "</tr>";
                }
                m++;
            }
            foreach (DataRow drv in ds.Tables[2].Rows)
            {
                jqComeCount += drv["ChartX"].ToString() + ",";
                jqDataComeCount += drv["ChartY"].ToString() + ",";
            }

            if (!string.IsNullOrEmpty(jqComeCount))
            {
                jqComeCount = jqComeCount.Substring(0, jqComeCount.Length - 1);
                jqDataComeCount = jqDataComeCount.Substring(0, jqDataComeCount.Length - 1);
            }

            string jqcarstay = "";
            string jqDestStayHour = "";
            string jqDataStayHour = "";
            int n= 0;
            jqcarstay += "<tr><td colspan=\"2\"></td></tr><tr><td colspan=\"2\" style=\"text-align:center;font-size:17px;\">景区逗留时间分析</td></tr>";
            foreach (DataRow dr in ds.Tables[3].Rows)
            {
                if (n % 2 == 0)
                {
                    jqcarstay += "<tr>";
                }
                jqcarstay += "<td>" + dr["ChartX"].ToString() + "小时：" + dr["ChartY"].ToString() + "辆</td>";
                if (n == ds.Tables[3].Rows.Count - 1 && n % 2 == 0)
                {
                    jqcarstay += "<td></td></tr>";
                }
                if (n % 2 != 0)
                {
                    jqcarstay += "</tr>";
                }
                n++;
            }
            foreach (DataRow drv in ds.Tables[3].Rows)
            {
                jqDestStayHour += drv["ChartX"].ToString() + ",";
                jqDataStayHour += drv["ChartY"].ToString() + ",";
            }

            if (!string.IsNullOrEmpty(jqDestStayHour))
            {
                jqDestStayHour = jqDestStayHour.Substring(0, jqDestStayHour.Length - 1);
                jqDataStayHour = jqDataStayHour.Substring(0, jqDataStayHour.Length - 1);
            }
            context.Response.Write(tbcarfrom + "|" + DestComeCount + "|" + DataComeCount + "|" + tbcarstay + "|" + DestStayHour + "|" + DataStayHour + "|" + jqcarfrom + "|" + jqComeCount + "|" + jqDataComeCount + "|" + jqcarstay + "|" + jqDestStayHour + "|" + jqDataStayHour);
        }
        else if (context.Request["type"] == "2")
        {
            DateTime MonthBegin = Convert.ToDateTime(context.Request["MonthBegin"] + "-01");
            DateTime MonthEnd = MonthBegin.AddMonths(1);
            DataTable dt = MySQL.ExecProc("usp_stat_CountyFlow_ByMonth", new string[] { MonthBegin.ToString("yyyy-MM-dd"), MonthEnd.ToString("yyyy-MM-dd"), context.Request["UnitID"] }, out sqlexec, out sqlresult).Tables[0];
            
            string CountyTitle = "";
            string CountyEnter = "";
            string CountyLeave = "";
            string ChartTitle = "";
            string ChartDate = "";
            string ChartData = "";
            
            CountyTitle = MonthBegin.ToString("yyyy年MM月") + "高速车辆进出";
            ChartTitle = MonthBegin.ToString("yyyy年MM月") + "景区车辆数量";
            foreach (DataRow dr in dt.Rows)
            {
                ChartDate += dr["SDate"].ToString() + "日,";
                CountyEnter += dr["EnterCount"].ToString() + ",";
                CountyLeave += dr["LeaveCount"].ToString() + ",";
                ChartData += dr["DateCount"].ToString() + ",";
            }

            if (!string.IsNullOrEmpty(ChartDate))
            {
                ChartDate = ChartDate.Substring(0, ChartDate.Length - 1);
                ChartData = ChartData.Substring(0, ChartData.Length - 1);
                CountyEnter = CountyEnter.Substring(0, CountyEnter.Length - 1);
                CountyLeave = CountyLeave.Substring(0, CountyLeave.Length - 1);
            }
            context.Response.Write(ChartTitle + "|" + ChartDate + "|" + ChartData + "|" + CountyTitle + "|" + CountyEnter + "+" + CountyLeave);
        }
        else if (context.Request["type"] == "3")
        {
            string tbcartype = "";
            string NameCarType = "";
            string CountCarType = "";

            DataSet ds = MySQL.ExecProc("usp_Stat_County_CarTypeCount", new string[] { context.Request["BeginDate"], context.Request["EndDate"], context.Request["UnitID"] }, out sqlexec, out sqlresult);
            int i = 0;
            tbcartype += "<tr><td colspan=\"2\" style=\"text-align:center;font-size:17px;\">高速车辆类型</td></tr>";
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                NameCarType += ((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString() + ",";
                CountCarType += dr["TypeCount"].ToString() + ",";
                if (i % 2 == 0)
                {
                    tbcartype += "<tr>";
                }
                tbcartype += "<td>" + ((CarEnum.CarType)Convert.ToInt32(dr["CarType"].ToString())).ToString() + "：" + dr["TypeCount"].ToString() + "辆</td>";
                if (i == ds.Tables[0].Rows.Count - 1 && i % 2 == 0)
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

            string jqcartype = "";
            string jqNameCarType = "";
            string jqCountCarType = "";
            
            int j = 0;
            jqcartype += "<tr><td colspan=\"2\" style=\"text-align:center;font-size:17px;\">景区车辆类型</td></tr>";
            foreach (DataRow dr in ds.Tables[1].Rows)
            {
                jqNameCarType += ((CarEnum.CarType)Convert.ToInt32(dr["CarType"])).ToString() + ",";
                jqCountCarType += dr["TypeCount"].ToString() + ",";
                if (j % 2 == 0)
                {
                    jqcartype += "<tr>";
                }
                jqcartype += "<td>" + ((CarEnum.CarType)Convert.ToInt32(dr["CarType"].ToString())).ToString() + "：" + dr["TypeCount"].ToString() + "辆</td>";
                if (j == ds.Tables[1].Rows.Count - 1 && j % 2 == 0)
                {
                    jqcartype += "<td></td></tr>";
                }
                if (j % 2 != 0)
                {
                    jqcartype += "</tr>";
                }
                j++;
            }
            if (!string.IsNullOrEmpty(jqNameCarType))
            {
                jqNameCarType = jqNameCarType.Substring(0, jqNameCarType.Length - 1);
                jqCountCarType = jqCountCarType.Substring(0, jqCountCarType.Length - 1);
            }
            context.Response.Write(tbcartype + "|" + NameCarType + "|" + CountCarType + "|" + jqcartype + "|" + jqNameCarType + "|" + jqCountCarType);
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