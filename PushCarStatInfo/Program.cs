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
                new com.zjwist.qy.CarStatByDay().StatCarInfoForSendMessage(DateTime.Now.ToString("yyyy-MM-dd"));
                //com.zjwist.qy.CarStatByDay cs = new com.zjwist.qy.CarStatByDay();
                //cs.StatByDay(3, DateTime.Now.ToString("yyyy-MM-dd"));
                //Console.Write(ss);
                //Console.ReadLine();
            }
            catch
            {

            }
        }
    }
}
