using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.SAP.Magento.Components
{
    [Serializable]
    public class ConnectionInfo
    {
        public string UserName;
        public string Password;
        public string CustomerCode;
        public string DeleteAPIUrl;
        public string InsertAPIUrl;
        public string UpdateAPIUrl;
        public string AuthenticationURL;
        public string Action;
    }
}
