<%@ WebHandler Language="C#" Class="GetPassInfoByCarNO" %>

using System;
using System.Web;
using System.Data;

public class GetPassInfoByCarNO : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Stat_Car_PassInfo_ByCarNo",
            new string[] { context.Request["BeginDate"], context.Request["EndDate"], context.Request["CarNo"], context.Request["UnitID"] },
            out sqlexec, out sqlresult).Tables[0];
        string divpasstable = "";
        divpasstable += "<table cellspacing=\"0\" cellpadding=\"3\" rules=\"cols\"  style=\"margin:auto;background-color:White;border-color:#C2D3ED;border-width:1px;border-style:Solid;border-collapse:collapse;\">";
        divpasstable += "<tbody>";
        divpasstable += "<tr align=\"center\" style=\"color:Black;background-color:#EDF4FC;font-weight:bold;height:25px;\">";
        divpasstable += "<th scope=\"col\">抓拍地点</th><th scope=\"col\">通过时间</th><th scope=\"col\">方向</th><th scope=\"col\">过车图片</th>";
        divpasstable += "</tr>";
        bool b = true;
        foreach (DataRow dr in dt.Rows)
        {
            if (b)
            {
                divpasstable += "<tr style=\"border-color:#C2D3ED;border-width:1px;border-style:Solid;height:25px;\">";
            }
            else
            {
                divpasstable += "<tr style=\"background-color:#EDF4FC;border-color:#C2D3ED;border-width:1px;border-style:Solid;height:25px;\">";
            }

            divpasstable += "<td>";
            divpasstable += dr["DeviceInstall"].ToString();
            divpasstable += "</td>";

            divpasstable += "<td>";
            divpasstable += Convert.ToDateTime(dr["PassTime"]).ToString("yyyy-MM-dd HH:mm:ss");
            divpasstable += "</td>";

            divpasstable += "<td>";
            divpasstable += dr["CarDirection"].ToString() == "0" ? CarEnum.CarDirection.进入 : CarEnum.CarDirection.离开;
            divpasstable += "</td>";

            divpasstable += "<td>";
            divpasstable += "<a href=\"javascript:;\" onClick=\"ShowCarImage('" + dr["CarImg"].ToString() + "')\">过车图片</a>";
            divpasstable += "</td>";


            divpasstable += "</tr>";
            b = !b;
        }
        divpasstable += "</tbody>";
        divpasstable += "</table>";

        context.Response.Write(divpasstable);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}