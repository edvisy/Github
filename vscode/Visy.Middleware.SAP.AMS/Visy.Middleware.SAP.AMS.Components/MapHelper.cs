using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.SAP.AMS.Components
{
    public class MapHelper
    {

        private const string LOOKUP_KEY = "LookUpKey";

        public string GetInterfaceLookup(string key, string interfaceName) {

            var s = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(key, interfaceName);
            var dict = new Dictionary<string, string>();
            dict.Add(Visy.Middleware.Components.Utilities.DataLookupHelper.INTERFACE_NAME, interfaceName);
            dict.Add(LOOKUP_KEY, key);
            var bindingInfo = Visy.Middleware.Components.Utilities.DataLookupHelper.GetLookupData(dict).FirstOrDefault(p => p.Key == key).Value;


            if (interfaceName == "SAP.AMS.UOM")
            {

                return string.IsNullOrEmpty(bindingInfo) ? key : bindingInfo;
            }
            else { 
               
                return string.IsNullOrEmpty(bindingInfo) ? "9900" : bindingInfo;
            }

        }
    }
}
