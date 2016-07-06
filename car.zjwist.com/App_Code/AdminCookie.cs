using System;
using System.Collections.Generic;
using System.Web;

// <summary>
//WebUserCookie 的摘要说明
// </summary>
public class AdminCookie
{
    public static string CookierUser = "AdminCookie";

    HttpCookie cookie;
    string cookien;

    public AdminCookie(string cookieName)
    {
        cookie = HttpContext.Current.Request.Cookies[cookieName];
        cookien = cookieName;
    }

    public static void ClearCookie()
    {
        HttpCookie aCookie;
        string cookieName;
        int limit = HttpContext.Current.Request.Cookies.Count;
        for (int i = 0; i < limit; i++)
        {
            cookieName = HttpContext.Current.Request.Cookies[i].Name;
            aCookie = new HttpCookie(cookieName);
            aCookie.Expires = DateTime.Now.AddDays(-1);
            HttpContext.Current.Response.Cookies.Add(aCookie);
        }
    }

    public static void ClearCookie(string CookierName)
    {
        HttpCookie aCookie;
        aCookie = new HttpCookie(CookierName);
        aCookie.Expires = DateTime.Now.AddDays(-1);
        HttpContext.Current.Response.Cookies.Add(aCookie);
    }

    public UserCookieInfo GetCookiesValues()
    {
        //尝试获取Cookies
        UserCookieInfo cookieValue = null;
        if (cookie != null)
        {
            cookieValue = new UserCookieInfo();
            cookieValue.UserName = HttpUtility.UrlDecode(cookie.Values["UserName"]);
            cookieValue.TrueName = HttpUtility.UrlDecode(cookie.Values["TrueName"]);
            cookieValue.UnitID = Convert.ToInt32(HttpUtility.UrlDecode(cookie.Values["UnitID"]));
            cookieValue.UnitType = Convert.ToInt32(HttpUtility.UrlDecode(cookie.Values["UnitType"]));
            cookieValue.UnitName = HttpUtility.UrlDecode(cookie.Values["UnitName"]);
        }
        return cookieValue;
    }

    public void WriteCookies(UserCookieInfo values)
    {
        //创建cookies,写入初始数据
        cookie = new HttpCookie(cookien);
        cookie.Values.Add("UserName", HttpUtility.UrlEncode(values.UserName));
        cookie.Values.Add("TrueName", HttpUtility.UrlEncode(values.TrueName));
        cookie.Values.Add("UnitID", HttpUtility.UrlEncode(values.UnitID.ToString()));
        cookie.Values.Add("UnitType", HttpUtility.UrlEncode(values.UnitType.ToString()));
        cookie.Values.Add("UnitName", HttpUtility.UrlEncode(values.UnitName));
        cookie.Expires = DateTime.Now.AddDays(1);
        HttpContext.Current.Response.Cookies.Add(cookie);
    }
}
public class UserCookieInfo
{
    public UserCookieInfo()
    {

    }

    public UserCookieInfo(string username, string truename, int unitid, int unittype, string unitname)
    {
        UserName = username;
        TrueName = truename;
        UnitID = unitid;
        UnitType = unittype;
        UnitName = unitname;
    }

    public string TrueName { get; set; }
    public string UserName { get; set; }
    public int UnitID { get; set; }
    public int UnitType { get; set; }
    public string UnitName { get; set; }


}
