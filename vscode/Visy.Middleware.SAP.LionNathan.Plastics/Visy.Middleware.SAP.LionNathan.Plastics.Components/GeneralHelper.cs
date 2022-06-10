using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;

namespace Visy.Middleware.SAP.LionNathan.Plastics.Components
{
    public class GeneralHelper
    {
        public static string GetAppSettings(string key)
        {
            try
            {
                string sValue = string.Empty;

                sValue = ConfigurationManager.AppSettings[key].ToString();

                System.Diagnostics.Trace.WriteLine(String.Format("GetAppSettings Key: {0} Value: {1}", key, sValue));

                return sValue;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Failed to perform GeneralHelper.GetAppSettings because - {0}", ex.Message), ex.InnerException);
            }
        }
    }
}
