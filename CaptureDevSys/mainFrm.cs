using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CaptureDevSys
{
    public partial class mainFrm : Form
    {
        public mainFrm()
        {
            InitializeComponent();
        }

        private void 设备信息ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //某个点的设备信息
            if (ListboxDeviceInfo.SelectedIndex < 0)
            {
                return;
            }
            new DeviceInfoFrm((DeviceInfo)ListboxDeviceInfo.SelectedItem).ShowDialog();
        }

        private void 布防监听ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (ListboxDeviceInfo.SelectedIndex < 0)
            {
                return;
            }
            AlarmAndListen((DeviceInfo)ListboxDeviceInfo.SelectedItem);
        }

        

        private void AddToDeviceInfo(string info)
        {
            if (tbDevice.Lines.Length > 1000)
            {
                tbDevice.Clear();
            }
            tbDevice.Text = string.Format("时间:{0} 信息:{1}", DateTime.Now.ToString("yy-MM-dd HH:mm:ss"), info)
                + Environment.NewLine + tbDevice.Text;
        }

        private void AddToDataInfo(string info)
        {
            if (tbData.Lines.Length > 1000)
            {
                //日志？！
                string LogPath = Application.StartupPath + "\\Log\\" + DateTime.Now.ToString("yyyyMM");
                if (!System.IO.Directory.Exists(LogPath))
                {
                    System.IO.Directory.CreateDirectory(LogPath);
                }
                System.IO.File.WriteAllText(LogPath + "\\" + DateTime.Now.ToString("HHmmss") + ".log", tbData.Text);

                tbData.Clear();
            }

            tbData.Text = string.Format("时间:{0} 信息:{1}", DateTime.Now.ToString("yy-MM-dd HH:mm:ss"), info)
                + Environment.NewLine + tbData.Text;
        }



        private void 重新加载ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                List<DeviceInfo> dlist = new List<DeviceInfo>();

                foreach (DeviceInfo dv in ListboxDeviceInfo.Items)
                {
                    dlist.Add(dv);
                }


                ListboxDeviceInfo.Items.Clear();

                string DeviceJson = System.IO.File.ReadAllText(openFileDialog1.FileName,Encoding.GetEncoding("GB2312"));
                List<DeviceInfo> DeviceList = Newtonsoft.Json.JsonConvert.DeserializeObject<List<DeviceInfo>>(DeviceJson);

                foreach (DeviceInfo di in DeviceList)
                {
                    List<DeviceInfo> dvs = (List<DeviceInfo>)dlist.Where(x => x.DeviceID == di.DeviceID);
                    if (dvs != null)
                    {
                        DeviceInfo dvi = dvs[0];
                        di.DVRLoginID = dvi.DVRLoginID;
                        dlist.Remove(dvi);
                    }
                    else
                    {
                        di.DVRLoginID = -1;
                    }
                    ListboxDeviceInfo.Items.Add(di);

                }
                //加载完成！

            }
        }

        

        private void toolStripMenuItem3_Click(object sender, EventArgs e)
        {
            if (ListboxDeviceInfo.SelectedIndex < 0)
            {
                return;
            }
            StopAndClose((DeviceInfo)ListboxDeviceInfo.SelectedItem);
        }

        

        private void 全部停用ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (DeviceInfo dv in ListboxDeviceInfo.Items)
            {
                if (dv.DVRLoginID != -1)
                {
                    StopAndClose(dv);
                }
            }
        }

        private void ListboxDeviceInfo_DrawItem(object sender, DrawItemEventArgs e)
        {
            e.DrawBackground();//绘制背景 
            Brush myBrush = Brushes.Black;


            if (((DeviceInfo)ListboxDeviceInfo.Items[e.Index]).DVRLoginID == -1)
            {
                myBrush = Brushes.Red;
            }
            else
            {
                myBrush = Brushes.Black;
            }
            e.DrawFocusRectangle();//焦点框 

            //文本 
            e.Graphics.DrawString(ListboxDeviceInfo.Items[e.Index].ToString(), e.Font, myBrush, e.Bounds, StringFormat.GenericDefault);
        }

        private void 全部启用ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (DeviceInfo dv in ListboxDeviceInfo.Items)
            {
                if (dv.DVRLoginID == -1)
                {
                    AlarmAndListen(dv);
                }
            }
        }

        private void AlarmAndListen(DeviceInfo deviceInfo)
        {
            //判断是否
            if (deviceInfo.DVRLoginID != -1)
            {
                AddToDeviceInfo(deviceInfo.DeviceName + "已经启用，不需要重复启用");
                return;
            }
            //开始启用：用户注册，布防，监测！

        }

        private void StopAndClose(DeviceInfo deviceInfo)
        {
            //单个停用
            if (deviceInfo.DVRLoginID == -1)
            {
                AddToDeviceInfo(deviceInfo.DeviceName + "已经停用，不需要重复停用");
                return;
            }
            //开始停用：撤防，停止监听，关闭资源，释放资源

        }
    }
}
