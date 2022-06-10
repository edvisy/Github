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

namespace Visy.Middleware.SAP.Glass.Lion.Components
{
    public static class HttpPostHelper
    {
        const string INTERFACE_NAME = "SAP.Glass.Lion";

        public static string HttpPost(XLANGMessage cxml)
        {
            //biztalk http adapter is failing when ariba is sending invalid http response encoding. This is the alternative solution
            var api = DataLookup.GetInterfaceLookupData("httpurl", INTERFACE_NAME); 

            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.Lion->API String: " + api);
            var client = new RestClient(api);
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);           
          
            request.AddHeader("Cookie", "private_content_version=d55d560d2f0467701861f217e3d1302a; mage-messages=%5B%7B%22type%22%3A%22error%22%2C%22text%22%3A%22Invalid+Form+Key.+Please+refresh+the+page.%22%7D%2C%7B%22type%22%3A%22error%22%2C%22text%22%3A%22Invalid+Form+Key.+Please+refresh+the+page.%22%7D%5D; PHPSESSID=n1enbv63t8pn3o71h5ljmajp5a");
            request.AddParameter("application/xml", CreateStringFromXLANGMessage(cxml, 0), ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            return response.Content;
        }
        private static string CreateStringFromXLANGMessage(XLANGMessage message, int index)
        {
            string toReturn;

            try
            {

                using (var reader = new StreamReader(message[index].RetrieveAs(typeof(Stream)) as Stream))
                {
                    toReturn = reader.ReadToEnd();
                }
            }
            finally
            {
                // Clean memory 
                message.Dispose();
            }
            //
            return toReturn;
        }

    }


}
