using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;

namespace Visy.Middleware.Components.Utilities
{
    public class AppSettingsReader
    {
        public static string retrieveValue(string key)
        {
            return System.Configuration.ConfigurationManager.AppSettings[key].ToString();
        }
    }
}
