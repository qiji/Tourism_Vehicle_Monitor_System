using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///CarEnum 的摘要说明
/// </summary>
public class CarEnum
{
    public CarEnum()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    public const string BigServiceSysID = "11";

    //设备算法
    public enum DeviceArithmetic : int
    {
        景区常规算法 = 0,
        高速算法 = 1,
        景区双向算法 = 2,
        景区反向算法 = 3,
    }

    public enum UnitType : int
    {
        景区 = 0,
        县 = 1,
        市 = 2,
    }

    public enum CarChangeType : int
    {
        当前车辆 = 0,
        进入车辆 = 1,
        离开车辆 = 2,
    }



    public enum CarType : int
    {
        客车 = 75,
        货车 = 72,
        牵引车 = 81,
        专项作业车 = 90,
        电车 = 68,
        摩托车 = 77,
        农用车 = 78,
        拖拉机 = 84,
        轮式机械 = 74,
        全挂车 = 71,
        半挂车 = 66,
        轿车 = 88,
    }

    public enum CarDirection1 : int
    {
        进入 = 0,
        离开 = 1,
    }

    public enum CarDirection : int
    {
        进入 = 19,
        离开 = 20,
    }

    public enum CarColor : int
    {
        白色 = 0,
        黄色 = 1,
        蓝色 = 2,
        黑色 = 3,
        其他 = 4,
        绿色 = 5,
    }

    public enum AreaType : int
    {
        按省份 = 0,
        按城市 = 1,
        省内城市 = 2,
        省外城市 = 3,
    }

    public enum DeviceState : int
    {
        正常 = 0,
        异常 = 1,
    }
}