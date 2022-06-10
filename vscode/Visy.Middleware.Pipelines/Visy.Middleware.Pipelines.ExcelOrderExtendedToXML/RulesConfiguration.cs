using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace Visy.Middleware.Pipelines.ExcelOrderExtendedToXML
{
    public class RulesConfiguration
    {
        public string CustomerEAN;
        public string CustomerCode;
        public string WarehouseCodeType;
        public string WarehouseCodeValue;
        public string CustomerNameLocation;
        public string DeliveryAddressCellLocation;
        public string SuburbLocation;
        public string PostcodeLocation;
        public string ContactLocation;
        public string PhoneLocation;
        public string EmailLocation;
        public string PurchaseOrderDateLocation;
        public string PurchaseOrderDateFormatLayout;
        public string PurchaseOrderDateDelimeter;
        public string PickupMethod;
        public string ProductIDStartLocation;
        public string ProductIDENDIdentifier;
        public string ProductIDENDIdentifierString;
        public string ProductDescriptionStartLocation;
        public string QuantityStartLocation;
        public string DeliveryDateType;
        public string DeliveryDateLocation;
        public string DeliveryDateFormatLayout;
        public string DeliveryDateFormatDelimeter;
        public string OrderType;
        public string PurchaseOrderNumberLocation;
        public string CommentsStartLocation;

        public RulesConfiguration()
        {
            this.CustomerEAN = "";
            this.CustomerCode = "";
            this.WarehouseCodeType = "";
            this.WarehouseCodeValue = "";
            this.CustomerNameLocation = "";
            this.DeliveryAddressCellLocation = "";
            this.SuburbLocation = "";
            this.PostcodeLocation = "";
            this.ContactLocation = "";
            this.PhoneLocation = "";
            this.EmailLocation = "";
            this.PurchaseOrderDateLocation = "";
            this.PurchaseOrderDateFormatLayout = "";
            this.PurchaseOrderDateDelimeter = "";
            this.PickupMethod = "";
            this.ProductIDStartLocation = "";
            this.ProductIDENDIdentifier = "";
            this.ProductIDENDIdentifierString = "";
            this.ProductDescriptionStartLocation = "";
            this.QuantityStartLocation = "";
            this.DeliveryDateType = "";
            this.DeliveryDateLocation = "";
            this.DeliveryDateFormatLayout = "";
            this.DeliveryDateFormatDelimeter = "";
            this.OrderType = "";
            this.PurchaseOrderNumberLocation = "";
            this.CommentsStartLocation = "";
           
        }

        public RulesConfiguration(DataSet ds)
        {
            this.CustomerEAN = "";
            this.CustomerCode = "";
            this.WarehouseCodeType = "";
            this.WarehouseCodeValue = "";
            this.CustomerNameLocation = "";
            this.DeliveryAddressCellLocation = "";
            this.SuburbLocation = "";
            this.PostcodeLocation = "";
            this.ContactLocation = "";
            this.PhoneLocation = "";
            this.EmailLocation = "";
            this.PurchaseOrderDateLocation = "";
            this.PurchaseOrderDateFormatLayout = "";
            this.PurchaseOrderDateDelimeter = "";
            this.PickupMethod = "";
            this.ProductIDStartLocation = "";
            this.ProductIDENDIdentifier = "";
            this.ProductIDENDIdentifierString = "";
            this.ProductDescriptionStartLocation = "";
            this.QuantityStartLocation = "";
            this.DeliveryDateType = "";
            this.DeliveryDateLocation = "";
            this.DeliveryDateFormatLayout = "";
            this.DeliveryDateFormatDelimeter = "";
            this.OrderType = "";
            this.PurchaseOrderNumberLocation = "";
            this.CommentsStartLocation = "";
          
            DataRow row = ds.Tables[0].Rows[0];
            this.CustomerEAN = row[0].ToString();
            this.CustomerCode = row[1].ToString();
            this.WarehouseCodeType = row[2].ToString();
            this.WarehouseCodeValue = row[3].ToString();
            this.CustomerNameLocation = row[4].ToString();
            this.DeliveryAddressCellLocation = row[5].ToString();
            this.SuburbLocation = row[6].ToString();
            this.PostcodeLocation = row[7].ToString();
            this.ContactLocation = row[8].ToString();
            this.PhoneLocation = row[9].ToString();
            this.EmailLocation = row[10].ToString();
            this.PurchaseOrderDateLocation = row[11].ToString();
            this.PurchaseOrderDateFormatLayout = row[12].ToString();
            this.PurchaseOrderDateDelimeter = row[13].ToString();
            this.PickupMethod = row[14].ToString();
            this.ProductIDStartLocation = row[15].ToString();
            this.ProductIDENDIdentifier = row[16].ToString();
            this.ProductIDENDIdentifierString = row[17].ToString();
            this.ProductDescriptionStartLocation = row[18].ToString();
            this.QuantityStartLocation = row[19].ToString();
            this.DeliveryDateType = row[20].ToString();
            this.DeliveryDateLocation = row[21].ToString();
            this.DeliveryDateFormatLayout = row[22].ToString();
            this.DeliveryDateFormatDelimeter = row[23].ToString();
            this.OrderType = row[24].ToString();
            this.PurchaseOrderNumberLocation = row[25].ToString();
            this.CommentsStartLocation = row[26].ToString();
        }


    }
}
