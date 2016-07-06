using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///DeviceInfo 的摘要说明
/// </summary>
public class DeviceInfo
{
	public DeviceInfo()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//

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
}