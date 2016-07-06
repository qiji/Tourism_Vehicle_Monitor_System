using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_CarTemp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {
            cbshowtruck.Checked = false;
            GetData();
        }
    }

    private void GetData()
    {

        bool sqlexec;
        string sqlresult;
        DataTable dt = MySQL.ExecProc("usp_Car_SaveTemp_GetALL", new string[] { }, out sqlexec, out sqlresult).Tables[0];

        string FilterStr = "";

        if (!string.IsNullOrEmpty(tbDeviceName.Text))
        {
            FilterStr = "DeviceName='" + tbDeviceName.Text + "'";
        }

        if (!cbshowtruck.Checked)
        {
            if (string.IsNullOrEmpty(FilterStr))
            {
                FilterStr = "CarType <> 72";

            }
            else
            {
                FilterStr += " and cartype <> 72";
            }
        }

        if (!string.IsNullOrEmpty(FilterStr))
        {
            dt.DefaultView.RowFilter = FilterStr;
        }

        if (RadioButtonList1.SelectedValue == "1")
        {
            divlist.Visible = true;
            divgrid.Visible = false;
            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
        }
        else
        {
            divlist.Visible = false;
            divgrid.Visible = true;

            TableRow trtitle = new TableRow();
            TableCell tctitle;
            int i = 0;

            foreach (DataRowView dr in dt.DefaultView)
            {
                tctitle = new TableCell();
                tctitle.Attributes["width"] = "16%";
                tctitle.Text = "<img src='" + dr["carimg"].ToString() + "?width=160' onclick=\"ShowCarImage('" + dr["carimg"].ToString() + "')\"/><br/>"
                    + Convert.ToDateTime(dr["PassTime"]).ToString("yyyy-MM-dd HH:mm:ss") + "<br/>" + dr["carno"].ToString() + "  " + GetCarType(dr["cartype"].ToString()) + "<br/>" 
                    +GetCarColor(dr["carcolor"].ToString())+"  "+ dr["DeviceName"].ToString();

                tctitle.HorizontalAlign = HorizontalAlign.Center;
                tctitle.BorderWidth = 1;
                trtitle.Attributes["padding"] = "50";
                trtitle.Cells.Add(tctitle);


                i++;

                if (i % 6 == 0)
                {
                    tbarea.Rows.Add(trtitle);

                    if (i != dt.Rows.Count)
                    {
                        trtitle = new TableRow();
                    }
                }

                if (i % 6 != 0 && i == dt.Rows.Count)
                {
                    for (int j = 0; j < 6 - i % 6; j++)
                    {
                        tctitle = new TableCell();
                        tctitle.Attributes["width"] = "16%";
                        tctitle.Text = "&nbsp;";
                        tctitle.HorizontalAlign = HorizontalAlign.Center;
                        trtitle.Cells.Add(tctitle);
                    }
                    tbarea.Rows.Add(trtitle);
                }
            }
        }
    }


    protected string GetCarColor(object nocolor)
    {
        return ((CarEnum.CarColor)Convert.ToInt32(nocolor)).ToString();
    }

    protected string GetCarType(object cartype)
    {
        return ((CarEnum.CarType)Convert.ToInt32(cartype)).ToString();
    }

    protected string GetCarDirection(object cardirection)
    {
        return ((CarEnum.CarDirection1)Convert.ToInt32(cardirection)).ToString();
    }


    protected void lbRefresh_Click(object sender, EventArgs e)
    {
        GetData();
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetData();
    }
}