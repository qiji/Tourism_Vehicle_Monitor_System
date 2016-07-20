using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CaptureDevSys
{
    public class DeviceInfo
    {
        public enum DeviceState:byte 
        {
            正常状态=1,
            重启状态,
            注册状态,
        }

        public const int Const_DeviceDisable = -1;

        public DeviceInfo()
        {
            DVRLoginID = Const_DeviceDisable;
            DVRAlarmHandle = Const_DeviceDisable;
            State = DeviceState.正常状态;
        }

        public int DeviceID { get; set; }
        public string DeviceName { get; set; }
        public int UnitID { get; set; }
        public string UnitName { get; set; }
        public string LastTime { get; set; }

        public string DeviceIP { get; set; }
        public string DevicePort { get; set; }
        public string ListenIP { get; set; }
        public string ListenPort { get; set; }
        public string DeviceUserID { get; set; }
        public string DevicePwd { get; set; }

        public int DVRLoginID { get; set; }
        public int DVRAlarmHandle { get; set; }
        public DeviceState State { get; set; }

        public override string ToString()
        {
            return "(" + UnitName + ")" + DeviceName;
        }
    }
}
