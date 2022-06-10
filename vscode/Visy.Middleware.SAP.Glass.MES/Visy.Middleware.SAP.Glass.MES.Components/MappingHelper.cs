using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.SAP.Glass.MES.Components
{
   
    public class MappingHelper
    {

        public static string GetTPLNRValue(string id) {

            //System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.MES.PlantId: " + id);
            if (id.Length > 3) {
                string substr = id.Trim().Substring(0, 4);
                string str = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(substr, "SAP.Glass.MES.PlantId");
                //System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.MES.PlantId: " + str);
                return (str == substr) ? string.Empty : id.Replace(substr, str);
            }
            else
                return string.Empty;

        }

        public static string GetTPLMAValue(string id)
        {

            //System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.MES.PlantId: " + id);
            if (id.Length > 3)
            {
                string substr = id.Trim().Substring(0, 4);
                string str = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(substr, "SAP.Glass.MES.PlantId");
                //System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.MES.PlantId: " + str);
                return (str == substr) ? string.Empty : id.Replace(substr, str);
            }
            else
                return string.Empty;

        }

        public static string GetPOSNR(string val)
        {          
            return !string.IsNullOrEmpty(val) ? val : string.Empty;
        }

        public static string GetARBPL(string val)
        {
            return !string.IsNullOrEmpty(val) ? val : string.Empty;
        }

        public static string GetEmptyString(string val)
        {
            return !string.IsNullOrEmpty(val) ? val : string.Empty;
        }

        public static string GetEmptyString2(string val)
        {
            return !string.IsNullOrEmpty(val) ? val : string.Empty;
        }

        public static string GetActiveValue(string val)
        {         
            if (val.ToUpper() == "X") return "false";
            if (val.ToUpper() == "") return "true";

            return string.Empty;
        }
    }
}
