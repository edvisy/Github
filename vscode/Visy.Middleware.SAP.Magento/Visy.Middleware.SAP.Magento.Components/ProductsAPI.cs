using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RestSharp;

namespace Visy.Middleware.SAP.Magento.Components
{
    public class ProductsAPI
    {

        private const string MagentoAPIDateFormat = "yyyy-MM-dd HH:mm:ss";
        public static string Insert(ProductInfo productInfo) {
            var client = new RestClient(productInfo.UpdateAPIUrl);
            var request = new RestRequest(Method.POST);
            request.AddHeader("content-type", "application/x-www-form-urlencoded");
            request.AddHeader("cache-control", "no-cache");           

            return "";
        }
    }

    [Serializable]
    public class ProductInfo : ConnectionInfo
    {
        public string sessionId;
        public string type;
        public string set;
        public string sku;
        public string categories;
        public string websites;
        public string name;
        public string description;
        public string short_description;
        public string weight;
        public string status;
        public string url_key;
        public string url_path;
        public string visibility;
        public string category_ids;
        public string website_ids;
        public string has_options;
        public string gift_message_available;
        public string price;
        public string special_price;
        public string special_from_date;
        public string special_to_date;
        public string tax_class_id;
        public List<TierPrice> tier_price;
        public string meta_title;
        public string meta_keyword;
        public string meta_description;
        public string custom_design;
        public string custom_layout_update;
        public string options_container;
        public string additional_attributes;
        public List<StockItem> stock_data;
    }

    [Serializable]
    public class StockItem {

        public string qty;
        public string is_in_stock;
        public string manage_stock;
        public string use_config_manage_stock;
        public string min_qty;
        public string use_config_min_qty;
        public string min_sale_qty;
        public string use_config_min_sale_qty;
        public string max_sale_qty;
        public string use_config_max_sale_qty;
        public string is_qty_decimal;
        public string backorders;
        public string use_config_backorders;
        public string notify_stock_qty;
        public string use_config_notify_stock_qty;
    }

    [Serializable]
    public class TierPrice {
        public string website;
        public string quantity;
        public string price;
    }
}
