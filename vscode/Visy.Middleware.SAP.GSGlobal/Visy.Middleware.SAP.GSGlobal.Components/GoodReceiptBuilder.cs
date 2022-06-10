using System;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using Microsoft.XLANGs.BaseTypes;

namespace Visy.Middleware.SAP.GSGlobal.Components
{
    public class GoodsReceiptBuilder : BaseComponent
    {
        //private readonly Order order;
        private readonly MultiPOASN multiPOASN;
        public GoodsReceiptBuilder(XLANGMessage inmsg)
        {
            multiPOASN = Deserialize<MultiPOASN>(inmsg);

        }


        public XmlDocument CountOrders()
        {
            List<string> listPO = new List<string>();
            Dictionary<string, string> tempDictionary = new Dictionary<string, string>();

            foreach (MultiPOASNDetail line in multiPOASN.Detail)
            {
                listPO.Add(line.VisyPO);
            }

            listPO.Sort();

            System.Diagnostics.Trace.WriteLine("DEBUG: Count" + listPO.Count);

            string value = string.Empty;

            foreach (string s in listPO)
            {
                if (!tempDictionary.TryGetValue(s, out value))
                {
                    tempDictionary.Add(s, s);
                }
            }

            string[] poArray = new string[tempDictionary.Count];

            int IndexKey = 0;
            foreach (KeyValuePair<string, string> kvp in tempDictionary)
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
            SinglePOASN singlePOASN = new SinglePOASN();
            List<SinglePOASNDetail> items = new List<SinglePOASNDetail>();

            singlePOASN.PONo = visyPO;
            items = PopulateItems(multiPOASN, visyPO);

            singlePOASN.Detail = items.ToArray();

            return Serialize(singlePOASN);
        }




        private List<SinglePOASNDetail> PopulateItems(MultiPOASN multiPOASN, string visyPO)
        {
            System.Diagnostics.Trace.WriteLine("DEBUG visyPO " + visyPO);

            List<SinglePOASNDetail> items = new List<SinglePOASNDetail>();
            List<SinglePOASNDetailBatchItem> batches = new List<SinglePOASNDetailBatchItem>();

            
            String POSEX = "";
            foreach (MultiPOASNDetail line in multiPOASN.Detail)
            {
                System.Diagnostics.Trace.WriteLine("DEBUG inside populateitem loop current VisyPONumber " + GetPO(line.VisyPO).Trim());
                SinglePOASNDetailBatchItem batch = new SinglePOASNDetailBatchItem();

                if (GetPO(line.VisyPO).Trim() == visyPO.Trim())
                {
                    System.Diagnostics.Trace.WriteLine("SDEBUG inside populateitem SUCCESS");
                    batch.LineNo = line.VisyPOEntNo;
                    batch.ProductCode = line.ProductCode;
                    batch.InvoiceNo = line.InvoiceNo;
                    batch.FileNo = line.FileNo;
                    batch.InspectionNo = line.InspectionNo;
                    batch.PackageNo = line.PackageNo;
                    batch.Temper = line.Temper;
                    batch.Size = line.Size;
                    batch.Coating = line.Coating;
                    batch.Footage = line.Footage;
                    batch.NetWeight = line.NetWeight;
                    batch.GrossWeight = line.GrossWeight;
                    batch.ETD = line.ETD;
                    batch.ETA = line.ETA;
                    batch.Vessel = line.Vessel;
                    batch.DestinationPort = line.DestinationPort;
                    batches.Add(batch);
                }
            }

            batches.Sort(delegate(SinglePOASNDetailBatchItem batch1, SinglePOASNDetailBatchItem batch2) { return batch1.LineNo.CompareTo(batch2.LineNo); });

            int count = 0;
            int itemNo = 0;
            string currentPOSEX = "";
            int innerCount = 0;
            SinglePOASNDetail item = new SinglePOASNDetail();
            batches.ForEach(delegate(SinglePOASNDetailBatchItem batch)
            {
                //GoodsReceiptItem item = new GoodsReceiptItem();
                if (count == 0)
                {
                    item.VisyPOEntNo = batch.LineNo;
                    currentPOSEX = batch.LineNo;
                    batches.ForEach(delegate(SinglePOASNDetailBatchItem innerBatch)
                    {
                        if (currentPOSEX.Equals(innerBatch.LineNo))
                            innerCount++;
                    });
                    item.CreateBatch(innerCount);
                    item.BatchItem[itemNo] = batch;
                }
                else
                {
                    // Use existing item
                    if (currentPOSEX.Equals(batch.LineNo))
                    {
                        itemNo++;
                        item.BatchItem[itemNo] = batch;
                    }
                    // Use new item
                    else
                    {
                        item = new SinglePOASNDetail();
                        item.VisyPOEntNo = batch.LineNo;
                        currentPOSEX = batch.LineNo;
                        innerCount = 0;
                        itemNo = 0;
                        foreach (SinglePOASNDetailBatchItem innerBatch in batches)
                        {
                            if (currentPOSEX.Equals(innerBatch.LineNo))
                                innerCount++;
                        }
                        item.CreateBatch(innerCount);
                        item.BatchItem[itemNo] = batch;
                    }


                }
                count++;
                if (itemNo + 1 == innerCount)
                    items.Add(item);


            });
            return items;

        }



        #region private methods

        private bool FindPOSEX(SinglePOASNDetail item, SinglePOASNDetailBatchItem batch)
        {
            foreach (SinglePOASNDetailBatchItem search in item.BatchItem)
            {
                if (search.LineNo.Equals(batch.LineNo))
                    return true;
            }
            return false;
        }



        private string GetPO(string param)
        {
            StringBuilder sBuild = new StringBuilder(param);
            sBuild.Replace("P/O# ", "");
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
            d = param.Substring(0, param.IndexOf("-"));
            temp = param.Substring(param.IndexOf("-") + 1);
            m = temp.Substring(0, temp.IndexOf("-"));
            y = "20" + temp.Substring(temp.IndexOf("-") + 1);
            m = m.ToUpper();
            switch (m)
            {
                case "JAN": MM = "01"; break;
                case "FEB": MM = "02"; break;
                case "MAR": MM = "03"; break;
                case "APR": MM = "04"; break;
                case "MAY": MM = "05"; break;
                case "JUN": MM = "06"; break;
                case "JUL": MM = "07"; break;
                case "AUG": MM = "08"; break;
                case "SEP": MM = "09"; break;
                case "OCT": MM = "10"; break;
                case "NOV": MM = "11"; break;
                case "DEC": MM = "12"; break;

            }

            return y + MM + d;
        }
        #endregion
    }

}
