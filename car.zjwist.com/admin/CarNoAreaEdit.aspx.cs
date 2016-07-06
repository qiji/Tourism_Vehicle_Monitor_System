using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_CarNoAreaEdit : System.Web.UI.Page
{
    string id;
    bool sqlexec;
    string sqlresult;

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request["id"];
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(id))
            {
                btnDelete.Visible = false;
            }
            else
            {
                DataTable dt = MySQL.ExecProc("usp_Sys_CarPlace_GetByid", new string[] { id }, out sqlexec, out sqlresult).Tables[0];
                tbAreaCode.Text = dt.Rows[0]["AreaCode"].ToString();
                tbProvince.Text = dt.Rows[0]["Province"].ToString();
                tbCity.Text = dt.Rows[0]["City"].ToString();
                tbCarNoPre.Text = dt.Rows[0]["CarNoPre"].ToString();
                tbProvinceShort.Text = dt.Rows[0]["ProvinceShort"].ToString();
                tbLat.Text = dt.Rows[0]["Lat"].ToString();
                tbLon.Text = dt.Rows[0]["Lon"].ToString();
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        //@ID int,
        //@AreaCode varchar(100),
        //@Province varchar(100),
        //@City varchar(100),
        //@CarNoPre varchar(10),
        //@ProvinceShort varchar(10)

        MySQL.ExecProc("usp_Sys_CarPlace_Save", new string[] {
            id,
            tbAreaCode.Text,
            tbProvince.Text,
            tbCity.Text,
            tbCarNoPre.Text,
            tbProvinceShort.Text,
            tbLon.Text,
            tbLat.Text
        }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("保存成功", "admin/CarNoArea.aspx", HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("保存失败," + sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {

        MySQL.ExecProc("usp_Sys_CarPlace_Delete", new string[] { id }, out sqlexec, out sqlresult);
        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("删除成功", "admin/CarNoArea.aspx", HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint("删除失败," + sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}