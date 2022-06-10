using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Visy.Middleware.Components.Utilities;

namespace Visy.Middleware.SAP.Glass.ECargo.Components
{
    [Serializable()]
    public class MappingHelper
    {

        private const string LOOKUP_KEY = "LookUpKey";
        private const string INTERFACE_NAME = "InterfaceName";
        public static string GetConsignmentOwner(string vstel) {
            var dict = new Dictionary<string, string>();
            dict.Add(DataLookupHelper.INTERFACE_NAME, "SAP.Glass.ECargo.Consignment");
            dict.Add(LOOKUP_KEY, vstel);
            var bindingInfo = DataLookupHelper.GetLookupData(dict).FirstOrDefault(p => p.Key == vstel).Value;
           
            return string.IsNullOrEmpty(bindingInfo) ? "" : bindingInfo;

        }
    }
}
