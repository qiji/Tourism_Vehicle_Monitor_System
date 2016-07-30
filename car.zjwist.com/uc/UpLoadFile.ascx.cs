using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Drawing;
using System.ComponentModel;
using System.IO;

public partial class uc_UpLoadFile : System.Web.UI.UserControl
{

    public delegate void AfterUpLoad(string filename, string originalfilename);

    public event AfterUpLoad OnAfterUpLoad;

    [DefaultValue(false)]
    public bool ShowImage
    {
        get
        {
            if (ViewState["ShowImage"] == null)
            {
                return false;
            }
            else
            {
                return (bool)ViewState["ShowImage"];
            }
        }
        set
        {
            ViewState["ShowImage"] = value;
            ImgShow.Visible = ((bool)ViewState["ShowImage"] && !string.IsNullOrEmpty(HFID.Value));
        }
    }

    /// <summary>
    /// 保存在云端OSS，还是在服务器上
    /// 默认为true，保存在OSS上
    /// </summary>
    [DefaultValue(true)]
    public bool IsSaveToOSS
    {
        get
        {
            if (ViewState["IsSaveToOSS"] == null)
            {
                return false;
            }
            else
            {
                return (bool)ViewState["IsSaveToOSS"];
            }
        }
        set
        {
            ViewState["IsSaveToOSS"] = value;
        }
    }



    [DefaultValue(0)]
    public int ImgWidth
    {
        get
        {

            return ViewState["ImgWidth"] == null ? 0 : (int)ViewState["ImgWidth"];
        }
        set
        {
            ViewState["ImgWidth"] = value;
        }
    }

    [DefaultValue(0)]
    public int ImgHeight
    {
        get
        {
            return ViewState["ImgHeight"] == null ? 0 : (int)ViewState["ImgHeight"];
        }
        set
        {
            ViewState["ImgHeight"] = value;
        }
    }

    public int ShowWidth
    {
        get
        {
            return (int)ViewState["ShowWidth"];
        }
        set
        {
            ViewState["ShowWidth"] = value;
            ImgShow.Width = value;
        }
    }

    string upLoadPath = "../UpLoadFile/";

    /// <summary>
    /// 文件名
    /// </summary>
    public string FileName
    {
        get
        {
            return HFID.Value;
        }
        set
        {
            HFID.Value = value;
            if (HFID.Value.Trim() == "")
            {
                divView.Visible = false;
                FileView.NavigateUrl = "";

            }
            else
            {
                divView.Visible = true;
                if (ShowImage)
                {
                    if (IsSaveToOSS)
                    {
                        ImgShow.ImageUrl = HFID.Value;
                    }
                    else
                    {
                        ImgShow.ImageUrl = upLoadPath + HFID.Value;
                    }
                    ImgShow.Visible = true;
                }
                if (IsSaveToOSS)
                {
                    FileView.NavigateUrl = HFID.Value;
                }
                else
                {
                    FileView.NavigateUrl = upLoadPath + HFID.Value;
                }
            }
        }

    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lb.Text = "";
        }
    }

    protected void btnUpLoad_Click(object sender, EventArgs e)
    {


        if (!fp.HasFile)
        {
            lb.Text = "请先选择文件";
            return;
        }

        string fileurl = "";

        if (IsSaveToOSS)
        {
            BFService.BFResult bfresult;

            BFService.BigFileService bs = new BFService.BigFileService(CarEnum.BigServiceSysID);
            if (ImgWidth == 0 || ImgHeight == 0)
            {
                bfresult = bs.UpLoadALL(HFID.Value, fp.FileName, fp.PostedFile.ContentType.ToString(), fp.FileBytes);
            }
            else
            {
                bfresult = bs.UpLoadALL(HFID.Value, fp.FileName, fp.PostedFile.ContentType.ToString(), fp.FileBytes, ImgWidth.ToString(), ImgHeight.ToString());
            }

            if (bfresult.code == 0)
            {
                //失败！
                lb.ForeColor = Color.Red;
                lb.Text = bfresult.message;
                return;
            }
            else
            {

                fileurl = "http://big.tourzj.com/bfinfo/GetFile/" + bfresult.message;
                HFID.Value = fileurl;
                FileView.NavigateUrl = fileurl;

            }
        }
        else
        {
            string date = DateTime.Now.ToString("yyMMdd");
            string newPath = Server.MapPath(upLoadPath + date + "/");

            if (!Directory.Exists(newPath))
            {
                System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(newPath);
                di.Create();
            }

            string fnOrg = date + "/" + Guid.NewGuid().ToString() + fp.FileName.Substring(fp.FileName.LastIndexOf("."));


            fp.SaveAs(Server.MapPath(upLoadPath) + fnOrg);

            HFID.Value = fnOrg;
            fileurl = upLoadPath + fnOrg;
            FileView.NavigateUrl = fileurl;
        }

        lb.Text = "上传成功";
        lb.ForeColor = Color.Black;



        if (ShowImage)
        {
            ImgShow.ImageUrl = FileView.NavigateUrl;
            ImgShow.Visible = true;
        }
        else
        {
            ImgShow.Visible = false;
        }
        divView.Visible = true;
        //获得文件名，并且传递给调用的窗口
        if (OnAfterUpLoad != null)
        {
            OnAfterUpLoad(fileurl, fp.FileName);
        }

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DeleteFile();
    }

    public bool DeleteFile()
    {
        if (IsSaveToOSS)
        {
            string bfid = HFID.Value.Substring(HFID.Value.LastIndexOf("/") + 1);
            new BFService.BigFileService(CarEnum.BigServiceSysID).Delete(bfid);
            return true;
        }
        else
        {
            if (HFID.Value != "")
            {

                System.IO.File.Delete(Server.MapPath(upLoadPath + HFID.Value));
                lb.Text = "删除成功!";
                HFID.Value = "";
                FileView.NavigateUrl = "";

                divView.Visible = false;
                ImgShow.ImageUrl = "#";
                ImgShow.Visible = false;

                return true;
            }
            return false;
        }
    }
}