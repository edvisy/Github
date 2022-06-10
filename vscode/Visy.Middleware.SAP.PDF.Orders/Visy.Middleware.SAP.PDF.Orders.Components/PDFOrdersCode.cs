using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.SAP.PDF.Orders.Components
{
    [Serializable]
    public class PDFOrdersCode
    {
        public string CustomerNumber;
        public string CustomerName;
        public string EmailAddress;
        public string PlantCode;
        public string SoldToCode;
        public bool UseVisyMaterialId;
    }
}
