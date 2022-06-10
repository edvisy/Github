using Microsoft.XLANGs.BaseTypes;
using RestSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Net;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;
using System.ServiceModel.Dispatcher;
using System.Text;


using DataLookup = Visy.Middleware.Components.Utilities.DataLookupHelper;

namespace Visy.Middleware.SAP.Magento2.Components
{
    public static class oAuthHelper
    {
        const string INTERFACE_NAME = "SAP.MAGENTO2";

        public static string SendToMagento(string calltype, XLANGMessage json, string orderid)
        {
            return Process(calltype, json, orderid);
        }
        public static string SendToMagento(string calltype, XLANGMessage json)
        {
            return Process(calltype, json, string.Empty);
        }

        private static string Process(string calltype, XLANGMessage json, string orderid)
        {

            var api = DataLookup.GetInterfaceLookupData(calltype + "api", INTERFACE_NAME);
            api = api.Contains(":orderid") ? api.Replace(":orderid", orderid) : api;

            var consumer_key = DataLookup.GetInterfaceLookupData("consumerkey", INTERFACE_NAME);
            var consumer_secret = DataLookup.GetInterfaceLookupData("consumersecret", INTERFACE_NAME);
            var access_token = DataLookup.GetInterfaceLookupData("accesstoken", INTERFACE_NAME);
            var token_secret = DataLookup.GetInterfaceLookupData("tokensecret", INTERFACE_NAME);
            var oauth_nonce = Convert.ToBase64String(new ASCIIEncoding().GetBytes(DateTime.Now.Ticks.ToString()));
            var timeSpan = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            var oAuthTimeSpan = Convert.ToInt64(timeSpan.TotalSeconds).ToString();

            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Magento2->API String: " + api);


            SortedDictionary<string, string> basestringParameters = new SortedDictionary<string, string>();

            basestringParameters.Add("oauth_version", "1.0");
            basestringParameters.Add("oauth_consumer_key", consumer_key);
            basestringParameters.Add("oauth_nonce", oauth_nonce);
            basestringParameters.Add("oauth_signature_method", "HMAC-SHA1");
            basestringParameters.Add("oauth_timestamp", oAuthTimeSpan);
            basestringParameters.Add("oauth_token", access_token);

            //Build the signature string
            string baseString = String.Empty;

            baseString += "POST" + "&";
            baseString += Uri.EscapeDataString(api.Split('?')[0]) + "&";

            foreach (KeyValuePair<string, string> entry in basestringParameters)
            {
                baseString += Uri.EscapeDataString(entry.Key + "=" + entry.Value + "&");
            }

            baseString = baseString.Substring(0, baseString.Length - 3);
            /////

            string signingKey = Uri.EscapeDataString(consumer_secret) +
            "&" + Uri.EscapeDataString(token_secret);

            //Sign the request
            HMACSHA1 hasher = new HMACSHA1(new ASCIIEncoding().GetBytes(signingKey));
            string oauthsignature = Convert.ToBase64String(
            hasher.ComputeHash(new ASCIIEncoding().GetBytes(baseString)));
          
            ServicePointManager.Expect100Continue = false;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                   | SecurityProtocolType.Tls11
                   | SecurityProtocolType.Tls12
                   | SecurityProtocolType.Ssl3;

            //authorization header
            string authorizationHeaderParams = String.Empty;
            authorizationHeaderParams += "OAuth ";
            authorizationHeaderParams += "oauth_nonce=" + "\"" +
            Uri.EscapeDataString(oauth_nonce) + "\",";
            authorizationHeaderParams += "oauth_signature_method=" + "\"" +
            Uri.EscapeDataString("HMAC-SHA1") + "\",";
            authorizationHeaderParams += "oauth_timestamp=" + "\"" +
            Uri.EscapeDataString(oAuthTimeSpan) + "\",";
            authorizationHeaderParams += "oauth_consumer_key=" + "\"" +
            Uri.EscapeDataString(consumer_key) + "\",";
            authorizationHeaderParams += "oauth_token=" + "\"" +
            Uri.EscapeDataString(access_token) + "\",";
            authorizationHeaderParams += "oauth_signature=" + "\"" +
            Uri.EscapeDataString(oauthsignature) + "\",";

            authorizationHeaderParams += "oauth_version=" + "\"" +
                 Uri.EscapeDataString("1.0") + "\"";

            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Magento2->API String: " + api);
          
            var client = new RestClient(api);
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            var oAuthStr = string.Format("OAuth oauth_consumer_key=\"{0}\",oauth_token=\"{1}\",oauth_signature_method=\"HMAC-SHA1\" " +
                ",oauth_timestamp=\"{3}\",oauth_nonce=\"{2}\",oauth_version=\"1.0\"," +
                "oauth_signature=\"{4}\"", consumer_key, access_token, oauth_nonce, oAuthTimeSpan, oauthsignature);

            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Magento2->oAuth Header String: " + oAuthStr);
            var jsonString = OrchestrationHelper.CreateStringFromXLANGMessage(json, 0);

            jsonString = calltype=="invoice" || calltype=="shipment" ? jsonString.Replace("comments", "comment") : jsonString;            

            //System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Magento2->JSON String: " + jsonString);

            request.AddHeader("Authorization", oAuthStr);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Cookie", "private_content_version=d55d560d2f0467701861f217e3d1302a; mage-messages=%5B%7B%22type%22%3A%22error%22%2C%22text%22%3A%22Invalid+Form+Key.+Please+refresh+the+page.%22%7D%2C%7B%22type%22%3A%22error%22%2C%22text%22%3A%22Invalid+Form+Key.+Please+refresh+the+page.%22%7D%5D; PHPSESSID=n1enbv63t8pn3o71h5ljmajp5a");
            request.AddParameter("application/json", jsonString, ParameterType.RequestBody);
            
            try {
                IRestResponse response = client.Execute(request);
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Magento2->HTTP Code: " + response.ResponseStatus.ToString());
                if (response.ResponseStatus.ToString() != "Completed")
                    throw new Exception(!string.IsNullOrEmpty(response.ErrorMessage) ? response.ErrorMessage : response.ResponseStatus.ToString());
                return response.Content;
            }
            catch (Exception ex) {
              
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "SAP.Magento2->HTTP Error: " + ex.Message.ToString(), System.Diagnostics.EventLogEntryType.Error);
                throw ex;
            }
           
        }
      
    }


}
