using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using log4net;

namespace CaptureDevSys
{
    public partial class main : Form
    {

        private delegate void UpDateTextBoxCallBack(string info);


        public static bool NeedBootService = false;

        public main()
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

        private void 重新加载ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                deviceapi.LoadDevice(openFileDialog1.FileName);
            }
        }


        private void toolStripMenuItem3_Click(object sender, EventArgs e)
        {
            deviceapi.DeviceAlarmClose((DeviceInfo)ListboxDeviceInfo.SelectedItem);
        }

        private void ListboxDeviceInfo_DrawItem(object sender, DrawItemEventArgs e)
        {
            if (e.Index < 0)
            {
                return;
            }
            e.DrawBackground();//绘制背景 
            Brush myBrush = Brushes.Black;
            DeviceInfo dvi = (DeviceInfo)ListboxDeviceInfo.Items[e.Index];
            if (dvi.DVRLoginID == -1 || dvi.DVRAlarmHandle == -1)
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
            deviceapi.DeviceOperateFull(DeviceAPI.OperateType.全部布防);
        }

        private void btnStartListen_Click(object sender, EventArgs e)
        {
            int listenport = 0;
            if (!int.TryParse(tbListenPort.Text, out listenport))
            {
                deviceapi_OnShowInfoData(DeviceAPI.InfoType.设备信息, null, "端口号必须为整数");
                return;
            }
            deviceapi.ServiceIPAddress = tbListenIP.Text;
            deviceapi.ServicePort = listenport;

            deviceapi.ServiceListenStart();
        }

        private void btnStopListen_Click(object sender, EventArgs e)
        {
            deviceapi.ServiceListenStop();
        }

        DeviceAPI deviceapi;
        bool CanClose = false;

        private void main_Load(object sender, EventArgs e)
        {
            deviceapi = new DeviceAPI();
            deviceapi.OnBeforeLoadDeviceFile += new DeviceAPI.BeforeLoadDeviceFile(deviceapi_OnBeforeLoadDeviceFile);
            deviceapi.OnShowInfoData += new DeviceAPI.ShowInfoData(deviceapi_OnShowInfoData);
            deviceapi.OnCreateDevice += new DeviceAPI.CreateDevice(deviceapi_OnCreateDevice);
            deviceapi.OnListenInfo += new DeviceAPI.ListenInfo(deviceapi_OnListenInfo);

            notifyIcon1.Visible = false;

            btnStopListen.Enabled = false;
            btnStartListen.Enabled = true;

            FiveMin.Enabled = true;
        }

        void deviceapi_OnBeforeLoadDeviceFile()
        {
            ListboxDeviceInfo.Items.Clear();
        }

        void deviceapi_OnCreateDevice(DeviceInfo deviceinfo)
        {
            ListboxDeviceInfo.Items.Add(deviceinfo);

            deviceapi_OnShowInfoData(DeviceAPI.InfoType.设备信息, deviceinfo, "加载成功");
        }

        void deviceapi_OnShowInfoData(DeviceAPI.InfoType infotype, DeviceInfo deviceinfo, string data)
        {
            if (infotype == DeviceAPI.InfoType.设备信息)
            {
                if (tbDevice.Lines.Length > 1000)
                {
                    tbDevice.Clear();
                }
                if (deviceinfo != null)
                {
                    tbDevice.Text = string.Format("时间:{0} 设备:{1} 信息：{2}", DateTime.Now.ToString("yyMMdd HHmmss"), deviceinfo.DeviceName, data)
                        + Environment.NewLine + tbDevice.Text;
                }
                else
                {
                    tbDevice.Text = string.Format("时间:{0}  信息：{1}", DateTime.Now.ToString("yyMMdd HHmmss"), data)
                                           + Environment.NewLine + tbDevice.Text;
                }
                ListboxDeviceInfo.Refresh();
            }
            else
            {
                if (InvokeRequired)
                {
                    object[] paras = new object[1];
                    paras[0] = data;
                    tbData.BeginInvoke(new UpDateTextBoxCallBack(UpDataTBInfo), paras);
                }
                else
                {
                    UpDataTBInfo(data);
                }
            }
        }

        public void UpDataTBInfo(string info)
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

            tbData.Text = string.Format("时间:{0} 信息:{1}", DateTime.Now.ToString("yyMMdd HHmmss"), info)
                + Environment.NewLine + tbData.Text;
        }

        void deviceapi_OnListenInfo(DeviceAPI.ListenType listentype)
        {
            if (listentype == DeviceAPI.ListenType.开始监听)
            {
                tbListenIP.Enabled = false;
                tbListenPort.Enabled = false;
                btnStartListen.Enabled = false;
                btnStopListen.Enabled = true;
            }
            else
            {
                tbListenIP.Enabled = true;
                tbListenPort.Enabled = true;
                btnStartListen.Enabled = true;
                btnStopListen.Enabled = false;
            }
        }

        private void main_FormClosed(object sender, FormClosedEventArgs e)
        {
            deviceapi.DisposeFull();
        }

        private void toolStripMenuItem1_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("真的要重启设备吗？", "提示", MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.Yes)
            {
                deviceapi.DeviceReboot((DeviceInfo)ListboxDeviceInfo.SelectedItem);
            }
        }

        private void 设备注册ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            deviceapi.DeviceRegist((DeviceInfo)ListboxDeviceInfo.SelectedItem);
        }

        private void 设备注销ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            deviceapi.DeviceUnRegist((DeviceInfo)ListboxDeviceInfo.SelectedItem);
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            deviceapi.DeviceAlarmOpen((DeviceInfo)ListboxDeviceInfo.SelectedItem);
        }

        private void 全部注册ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            deviceapi.DeviceOperateFull(DeviceAPI.OperateType.全部注册);
        }

        private void 全部注销ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            deviceapi.DeviceOperateFull(DeviceAPI.OperateType.全部注销);
        }

        private void 全部停用ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            deviceapi.DeviceOperateFull(DeviceAPI.OperateType.全部撤防);
        }

        private void notifyIcon1_DoubleClick(object sender, EventArgs e)
        {
            this.Show();
            notifyIcon1.Visible = false;
        }

        private void main_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (!CanClose)
            {
                this.Hide();
                notifyIcon1.Visible = true;
                e.Cancel = true;
            }

        }

        private void 退出ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CanClose = true;
            this.Close();
        }

        private void 打开ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Show();
            notifyIcon1.Visible = false;
        }

        private void FiveMin_Tick(object sender, EventArgs e)
        {
            //tbData.Text = DateTime.Now.ToString() + "\r\n" + tbData.Text;

            if (NeedBootService)
            {
                //重启
                NeedBootService = false;
                deviceapi.DisposeFull();
                deviceapi.ReLoadFull();
                return;
            }
            else
            {
                deviceapi.CheckDeviceState();
            }
        }

        private void 手动抓拍ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            deviceapi.DeviceManualSpan((DeviceInfo)ListboxDeviceInfo.SelectedItem);
        }

        private void cbSaveImg_CheckedChanged(object sender, EventArgs e)
        {
            deviceapi.IsSaveImage = cbSaveImg.Checked;
        }

       


    }
}
