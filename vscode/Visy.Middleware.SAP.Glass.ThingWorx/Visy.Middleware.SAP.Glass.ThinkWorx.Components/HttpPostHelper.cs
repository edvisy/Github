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

namespace Visy.Middleware.SAP.Glass.ThingWorx.Components
{
    public static class HttpPostHelper
    {
        const string INTERFACE_NAME = "SAP.Glass.ThingWorx";

        public static void HttpPost(XLANGMessage cxml)
        {
            //biztalk http adapter is failing when ariba is sending invalid http response encoding. This is the alternative solution
            var api = DataLookup.GetInterfaceLookupData("httpurl", INTERFACE_NAME); 

            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ThingWorx->API String: " + api);
            var client = new RestClient(api);
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            
            request.AddHeader("appKey", DataLookup.GetInterfaceLookupData("appKey", INTERFACE_NAME));
            request.AddHeader("Content-Type", "text/xml");
            request.AddParameter("application/xml", CreateStringFromXLANGMessage(cxml, 0), ParameterType.RequestBody);
            IRestResponse response =  client.Execute(request);
            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ThingWorx->HttP Status Code: " + response.StatusCode);
            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ThingWorx->HttP Status Description: " + response.StatusDescription);

            if (response.StatusCode == 0)
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ThingWorx->HttP Error Code: " + response.ErrorMessage + response.ErrorException);

        }

        public static void HttpPostBartender(XLANGMessage cxml)
        {
            //biztalk http adapter is failing when ariba is sending invalid http response encoding. This is the alternative solution
            var api = DataLookup.GetInterfaceLookupData("bartenderhttpurl", INTERFACE_NAME);

            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ThingWorx->API String: " + api);
            var client = new RestClient(api);
            //client.Timeout = -1;
            client.ConfigureWebRequest((r) =>
            {
                r.ServicePoint.Expect100Continue = false;
                r.KeepAlive = false;
            });
            var request = new RestRequest(Method.POST);

            request.AddHeader("appKey", DataLookup.GetInterfaceLookupData("appKey", INTERFACE_NAME));
            request.AddHeader("Content-Type", "text/xml");
            request.AddParameter("application/xml", CreateStringFromXLANGMessage(cxml, 0).Replace("<Command>", "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" +
                    "<Command xmlns:xsi = \"http://www.w3.org/2001/XMLSchema-instance\" xmlns:ns0 =\"http://sap.com/xi/XI/SplitAndMerg\" xsi:noNamespaceSchemaLocation=\"Command.xsd\" >"), ParameterType.RequestBody);
            client.Execute(request);
            //System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ThingWorx->HttP Status Code: " + response.StatusCode);
            //System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ThingWorx->HttP Status Description: " + response.StatusDescription);

            //if (response.StatusCode == 0)
            //    System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Glass.ThingWorx->HttP Error Code: " + response.ErrorMessage + response.ErrorException);

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
