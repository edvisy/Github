using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RestSharp;

namespace Visy.Middleware.SAP.Magento.Components
{

    [Serializable]
    public class PricingAPI
    {

        private const string MagentoAPIDateFormat = "yyyy-MM-dd HH:mm:ss";

        //update  price
        public static string Update(PriceInfo price)        {
            try { 
                var client = new RestClient(price.UpdateAPIUrl);
                var request = new RestRequest(Method.POST);
                request.AddHeader("content-type", "application/x-www-form-urlencoded");
                request.AddHeader("cache-control", "no-cache");

                string criteria = System.Web.HttpUtility.UrlEncode((string.Format(@"{{""customer_code"":""{0}"",""product_sku"":""{1}""}}", price.CustomerCode, price.Product_Sku)))
                    .Replace("%3d", "=");

                string s_tierPrice = string.Empty;
                foreach (string t_price in price.Tier_Price)
                {
                    s_tierPrice += string.Format(@"{{""price"": {0},""qty"": {1}}},", t_price.Split('-')[0], t_price.Split('-')[1]);
                }
                s_tierPrice = s_tierPrice.Remove(s_tierPrice.LastIndexOf(','), 1);


                string newObj = System.Web.HttpUtility.UrlEncode((string.Format(@"{{""customer_code"":""{0}"", ""product_sku"":""{1}"", ""price"":{2},""updated_at"":""{3}"", ""tier_price"":[{4}]}}"
                    , price.CustomerCode, price.Product_Sku, price.Price, DateTime.Now.ToString(MagentoAPIDateFormat), s_tierPrice)))
                    .Replace("%3d", "=");


                string updateParams = string.Format("username={0}&password={1}&safe=true&upsert=true&criteria={2}&newobj={3}", price.UserName, price.Password, criteria, newObj);
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "Pricing Update: " +updateParams);
                request.AddParameter("application/x-www-form-urlencoded", updateParams, ParameterType.RequestBody);

                IRestResponse response = client.Execute(request);
                return response.StatusCode.ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", ex.Message.ToString());
                throw ex;
            }
        }

        //insert price
        public static string Insert(PriceInfo price)
        {
            try
            {
                var client = new RestClient(price.InsertAPIUrl);
                var request = new RestRequest(Method.POST);
                request.AddHeader("content-type", "application/x-www-form-urlencoded");
                request.AddHeader("cache-control", "no-cache");

                string s_tierPrice = string.Empty;
                if (price.Tier_Price != null)
                {
                    foreach (string t_price in price.Tier_Price)
                    {
                        s_tierPrice += string.Format(@"{{""price"": {0},""qty"": {1}}},", t_price.Split('-')[0], t_price.Split('-')[1]);
                    }
                    s_tierPrice = s_tierPrice.Remove(s_tierPrice.LastIndexOf(','), 1);
                }

                string docs = System.Web.HttpUtility.UrlEncode((string.Format(@"{{""customer_code"":""{0}"", ""product_sku"":""{1}"", ""price"":{2},""updated_at"":""{3}"", ""tier_price"":[{4}]}}"
                    , price.CustomerCode, price.Product_Sku, price.Price, DateTime.Now.ToString(MagentoAPIDateFormat), s_tierPrice)))
                    .Replace("%3d", "=");

                string insertParams = string.Format("username={0}&password={1}&safe=true&upsert=true&docs={2}", price.UserName, price.Password, docs);
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "Pricing Insert: " + insertParams);
                request.AddParameter("application/x-www-form-urlencoded", insertParams, ParameterType.RequestBody);
                IRestResponse responseInsert = client.Execute(request);
                return responseInsert.StatusCode.ToString();
            }
            catch (Exception ex) {
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", ex.Message.ToString());
                throw ex;
            }          
        }

        //delete price 
        public static string Delete(PriceInfo price)
        {
            try { 

            var client = new RestClient(price.DeleteAPIUrl);
            var request = new RestRequest(Method.POST);
            request.AddHeader("content-type", "application/x-www-form-urlencoded");
            request.AddHeader("cache-control", "no-cache");

            string criteria = System.Web.HttpUtility.UrlEncode((string.Format(@"criteria={{""customer_code"":""{0}"",""product_sku"":""{1}""}}", price.CustomerCode, price.Product_Sku)))
                .Replace("%3d", "=");

            string deleteParams = string.Format("username={0}&password={1}&{2}&safe=true", price.UserName, price.Password, criteria);
            System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "Pricing Delete: " + deleteParams);

            request.AddParameter("application/x-www-form-urlencoded", deleteParams, ParameterType.RequestBody);
            IRestResponse responseDelete = client.Execute(request);


            return responseDelete.StatusCode.ToString();
            }
            catch (Exception ex)
            {
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", ex.Message.ToString());
                throw ex;
            }
        }
    }

    [Serializable]
    public class PriceInfo : ConnectionInfo {

        public string Product_Sku;
        public string Price;
        public string[] Tier_Price;
    }
}
