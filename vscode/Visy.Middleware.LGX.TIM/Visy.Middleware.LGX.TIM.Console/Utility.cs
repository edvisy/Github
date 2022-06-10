using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;
using System.Diagnostics;
//using Microsoft.Practices.EnterpriseLibrary.Logging;

namespace Visy.Middleware.LGX.TIM.Console
{
    public class Utility
    {
        public static string ConvertSybaseDateTime(string source)
        {
            string output = String.Empty;
            DateTime sourceDate;

            if (DateTime.TryParse(source, out sourceDate))
            {               
                output = sourceDate.ToString(new DateTimeFormatInfo().SortableDateTimePattern);
            }

            return output;
        }

        public static string ReplaceEscapeCharacter(String EscapeXML)
        {
            string strEscapeXML = string.Empty;
            if (EscapeXML != null)
            {
                strEscapeXML = EscapeXML.Replace("&", "&amp;");
                strEscapeXML = strEscapeXML.Replace("\"", "&quot;");
                strEscapeXML = strEscapeXML.Replace("'", "&apos;");
                strEscapeXML = strEscapeXML.Replace(">", "&gt;");
                strEscapeXML = strEscapeXML.Replace("<", "&lt;");
            }
            else
            {
                strEscapeXML = string.Empty;
            }
            return strEscapeXML;
        }

        public static void LogError(Exception e, string message)
        {
            using (EventLog eventLog = new EventLog("Application"))
            {
                eventLog.Source = "Application";
                eventLog.WriteEntry(message, EventLogEntryType.Error);
            }          
        }

        public static void LogError(Exception e, string format, params object[] args)
        {
            LogError(e, String.Format(format, args));
        }


        public static void LogWarning(string message)
        {
            using (EventLog eventLog = new EventLog("Application"))
            {
                eventLog.Source = "Application";
                eventLog.WriteEntry(message, EventLogEntryType.Warning);
            }
        }

        public static void LogWarning(string format, params object[] args)
        {
            LogWarning(String.Format(format, args));
        }

        public static void LogInfo(string message)
        {
            using (EventLog eventLog = new EventLog("Application"))
            {
                eventLog.Source = "Application";
                eventLog.WriteEntry(message, EventLogEntryType.Information);
            }
        }

        public static void LogInfo(string format, params object[] args)
        {
            LogInfo(String.Format(format, args));
        }


        //private static void LogInternal(string message, TraceEventType eventType, Exception e)
        //{
        //    var logEntry = new LogEntry();
        //    logEntry.EventId = 1;
        //    logEntry.Priority = 1;
        //    if (e == null)
        //        logEntry.Message = message;
        //    else
        //        logEntry.Message = String.Format("{0}:{1}", message, e.Message);
        //    logEntry.Severity = eventType;

        //    if (e != null)
        //    {
        //        var dictionary = new Dictionary<string, object>();
        //        dictionary.Add("Exception", e);

        //        logEntry.ExtendedProperties = dictionary;
        //    }

        //    // Conditionally log the message
        //    if (Logger.ShouldLog(logEntry))
        //        Logger.Write(logEntry);
        //}

    }

}
