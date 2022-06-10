using Microsoft.XLANGs.BaseTypes;
using RestSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;
using System.ServiceModel.Dispatcher;
using System.Text;

using DataLookup = Visy.Middleware.Components.Utilities.DataLookupHelper;

namespace Visy.Middleware.SAP.Lion.Components
{
    public static class OrchestrationHelper
    {
       
        public static bool IsBoagsPO(string poNumber)
        {
            return Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(poNumber, "SAP.Lion.BoagsPO") == "1" ? true : false;
        }
        
    }


}
