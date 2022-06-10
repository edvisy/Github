using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.EDI.Order.Router.Components
{
    [Serializable]
    public class EDIOrderFactObject
    {
        public string EmailAddress;
        public string InterfaceFolderPath;
        public string CustomerCode;
        public string OutputValue1;
        public string OutputValue2;
        public string Parameter1;
        public string Parameter2;

    }
}
