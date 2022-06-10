using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace VISY.Middleware.LGX.TIM.ConsoleApp
{
    public class ConnectionInfo
    {
        public static string getConnectionInfo()
        {
            string ConnectionStr = System.Configuration.ConfigurationManager.AppSettings["ConnectionStr"];          
            return ConnectionStr;
        }
    }
}
