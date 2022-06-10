using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace Visy.Middleware.LGX.TIM.Console
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
