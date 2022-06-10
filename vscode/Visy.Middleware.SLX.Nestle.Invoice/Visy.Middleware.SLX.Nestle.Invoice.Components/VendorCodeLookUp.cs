using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.SLX.Nestle.Invoice.Components
{
    [Serializable]
    public class VendorCodeLookup
    {
        public string PlantCode;
        public string ABN;
        public string CustomerCode;
        public string Source;
        public string CustomerName;
        public string Region;
        public string OrderType;
        public string Division;
        public string Distribution;
        public string VendorCode;
    }
}
