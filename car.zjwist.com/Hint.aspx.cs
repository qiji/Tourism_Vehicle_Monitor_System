using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Hint : System.Web.UI.Page
{
    protected string urlreferrer = "#";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            urlreferrer = Request.UrlReferrer.ToString();

            switch (((WebHint)Session[WebHint.Web_Hint]).Flag)
            {
                case HintFlag.错误:
                    divFlag.InnerText = "×";
                    divFlag.Attributes["class"] = "bigred";
                    divInfo.InnerHtml = "<span class=\"wrong\">" + ((WebHint)Session[WebHint.Web_Hint]).Hintmsg + "</span>";
                    divBack.InnerHtml = "3秒后，系统将自动跳转到原来的页面<br>如果系统未跳转请<a href=\"javascript:void(0);\" onclick=\"window.history.back()\">点击这里</a>";
                    break;
                case HintFlag.跳转:
                    urlreferrer = ((WebHint)Session[WebHint.Web_Hint]).Url;
                    divFlag.InnerText = "√";
                    divFlag.Attributes["class"] = "biggreen";
                    divInfo.InnerHtml = "<span class=\"right\">" + ((WebHint)Session[WebHint.Web_Hint]).Hintmsg + "</span>";
                    divBack.InnerHtml = "3秒后，系统将自动跳转到原来的页面<br>如果系统未跳转请<a href=\"" + urlreferrer + " \">点击这里</a>";
                    break;
            }
        }
    }

}