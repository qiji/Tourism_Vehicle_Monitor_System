using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using System.IO;

namespace CaptureDevSys
{

    /// <summary>
    /// 设备接口类
    /// 封装了所有的摄像头的函数
    /// </summary>
    public class DeviceAPI
    {
        public enum InfoType : byte
        {
            设备信息 = 0,
            抓拍信息,
        }

        public enum ListenType : byte
        {
            开始监听 = 0,
            停止监听,
        }

        public enum OperateType : byte
        {
            全部注册 = 0,
            全部注销,
            全部布防,
            全部撤防
        }

        //显示设备信息或者是抓拍信息
        public delegate void ShowInfoData(InfoType infotype, DeviceInfo deviceinfo, string data);
        public event ShowInfoData OnShowInfoData;

        //创建一个设备
        public delegate void CreateDevice(DeviceInfo deviceinfo);
        public event CreateDevice OnCreateDevice;


        //启动、关闭监听
        public delegate void ListenInfo(ListenType listentype);
        public event ListenInfo OnListenInfo;

        //重新加载设备之前
        public delegate void BeforeLoadDeviceFile();
        public event BeforeLoadDeviceFile OnBeforeLoadDeviceFile;

        private CHCNetSDK.MSGCallBack m_falarmData = null;

        string deviceinfofile; //json格式的设备文件
        int iListenHandle; //监听句柄

        List<DeviceInfo> devicelists;
        private com.zjwist.car.CarService carservice = new com.zjwist.car.CarService();
        private com.zjwist.qy.CarStatByDay carstatbyday = new com.zjwist.qy.CarStatByDay();

        public DeviceAPI()
        {

            devicelists = new List<DeviceInfo>();
            iListenHandle = DeviceInfo.Const_DeviceDisable;
            IsSaveImage = false;
            ServiceIPAddress = "";
            ServicePort = 0;

            if (!CHCNetSDK.NET_DVR_Init())
            {
                MessageBox.Show("初始化SDK失败!");
            }
            else
            {
                m_falarmData = new CHCNetSDK.MSGCallBack(MsgCallback);
                CHCNetSDK.NET_DVR_SetDVRMessageCallBack_V30(m_falarmData, IntPtr.Zero);
            }

        }

        /// <summary>
        /// 是否保存图片
        /// </summary>
        public bool IsSaveImage { get; set; }

        public string ServiceIPAddress { get; set; }

        public int ServicePort { get; set; }

        /// <summary>
        /// 监听回调函数
        /// </summary>
        /// <param name="lCommand">报警类型</param>
        /// <param name="pAlarmer"></param>
        /// <param name="pAlarmInfo"></param>
        /// <param name="dwBufLen"></param>
        /// <param name="pUser"></param>
        private void MsgCallback(int lCommand, ref CHCNetSDK.NET_DVR_ALARMER pAlarmer, IntPtr pAlarmInfo, uint dwBufLen, IntPtr pUser)
        {
            //通过lCommand来判断接收到的报警信息类型，不同的lCommand对应不同的pAlarmInfo内容
            if (lCommand == CHCNetSDK.COMM_ITS_PLATE_RESULT)
            {
                ProcessCommAlarm_ITSPlate(ref pAlarmer, pAlarmInfo, dwBufLen, pUser);
            }
            else
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.抓拍信息, null, "返回了其他的报警信息");
                }
            }
        }

        private void ProcessCommAlarm_ITSPlate(ref CHCNetSDK.NET_DVR_ALARMER pAlarmer, IntPtr pAlarmInfo, uint dwBufLen, IntPtr pUser)
        {
            int dvrloginid = pAlarmer.lUserID;

            var dvs = devicelists.Where(x => x.DVRLoginID == dvrloginid);

            if (dvs.Count() == 0)
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.抓拍信息, null, "没有找到对应的注册设备,回调注册号:" + dvrloginid);
                }
                return;
            }
            DeviceInfo di = (DeviceInfo)dvs.ToArray()[0];

            CHCNetSDK.NET_ITS_PLATE_RESULT struITSPlateResult = new CHCNetSDK.NET_ITS_PLATE_RESULT();

            uint dwSize = (uint)Marshal.SizeOf(struITSPlateResult);

            string imgBase64 = "";

            struITSPlateResult = (CHCNetSDK.NET_ITS_PLATE_RESULT)Marshal.PtrToStructure(pAlarmInfo, typeof(CHCNetSDK.NET_ITS_PLATE_RESULT));

            //保存抓拍图片
            for (int i = 0; i < struITSPlateResult.dwPicNum; i++)
            {
                if (struITSPlateResult.struPicInfo[i].byType == 1)
                {
                    if (struITSPlateResult.struPicInfo[i].dwDataLen != 0)
                    {
                        int iLen = (int)struITSPlateResult.struPicInfo[i].dwDataLen;
                        byte[] by = new byte[iLen];
                        Marshal.Copy(struITSPlateResult.struPicInfo[i].pBuffer, by, 0, iLen);
                        imgBase64 = Convert.ToBase64String(by);

                        if (IsSaveImage)
                        {
                            SaveImage(by, di.DeviceName + "_" + struITSPlateResult.struPicInfo[i].byType.ToString());
                        }
                    }
                }
            }

            //抓拍时间：年月日时分秒
            string strTimeYear = string.Format("{0:D4}", struITSPlateResult.struSnapFirstPicTime.wYear) + "-" +
                string.Format("{0:D2}", struITSPlateResult.struSnapFirstPicTime.byMonth) + "-" +
                string.Format("{0:D2}", struITSPlateResult.struSnapFirstPicTime.byDay) + " "
                + string.Format("{0:D2}", struITSPlateResult.struSnapFirstPicTime.byHour) + ":"
                + string.Format("{0:D2}", struITSPlateResult.struSnapFirstPicTime.byMinute) + ":"
                + string.Format("{0:D2}", struITSPlateResult.struSnapFirstPicTime.bySecond);

            di.LastTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            //上传结果
            string stringAlarm = di.DeviceName + "抓拍上传，" + "车牌：" + struITSPlateResult.struPlateInfo.sLicense + "，车辆序号：" + struITSPlateResult.struVehicleInfo.dwIndex;

            //struITSPlateResult.struPlateInfo.sLicense 车牌号码 

            //struITSPlateResult.byVehicleType 
            //车型识别：0- 未知，1- 客车(大型)，2- 货车(大型)，3- 轿车(小型)，4- 面包车，
            //5- 小货车，6- 行人，7- 二轮车，8- 三轮车，9- SUV/MPV，10- 中型客车

            //设置车辆类型
            string CarType = "Z";
            switch (struITSPlateResult.byVehicleType)
            {
                case 1:
                case 10:
                    CarType = "K";
                    break;
                case 2:
                    CarType = "H";
                    break;
                case 3:
                case 9:
                    CarType = "X";
                    break;
            }

            //设置车牌颜色
            string CarNocolor = "4";
            switch ((CHCNetSDK.VCA_PLATE_COLOR)struITSPlateResult.struPlateInfo.byColor)
            {
                case CHCNetSDK.VCA_PLATE_COLOR.VCA_BLUE_PLATE://蓝色车牌
                    CarNocolor = "2";
                    break;
                case CHCNetSDK.VCA_PLATE_COLOR.VCA_YELLOW_PLATE://黄色车牌
                    CarNocolor = "1";
                    break;
                case CHCNetSDK.VCA_PLATE_COLOR.VCA_WHITE_PLATE://白色车牌
                    CarNocolor = "0";
                    break;
                case CHCNetSDK.VCA_PLATE_COLOR.VCA_BLACK_PLATE://黑色车牌
                    CarNocolor = "3";
                    break;
                case CHCNetSDK.VCA_PLATE_COLOR.VCA_GREEN_PLATE: //绿色车牌
                    CarNocolor = "5";
                    break;
                default:
                    break;
            }

            //设置车辆方向
            string CarDirection = struITSPlateResult.byDir == 1 ? "19" : "20";



            carservice.TestSaveCarInfo(di.DeviceName,
                struITSPlateResult.struPlateInfo.sLicense,
                                        strTimeYear,
                                        CarNocolor,
                                        CarType,
                                        CarDirection,
                                        imgBase64,
                                         struITSPlateResult.struPlateInfo.byEntireBelieve,
                                         struITSPlateResult.struPlateInfo.byBelieve[0]);

            if (OnShowInfoData != null)
            {
                OnShowInfoData(InfoType.抓拍信息, di, stringAlarm);
            }
        }

        private void SaveImage(byte[] by, string devicename)
        {

            string Path = Application.StartupPath + "\\" + DateTime.Now.ToString("yyyyMMdd");
            if (!System.IO.Directory.Exists(Path))
            {
                System.IO.Directory.CreateDirectory(Path);
            }
            string filename = Path + "\\" + DateTime.Now.ToString("HHmmss") + "_" + devicename + ".jpg";
            FileStream fs = new FileStream(filename, FileMode.Create);
            fs.Write(by, 0, by.Length);
            fs.Close();
        }


        /// <summary>
        /// 加载设备
        /// </summary>
        /// <param name="FileName">需要加载的设备文件</param>
        public void LoadDevice(string FileName)
        {
            //载入所有的设备信息
            if (OnBeforeLoadDeviceFile != null)
            {
                OnBeforeLoadDeviceFile();
            }
            deviceinfofile = FileName;

            List<DeviceInfo> dlist = new List<DeviceInfo>(devicelists.ToArray());
            devicelists.Clear();

            string DeviceJson = System.IO.File.ReadAllText(deviceinfofile, Encoding.GetEncoding("GB2312"));
            devicelists = Newtonsoft.Json.JsonConvert.DeserializeObject<List<DeviceInfo>>(DeviceJson);

            foreach (DeviceInfo di in devicelists)
            {
                di.DVRLoginID = DeviceInfo.Const_DeviceDisable;
                di.DVRAlarmHandle = DeviceInfo.Const_DeviceDisable;

                if (dlist != null)
                {
                    var dvs = dlist.Where(x => x.DeviceID == di.DeviceID);
                    if (dvs.Count() != 0)
                    {
                        DeviceInfo dvi = dvs.ToArray()[0];
                        di.DVRLoginID = dvi.DVRLoginID;
                        di.DVRAlarmHandle = dvi.DVRAlarmHandle;
                        di.LastTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        dlist.Remove(dvi);
                    }
                }
                if (OnCreateDevice != null)
                {
                    OnCreateDevice(di);
                }
            }
            if (OnShowInfoData != null)
            {
                OnShowInfoData(InfoType.设备信息, null, "设备加载完成");
            }
        }

        /// <summary>
        /// 判断设备是否为NULL
        /// </summary>
        /// <param name="deviceInfo">设备信息</param>
        /// <returns></returns>
        private bool DeviceIsNull(DeviceInfo deviceInfo)
        {
            if (deviceInfo == null)
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "请选择需要注册的设备");
                }
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 判断设备是否注册
        /// </summary>
        /// <param name="deviceInfo"></param>
        /// <param name="ShowInfoRegist"></param>
        /// <returns></returns>
        private bool DeviceIsRegist(DeviceInfo deviceInfo, bool ShowInfoRegist)
        {
            if (deviceInfo.DVRLoginID == DeviceInfo.Const_DeviceDisable)
            {
                if (!ShowInfoRegist)
                {
                    if (OnShowInfoData != null)
                    {
                        OnShowInfoData(InfoType.设备信息, deviceInfo, "设备还未注册");
                    }
                }
                return false;
            }
            else
            {
                if (ShowInfoRegist)
                {
                    if (OnShowInfoData != null)
                    {
                        OnShowInfoData(InfoType.设备信息, deviceInfo, "已经注册");
                    }
                }
                return true;
            }
        }

        /// <summary>
        /// 设备注册
        /// </summary>
        /// <param name="deviceInfo">设备信息</param>
        public void DeviceRegist(DeviceInfo deviceInfo)
        {
            if (DeviceIsNull(deviceInfo))
            {
                return;
            }

            if (DeviceIsRegist(deviceInfo, true))
            {
                return;
            }

            CHCNetSDK.NET_DVR_DEVICEINFO_V30 devInfo = new CHCNetSDK.NET_DVR_DEVICEINFO_V30();

            int m_lUserID = CHCNetSDK.NET_DVR_Login_V30(deviceInfo.DeviceIP,
                Convert.ToInt16(deviceInfo.DevicePort),
                deviceInfo.DeviceUserID,
                deviceInfo.DevicePwd, ref devInfo);

            if (m_lUserID == DeviceInfo.Const_DeviceDisable)
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "注册失败，错误代码： " + CHCNetSDK.NET_DVR_GetLastError().ToString());
                }
            }
            else
            {
                //登录成功
                deviceInfo.DVRLoginID = m_lUserID;
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "注册成功");
                }
            }
        }

        /// <summary>
        /// 设备注销
        /// </summary>
        /// <param name="deviceInfo"></param>
        public void DeviceUnRegist(DeviceInfo deviceInfo)
        {
            if (DeviceIsNull(deviceInfo))
            {
                return;
            }

            if (!DeviceIsRegist(deviceInfo, false))
            {
                return;
            }
            if (CHCNetSDK.NET_DVR_Logout(deviceInfo.DVRLoginID))
            {
                deviceInfo.DVRLoginID = DeviceInfo.Const_DeviceDisable;

                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "注销成功");
                }
            }
            else
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "注销失败,错误代码:" + CHCNetSDK.NET_DVR_GetLastError().ToString());
                }
            }
        }

        /// <summary>
        /// 设备布防
        /// </summary>
        /// <param name="deviceInfo">设备信息</param>
        public void DeviceAlarmOpen(DeviceInfo deviceInfo)
        {
            if (DeviceIsNull(deviceInfo))
            {
                return;
            }

            if (!DeviceIsRegist(deviceInfo, false))
            {
                return;
            }

            if (deviceInfo.DVRAlarmHandle != DeviceInfo.Const_DeviceDisable)
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "已经布防，不能重复布防");
                }
                return;
            }


            CHCNetSDK.NET_DVR_SETUPALARM_PARAM struAlarmParam = new CHCNetSDK.NET_DVR_SETUPALARM_PARAM();
            struAlarmParam.dwSize = (uint)Marshal.SizeOf(struAlarmParam);
            struAlarmParam.byLevel = 0;
            struAlarmParam.byAlarmInfoType = 1;

            int m_lAlarmHandle = CHCNetSDK.NET_DVR_SetupAlarmChan_V41(deviceInfo.DVRLoginID, ref struAlarmParam);
            if (m_lAlarmHandle == DeviceInfo.Const_DeviceDisable)
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "布防失败，错误代码：" + CHCNetSDK.NET_DVR_GetLastError().ToString());
                }
            }
            else
            {
                deviceInfo.DVRAlarmHandle = m_lAlarmHandle;
                deviceInfo.LastTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "布防成功!");
                }
                deviceInfo.State = DeviceInfo.DeviceState.正常状态;
            }
        }

        /// <summary>
        /// 设备撤防
        /// </summary>
        /// <param name="deviceinfo">设备信息</param>
        public void DeviceAlarmClose(DeviceInfo deviceInfo)
        {
            if (DeviceIsNull(deviceInfo))
            {
                return;
            }

            if (!DeviceIsRegist(deviceInfo, false))
            {
                return;
            }

            if (deviceInfo.DVRAlarmHandle == DeviceInfo.Const_DeviceDisable)
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "已经撤防，不需要重复撤防！");
                }
            }


            if (!CHCNetSDK.NET_DVR_CloseAlarmChan_V30(deviceInfo.DVRAlarmHandle))
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "撤防失败，错误代码：" + CHCNetSDK.NET_DVR_GetLastError().ToString());
                }
            }
            else
            {
                deviceInfo.DVRAlarmHandle = DeviceInfo.Const_DeviceDisable;
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "撤防成功");
                }
            }
        }



        /// <summary>
        /// 服务器启动监听
        /// </summary>
        /// <param name="serviceip">服务器IP地址</param>
        /// <param name="serviceport">服务器监听端口号</param>
        public void ServiceListenStart()
        {
            if (string.IsNullOrEmpty(ServiceIPAddress))
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, null, "监听IP地址不能为空");
                }
            }

            iListenHandle = CHCNetSDK.NET_DVR_StartListen_V30(ServiceIPAddress, (ushort)ServicePort, m_falarmData, IntPtr.Zero);

            if (iListenHandle == DeviceInfo.Const_DeviceDisable)
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, null, "监听启动失败，错误代码：" + CHCNetSDK.NET_DVR_GetLastError().ToString());
                }
            }
            else
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, null, "监听启动成功");
                }

                if (OnListenInfo != null)
                {
                    OnListenInfo(ListenType.开始监听);
                }

            }
        }

        /// <summary>
        /// 服务器停止监听
        /// </summary>
        /// <returns></returns>
        public void ServiceListenStop()
        {
            if (iListenHandle == DeviceInfo.Const_DeviceDisable)
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, null, "没有启动监听");
                }
                return;
            }

            if (!CHCNetSDK.NET_DVR_StopListen_V30(iListenHandle))
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, null, "监听停止失败，错误代码：" + CHCNetSDK.NET_DVR_GetLastError().ToString());
                }
            }
            else
            {
                iListenHandle = DeviceInfo.Const_DeviceDisable;

                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, null, "监听停止成功！");
                }
            }
        }

        /// <summary>
        /// 设备批量操作
        /// </summary>
        /// <param name="opttype">操作类型</param>
        public void DeviceOperateFull(OperateType opttype)
        {
            foreach (DeviceInfo di in devicelists)
            {
                switch (opttype)
                {
                    case OperateType.全部注册:
                        DeviceRegist(di);
                        break;
                    case OperateType.全部注销:
                        DeviceUnRegist(di);
                        break;
                    case OperateType.全部布防:
                        DeviceAlarmOpen(di);
                        break;
                    case OperateType.全部撤防:
                        DeviceAlarmClose(di);
                        break;
                    default:
                        break;
                }
            }
        }

        /// <summary>
        /// 设备重启
        /// </summary>
        /// <param name="deviceInfo"></param>
        public void DeviceReboot(DeviceInfo deviceInfo, bool sendNotify = false)
        {
            if (DeviceIsNull(deviceInfo))
            {
                return;
            }

            if (!CHCNetSDK.NET_DVR_RebootDVR(deviceInfo.DVRLoginID))
            {
                //重启失败
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "设备重启失败,错误代码：" + CHCNetSDK.NET_DVR_GetLastError().ToString());
                }
                //重启失败，撤防，注销，发送通知，等待管理员处理
                DeviceAlarmClose(deviceInfo);
                DeviceUnRegist(deviceInfo);



                if (sendNotify)
                {
                    //发送通知！！！
                    carstatbyday.SendMsgForCarToAdmin("【" + deviceInfo.UnitName + "】的" + deviceInfo.DeviceName + " 设备重启失败,错误原因：" + CHCNetSDK.NET_DVR_GetLastError().ToString());
                }

                deviceInfo.State = DeviceInfo.DeviceState.注册状态;

            }
            else
            {
                //测试重启成功了以后，是否还能正常抓拍
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "设备重启成功");
                }
                deviceInfo.State = DeviceInfo.DeviceState.正常状态;

            }


        }

        /// <summary>
        /// 停止监听，全部撤防，全部注销，释放资源
        /// </summary>
        public void DisposeFull()
        {
            ServiceListenStop();
            foreach (DeviceInfo di in devicelists)
            {
                if (di.DVRAlarmHandle != DeviceInfo.Const_DeviceDisable)
                {
                    DeviceAlarmClose(di);
                }
                if (di.DVRLoginID != DeviceInfo.Const_DeviceDisable)
                {
                    DeviceUnRegist(di);
                }
            }
            CHCNetSDK.NET_DVR_Cleanup();
        }

        /// <summary>
        /// 重新加载
        /// </summary>
        public void ReLoadFull()
        {
            LoadDevice(deviceinfofile);
            foreach (DeviceInfo di in devicelists)
            {

                DeviceRegist(di);
                DeviceAlarmOpen(di);
            }
            ServiceListenStart();
        }

        public void DeviceManualSpan(DeviceInfo deviceInfo)
        {
            if (DeviceIsNull(deviceInfo))
            {
                return;
            }
            //先预览，再抓拍！关闭预览

            CHCNetSDK.NET_DVR_MANUALSNAP strucManualsnap = new CHCNetSDK.NET_DVR_MANUALSNAP();

            CHCNetSDK.NET_DVR_PLATE_RESULT struPlateResult = new CHCNetSDK.NET_DVR_PLATE_RESULT();

            struPlateResult.pBuffer1 = Marshal.AllocHGlobal(2 * 1024 * 1024);
            struPlateResult.pBuffer2 = Marshal.AllocHGlobal(2 * 1024 * 1024);


            if (CHCNetSDK.NET_DVR_ManualSnap(deviceInfo.DVRLoginID, ref strucManualsnap, ref struPlateResult))
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "手动抓拍成功！");
                }


            }
            else
            {
                if (OnShowInfoData != null)
                {
                    OnShowInfoData(InfoType.设备信息, deviceInfo, "手动抓拍失败,错误原因：" + CHCNetSDK.NET_DVR_GetLastError().ToString());
                }
                deviceInfo.State = DeviceInfo.DeviceState.重启状态;
            }

        }

        /// <summary>
        /// 设备状态检查
        /// 5分钟没有数据上来的，发送一个手动的抓拍信息
        /// </summary>
        public void CheckDeviceState()
        {
            foreach (DeviceInfo di in devicelists)
            {
                if (di.DVRAlarmHandle != DeviceInfo.Const_DeviceDisable || di.State == DeviceInfo.DeviceState.注册状态)
                {
                    TimeSpan timespan = (TimeSpan)(DateTime.Now - Convert.ToDateTime(di.LastTime));
                    if (timespan.Minutes >= 1)
                    {
                        switch (di.State)
                        {
                            case DeviceInfo.DeviceState.正常状态:
                                DeviceManualSpan(di);
                                break;
                            case DeviceInfo.DeviceState.重启状态:
                                DeviceReboot(di, true);
                                break;
                            case DeviceInfo.DeviceState.注册状态:
                                DeviceRegist(di);
                                DeviceAlarmOpen(di);
                                break;
                        }
                        di.LastTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                    }
                }
            }
        }


    }
}
