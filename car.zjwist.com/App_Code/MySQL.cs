﻿using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// 进行SQL操作的类
/// </summary>
public class MySQL
{


    public static string DNSTable = "DBCar";


    public MySQL()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 根据DNS信息取得数据集
    /// </summary>
    /// <param name="DNS">WebConfig连接字符串名称</param>
    /// <param name="StoreProcName">存储过程名称</param>
    /// <param name="aParamList">参数数组</param>
    /// <param name="r">返回成功与否</param>
    /// <param name="e">返回错误信息</param>
    /// <returns></returns>
    public static DataSet ExecProcBase(string DNS, string StoreProcName, string[] aParamList, out bool r, out string e)
    {
        r = true;
        e = "";
        DataSet Result = new DataSet();
        try
        {
            using (SqlConnection dc = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings[DNS].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(StoreProcName, dc);
                cmd.CommandType = CommandType.StoredProcedure;
                dc.Open();
                SqlCommandBuilder.DeriveParameters(cmd);
                int ParamCount = aParamList.Length + 1;

                if (cmd.Parameters.Count != ParamCount)
                {
                    e = "输入的参数和存储过程的参数数目不符合";
                    r = false;
                }
                else
                {

                    for (int i = 0; i < aParamList.Length; i++)
                    {
                        cmd.Parameters[i + 1].DbType = DbType.String;
                        if (aParamList[i] == null)
                            cmd.Parameters[i + 1].Value = DBNull.Value;
                        else
                            cmd.Parameters[i + 1].Value = aParamList[i];
                    }

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(Result);

                    if (Result.Tables.Count > 0 && Result.Tables[Result.Tables.Count - 1].Rows.Count > 0)
                    {
                        if (Result.Tables[Result.Tables.Count - 1].Rows[0][0].ToString() == "F")
                        {
                            r = false;
                            if (Result.Tables[Result.Tables.Count - 1].Columns.Count > 1)
                                e = Result.Tables[Result.Tables.Count - 1].Rows[0][1].ToString();
                        }
                        else
                            r = true;
                    }
                    else
                    {
                        r = true;
                    }
                }
            }
        }
        catch (Exception ee)
        {
            e = ee.Message;
            r = false;

        }
        return Result;
    }

    public static DataSet ExecProc(string StoreProcName, string[] aParamList, out bool r, out string e)
    {
        return ExecProcBase(DNSTable, StoreProcName, aParamList, out r, out e);
    }
   
}
