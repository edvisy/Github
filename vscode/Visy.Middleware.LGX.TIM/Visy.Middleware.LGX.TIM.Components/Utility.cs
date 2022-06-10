using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace Visy.Middleware.LGX.TIM.Components
{
    public class Utility
    {
        public static void WriteEventLog(string Message, string ErrorType)
        {
            if (!EventLog.SourceExists(""))
            {
                EventLog m_EventLog = new EventLog("");
                m_EventLog.Source = "Visy.Middleware.LGX.TIM.Components";
                //m_EventLog.WriteEntry("This", "This");
                if (ErrorType == "Error")
                {
                    m_EventLog.WriteEntry(Message, EventLogEntryType.Error);
                }
                else if (ErrorType == "Information")
                {
                    m_EventLog.WriteEntry(Message, EventLogEntryType.Information);
                }
                else if (ErrorType == "FailureAudit")
                {
                    m_EventLog.WriteEntry(Message, EventLogEntryType.FailureAudit);
                }
                else if (ErrorType == "SuccessAudit")
                {
                    m_EventLog.WriteEntry(Message, EventLogEntryType.SuccessAudit);
                }
                else if (ErrorType == "Warning")
                {
                    m_EventLog.WriteEntry(Message, EventLogEntryType.Warning);
                }
            }
        }

    }
}
