using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace Visy.Middleware.Pipelines.ExcelOrderExtendedToXML
{
    public class OrderExtended
    {
        public SortedList Products = new SortedList();

        public string CustomerEAN = string.Empty;
        public string CustomerNumber = string.Empty;
        public string CustomerName = string.Empty;
        public string DeliveryAddressCode = string.Empty;
        public string DeliveryAddress = string.Empty;
        public string Suburb = string.Empty;
        public string Postcode = string.Empty;
        public string Contact = string.Empty;
        public string Phone = string.Empty;
        public string EmailAddress = string.Empty;
        public string PurchaseOrderDate = string.Empty;
        public string PickupMethod = string.Empty;
        public OrderExtended()
        { }

        public void addProduct(string id, Product aProduct)
        {
            Products.Add(id, aProduct);
        }

        public Product getProduct(string id)
        {
            return (Product)Products.GetByIndex(Products.IndexOfKey(id));
        }

    }

    public class Product
    {
        public Product()
        {}

        public string MaterialID = string.Empty;
        public string Quantity = string.Empty;
        public string ProductDescription = string.Empty;
        public string DeliveryDate = string.Empty;
        public string PurchaseOrderNumber = string.Empty;
        public string WareHouseCode = string.Empty;
        public string Comments = string.Empty;
    }
}
