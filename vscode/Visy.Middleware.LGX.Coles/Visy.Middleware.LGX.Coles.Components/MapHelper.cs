using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.LGX.Coles.Components
{
    public class MapHelper
    {
      
        public string GetCustomerCode(string key, string interfaceName) {

            string s = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(key, interfaceName);
            return !string.IsNullOrEmpty(s) ? s : "";
        }
    }
}
