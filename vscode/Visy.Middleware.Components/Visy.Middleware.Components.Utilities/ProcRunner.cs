using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Visy.Middleware.Components.Utilities
{
    public class ProcRunner
    {
        public static int CallProcRunner(string dbConnString, string procName)
        {

            string sql_conn;
            int return_value = 0;
            SqlParameter[] objParams; 
            sql_conn = dbConnString;

            using (SqlConnection sqlCon = new SqlConnection(sql_conn))
            {
                try
                {
                    sqlCon.Open();
                    objParams = SqlHelperParameterCache.GetSpParameterSet(sql_conn,procName,true);
                    objParams[0].Direction = ParameterDirection.ReturnValue;
                    //SqlDataReader dr = SqlHelper.ExecuteReader(dbConnString, procName, null);
                    DataSet ds = SqlHelper.ExecuteDataset(sql_conn, CommandType.StoredProcedure, procName, objParams);
                    return_value = (int)objParams[0].Value; 
                 }
                catch (Exception ex)
                {
                    return 99;
                }
            }
            return return_value;

        }
    }
}
