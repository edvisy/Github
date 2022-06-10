using System;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using Microsoft.XLANGs.BaseTypes;

namespace Visy.Middleware.SAP.LionNathan.Plastics.Components
{
    [Serializable]
    public class DELFORBuilder : BaseComponent
    {
        //private readonly Order order;
        private readonly VISY visy;

        public DELFORBuilder(XLANGMessage inmsg)
        {
            visy = Deserialize<VISY>(inmsg);
        }


        public XmlDocument CountVISYs()
        {
            List<string> listDELFOR = new List<string>();
            Dictionary<string, string> tempDictionary = new Dictionary<string, string>();

            Detail detail = new Detail();
            Details details = new Details();
            PurchaseOrders purchaseorders = new PurchaseOrders();
            PurchaseOrder purchaseorder = new PurchaseOrder();

            purchaseorders = (PurchaseOrders)visy.Items[2];
            purchaseorder = (PurchaseOrder)purchaseorders.Items[0];
            details = (Details)purchaseorder.Items[2];


            foreach (Detail line in details.Items)
            {
                //listPO.Add(line.AUSPoNumber);
                listDELFOR.Add(line.F1);
            }

            listDELFOR.Sort();

            System.Diagnostics.Trace.WriteLine("DEBUG: Count" + listDELFOR.Count);

            string value = string.Empty;

            foreach (string s in listDELFOR)
            {
                if (!tempDictionary.TryGetValue(s, out value))
                {
                    tempDictionary.Add(s, s);
                }
            }

            string[] delforArray = new string[tempDictionary.Count];

            int IndexKey = 0;
            foreach (KeyValuePair<string, string> kvp in tempDictionary)
            {
                System.Diagnostics.Trace.WriteLine("DEBUG: And  PO# are " + kvp.Value);
                delforArray[IndexKey] = kvp.Value;
                IndexKey++;
            }

            return Serialize(delforArray);

        }

        public XmlDocument GetOrder(string visyPlantCode)
        {
            CountVISYs();
            SingleDELFOR singleDELFOR = new SingleDELFOR();
            //List<SingleDELFORDate> items = new List<SingleDELFORDate>();

            singleDELFOR.PlantCode = visyPlantCode;
            //items = PopulateItems(visy, visyPlantCode);
            singleDELFOR = PopulateItems(visy, visyPlantCode);
            //singleDELFOR.Date = items.ToArray();

            return Serialize(singleDELFOR);
        }


        private SingleDELFOR PopulateItems(VISY visy, string visyPlantCode)
        {
            SingleDELFOR singleDELFOR = new SingleDELFOR();
            SingleDELFORDate[] items = new SingleDELFORDate[1];
            SingleDELFORDateBatchItem[] batches = new SingleDELFORDateBatchItem[500];
            SingleDELFORDate item = new SingleDELFORDate();
            items[0] = new SingleDELFORDate();

            Detail detail = new Detail();
            Headers headers = new Headers();
            Header header = new Header();
            Details details = new Details();
            PurchaseOrders purchaseorders = new PurchaseOrders();
            PurchaseOrder purchaseorder = new PurchaseOrder();

            purchaseorders = (PurchaseOrders)visy.Items[2];
            purchaseorder = (PurchaseOrder)purchaseorders.Items[0];
            details = (Details)purchaseorder.Items[2];
            headers = (Headers)purchaseorder.Items[0];
            header = (Header)headers.Items[0];
            int count = 0;
            string currentPOSEX = string.Empty;

            item.Date1 = ConvertStringDate(header.F1);
            item.Date2 = ConvertStringDate(header.F2);
            item.Date3 = ConvertStringDate(header.F3);
            item.Date4 = ConvertStringDate(header.F4);
            item.Date5 = ConvertStringDate(header.F5);
            item.Date6 = ConvertStringDate(header.F6);
            item.Date7 = ConvertStringDate(header.F7);
            item.Date8 = ConvertStringDate(header.F8);
            item.Date9 = ConvertStringDate(header.F9);
            item.Date10 = ConvertStringDate(header.F10);
            item.Date11 = ConvertStringDate(header.F11);
            item.Date12 = ConvertStringDate(header.F12);
            item.Date13 = ConvertStringDate(header.F13);
            item.Date14 = ConvertStringDate(header.F14);
            item.Date15 = ConvertStringDate(header.F15);
            item.Date16 = ConvertStringDate(header.F16);
            item.Date17 = ConvertStringDate(header.F17);
            item.Date18 = ConvertStringDate(header.F18);
            item.Date19 = ConvertStringDate(header.F19);
            item.Date20 = ConvertStringDate(header.F20);
            item.Date21 = ConvertStringDate(header.F21);
            item.Date22 = ConvertStringDate(header.F22);
            item.Date23 = ConvertStringDate(header.F23);
            item.Date24 = ConvertStringDate(header.F24);
            item.Date25 = ConvertStringDate(header.F25);
            item.Date26 = ConvertStringDate(header.F26);
            item.Date27 = ConvertStringDate(header.F27);
            item.Date28 = ConvertStringDate(header.F28);
            item.Date29 = ConvertStringDate(header.F29);
            item.Date30 = ConvertStringDate(header.F30);
            item.Date31 = ConvertStringDate(header.F31);
            item.Date32 = ConvertStringDate(header.F32);
            item.Date33 = ConvertStringDate(header.F33);
            item.Date34 = ConvertStringDate(header.F34);
            item.Date35 = ConvertStringDate(header.F35);
            item.Date36 = ConvertStringDate(header.F36);
            item.Date37 = ConvertStringDate(header.F37);
            item.Date38 = ConvertStringDate(header.F38);
            item.Date39 = ConvertStringDate(header.F39);
            item.Date40 = ConvertStringDate(header.F40);
            item.Date41 = ConvertStringDate(header.F41);
            item.Date42 = ConvertStringDate(header.F42);
            item.Date43 = ConvertStringDate(header.F43);
            item.Date44 = ConvertStringDate(header.F44);
            item.Date45 = ConvertStringDate(header.F45);
            item.Date46 = ConvertStringDate(header.F46);
            item.Date47 = ConvertStringDate(header.F47);
            item.Date48 = ConvertStringDate(header.F48);
            item.Date49 = ConvertStringDate(header.F49);
            item.Date50 = ConvertStringDate(header.F50);
            item.Date51 = ConvertStringDate(header.F51);
            item.Date52 = ConvertStringDate(header.F52);




            foreach (Detail line in details.Items)
            {
                if (line.F1.Trim() == visyPlantCode.Trim())
                {
                    //line.VisyPONO 
                    batches[count] = new SingleDELFORDateBatchItem();
                    System.Diagnostics.Trace.WriteLine("SDEBUG inside populateitem SUCCESS");
                    batches[count].MaterialCode = line.F2;
                    batches[count].MaterialDesc = line.F3;
                    batches[count].UOM = line.F5;
                    batches[count].QTY1 = line.F6;
                    batches[count].QTY2 = line.F7;
                    batches[count].QTY3 = line.F8;
                    batches[count].QTY4 = line.F9;
                    batches[count].QTY5 = line.F10;
                    batches[count].QTY6 = line.F11;
                    batches[count].QTY7 = line.F12;
                    batches[count].QTY8 = line.F13;
                    batches[count].QTY9 = line.F14;
                    batches[count].QTY10 = line.F15;
                    batches[count].QTY11 = line.F16;
                    batches[count].QTY12 = line.F17;
                    batches[count].QTY13 = line.F18;
                    batches[count].QTY14 = line.F19;
                    batches[count].QTY15 = line.F20;
                    batches[count].QTY16 = line.F21;
                    batches[count].QTY17 = line.F22;
                    batches[count].QTY18 = line.F23;
                    batches[count].QTY19 = line.F24;
                    batches[count].QTY20 = line.F25;
                    batches[count].QTY21 = line.F26;
                    batches[count].QTY22 = line.F27;
                    batches[count].QTY23 = line.F28;
                    batches[count].QTY24 = line.F29;
                    batches[count].QTY25 = line.F30;
                    batches[count].QTY26 = line.F31;
                    batches[count].QTY27 = line.F32;
                    batches[count].QTY28 = line.F33;
                    batches[count].QTY29 = line.F34;
                    batches[count].QTY30 = line.F35;
                    batches[count].QTY31 = line.F36;
                    batches[count].QTY32 = line.F37;
                    batches[count].QTY33 = line.F38;
                    batches[count].QTY34 = line.F39;
                    batches[count].QTY35 = line.F40;
                    batches[count].QTY36 = line.F41;
                    batches[count].QTY37 = line.F42;
                    batches[count].QTY38 = line.F43;
                    batches[count].QTY39 = line.F44;
                    batches[count].QTY40 = line.F45;
                    batches[count].QTY41 = line.F46;
                    batches[count].QTY42 = line.F47;
                    batches[count].QTY43 = line.F48;
                    batches[count].QTY44 = line.F49;
                    batches[count].QTY45 = line.F50;
                    batches[count].QTY46 = line.F51;
                    batches[count].QTY47 = line.F52;
                    batches[count].QTY48 = line.F53;
                    batches[count].QTY49 = line.F54;
                    batches[count].QTY50 = line.F55;
                    batches[count].QTY51 = line.F56;
                    batches[count].QTY52 = line.F57;
                    count++;
                }
            }

            item.BatchItem = batches;

            items[0] = item;
            singleDELFOR.Date = items;
            singleDELFOR.PlantCode = visyPlantCode;

            return singleDELFOR;

        }

        private string ConvertStringDate(string InputDate)
        {
            string strYear = string.Empty;

            if (InputDate != null)
            {
                strYear = InputDate.Substring(4, 2);

                if (Convert.ToInt16(strYear) > 50)
                {
                    strYear = string.Format("19{0}", strYear);
                }
                else
                {
                    strYear = string.Format("20{0}", strYear);
                }

                return InputDate.Substring(2, 2) + "/" + InputDate.Substring(0, 2) + "/" + strYear;
            }
            else
            {
                return null;
            }
        }
    }
}

