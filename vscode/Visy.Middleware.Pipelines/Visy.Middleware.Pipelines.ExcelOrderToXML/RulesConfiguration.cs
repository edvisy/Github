using System;
using System.Collections.Generic;
using System.Text;
using System.Data;

namespace Visy.Middleware.Pipelines.ExcelOrderToXML
{
    public class RulesConfiguration
    {
        #region Constructors
        public RulesConfiguration()
        {
            
        }

        public RulesConfiguration(DataSet ds)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            CustomerEAN = dr[0].ToString();
            CustomerCode = dr[1].ToString();            
            WarehouseCodeType = dr[2].ToString();
            WarehouseCodeValue = dr[3].ToString();
            CustomerNameLocation = dr[4].ToString();
            DeliveryAddressCellLocation = dr[5].ToString();
            SuburbLocation = dr[6].ToString();
            PostcodeLocation = dr[7].ToString();
            ContactLocation = dr[8].ToString();
            PhoneLocation = dr[9].ToString();
            EmailLocation = dr[10].ToString();
            PurchaseOrderDateLocation = dr[11].ToString();
            PurchaseOrderDateFormatLayout = dr[12].ToString();
            PurchaseOrderDateDelimeter = dr[13].ToString();
            PickupMethod = dr[14].ToString();
            ProductIDStartLocation = dr[15].ToString();
            ProductIDENDIdentifier = dr[16].ToString();
            ProductIDENDIdentifierString = dr[17].ToString();
            ProductDescriptionStartLocation = dr[18].ToString();
            QuantityStartLocation = dr[19].ToString();
            DeliveryDateType = dr[20].ToString();
            DeliveryDateLocation = dr[21].ToString();
            DeliveryDateFormatLayout = dr[22].ToString();
            DeliveryDateFormatDelimeter = dr[23].ToString();
            OrderType = dr[24].ToString();
            PurchaseOrderNumberLocation = dr[25].ToString();
        }
        #endregion

        #region Variables

        public String CustomerEAN = "";
        public String CustomerCode = "";
        public String WarehouseCodeType = "";
        public String WarehouseCodeValue = "";
        public String CustomerNameLocation = "";
        public String DeliveryAddressCellLocation = "";
        public String SuburbLocation = "";
        public String PostcodeLocation = "";
        public String ContactLocation = "";
        public String PhoneLocation = "";
        public String EmailLocation = "";
        public String PurchaseOrderDateLocation = "";
        public String PurchaseOrderDateFormatLayout = "";
        public String PurchaseOrderDateDelimeter = "";
        public String PickupMethod = "";
        public String ProductIDStartLocation = "";
        public String ProductIDENDIdentifier = "";
        public String ProductIDENDIdentifierString = "";
        public String ProductDescriptionStartLocation = "";
        public String QuantityStartLocation = "";
        public String DeliveryDateType = "";
        public String DeliveryDateLocation = "";
        public String DeliveryDateFormatLayout = "";
        public String DeliveryDateFormatDelimeter = "";
        public String OrderType = "";
        public String PurchaseOrderNumberLocation = "";

        #endregion

 
    }
}
