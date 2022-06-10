using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Sybase.Data.AseClient;

namespace Visy.Middleware.LGX.TIM.Console
{
    public class DatabaseInfo
    {
        private static AseConnection conn;
        private AseConnection OpenConnection()
        {
            var connectionString = ConnectionInfo.getConnectionInfo();
            try
            {
                conn = new AseConnection(connectionString);                
                conn.Open();
                return conn;      
            }
            catch (Exception)
            {
                //return null;
                throw;
            }
        }

        public void DisposeCloseConn()
        {
            try
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                    conn.Dispose();
                }
                else if (conn.State == ConnectionState.Closed && conn != null)
                {
                    conn.Dispose();
                }
            }
            catch (Exception)
            {
               throw;
            }
        }


        public DataSet getVendorOrderSync(int tim_process_id, string process_code_2)
        {
            var spOrderSync = System.Configuration.ConfigurationManager.AppSettings["spOrderSync"];
            AseDataAdapter Da;
            //var conn = new AseConnection();
            DataSet DS;
            try
            {
                if (conn == null || conn.State != ConnectionState.Open)
                {
                    conn = OpenConnection();
                }
                var cmd = new AseCommand(spOrderSync, conn) { CommandType = CommandType.StoredProcedure };

                cmd.Parameters.Add(new AseParameter("@tim_vendor_order_id", AseDbType.Numeric) { Value = tim_process_id });
                cmd.Parameters.Add(new AseParameter("@process_code_2", AseDbType.VarChar, 50) { Value = process_code_2 });
                cmd.Parameters.Add(new AseParameter("@debug", AseDbType.Integer) { Value = 0 });
                DS = new DataSet();
                Da = new AseDataAdapter(cmd);
                Da.Fill(DS);
                return DS;

            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                //conn.Close();               
            }
        }
        public DataSet getCreateUpdateCancel(int vendor_order_id)
        {                    
            var sproc = System.Configuration.ConfigurationManager.AppSettings["sproc"];
            AseDataAdapter Da;
            //var conn = new AseConnection();
            DataSet DS;
            try
            {
                if (conn == null || conn.State != ConnectionState.Open)
                {
                    conn = OpenConnection();
                }
                var cmd = new AseCommand(sproc, conn) { CommandType = CommandType.StoredProcedure };

                cmd.Parameters.Add(new AseParameter("@tim_vendor_order_id", AseDbType.Numeric) { Value = vendor_order_id });
                DS = new DataSet();
                Da = new AseDataAdapter(cmd);
                Da.Fill(DS);
                return DS;
            }
            catch (Exception)
            {               
                throw;
            }
            finally
            {
                //conn.Close();               
            }
        }

        public DataSet getTIMProcessDetails(string tim_process_type_code)
        {
            var spTIMProcess = System.Configuration.ConfigurationManager.AppSettings["spTIMProcess"];
            AseDataAdapter daTIMProcess;
            DataSet dsTIMProcess;
            //var conn = new AseConnection();
            try
            {
                if (conn == null || conn.State != ConnectionState.Open)
                {
                    conn = OpenConnection();
                }
                var cmd = new AseCommand(spTIMProcess, conn) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new AseParameter("@tim_process_type_code", AseDbType.VarChar)  { Value = tim_process_type_code });
                dsTIMProcess = new DataSet();
                daTIMProcess = new AseDataAdapter(cmd);
                daTIMProcess.Fill(dsTIMProcess);
                return dsTIMProcess;
            }

            finally
            {
                //conn.Close();
            }
           
        }

        public void UpdateTIMProcessDetails(int tim_process_id, Boolean is_process_succes, string error_message)
        {
            var spTIMProcessUpdate = System.Configuration.ConfigurationManager.AppSettings["spTIMProcessUpdate"];
            int int_is_process_success = 0;
            //var conn = new AseConnection();
            try
            {
                if (conn == null || conn.State != ConnectionState.Open)
                {
                    conn = OpenConnection();
                }
                var cmd = new AseCommand(spTIMProcessUpdate, conn) { CommandType = CommandType.StoredProcedure };
                if (is_process_succes == true)
                {
                    int_is_process_success = 1;
                }
                else
                {
                    int_is_process_success = 0;
                }
                cmd.Parameters.Add(new AseParameter("@tim_process_id", AseDbType.Numeric, 9) { Value = tim_process_id });
                cmd.Parameters.Add(new AseParameter("@is_process_success", AseDbType.Bit) { Value = int_is_process_success });
                cmd.Parameters.Add(new AseParameter("@error_message", AseDbType.VarChar, 254) { Value = error_message });
                cmd.Parameters.Add(new AseParameter("@debug", AseDbType.Integer) { Value = 0 });
                cmd.ExecuteNonQuery();                               
            }

            finally
            {
                //conn.Close();
            }

        }

    }
}
