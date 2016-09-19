using System;
using System.Collections.Generic;
using System.Xml;
using System.Web;
using System.Web.Services;
using System.Web.Caching;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Web.UI.WebControls;
using System.Data;
using BFService;
using System.Drawing;

/// <summary>
///CarService 的摘要说明
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消对下行的注释。 
// [System.Web.Script.Services.ScriptService]
public class CarService : System.Web.Services.WebService
{
    bool SQLExec;
    string SQLResult;

    public CarService()
    {

        //如果使用设计的组件，请取消注释以下行 
        //InitializeComponent(); 
    }



    private string Base64ImgSave(string base64img)
    {

        string pathname = "carimg/" + DateTime.Now.ToString("yyyyMMdd") + "/";
        string imgfn = "";
        try
        {
            if (!System.IO.Directory.Exists(Server.MapPath(pathname)))
            {
                System.IO.Directory.CreateDirectory(Server.MapPath(pathname));
            }

            imgfn = Guid.NewGuid().ToString() + ".jpg";

            byte[] arr = Convert.FromBase64String(base64img);
            MemoryStream ms = new MemoryStream(arr);
            Bitmap bmp = new Bitmap(ms);

            bmp.Save(Server.MapPath(pathname + imgfn), System.Drawing.Imaging.ImageFormat.Jpeg);
            ms.Close();
            imgfn = "http://car.zjwist.com/" + pathname + imgfn;
        }
        catch (Exception ee)
        {
            imgfn = "";

            //MySQL.ExecProc("usp_test_save", new string[] { ee.Message + "|" + ee.StackTrace }, out SQLExec, out SQLResult);
        }

        return imgfn;
    }


    [WebMethod]
    public string SaveCarInfo(string DeviceName, string CarNo, string PassTime, string NoColor, string CarType, string CarDirection, string CarImg)
    {

        //调整算法，写入到临时表，使用任务此程序来处理所有数据
        //if (CarNo == "无法识别")
        //{
        //    return "";
        //}
        string carno = CarNo.Trim();
        if (carno == "无车牌")
        {
            carno = "无法识别";
        }

        string CarTypeASCII = ((int)CarType.ToUpper().ToCharArray()[0]).ToString();

        //货车信息
        //if (CarTypeASCII != "75" && CarTypeASCII != "88")
        //{
        //    return "";
        //}


        string CarDirectionDB = CarDirection == "19" ? "0" : "1";


        string imgurl = "";
        #region 图片保存
        if (!string.IsNullOrEmpty(CarImg))
        {
            //imgurl = Base64ImgSave(CarImg);
            //图片服务器坏了！！！

            BFResult br = new BFResult();
            try
            {
                byte[] bytes = Convert.FromBase64String(CarImg);
                BigFileService bs = new BigFileService(CarEnum.BigServiceSysID);
                br = bs.UpLoadALL("0", carno + "_" + PassTime + ".jpg", "image/jpeg", bytes, "1024", "768");
                if (br.code == 1)
                {
                    imgurl = "http://big.tourzj.com/bfinfo/GetFile/" + br.message;
                }
                //MemoryStream memStream = new MemoryStream(bytes);
                //BinaryFormatter binFormatter = new BinaryFormatter();
                //Image img = (Image)binFormatter.Deserialize(memStream);
            }
            catch
            {
            }
        }
        #endregion

        MySQL.ExecProc("usp_Car_SaveTemp_Save", new string[] {
                DeviceName,
                CarNo,
                PassTime,
                NoColor,
                CarTypeASCII,
                CarDirectionDB,
                imgurl,
                null,
                null}, out SQLExec, out SQLResult);

        if (SQLExec)
        {
            return "保存成功";
        }
        else
        {
            return SQLResult;
        }
    }

    /// <summary>
    /// 获得所有需要发送早间通知的单位
    /// </summary>
    /// <returns></returns>
    [WebMethod]
    public DataTable SendMessage_GetUnitInfo()
    {
        return MySQL.ExecProc("usp_Sys_UnitInfo_GetBySendMessage", new string[] { }, out SQLExec, out SQLResult).Tables[0];
    }

    /// <summary>
    /// 设置设别率
    /// </summary>
    [WebMethod]
    public void SendMessage_SetRecoReate()
    {
        MySQL.ExecProc("usp_Car_RecoRate_Save", new string[] { }, out SQLExec, out SQLResult);
    }


    /// <summary>
    /// 前一天的车辆监测汇总情况
    /// </summary>
    /// <param name="unitid"></param>
    /// <param name="carday"></param>
    /// <returns></returns>
    [WebMethod]
    public DataSet SendMessage_StatByUnitID(int unitid, string carday)
    {
        return MySQL.ExecProc("usp_Car_StatByDay", new string[] { unitid.ToString(), carday }, out SQLExec, out SQLResult);
    }

    /// <summary>
    /// 日志,识别率及各个点位设备监控情况
    /// </summary>
    /// <param name="unitid"></param>
    /// <param name="logday"></param>
    /// <returns></returns>
    [WebMethod]
    public DataSet SendMessage_Log(int unitid, string logday)
    {
        return MySQL.ExecProc("usp_Car_LogByDay", new string[] { unitid.ToString(), logday }, out SQLExec, out SQLResult);
    }

    /// <summary>
    /// 清除3个月以上的图片数据！
    /// </summary>
    [WebMethod]
    public void SendMessage_CarImageDelete()
    {
        BFService.BigFileService bs = new BigFileService(CarEnum.BigServiceSysID);

        DataTable dt = MySQL.ExecProc("usp_Car_ImageCanDelete", new string[] { }, out SQLExec, out SQLResult).Tables[0];

        foreach (DataRow dr in dt.Rows)
        {
            try
            {
                if (dr["img"].ToString().Contains("big.tourzj.com"))
                {
                    string bfid = dr["CarImg"].ToString().Substring(dr["CarImg"].ToString().LastIndexOf("/") + 1);
                    bs.Delete(bfid);
                    MySQL.ExecProc("usp_Car_ImageDelete", new string[] { dr["TableName"].ToString(), dr["ID"].ToString() }, out SQLExec, out SQLResult);
                }
                else
                {
                    //进行本地的图片删除
                }
            }
            catch
            {
                //此处应该做一个日志记录！
            }
        }
    }

    /// <summary>
    /// 五分钟车辆数据处理
    /// </summary>
    [WebMethod]
    public void FiveMinuteProc()
    {
        MySQL.ExecProc("usp_Car_SaveTemp_Proc", new string[] { }, out SQLExec, out SQLResult);
    }

    /// <summary>
    /// 30分钟没有数据的监控点位数据
    /// </summary>
    /// <returns></returns>
    [WebMethod]
    public DataTable GetWithOutInfo()
    {
        return MySQL.ExecProc("usp_Sys_DeviceInfo_WithOutInfoMore30Min",
            new string[] { }, out SQLExec, out SQLResult).Tables[0];
    }

    /// <summary>
    /// 设置监控点位异常
    /// </summary>
    /// <param name="DeviceName"></param>
    [WebMethod]
    public void SetDeviceError(string DeviceName)
    {
        MySQL.ExecProc("usp_Sys_DeviceInfo_SetError", new string[] { DeviceName }, out SQLExec, out SQLResult);
    }

    [WebMethod]
    public DataTable GetUnitInfoByUnitID(string unitid)
    {
        return MySQL.ExecProc("usp_sys_unitinfo_getbyunitid", new string[] { unitid }, out SQLExec, out SQLResult).Tables[0];
    }
}

