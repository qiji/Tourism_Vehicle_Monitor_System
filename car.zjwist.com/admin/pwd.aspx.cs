using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_pwd : System.Web.UI.Page
{
    UserCookieInfo uc;
    bool sqlexec;
    string sqlresult;

    protected void Page_Load(object sender, EventArgs e)
    {
        uc = new AdminCookie(AdminCookie.CookierUser).GetCookiesValues();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        MySQL.ExecProc("usp_Sys_UserInfo_ModifyPwd",
            new string[] { uc.UserName, tbOldPwd.Text, tbNewPwd.Text },
            out sqlexec, out sqlresult);

        if (sqlexec)
        {
            Session[WebHint.Web_Hint] = new WebHint("密码修改成功！", "Supplier/Welcome.aspx", HintFlag.跳转);
        }
        else
        {
            Session[WebHint.Web_Hint] = new WebHint(sqlresult, "#", HintFlag.错误);
        }
        Response.Redirect(WebHint.HintURL);
    }
}