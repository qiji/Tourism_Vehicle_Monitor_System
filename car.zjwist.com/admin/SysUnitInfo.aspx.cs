using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_SysUnitInfo : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = MySQL.ExecProc("usp_Sys_UnitInfo_GetALL", new string[] { }, out sqlexec, out sqlresult).Tables[0];
            divList.InnerHtml = "";
            GetUnitInfo(0, dt, 0);
        }
    }

    private void GetUnitInfo(int unitid, DataTable dt, int Level)
    {
        DataRow[] drs = dt.Select("pUnitID=" + unitid.ToString());

        foreach (DataRow dr in drs)
        {
            //输出div
            divList.InnerHtml += "<div class=\"type\">";


            divList.InnerHtml += " <div class=\"types_s\" style=\"width: 30%\"> <div class=\"types_s\" style=\"width: " + (15 * Level) + "px\">&nbsp;</div><div class=\"types_s\"><a href='SysUnitEdit.aspx?pid="
                + unitid.ToString() + "&UnitID=" + dr["UnitID"].ToString() + "'>" + dr["UnitName"].ToString() + "</a></div></div>";

            divList.InnerHtml += "<div class=\"types_s\" style=\"background-color: #edf4fc; width: 20%; text-align: center\">" + ((CarEnum.UnitType)Convert.ToInt32(dr["UnitType"])).ToString() + "</div>";
            divList.InnerHtml += "<div class=\"types_s\" style=\"background-color: #edf4fc; width: 40%; text-align: center\"><a href='SysUnitEdit.aspx?pid=" + dr["UnitID"].ToString()
                + "'>增加下级</a> | <a href='SysUser.aspx?UnitID=" + dr["UnitID"].ToString() + "'>用户管理</a> | <a href='DeviceList.aspx?unitid=" + dr["UnitID"].ToString()
                + "'>设备管理</a> | <a href='CarRecoRate.aspx?unitid=" + dr["UnitID"].ToString() + "'>车辆信息概览</a></div>";
            divList.InnerHtml += "</div>";
            GetUnitInfo(Convert.ToInt32(dr["UnitID"]), dt, Level + 1);

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DataTable dt = MySQL.ExecProc("usp_Sys_DeviceInfo_GetALL", new string[] { }, out sqlexec, out sqlresult).Tables[0];
        List<DeviceInfo> devlists = new List<DeviceInfo>();
        foreach (DataRow dr in dt.Rows)
        {
            DeviceInfo di = new DeviceInfo();

            di.DeviceID = Convert.ToInt32(dr["DeviceID"]);
            di.DeviceName = dr["DeviceName"].ToString();
            di.DeviceAddress = dr["DeviceInstall"].ToString();
            di.UnitID = Convert.ToInt32(dr["UnitID"]);
            di.UnitName = dr["UnitName"].ToString();
            if (string.IsNullOrEmpty(dr["LastTime"].ToString()))
            {
                di.LastTime = "2000-01-01";
            }
            else
            {
                di.LastTime = Convert.ToDateTime(dr["LastTime"]).ToString("yyyy-MM-dd HH:mm:ss");
            }
            di.DeviceIP = dr["IPAddress"].ToString();
            di.DevicePort = dr["DevicePort"].ToString();

            di.ListenIP = dr["ListenIP"].ToString();
            di.ListenPort = dr["ListenPort"].ToString();
            di.DeviceUserID = dr["DeviceUserID"].ToString();
            di.DevicePwd = dr["DevicePwd"].ToString();
            di.BeginTime = dr["shotbegintime"].ToString();
            di.EndTime = dr["shotendtime"].ToString();
            di.DVRLoginID = -1;
            devlists.Add(di);
        }

        string devjson = Newtonsoft.Json.JsonConvert.SerializeObject(devlists);
        string fileName = "设备信息.json";

        HttpContext.Current.Response.ClearContent();
        HttpContext.Current.Response.Charset = "GB2312";
        HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
        HttpContext.Current.Response.ContentType = "text/plain";

        Response.Write(devjson);
        Response.End();
    }
}