using System;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using Microsoft.XLANGs.BaseTypes;


namespace Visy.Middleware.SAP.NipponSteel.Components
{
    public class GoodsReceiptBuilder: BaseComponent
    {
        private readonly Order order;

        public GoodsReceiptBuilder(XLANGMessage inmsg)
        {
            order = Deserialize<Order>(inmsg);

        }

       
        public XmlDocument CountOrders()
        {
            List<string> listPO = new List<string>();
            Dictionary<string, string> tempDictionary = new Dictionary<string,string>();
            
            foreach(OrderOrderLine line in order.OrderLine)
            {
                listPO.Add(line.CustomerCtrl);
            }
            
            listPO.Sort();

            System.Diagnostics.Trace.WriteLine("DEBUG: Count" + listPO.Count);

            string value = string.Empty;
            
            foreach (string s in listPO)
            {
              if(!tempDictionary.TryGetValue(s,out value))
              {
                  tempDictionary.Add(s,s);
              }
            }

            string[] poArray = new string[tempDictionary.Count];

            int IndexKey =0;
            foreach (KeyValuePair<string , string> kvp in tempDictionary)
            {
                System.Diagnostics.Trace.WriteLine("DEBUG: And  PO# are " + kvp.Value);
                poArray[IndexKey] = GetPO(kvp.Value);
                IndexKey++;
            }

            return Serialize(poArray);

        }

        public XmlDocument GetOrder(string visyPO)
        {
          
            CountOrders();

            GoodsReceipt goodsReceipt = new GoodsReceipt();
            GoodsReceiptHeader header = new GoodsReceiptHeader();
            List<GoodsReceiptItem> items = new List<GoodsReceiptItem>();
            
            header = PopulateHeader(order,visyPO);
            items = PopulateItems(order, visyPO);

            goodsReceipt.Header = header;
            goodsReceipt.Item = items.ToArray();

            return Serialize(goodsReceipt);
        }




        private List<GoodsReceiptItem> PopulateItems(Order order,string visyPO )
        {
            System.Diagnostics.Trace.WriteLine("DEBUG visyPO " + visyPO);

 	        List<GoodsReceiptItem> items = new List<GoodsReceiptItem>();
            List<GoodsReceiptItemBatch> batches = new List<GoodsReceiptItemBatch>();
            String POSEX ="";
            foreach(OrderOrderLine line in order.OrderLine)
            {
                System.Diagnostics.Trace.WriteLine("DEBUG inside populateitem loop current VisyPONumber " + GetPO(line.CustomerCtrl).Trim());
                GoodsReceiptItemBatch batch = new GoodsReceiptItemBatch();

                if (GetPO(line.CustomerCtrl).Trim() == visyPO.Trim())
                {
                    System.Diagnostics.Trace.WriteLine("SDEBUG inside populateitem SUCCESS");
                    batch.CoilNumber = line.InspectionNo;
                    batch.ItemNumber = line.PONoBody;
                    batch.Quantity = line.NetMassKG;
                    batch.UOM = "KG";
                    batch.POSEX = line.LineNo;
                        
                   
                    batches.Add(batch);
                }
            }

            batches.Sort(delegate(GoodsReceiptItemBatch batch1, GoodsReceiptItemBatch batch2) { return batch1.POSEX.CompareTo(batch2.POSEX); });

            int count = 0;
            int itemNo = 0;
            string currentPOSEX = "";
            int innerCount = 0;
            GoodsReceiptItem item = new GoodsReceiptItem();
            batches.ForEach(delegate(GoodsReceiptItemBatch batch)
            {     
                //GoodsReceiptItem item = new GoodsReceiptItem();
                if(count == 0)
                {                    
                    item.ItemPOSEX = batch.POSEX;   
                    currentPOSEX = batch.POSEX;                    
                    batches.ForEach(delegate(GoodsReceiptItemBatch innerBatch)
                    {
                        if(currentPOSEX.Equals(innerBatch.POSEX))
                            innerCount++;
                    });
                    item.CreateBatch(innerCount);
                    item.Batch[itemNo] = batch;   
                }
                else
                {   
                    // Use existing item
                    if(currentPOSEX.Equals(batch.POSEX))
                    {
                        itemNo++;
                        item.Batch[itemNo] = batch;
                    }
                    // Use new item
                    else
                    {
                        item = new GoodsReceiptItem();
                        item.ItemPOSEX = batch.POSEX;
                        currentPOSEX = batch.POSEX;
                        innerCount = 0;
                        itemNo = 0;
                        foreach (GoodsReceiptItemBatch innerBatch in batches)
                        {
                            if (currentPOSEX.Equals(innerBatch.POSEX))
                                innerCount++;
                        }
                        item.CreateBatch(innerCount);
                        item.Batch[itemNo] = batch;
                    }
                    

                }
                count++;
                if (itemNo+1 == innerCount)
                    items.Add(item);

                
            });
            return items;

        }


        
        #region private methods

        private bool FindPOSEX(GoodsReceiptItem item, GoodsReceiptItemBatch batch)
        {
            foreach (GoodsReceiptItemBatch search in item.Batch)
            {
                if (search.POSEX.Equals(batch.POSEX))
                    return true;
            }
            return false;
        }

        private GoodsReceiptHeader PopulateHeader(Order order,string visyPO)
        {
            GoodsReceiptHeader headerDetail = new GoodsReceiptHeader();
            foreach (OrderOrderLine line in order.OrderLine)
            {
                if (GetPO(line.CustomerCtrl).Trim() == visyPO.Trim())
                {
                    headerDetail.Name = "NIPPON STEEL CORP. NAGOYA WORKS";
                    headerDetail.DeliveryDate = line.ETAGeelong; //SetDeliveryDate(order.OrderLine[0].ShippingDateFromWorks);
                    headerDetail.PlantCode = "2105";
                    headerDetail.PONumber = visyPO; //GetPO(order.OrderLine[0].VisyPONumber);
                    headerDetail.VendorNumber = "114312";
                    headerDetail.VoyageNumber = line.VessselName + line.VoyageNo; //order.OrderLine[0].VoyageNumber;
                    break;
                }
            }
            return headerDetail;
        }
        
        private string GetPO(string param)
        {
            StringBuilder sBuild = new StringBuilder(param);
            sBuild.Replace("PO NO.", "");
            System.Diagnostics.Trace.WriteLine("DEBUG : GetPO" + sBuild.ToString());
            return sBuild.ToString().Trim();
        }

        private string SetDeliveryDate(string param)
        {
            string y = "";
            string m = "";
            string d = "";
            string MM = "";
            string temp = "";
            d = param.Substring(0, param.IndexOf("/"));
            temp = param.Substring(param.IndexOf("/")+1);
            m = temp.Substring(0, temp.IndexOf("/"));
            y = "20" + temp.Substring(temp.IndexOf("/")+1);
            m = m.ToUpper();
            switch(m)
            {
                  case "JAN" : MM = "01"; break;
                  case "FEB" : MM = "02"; break;
                  case "MAR" : MM = "03"; break;
                  case "APR" : MM = "04"; break;
                  case "MAY" : MM = "05"; break;
                  case "JUN" : MM = "06"; break;
                  case "JUL" : MM = "07"; break;
                  case "AUG" : MM = "08"; break;
                  case "SEP" : MM = "09"; break;
                  case "OCT" : MM = "10"; break;
                  case "NOV" : MM = "11"; break;
                  case "DEC" : MM = "12"; break;

            }

            return y+MM+d;
        }
        #endregion
    }
}
