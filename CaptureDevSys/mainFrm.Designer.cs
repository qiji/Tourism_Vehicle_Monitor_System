namespace CaptureDevSys
{
    partial class mainFrm
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
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.ListboxDeviceInfo = new System.Windows.Forms.ListBox();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.设备信息ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.布防监听ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripMenuItem4 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.重新加载ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.全部启用ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.全部停用ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem3 = new System.Windows.Forms.ToolStripMenuItem();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.tbDevice = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.tbData = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
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
            this.splitContainer1.Size = new System.Drawing.Size(980, 611);
            this.splitContainer1.SplitterDistance = 326;
            this.splitContainer1.TabIndex = 2;
            // 
            // ListboxDeviceInfo
            // 
            this.ListboxDeviceInfo.ContextMenuStrip = this.contextMenuStrip1;
            this.ListboxDeviceInfo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ListboxDeviceInfo.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.ListboxDeviceInfo.FormattingEnabled = true;
            this.ListboxDeviceInfo.ItemHeight = 15;
            this.ListboxDeviceInfo.Location = new System.Drawing.Point(0, 0);
            this.ListboxDeviceInfo.Name = "ListboxDeviceInfo";
            this.ListboxDeviceInfo.Size = new System.Drawing.Size(326, 611);
            this.ListboxDeviceInfo.TabIndex = 0;
            this.ListboxDeviceInfo.DrawItem += new System.Windows.Forms.DrawItemEventHandler(this.ListboxDeviceInfo_DrawItem);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.设备信息ToolStripMenuItem,
            this.布防监听ToolStripMenuItem,
            this.toolStripMenuItem3,
            this.toolStripMenuItem2,
            this.toolStripMenuItem4,
            this.toolStripSeparator1,
            this.重新加载ToolStripMenuItem,
            this.全部启用ToolStripMenuItem,
            this.全部停用ToolStripMenuItem});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(139, 172);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(135, 6);
            // 
            // 设备信息ToolStripMenuItem
            // 
            this.设备信息ToolStripMenuItem.Name = "设备信息ToolStripMenuItem";
            this.设备信息ToolStripMenuItem.Size = new System.Drawing.Size(138, 24);
            this.设备信息ToolStripMenuItem.Text = "设备信息";
            this.设备信息ToolStripMenuItem.Click += new System.EventHandler(this.设备信息ToolStripMenuItem_Click);
            // 
            // 布防监听ToolStripMenuItem
            // 
            this.布防监听ToolStripMenuItem.Name = "布防监听ToolStripMenuItem";
            this.布防监听ToolStripMenuItem.Size = new System.Drawing.Size(138, 24);
            this.布防监听ToolStripMenuItem.Text = "布防监听";
            this.布防监听ToolStripMenuItem.Click += new System.EventHandler(this.布防监听ToolStripMenuItem_Click);
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(135, 6);
            // 
            // toolStripMenuItem4
            // 
            this.toolStripMenuItem4.Name = "toolStripMenuItem4";
            this.toolStripMenuItem4.Size = new System.Drawing.Size(135, 6);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(135, 6);
            // 
            // 重新加载ToolStripMenuItem
            // 
            this.重新加载ToolStripMenuItem.Name = "重新加载ToolStripMenuItem";
            this.重新加载ToolStripMenuItem.Size = new System.Drawing.Size(138, 24);
            this.重新加载ToolStripMenuItem.Text = "全部加载";
            this.重新加载ToolStripMenuItem.Click += new System.EventHandler(this.重新加载ToolStripMenuItem_Click);
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.DefaultExt = "json";
            this.openFileDialog1.Filter = "设备信息文件|*.json|所有文件|*.*";
            this.openFileDialog1.Title = "设备文件选择";
            // 
            // 全部启用ToolStripMenuItem
            // 
            this.全部启用ToolStripMenuItem.Name = "全部启用ToolStripMenuItem";
            this.全部启用ToolStripMenuItem.Size = new System.Drawing.Size(152, 24);
            this.全部启用ToolStripMenuItem.Text = "全部启用";
            this.全部启用ToolStripMenuItem.Click += new System.EventHandler(this.全部启用ToolStripMenuItem_Click);
            // 
            // 全部停用ToolStripMenuItem
            // 
            this.全部停用ToolStripMenuItem.Name = "全部停用ToolStripMenuItem";
            this.全部停用ToolStripMenuItem.Size = new System.Drawing.Size(138, 24);
            this.全部停用ToolStripMenuItem.Text = "全部停用";
            this.全部停用ToolStripMenuItem.Click += new System.EventHandler(this.全部停用ToolStripMenuItem_Click);
            // 
            // toolStripMenuItem3
            // 
            this.toolStripMenuItem3.Name = "toolStripMenuItem3";
            this.toolStripMenuItem3.Size = new System.Drawing.Size(138, 24);
            this.toolStripMenuItem3.Text = "撤防停用";
            this.toolStripMenuItem3.Click += new System.EventHandler(this.toolStripMenuItem3_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.tbDevice);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.groupBox1.Location = new System.Drawing.Point(0, 348);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(650, 263);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "设备操作信息";
            // 
            // tbDevice
            // 
            this.tbDevice.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbDevice.Location = new System.Drawing.Point(3, 21);
            this.tbDevice.Multiline = true;
            this.tbDevice.Name = "tbDevice";
            this.tbDevice.ReadOnly = true;
            this.tbDevice.Size = new System.Drawing.Size(644, 239);
            this.tbDevice.TabIndex = 2;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.tbData);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.groupBox2.Location = new System.Drawing.Point(0, 0);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(650, 348);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "数据接收信息";
            // 
            // tbData
            // 
            this.tbData.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tbData.Location = new System.Drawing.Point(3, 21);
            this.tbData.Multiline = true;
            this.tbData.Name = "tbData";
            this.tbData.ReadOnly = true;
            this.tbData.Size = new System.Drawing.Size(644, 324);
            this.tbData.TabIndex = 3;
            // 
            // main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(980, 611);
            this.Controls.Add(this.splitContainer1);
            this.MaximizeBox = false;
            this.Name = "main";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "智旅信息车辆抓拍设备监测平台";
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.contextMenuStrip1.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem2;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem4;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem 重新加载ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 设备信息ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 布防监听ToolStripMenuItem;
        private System.Windows.Forms.ListBox ListboxDeviceInfo;
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.ToolStripMenuItem 全部启用ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem3;
        private System.Windows.Forms.ToolStripMenuItem 全部停用ToolStripMenuItem;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox tbDevice;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox tbData;
    }
}

