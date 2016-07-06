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
    public partial class DeviceInfoFrm : Form
    {
        public DeviceInfoFrm(DeviceInfo dvi)
        {
            InitializeComponent();

            lbDeviceID.Text = dvi.DeviceID.ToString();
            lbDeviceName.Text = dvi.DeviceName;
            lbUnitName.Text = dvi.UnitName;
            lbLastTime.Text = dvi.LastTime;
            lbDeviceIP.Text = dvi.DeviceIP;
            lbDevicePort.Text = dvi.DevicePort;
            lbListenIP.Text = dvi.ListenIP;
            lbListenPort.Text = dvi.ListenPort;
            lbDvrLoginID.Text = dvi.DVRLoginID.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }


    }
}
