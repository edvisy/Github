using System;
using System.Collections.Generic;
using System.Linq;
using Sybase.Data.AseClient;
using System.Text;
using System.Data;
using System.Runtime.InteropServices;
using System.Configuration;
using System.Xml;

namespace VISY.TIM.ConsoleApp
{
    //[DllImport]
    class Program
    {
        public static void Main(string[] args)
        {
            DatabaseInfo DBdata;

            XMLUtility xmlUtil = new XMLUtility();

            DataSet DSCreateUpdateCancel;
            DataSet DSTIMProcess;
            DataSet DSTIMOrderSync;

            int vendor_order_id = 0;

            try
            {
                DBdata = new DatabaseInfo();

                DSTIMProcess = DBdata.getTIMProcessDetails(System.Configuration.ConfigurationManager.AppSettings["ProcessTypeCode"]);

                if (DSTIMProcess.Tables[0].Rows.Count > 0)
                {
                    vendor_order_id = xmlUtil.GenerateXMLTimProcess(DSTIMProcess);
                }

                if (DSTIMProcess.Tables[0].Rows.Count > 0)
                {
                    if (xmlUtil.Process_Code == "DATE_CHANGE")
                    {
                        DSTIMOrderSync = DBdata.getVendorOrderSync(xmlUtil.TIM_Process_ID, xmlUtil.Process_Code_2);
                        xmlUtil.GenerateXMLOrderSync(DSTIMOrderSync);
                        DBdata.UpdateTIMProcessDetails(xmlUtil.TIM_Process_ID, true, null);
                    }
                    else if (xmlUtil.Process_Code != "DATE_CHANGE")
                    {
                        DSCreateUpdateCancel = DBdata.getCreateUpdateCancel(vendor_order_id);
                        xmlUtil.GenerateXMLCreateUpdateCancel(DSCreateUpdateCancel, xmlUtil.Process_Code);
                        DBdata.UpdateTIMProcessDetails(xmlUtil.TIM_Process_ID, true, null);
                    }
                }
            }
            catch (Sybase.Data.AseClient.AseException aseex)
            {
                //Any Sybase connection exception will be caught here and logged to event viewer.The process will gracefully end.
                System.Diagnostics.EventLog.WriteEntry("TIM OUTBOUND", System.String.Format("An exception occurred in TIM Outbound Process.The exception and stack trace is as follows - Exception : {0}, Stack Trace : {1}", aseex.Message, aseex.StackTrace), System.Diagnostics.EventLogEntryType.Error, 1000);
            }
            catch (Exception ex)
            {
                //Log.LogError(ex, "Error calling stored procedure '{0}'", sproc);
                string ExceptionStr = string.Empty;
                if (ex.Message.Length > 253)
                {
                    ExceptionStr = ex.Message.Substring(1, 253);
                }
                else
                {
                    ExceptionStr = ex.Message;
                }
                DatabaseInfo DBdataException = new DatabaseInfo();
                //xmlUtil = new XMLUtility(); Fixed a bug here by commenting this out and declaring and initialising xmlUtil at the parent level.
                DBdataException.UpdateTIMProcessDetails(xmlUtil.TIM_Process_ID, true, ExceptionStr);
                //throw ex; Commented out.This would cause unhandled exception and application crash errors.Instead gracefully log the error and end the process.
                System.Diagnostics.EventLog.WriteEntry("TIM OUTBOUND", System.String.Format("An exception occurred in TIM Outbound Process. TIM Order Id : {0}, TIM Process Id : {1}, TIM Process Type : {2}.The exception and stack trace is as follows - Exception : {3}, Stack Trace : {4}", xmlUtil.Vendor_Order_ID, xmlUtil.TIM_Process_ID, xmlUtil.Process_Code, ex.Message, ex.StackTrace), System.Diagnostics.EventLogEntryType.Error, 1000);
            }
            finally
            {
                DBdata = new DatabaseInfo();
                DBdata.DisposeCloseConn();
            }
        }
    }
}
