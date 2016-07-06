using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// 进行SQL操作的类
/// </summary>
public class MySQL
{


    static string sqlConnectionString = "server=114.55.59.143,1430;database=lscar;uid=sa;pwd=zyzlxxjs" ;
    


    public MySQL()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

 
    public static DataSet ExecProc( string StoreProcName, string[] aParamList, out bool r, out string e)
    {
        r = true;
        e = "";
        DataSet Result = new DataSet();
        try
        {
            using (SqlConnection dc = new SqlConnection(sqlConnectionString))
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

}
