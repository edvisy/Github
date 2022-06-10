using System;
using System.Collections.Generic;
using System.Net;
using System.Security.Cryptography;
using System.ServiceModel;
using System.ServiceModel.Channels;
using System.ServiceModel.Description;
using System.ServiceModel.Dispatcher;
using System.Text;
using DataLookup = Visy.Middleware.Components.Utilities.DataLookupHelper;

namespace Visy.Middleware.SAP.Magento2.AdapterBehaviors
{
    public class MagentoBehaviour : IClientMessageInspector, IEndpointBehavior
    {
        private MagentoOAuthToken token_;
        const string INTERFACE_NAME = "SAP.MAGENTO2";
        private void SetOAuthToken()
        {            
            token_ = new MagentoOAuthToken();
            token_.oauth_token = DataLookup.GetInterfaceLookupData("accesstoken", INTERFACE_NAME);
            token_.oauth_token_secret = DataLookup.GetInterfaceLookupData("tokensecret", INTERFACE_NAME);
            token_.oauth_consumer_key = DataLookup.GetInterfaceLookupData("consumerkey", INTERFACE_NAME);
            token_.oauth_consumer_secret = DataLookup.GetInterfaceLookupData("consumersecret", INTERFACE_NAME);

            token_.oauth_version = "1.0";
            token_.oauth_signature_method = "HMAC-SHA1";
            token_.oauth_nonce = Convert.ToBase64String(
            new ASCIIEncoding().GetBytes(
            DateTime.Now.Ticks.ToString()));

            var timeSpan = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            token_.oauth_timestamp = Convert.ToInt64(timeSpan.TotalSeconds).ToString();
        }
        public void AddBindingParameters(ServiceEndpoint endpoint, BindingParameterCollection bindingParameters)
        {
            throw new NotImplementedException();
        }

        public void AfterReceiveReply(ref Message reply, object correlationState)
        {
          
        }

        public void ApplyClientBehavior(ServiceEndpoint endpoint, ClientRuntime clientRuntime)
        {
            clientRuntime.MessageInspectors.Add(this);
        }

        public void ApplyDispatchBehavior(ServiceEndpoint endpoint, EndpointDispatcher endpointDispatcher)
        {
            throw new NotImplementedException();
        }

        public object BeforeSendRequest(ref Message request, IClientChannel channel)
        {
            HttpRequestMessageProperty httpRequest = null;

            if (request.Properties.ContainsKey(HttpRequestMessageProperty.Name))
            {
                httpRequest = request.Properties[HttpRequestMessageProperty.Name] as HttpRequestMessageProperty;
            }

            if (httpRequest == null)
            {
                httpRequest = new HttpRequestMessageProperty()
                {
                    Method = "POST",
                    SuppressEntityBody = true
                };
                request.Properties.Add(HttpRequestMessageProperty.Name, httpRequest);
            }

            WebHeaderCollection headers = httpRequest.Headers;
            SetOAuthToken();

            string url;
            url = (request.Headers).To.OriginalString;

            SortedDictionary<string, string> basestringParameters = new SortedDictionary<string, string>();
            string parametersStr = url.Split('?')[1];
            string[] parameters = parametersStr.Split('&');
            for (int i = 0; i < parameters.Length; i++)
            {

                string[] currentParam = parameters[i].Split('=');
                basestringParameters.Add(currentParam[0], currentParam[1]);
            }

            basestringParameters.Add("oauth_version", token_.oauth_version);
            basestringParameters.Add("oauth_consumer_key", token_.oauth_consumer_key);
            basestringParameters.Add("oauth_nonce", token_.oauth_nonce);
            basestringParameters.Add("oauth_signature_method", token_.oauth_signature_method);
            basestringParameters.Add("oauth_timestamp", token_.oauth_timestamp);
            basestringParameters.Add("oauth_token", token_.oauth_token);

            //Build the signature string
            string baseString = String.Empty;
            if (httpRequest.Method == "GET")
                baseString += "GET" + "&";
            else
                baseString += "POST" + "&";
            baseString += Uri.EscapeDataString(url.Split('?')[0]) + "&";
            foreach (KeyValuePair<string, string> entry in basestringParameters)
            {
                baseString += Uri.EscapeDataString(entry.Key + "=" + entry.Value + "&");
            }

            baseString = baseString.Substring(0, baseString.Length - 3);
            /////

            string signingKey = Uri.EscapeDataString(token_.oauth_consumer_secret) +
            "&" + Uri.EscapeDataString(token_.oauth_token_secret);

            //Sign the request
            HMACSHA1 hasher = new HMACSHA1(new ASCIIEncoding().GetBytes(signingKey));
            string oauthsignature = Convert.ToBase64String(
            hasher.ComputeHash(new ASCIIEncoding().GetBytes(baseString)));

            
            ServicePointManager.Expect100Continue = false;

            //authorization header
            string authorizationHeaderParams = String.Empty;
            authorizationHeaderParams += "OAuth ";
            authorizationHeaderParams += "oauth_nonce=" + "\"" +
            Uri.EscapeDataString(token_.oauth_nonce) + "\",";
            authorizationHeaderParams += "oauth_signature_method=" + "\"" +
            Uri.EscapeDataString(token_.oauth_signature_method) + "\",";
            authorizationHeaderParams += "oauth_timestamp=" + "\"" +
            Uri.EscapeDataString(token_.oauth_timestamp) + "\",";
            authorizationHeaderParams += "oauth_consumer_key=" + "\"" +
            Uri.EscapeDataString(token_.oauth_consumer_key) + "\",";
            authorizationHeaderParams += "oauth_token=" + "\"" +
            Uri.EscapeDataString(token_.oauth_token) + "\",";
            authorizationHeaderParams += "oauth_signature=" + "\"" +
            Uri.EscapeDataString(oauthsignature) + "\",";

            authorizationHeaderParams += "oauth_version=" + "\"" +
                 Uri.EscapeDataString(token_.oauth_version) + "\"";

            headers.Add(HttpRequestHeader.Authorization, authorizationHeaderParams);

            return null;
        }

        public void Validate(ServiceEndpoint endpoint)
        {
            throw new NotImplementedException();
        }
    }

    public class MagentoOAuthToken
    {
        public string oauth_token { get; set; }
        public string oauth_token_secret { get; set; }
        public string oauth_consumer_key { get; set; }
        public string oauth_consumer_secret { get; set; }
        public string oauth_version { get; set; }
        public string oauth_signature_method { get; set; }
        public string oauth_nonce { get; set; }
        public string oauth_timestamp { get; set; }
    }
}
