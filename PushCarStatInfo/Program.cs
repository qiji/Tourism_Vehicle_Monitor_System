using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PushCarStatInfo
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                com.zjwist.qy.CarStatByDay cs = new com.zjwist.qy.CarStatByDay();
                cs.StatByDay(3, DateTime.Now.ToString("yyyy-MM-dd"));
                //Console.Write(ss);
                //Console.ReadLine();
            }
            catch
            {

            }
        }
    }
}
