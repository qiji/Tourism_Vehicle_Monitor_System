using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FiveMinute
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                new com.zjwist.car.CarService().FiveMinuteProc();
                new com.zjwist.qy.CarStatByDay().WithOutCarInfoMore30Min();
            }
            catch
            {

            }
        }
    }
}
