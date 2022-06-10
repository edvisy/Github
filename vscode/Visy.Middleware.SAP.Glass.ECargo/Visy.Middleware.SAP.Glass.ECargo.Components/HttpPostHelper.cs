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

namespace Visy.Middleware.SAP.Glass.ECargo.Components
{
    public static class HttpPostHelper
    {
        const string INTERFACE_NAME = "SAP.Glass.ECargo.APISettings";

        public static string HttpPost(XLANGMessage cxml, string urlType)
        {
            //biztalk http adapter is failing when ariba is sending invalid http response encoding. This is the alternative solution
            var api = DataLookup.GetInterfaceLookupData(urlType, INTERFACE_NAME);
            var apiKey = DataLookup.GetInterfaceLookupData("APIKey", INTERFACE_NAME);

            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ECargo->API URL: " + api);
            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ECargo->API Key: " + apiKey);
            try
            {
                var client = new RestClient(api);
                client.Timeout = -1;
                var request = new RestRequest(Method.POST);
                request.AddHeader("x-api-key", apiKey);
                request.AddHeader("Cookie", "private_content_version=d55d560d2f0467701861f217e3d1302a; mage-messages=%5B%7B%22type%22%3A%22error%22%2C%22text%22%3A%22Invalid+Form+Key.+Please+refresh+the+page.%22%7D%2C%7B%22type%22%3A%22error%22%2C%22text%22%3A%22Invalid+Form+Key.+Please+refresh+the+page.%22%7D%5D; PHPSESSID=n1enbv63t8pn3o71h5ljmajp5a");
                request.AddParameter("application/xml", CreateStringFromXLANGMessage(cxml, 0), ParameterType.RequestBody);
                IRestResponse response = client.Execute(request);
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ECargo->Http Response Code: " + response.StatusCode);
               
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ECargo->HttP Status Description: " + response.StatusDescription);

                if (response.StatusCode == 0)
                    System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ECargo->HttP Error Code: " + response.ErrorMessage + response.ErrorException);

                return response.Content;
            }
            catch (Exception ex) {
                return ex.Message.ToString();
            }
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
