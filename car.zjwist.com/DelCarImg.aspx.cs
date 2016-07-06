using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DelCarImg : System.Web.UI.Page
{
    bool sqlexec;
    string sqlresult;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = MySQL.ExecProc("usp_Car_ErrorInfo_GetWithImage", new string[] { }, out sqlexec, out sqlresult).Tables[0];
        BFService.BigFileService bs = new BFService.BigFileService(CarEnum.BigServiceSysID);

        foreach (DataRow dr in dt.Rows)
        {
            try
            {
                string bfidstring = dr["CarImg"].ToString();
                string bfid = bfidstring.Substring(bfidstring.LastIndexOf("/") + 1);

                if (string.IsNullOrEmpty(bs.Delete(bfid)))
                {
                    MySQL.ExecProc("usp_Car_ErrorInfo_ClearImg",
                        new string[] { dr["id"].ToString() },
                        out sqlexec, out sqlresult);
                }
            }
            catch
            {
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DataTable dt = MySQL.ExecProc("usp_Car_EmployeePassInfo_GetWithImage", new string[] { }, out sqlexec, out sqlresult).Tables[0];
        BFService.BigFileService bs = new BFService.BigFileService(CarEnum.BigServiceSysID);

        foreach (DataRow dr in dt.Rows)
        {
            try
            {
                string bfidstring = dr["CarImg"].ToString();
                string bfid = bfidstring.Substring(bfidstring.LastIndexOf("/") + 1);

                if (string.IsNullOrEmpty(bs.Delete(bfid)))
                {
                    MySQL.ExecProc("usp_Car_EmployeePassInfo_ClearImg",
                        new string[] { dr["id"].ToString() },
                        out sqlexec, out sqlresult);
                }
            }
            catch
            {
            }
        }
    }
}