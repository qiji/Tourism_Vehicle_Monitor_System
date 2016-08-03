using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_statcartype : System.Web.UI.Page
{
    

    protected string unitid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Request["ScenicID"]))
        {
            unitid = CookierManage.CookierAPI<UserCookieInfo>.GetCookierObject(UserCookieInfo.UserCookierName).UnitID.ToString();
        }
        else
        {
            unitid = Request["ScenicID"];
        }




    }


    

 



    protected string GetCarType(object cartype)
    {
        return ((CarEnum.CarType)Convert.ToInt32(cartype)).ToString();
    }

}