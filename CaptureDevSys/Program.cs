using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using log4net;

namespace CaptureDevSys
{
    static class Program
    {
        /// <summary>
        /// 应用程序的主入口点。
        /// </summary>
        [STAThread]
        static void Main()
        {

            Application.ThreadException += new System.Threading.ThreadExceptionEventHandler(Application_ThreadException);
            AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(CurrentDomain_UnhandledException);
            Application.EnableVisualStyles();

            log4net.Config.XmlConfigurator.ConfigureAndWatch(new System.IO.FileInfo("Log4Net_ZL.config"));

            Application.SetCompatibleTextRenderingDefault(false);

            Application.Run(new main());
        }

        static void Application_ThreadException(object sender, System.Threading.ThreadExceptionEventArgs e)
        {
            //日志记录
            ILog log = LogManager.GetLogger("CaptureLog");
            log.Debug("Message:" + e.Exception.Message);
            log.Debug("Trace:" + e.Exception.StackTrace);

            main.NeedBootService = true;
        }

        static void CurrentDomain_UnhandledException(object sender, UnhandledExceptionEventArgs e)
        {
            ILog log = LogManager.GetLogger("CaptureLog");
            log.Debug("DomainMessage:" + e.ExceptionObject.ToString());
            main.NeedBootService = true;
        }

    }
}
