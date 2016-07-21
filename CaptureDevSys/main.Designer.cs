namespace CaptureDevSys
{
    partial class main
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(main));
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.ListboxDeviceInfo = new System.Windows.Forms.ListBox();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.设备信息ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem6 = new System.Windows.Forms.ToolStripSeparator();
            this.设备注册ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem3 = new System.Windows.Forms.ToolStripMenuItem();
            this.设备注销ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem5 = new System.Windows.Forms.ToolStripSeparator();
            this.手动抓拍ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem7 = new System.Windows.Forms.ToolStripSeparator();
            this.重新加载ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem4 = new System.Windows.Forms.ToolStripSeparator();
            this.全部注册ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.全部启用ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.全部停用ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.全部注销ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.tbData = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.tbDevice = new System.Windows.Forms.TextBox();
            this.notifyIcon1 = new System.Windows.Forms.NotifyIcon(this.components);
            this.contextMenuStrip2 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.打开ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.退出ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.panel1 = new System.Windows.Forms.Panel();
            this.cbSaveImg = new System.Windows.Forms.CheckBox();
            this.btnStopListen = new System.Windows.Forms.Button();
            this.tbListenPort = new System.Windows.Forms.TextBox();
            this.btnStartListen = new System.Windows.Forms.Button();
            this.label10 = new System.Windows.Forms.Label();
            this.tbListenIP = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.FiveMin = new System.Windows.Forms.Timer(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.contextMenuStrip2.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Margin = new System.Windows.Forms.Padding(2);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.ListboxDeviceInfo);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.groupBox2);
            this.splitContainer1.Panel2.Controls.Add(this.groupBox1);
            this.splitContainer1.Size = new System.Drawing.Size(735, 444);
            this.splitContainer1.SplitterDistance = 243;
            this.splitContainer1.SplitterWidth = 3;
            this.splitContainer1.TabIndex = 2;
            // 
            // ListboxDeviceInfo
            // 
            this.ListboxDeviceInfo.ContextMenuStrip = this.contextMenuStrip1;
            this.ListboxDeviceInfo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ListboxDeviceInfo.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.ListboxDeviceInfo.FormattingEnabled = true;
            this.ListboxDeviceInfo.ItemHeight = 20;
            this.ListboxDeviceInfo.Location = new System.Drawing.Point(0, 0);
            this.ListboxDeviceInfo.Margin = new System.Windows.Forms.Padding(2);
            this.ListboxDeviceInfo.Name = "ListboxDeviceInfo";
            this.ListboxDeviceInfo.Size = new System.Drawing.Size(243, 444);
            this.ListboxDeviceInfo.TabIndex = 0;
            this.ListboxDeviceInfo.DrawItem += new System.Windows.Forms.DrawItemEventHandler(this.ListboxDeviceInfo_DrawItem);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.设备信息ToolStripMenuItem,
            this.toolStripMenuItem6,
            this.设备注册ToolStripMenuItem,
            this.toolStripMenuItem2,
            this.toolStripMenuItem3,
            this.设备注销ToolStripMenuItem,
            this.toolStripMenuItem5,
            this.手动抓拍ToolStripMenuItem,
            this.toolStripMenuItem1,
            this.toolStripMenuItem7,
            this.重新加载ToolStripMenuItem,
            this.toolStripMenuItem4,
            this.全部注册ToolStripMenuItem,
            this.全部启用ToolStripMenuItem,
            this.全部停用ToolStripMenuItem,
            this.全部注销ToolStripMenuItem});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(125, 292);
            // 
            // 设备信息ToolStripMenuItem
            // 
            this.设备信息ToolStripMenuItem.Name = "设备信息ToolStripMenuItem";
            this.设备信息ToolStripMenuItem.Size = new System.Drawing.Size(124, 22);
            this.设备信息ToolStripMenuItem.Text = "设备信息";
            this.设备信息ToolStripMenuItem.Click += new System.EventHandler(this.设备信息ToolStripMenuItem_Click);
            // 
            // toolStripMenuItem6
            // 
            this.toolStripMenuItem6.Name = "toolStripMenuItem6";
            this.toolStripMenuItem6.Size = new System.Drawing.Size(121, 6);
            // 
            // 设备注册ToolStripMenuItem
            // 
            this.设备注册ToolStripMenuItem.Name = "设备注册ToolStripMenuItem";
            this.设备注册ToolStripMenuItem.Size = new System.Drawing.Size(124, 22);
            this.设备注册ToolStripMenuItem.Text = "设备注册";
            this.设备注册ToolStripMenuItem.Click += new System.EventHandler(this.设备注册ToolStripMenuItem_Click);
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(124, 22);
            this.toolStripMenuItem2.Text = "设备布防";
            this.toolStripMenuItem2.Click += new System.EventHandler(this.toolStripMenuItem2_Click);
            // 
            // toolStripMenuItem3
            // 
            this.toolStripMenuItem3.Name = "toolStripMenuItem3";
            this.toolStripMenuItem3.Size = new System.Drawing.Size(124, 22);
            this.toolStripMenuItem3.Text = "设备撤防";
            this.toolStripMenuItem3.Click += new System.EventHandler(this.toolStripMenuItem3_Click);
            // 
            // 设备注销ToolStripMenuItem
            // 
            this.设备注销ToolStripMenuItem.Name = "设备注销ToolStripMenuItem";
            this.设备注销ToolStripMenuItem.Size = new System.Drawing.Size(124, 22);
            this.设备注销ToolStripMenuItem.Text = "设备注销";
            this.设备注销ToolStripMenuItem.Click += new System.EventHandler(this.设备注销ToolStripMenuItem_Click);
            // 
            // toolStripMenuItem5
            // 
            this.toolStripMenuItem5.Name = "toolStripMenuItem5";
            this.toolStripMenuItem5.Size = new System.Drawing.Size(121, 6);
            // 
            // 手动抓拍ToolStripMenuItem
            // 
            this.手动抓拍ToolStripMenuItem.Name = "手动抓拍ToolStripMenuItem";
            this.手动抓拍ToolStripMenuItem.Size = new System.Drawing.Size(124, 22);
            this.手动抓拍ToolStripMenuItem.Text = "手动抓拍";
            this.手动抓拍ToolStripMenuItem.Click += new System.EventHandler(this.手动抓拍ToolStripMenuItem_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(124, 22);
            this.toolStripMenuItem1.Text = "重启设备";
            this.toolStripMenuItem1.Click += new System.EventHandler(this.toolStripMenuItem1_Click);
            // 
            // toolStripMenuItem7
            // 
            this.toolStripMenuItem7.Name = "toolStripMenuItem7";
            this.toolStripMenuItem7.Size = new System.Drawing.Size(121, 6);
            // 
            // 重新加载ToolStripMenuItem
            // 
            this.重新加载ToolStripMenuItem.Name = "重新加载ToolStripMenuItem";
            this.重新加载ToolStripMenuItem.Size = new System.Drawing.Size(124, 22);
            this.重新加载ToolStripMenuItem.Text = "重新加载";
            this.重新加载ToolStripMenuItem.Click += new System.EventHandler(this.重新加载ToolStripMenuItem_Click);
            // 
            // toolStripMenuItem4
            // 
            this.toolStripMenuItem4.Name = "toolStripMenuItem4";
            this.toolStripMenuItem4.Size = new System.Drawing.Size(121, 6);
            // 
            // 全部注册ToolStripMenuItem
            // 
            this.全部注册ToolStripMenuItem.Name = "全部注册ToolStripMenuItem";
            this.全部注册ToolStripMenuItem.Size = new System.Drawing.Size(124, 22);
            this.全部注册ToolStripMenuItem.Text = "全部注册";
            this.全部注册ToolStripMenuItem.Click += new System.EventHandler(this.全部注册ToolStripMenuItem_Click);
            // 
            // 全部启用ToolStripMenuItem
            // 
            this.全部启用ToolStripMenuItem.Name = "全部启用ToolStripMenuItem";
            this.全部启用ToolStripMenuItem.Size = new System.Drawing.Size(124, 22);
            this.全部启用ToolStripMenuItem.Text = "全部布防";
            this.全部启用ToolStripMenuItem.Click += new System.EventHandler(this.全部启用ToolStripMenuItem_Click);
            // 
            // 全部停用ToolStripMenuItem
            // 
            this.全部停用ToolStripMenuItem.Name = "全部停用ToolStripMenuItem";
            this.全部停用ToolStripMenuItem.Size = new System.Drawing.Size(124, 22);
            this.全部停用ToolStripMenuItem.Text = "全部撤防";
            this.全部停用ToolStripMenuItem.Click += new System.EventHandler(this.全部停用ToolStripMenuItem_Click);
            // 
            // 全部注销ToolStripMenuItem
            // 
            this.全部注销ToolStripMenuItem.Name = "全部注销ToolStripMenuItem";
            this.全部注销ToolStripMenuItem.Size = new System.Drawing.Size(124, 22);
            this.全部注销ToolStripMenuItem.Text = "全部注销";
            this.全部注销ToolStripMenuItem.Click += new System.EventHandler(this.全部注销ToolStripMenuItem_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.tbData);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox2.Location = new System.Drawing.Point(0, 0);
            this.groupBox2.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox2.Size = new System.Drawing.Size(489, 234);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "数据接收信息";
            // 
            // tbData
            // 
            this.tbData.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbData.Location = new System.Drawing.Point(2, 16);
            this.tbData.Margin = new System.Windows.Forms.Padding(2);
            this.tbData.Multiline = true;
            this.tbData.Name = "tbData";
            this.tbData.ReadOnly = true;
            this.tbData.Size = new System.Drawing.Size(485, 216);
            this.tbData.TabIndex = 3;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.tbDevice);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.groupBox1.Location = new System.Drawing.Point(0, 234);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(2);
            this.groupBox1.Size = new System.Drawing.Size(489, 210);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "设备操作信息";
            // 
            // tbDevice
            // 
            this.tbDevice.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbDevice.Location = new System.Drawing.Point(2, 16);
            this.tbDevice.Margin = new System.Windows.Forms.Padding(2);
            this.tbDevice.Multiline = true;
            this.tbDevice.Name = "tbDevice";
            this.tbDevice.ReadOnly = true;
            this.tbDevice.Size = new System.Drawing.Size(485, 192);
            this.tbDevice.TabIndex = 2;
            // 
            // notifyIcon1
            // 
            this.notifyIcon1.BalloonTipIcon = System.Windows.Forms.ToolTipIcon.Info;
            this.notifyIcon1.ContextMenuStrip = this.contextMenuStrip2;
            this.notifyIcon1.Icon = ((System.Drawing.Icon)(resources.GetObject("notifyIcon1.Icon")));
            this.notifyIcon1.Text = "智旅信息 抓拍平台";
            this.notifyIcon1.Visible = true;
            this.notifyIcon1.DoubleClick += new System.EventHandler(this.notifyIcon1_DoubleClick);
            // 
            // contextMenuStrip2
            // 
            this.contextMenuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.打开ToolStripMenuItem,
            this.退出ToolStripMenuItem});
            this.contextMenuStrip2.Name = "contextMenuStrip2";
            this.contextMenuStrip2.Size = new System.Drawing.Size(101, 48);
            // 
            // 打开ToolStripMenuItem
            // 
            this.打开ToolStripMenuItem.Name = "打开ToolStripMenuItem";
            this.打开ToolStripMenuItem.Size = new System.Drawing.Size(100, 22);
            this.打开ToolStripMenuItem.Text = "打开";
            this.打开ToolStripMenuItem.Click += new System.EventHandler(this.打开ToolStripMenuItem_Click);
            // 
            // 退出ToolStripMenuItem
            // 
            this.退出ToolStripMenuItem.Name = "退出ToolStripMenuItem";
            this.退出ToolStripMenuItem.Size = new System.Drawing.Size(100, 22);
            this.退出ToolStripMenuItem.Text = "退出";
            this.退出ToolStripMenuItem.Click += new System.EventHandler(this.退出ToolStripMenuItem_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.DefaultExt = "json";
            this.openFileDialog1.Filter = "设备信息文件|*.json|所有文件|*.*";
            this.openFileDialog1.Title = "设备文件选择";
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.cbSaveImg);
            this.panel1.Controls.Add(this.btnStopListen);
            this.panel1.Controls.Add(this.tbListenPort);
            this.panel1.Controls.Add(this.btnStartListen);
            this.panel1.Controls.Add(this.label10);
            this.panel1.Controls.Add(this.tbListenIP);
            this.panel1.Controls.Add(this.label11);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 444);
            this.panel1.Margin = new System.Windows.Forms.Padding(2);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(735, 45);
            this.panel1.TabIndex = 3;
            // 
            // cbSaveImg
            // 
            this.cbSaveImg.AutoSize = true;
            this.cbSaveImg.Location = new System.Drawing.Point(620, 16);
            this.cbSaveImg.Margin = new System.Windows.Forms.Padding(2);
            this.cbSaveImg.Name = "cbSaveImg";
            this.cbSaveImg.Size = new System.Drawing.Size(72, 16);
            this.cbSaveImg.TabIndex = 60;
            this.cbSaveImg.Text = "保存图片";
            this.cbSaveImg.UseVisualStyleBackColor = true;
            this.cbSaveImg.CheckedChanged += new System.EventHandler(this.cbSaveImg_CheckedChanged);
            // 
            // btnStopListen
            // 
            this.btnStopListen.Enabled = false;
            this.btnStopListen.Location = new System.Drawing.Point(481, 10);
            this.btnStopListen.Name = "btnStopListen";
            this.btnStopListen.Size = new System.Drawing.Size(90, 23);
            this.btnStopListen.TabIndex = 55;
            this.btnStopListen.Text = " 停止监听";
            this.btnStopListen.UseVisualStyleBackColor = true;
            this.btnStopListen.Click += new System.EventHandler(this.btnStopListen_Click);
            // 
            // tbListenPort
            // 
            this.tbListenPort.Location = new System.Drawing.Point(259, 13);
            this.tbListenPort.Name = "tbListenPort";
            this.tbListenPort.Size = new System.Drawing.Size(100, 21);
            this.tbListenPort.TabIndex = 59;
            this.tbListenPort.Text = "7200";
            // 
            // btnStartListen
            // 
            this.btnStartListen.Location = new System.Drawing.Point(375, 10);
            this.btnStartListen.Name = "btnStartListen";
            this.btnStartListen.Size = new System.Drawing.Size(88, 23);
            this.btnStartListen.TabIndex = 54;
            this.btnStartListen.Text = "启动监听";
            this.btnStartListen.UseVisualStyleBackColor = true;
            this.btnStartListen.Click += new System.EventHandler(this.btnStartListen_Click);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(15, 16);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(71, 12);
            this.label10.TabIndex = 56;
            this.label10.Text = "监听IP地址:";
            // 
            // tbListenIP
            // 
            this.tbListenIP.Location = new System.Drawing.Point(89, 13);
            this.tbListenIP.Name = "tbListenIP";
            this.tbListenIP.Size = new System.Drawing.Size(98, 21);
            this.tbListenIP.TabIndex = 58;
            this.tbListenIP.Text = "192.168.10.106";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(201, 16);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(59, 12);
            this.label11.TabIndex = 57;
            this.label11.Text = "监听端口:";
            // 
            // FiveMin
            // 
            this.FiveMin.Interval = 30000;
            this.FiveMin.Tick += new System.EventHandler(this.FiveMin_Tick);
            // 
            // main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(735, 489);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.panel1);
            this.Margin = new System.Windows.Forms.Padding(2);
            this.MaximizeBox = false;
            this.Name = "main";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "智旅信息车辆抓拍设备监测平台";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.main_FormClosing);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.main_FormClosed);
            this.Load += new System.EventHandler(this.main_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.contextMenuStrip1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.contextMenuStrip2.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.NotifyIcon notifyIcon1;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem4;
        private System.Windows.Forms.ToolStripMenuItem 重新加载ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 设备信息ToolStripMenuItem;
        private System.Windows.Forms.ListBox ListboxDeviceInfo;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.ToolStripMenuItem 全部启用ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem3;
        private System.Windows.Forms.ToolStripMenuItem 全部停用ToolStripMenuItem;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox tbDevice;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox tbData;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnStopListen;
        private System.Windows.Forms.TextBox tbListenPort;
        private System.Windows.Forms.Button btnStartListen;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox tbListenIP;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.CheckBox cbSaveImg;
        private System.Windows.Forms.Timer FiveMin;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem 设备注册ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 设备注销ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem5;
        private System.Windows.Forms.ToolStripMenuItem 全部注册ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 全部注销ToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem7;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip2;
        private System.Windows.Forms.ToolStripMenuItem 打开ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 退出ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 手动抓拍ToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem6;
    }
}

