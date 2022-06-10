using System;
using System.Collections;
using System.Text;
using System.Text.RegularExpressions;
using C1.C1Excel;

namespace Visy.Middleware.Pipelines.ExcelOrderToXML
{


    public class ExcelOrderHandler
    {
        #region Constructors

        public ExcelOrderHandler()
        { 
        }

        #endregion
        #region Parameters

        private C1.C1Excel.C1XLBook xlsBook = new C1XLBook();    
        private XLSheet sheet = null;   
   
                
        #endregion

        public void loadXLSBook(string filePath)
        {
            xlsBook.Load(filePath);
            sheet = xlsBook.Sheets[xlsBook.Sheets.SelectedIndex];
        }

        
        public string readCell(string location)
        {
            if (!location.Equals(""))
            {
                CellCoords cc = GetCellCoords(sheet, location, "reading from location");

                XLCell cell = sheet.GetCell(cc.RowIndex, cc.ColIndex);

                //Add to check if there is a Excel entry for SharePoint config.
                string cellValue;

                    if (cell != null)
                    {
                        cellValue = Convert.ToString(cell.Value);
                    }
                    else
                    {
                         cellValue = string.Empty;
                    }

                return cellValue;
            }
            else
                return "";
        }

        public string formatDate(string aDate, string delimeter, string layout, string dateType)
        {
            int layoutType = 0;
            string layoutFormat = "dd/MM/yyyy";
            string temp = "";
            switch(layout)
            {
               case "D.Y.M": layoutType = 1; layoutFormat = "d.yyyy.M";
                             break;
               case "D.M.Y": layoutType = 2; layoutFormat = "d.M.yyyy";
                    break;
               case "M.Y.D": layoutType = 3; layoutFormat = "M.yyyy.d";
                    break;
               case "M.D.Y": layoutType = 4; layoutFormat = "M.d.yyyy";
                    break;
               case "Y.D.M": layoutType = 5; layoutFormat = "yyyy.d.M";
                    break;
               case "Y.M.D": layoutType = 6; layoutFormat = "yyyy.M.d";
                    break;
               case "DATENUMBER": layoutType = 7;
                             break;

            }
            if (dateType.Equals("DD"))
            {
                if (aDate.Equals(""))
                {
                    temp = DateTime.Today.AddDays(5).ToShortDateString();
                    return Visy.Middleware.Components.Utilities.DateFormatting.FormateDateNew(temp, "yyyyMMdd", layoutFormat);
                }
                else
                {
                    if (aDate.IndexOf(" ") == -1)
                        temp = aDate;
                    else
                    {
                        temp = aDate;
                        while (temp.IndexOf(" ") != -1)
                        {
                            temp = aDate.Substring(0, aDate.IndexOf(" "));
                            if (temp.IndexOf(delimeter) == -1)
                            {
                                temp = aDate.Substring(aDate.LastIndexOf(" ")+1);
                                aDate = temp;
                            }
                        }
                        
                    }
                    //TODO:Visy.ECommerce.Utilities.DateFormatting.FormatNumberToDDMMYYYY(aDate);
                    if (layoutType == 7)
                    {
                        return GetDateFromString(temp);
                    }
                    else
                    {
                        return Visy.Middleware.Components.Utilities.DateFormatting.FormateDateNew(temp, "yyyyMMdd", layoutFormat);
                    }
                }
            }
            else
            {
                if (aDate.Equals(""))
                    return "";
                else
                {
                    if (aDate.IndexOf(" ") == -1)
                        temp = aDate;
                    else
                    {
                        temp = aDate;
                        while (temp.IndexOf(" ") != -1)
                        {
                            temp = aDate.Substring(0, aDate.IndexOf(" "));
                            if (temp.IndexOf(delimeter) == -1)
                            {
                                temp = aDate.Substring(aDate.LastIndexOf(" ")+1);
                                aDate = temp;
                            }
                        }
                    }
                }
                return Visy.Middleware.Components.Utilities.DateFormatting.FormateDateNew(temp, "yyyyMMdd", layoutFormat);
            }
        }

        private string GetDateFromString(string dateString)
        {

            string format = "yyyyMMdd";

            DateTime date = DateTime.ParseExact(dateString, format, System.Globalization.CultureInfo.InvariantCulture);

            return date.ToString("yyyMMdd");
        }


        public Order readIntoOrder(RulesConfiguration rc)
        {
            //Headers
            Order o = new Order();
            o.CustomerEAN = rc.CustomerEAN;
            o.CustomerName = readCell(rc.CustomerNameLocation);
            o.CustomerNumber = rc.CustomerCode;
            o.DeliveryAddress = readCell(rc.DeliveryAddressCellLocation);
            
            if (rc.WarehouseCodeType.Equals("From Template"))
                o.DeliveryAddressCode = readCell(rc.WarehouseCodeValue);
            else
                o.DeliveryAddressCode = rc.WarehouseCodeValue;
            
            o.Suburb = readCell(rc.SuburbLocation);
            o.Contact = readCell(rc.ContactLocation);
            o.Postcode = readCell(rc.PostcodeLocation);
            
            o.Phone = readCell(rc.PhoneLocation);
            o.EmailAddress = readCell(rc.EmailLocation);
            o.PurchaseOrderDate = formatDate(readCell(rc.PurchaseOrderDateLocation), rc.PurchaseOrderDateDelimeter, rc.PurchaseOrderDateFormatLayout,"PD");
            o.PickupMethod = readCell(rc.PickupMethod);

            
            //Products
            CellCoords ProductIDStartCoords = GetCellCoords(sheet, rc.ProductIDStartLocation, "Product ID Start Location");

            int startRow = ProductIDStartCoords.RowIndex;
            int count = 1;
            string startColumn = ProductIDStartCoords.ColStr;

            Boolean rowEnds = false;

            
            do
            {
                Product newProduct = new Product();
                CellCoords ccPD = GetCellCoords(sheet, rc.ProductDescriptionStartLocation, "Product Description Start Location");
                string PDColumn = ccPD.ColStr;
                CellCoords ccQty = GetCellCoords(sheet, rc.QuantityStartLocation, "Product Quantity");
                string QtyColumn = ccQty.ColStr;
                CellCoords ccPON = GetCellCoords(sheet, rc.PurchaseOrderNumberLocation, "Product Purchase Number");
                string PONColumn = ccPON.ColStr;
                CellCoords ccDD = GetCellCoords(sheet, rc.DeliveryDateLocation, "Product Delivery Date");
                string DDColumn = ccDD.ColStr;
                /*
                CellCoords ccWC = GetCellCoords(sheet, rc.WarehouseCodeValue, "Warehouse Code");
                string WCColumn = ccWC.ColStr;
                */

                newProduct.MaterialID = readCell(ProductIDStartCoords.XYToCell(startColumn,startRow+count));
                newProduct.ProductDescription = readCell(ccPD.XYToCell(ccPD.ColStr,startRow+count));
                newProduct.Quantity = readCell(ccQty.XYToCell(QtyColumn,startRow+count));
                //newProduct.WareHouseCode = readCell(ccWC.XYToCell(WCColumn, startRow+count));
                

                if (rc.OrderType.Equals("Single"))
                {
                    newProduct.PurchaseOrderNumber = readCell(rc.PurchaseOrderNumberLocation);
                }
                else
                {                    
                    newProduct.PurchaseOrderNumber = readCell(ccPON.XYToCell(ccPON.ColStr,startRow+count));
                }

                if (rc.DeliveryDateType.Equals("Single"))
                {
                    newProduct.DeliveryDate = formatDate(readCell(rc.DeliveryDateLocation),rc.DeliveryDateFormatDelimeter,rc.DeliveryDateFormatLayout,"DD");
                }
                else
                {
                    newProduct.DeliveryDate = formatDate(readCell(ccDD.XYToCell(DDColumn, startRow + count)),rc.DeliveryDateFormatDelimeter,rc.DeliveryDateFormatLayout,"DD");
                }


                if (rc.ProductIDENDIdentifier.Equals("BLANK"))
                {
                    try
                    {
                        if (readCell(ProductIDStartCoords.XYToCell(startColumn, startRow + count + 1)).Equals(""))
                        { rowEnds = true; }                        
                    }
                    catch (Exception)
                    {
                        rowEnds = true;
                    }
                }
                else
                {
                    
                    try
                    {
                        if (readCell(ProductIDStartCoords.XYToCell(startColumn, startRow + count + 1)).Equals(rc.ProductIDENDIdentifierString))
                        { rowEnds = true; }
                    }
                    catch (Exception)
                    {
                        rowEnds = true;
                    }
                }
                o.addProduct(newProduct.PurchaseOrderNumber + "@" + count.ToString(), newProduct);
                count++;
            } while (!rowEnds);

            return o;
        }

        public ArrayList PopulateExcelXML(Order o)
        {
            ArrayList arOrders = new ArrayList();

            int xmlNumber = 0;
           
            string PONo = ((Product)o.Products.GetByIndex(0)).PurchaseOrderNumber;
            ArrayList Products = new ArrayList();

            int iNoOfProds = 0;
            //Boolean newPO = false;

            for (int x = 0; x < o.Products.Count; x++)
            {
                Product p_temp = (Product)o.Products.GetByIndex(x);
            
                ExcelOrderProduct singleProduct = new ExcelOrderProduct();
                if (!PONo.Equals(p_temp.PurchaseOrderNumber))
                {
                   
                    xmlNumber++;
                    //Products = new ArrayList();

                    #region Build XML Order
                    ExcelOrder singleOrder = new ExcelOrder();

                    #region HEADER
                    singleOrder.CustomerEAN = o.CustomerEAN;
                    singleOrder.CustomerName = o.CustomerName;
                    singleOrder.CustomerNumber = o.CustomerNumber;
                    singleOrder.DeliveryAddress = o.DeliveryAddress;
                    singleOrder.Postcode = o.Postcode;
                    singleOrder.Suburb = o.Suburb;
                    singleOrder.Contact = o.Contact;
                    singleOrder.DeliveryAddressCode = o.DeliveryAddressCode;
                    singleOrder.EmailAddress = o.EmailAddress;
                    singleOrder.Phone = o.Phone;
                    singleOrder.PickupMethod = o.PickupMethod;
                    singleOrder.PurchaseOrderDate = o.PurchaseOrderDate;
                    singleOrder.PurchaseOrderNumber = PONo;
                    #endregion 
                    #region PRODUCTS

                    //create products inside xml order
                    singleOrder.CreateProducts(Products.Count);

                    for (int i = 0; i < Products.Count; i++)
                    {
                        singleOrder.Product[i] = (ExcelOrderProduct)Products[i];
                    }
                    PONo = p_temp.PurchaseOrderNumber;
                    #endregion


                    #endregion
                    //persistXML(singleOrder, xmlNumber);
                    arOrders.Add(singleOrder);
                    iNoOfProds = 0;
                    Products.Clear();
                }
                iNoOfProds++;
                singleProduct.MaterialID = p_temp.MaterialID;
                singleProduct.Description = p_temp.ProductDescription;
                singleProduct.DeliveryDate = p_temp.DeliveryDate;
                singleProduct.Quantity = p_temp.Quantity;
                singleProduct.WareHouseCode = p_temp.WareHouseCode;
                //PONo = ((Product)key.Value).PurchaseOrderNumber;
                Products.Add(singleProduct);
                
            }
            //process left over
            if (iNoOfProds > 0)
            {
                xmlNumber++;
                //Products = new ArrayList();

                #region Build XML Order
                ExcelOrder singleOrder = new ExcelOrder();

                #region HEADER
                singleOrder.CustomerEAN = o.CustomerEAN;
                singleOrder.CustomerName = o.CustomerName;
                singleOrder.CustomerNumber = o.CustomerNumber;
                singleOrder.DeliveryAddress = o.DeliveryAddress;
                singleOrder.Postcode = o.Postcode;
                singleOrder.Suburb = o.Suburb;
                singleOrder.Contact = o.Contact;
                singleOrder.DeliveryAddressCode = o.DeliveryAddressCode;
                singleOrder.EmailAddress = o.EmailAddress;
                singleOrder.Phone = o.Phone;
                singleOrder.PickupMethod = o.PickupMethod;
                singleOrder.PurchaseOrderDate = o.PurchaseOrderDate;
                singleOrder.PurchaseOrderNumber = PONo;
                #endregion
                #region PRODUCTS

                //create products inside xml order
                singleOrder.CreateProducts(Products.Count);

                for (int i = 0; i < Products.Count; i++)
                {
                    singleOrder.Product[i] = (ExcelOrderProduct)Products[i];
                }
                #endregion


                #endregion
                //persistXML(singleOrder, xmlNumber);
                arOrders.Add(singleOrder);
                iNoOfProds = 0;
                Products.Clear();

            }
            #region old code
            /*
            do
            {

                int count = 0;
                samePO = true;
                ArrayList products = new ArrayList();
                string poNumber = "";
                Product nextProduct = null;
                while(o.Products.Count!=0 && samePO)
                {
                    
                    
                    ExcelOrderProduct aProduct = new ExcelOrderProduct();

                    
                    
                    if (currentIde.MoveNext())
                    {                        
                        if (xmlNumber == 0)
                        {
                            if (nextIde.MoveNext() && nextIde.MoveNext())
                            {
                                nextProduct = (Product)nextIde.Value;
                            }

                        }
                        else if (xmlNumber != 0)
                            if(nextIde.MoveNext())
                                nextProduct = (Product)nextIde.Value;
                        else
                            nextPO = true;
                        // No more Products
                        Product singleProduct = (Product)currentIde.Value;

                        aProduct.MaterialID = singleProduct.MaterialID;
                        aProduct.Description = singleProduct.ProductDescription;
                        aProduct.DeliveryDate = singleProduct.DeliveryDate;
                        aProduct.Quantity = singleProduct.Quantity;
                        poNumber = singleProduct.PurchaseOrderNumber;

                        try
                        {
                            if (nextProduct.PurchaseOrderNumber.Equals(singleProduct.PurchaseOrderNumber))
                            {
                                nextPO = false;
                                samePO = true;
                            }
                            else
                            {
                                nextPO = true;
                                samePO = false;
                            }
                        }
                        catch(Exception)
                        {
                            nextPO = true;
                            samePO = false;
                        }

                        count++;
                        products.Add(aProduct);
                    }
                    
                }
                
                
            } while (nextPO);
             */
            #endregion
            return arOrders;
        }


        private void persistXML(ExcelOrder anOrder, int xmlNumber)
        {


            System.Xml.Serialization.XmlSerializer xsOrder = new System.Xml.Serialization.XmlSerializer(typeof(Visy.Middleware.Pipelines.ExcelOrderToXML.ExcelOrder));
            System.IO.FileStream fs = new System.IO.FileStream("C:\\pipelines\\Visy.Biztalk.Pipelines\\XLSOrderToXML.TestHarness\\Output\\output~"+ xmlNumber + ".xml",System.IO.FileMode.Create, System.IO.FileAccess.Write, System.IO.FileShare.None);
            xsOrder.Serialize(fs,anOrder);
            fs.Close();

        }

        #region Copy from Sergiy
       /// <summary>
        /// Creates a CellCoords instance from a human readable Cell location value.
        /// </summary>
        /// <param name="sheet">The Excel sheet instance with data.</param>
        /// <param name="location">The human readable Cell location within Excel document (e.g. E15)</param>
        /// <param name="name">A descriptive name of the Cell (e.g. Week Start Location)</param>
        /// <returns>The created CellCoords instance.</returns>
        /// 
        /// Modified From Sergiy's Code
        private CellCoords GetCellCoords(XLSheet sheet, string location, string name)
        {


            string stringPart = null;
            string numericPart = null;

            // Look for a single letter e.g. A, L
            Match match1 = Regex.Match(location, "[A-Z]", RegexOptions.IgnoreCase);
            stringPart = match1.Value;
            // Look for two letters e.g. AB, XV
            Match match2 = Regex.Match(location, "[A-Z][A-Z]", RegexOptions.IgnoreCase);
            if (!String.IsNullOrEmpty(match2.Value))
                stringPart = match2.Value;
            // Look for integers e.g. 12
            Match match3 = Regex.Match(location, "0*[1-9][0-9]*", RegexOptions.IgnoreCase);
            numericPart = match3.Value;

            if (String.IsNullOrEmpty(stringPart))
                throw new FormatException("Unable to find the string part (i.e. Excel column name) within '" + location + "' Cell location.");
            if (String.IsNullOrEmpty(numericPart))
                throw new FormatException("Unable to find the numeric part (i.e. Excel row name) within '" + location + "' Cell location.");

            // Create CellCoords instance
            CellCoords coords = new CellCoords();
            
            coords.RowIndex = Convert.ToInt32(numericPart) - 1;
            coords.ColIndex = GetColIndex(stringPart);
            coords.ColStr = stringPart;
            coords.Location = location;
            coords.Name = name;

    
            // Return result
            return coords;
        }
        /// <summary>
        /// Performs string to integer matching to determine the Cell column index
        /// that can be used to access an array.
        /// </summary>
        /// <remarks>
        /// Supports string part strings from A to DZ (Index range 0-130).
        /// </remarks>
        /// <param name="stringPart">The string part of a Cell column location (e.g. E)</param>
        /// <returns>The Cell column index (e.g. 4)</returns>
        /// 
        /// Copy from Sergiy's code
        private int GetColIndex(string stringPart)
        {
            if (stringPart != null)
                stringPart = stringPart.Trim();
            if (String.IsNullOrEmpty("stringPart"))
                throw new ArgumentNullException("stringPart");

            int colIndex = 0;
            string stringPartUpper = stringPart.ToUpper();

            switch (stringPartUpper)
            {
                case "A": colIndex = 0; break;
                case "B": colIndex = 1; break;
                case "C": colIndex = 2; break;
                case "D": colIndex = 3; break;
                case "E": colIndex = 4; break;
                case "F": colIndex = 5; break;
                case "G": colIndex = 6; break;
                case "H": colIndex = 7; break;
                case "I": colIndex = 8; break;
                case "J": colIndex = 9; break;
                case "K": colIndex = 10; break;
                case "L": colIndex = 11; break;
                case "M": colIndex = 12; break;
                case "N": colIndex = 13; break;
                case "O": colIndex = 14; break;
                case "P": colIndex = 15; break;
                case "Q": colIndex = 16; break;
                case "R": colIndex = 17; break;
                case "S": colIndex = 18; break;
                case "T": colIndex = 19; break;
                case "U": colIndex = 20; break;
                case "V": colIndex = 21; break;
                case "W": colIndex = 22; break;
                case "X": colIndex = 23; break;
                case "Y": colIndex = 24; break;
                case "Z": colIndex = 25; break;

                case "AA": colIndex = 26; break;
                case "AB": colIndex = 27; break;
                case "AC": colIndex = 28; break;
                case "AD": colIndex = 29; break;
                case "AE": colIndex = 30; break;
                case "AF": colIndex = 31; break;
                case "AG": colIndex = 32; break;
                case "AH": colIndex = 33; break;
                case "AI": colIndex = 34; break;
                case "AJ": colIndex = 35; break;
                case "AK": colIndex = 36; break;
                case "AL": colIndex = 37; break;
                case "AM": colIndex = 38; break;
                case "AN": colIndex = 39; break;
                case "AO": colIndex = 40; break;
                case "AP": colIndex = 41; break;
                case "AQ": colIndex = 42; break;
                case "AR": colIndex = 43; break;
                case "AS": colIndex = 44; break;
                case "AT": colIndex = 45; break;
                case "AU": colIndex = 46; break;
                case "AV": colIndex = 47; break;
                case "AW": colIndex = 48; break;
                case "AX": colIndex = 49; break;
                case "AY": colIndex = 50; break;
                case "AZ": colIndex = 51; break;

                case "BA": colIndex = 52; break;
                case "BB": colIndex = 53; break;
                case "BC": colIndex = 54; break;
                case "BD": colIndex = 55; break;
                case "BE": colIndex = 56; break;
                case "BF": colIndex = 57; break;
                case "BG": colIndex = 58; break;
                case "BH": colIndex = 59; break;
                case "BI": colIndex = 60; break;
                case "BJ": colIndex = 61; break;
                case "BK": colIndex = 62; break;
                case "BL": colIndex = 63; break;
                case "BM": colIndex = 64; break;
                case "BN": colIndex = 65; break;
                case "BO": colIndex = 66; break;
                case "BP": colIndex = 67; break;
                case "BQ": colIndex = 68; break;
                case "BR": colIndex = 69; break;
                case "BS": colIndex = 70; break;
                case "BT": colIndex = 71; break;
                case "BU": colIndex = 72; break;
                case "BV": colIndex = 73; break;
                case "BW": colIndex = 74; break;
                case "BX": colIndex = 75; break;
                case "BY": colIndex = 76; break;
                case "BZ": colIndex = 77; break;

                case "CA": colIndex = 78; break;
                case "CB": colIndex = 79; break;
                case "CC": colIndex = 80; break;
                case "CD": colIndex = 81; break;
                case "CE": colIndex = 82; break;
                case "CF": colIndex = 83; break;
                case "CG": colIndex = 84; break;
                case "CH": colIndex = 85; break;
                case "CI": colIndex = 86; break;
                case "CJ": colIndex = 87; break;
                case "CK": colIndex = 88; break;
                case "CL": colIndex = 89; break;
                case "CM": colIndex = 90; break;
                case "CN": colIndex = 91; break;
                case "CO": colIndex = 92; break;
                case "CP": colIndex = 93; break;
                case "CQ": colIndex = 94; break;
                case "CR": colIndex = 95; break;
                case "CS": colIndex = 96; break;
                case "CT": colIndex = 97; break;
                case "CU": colIndex = 98; break;
                case "CV": colIndex = 99; break;
                case "CW": colIndex = 100; break;
                case "CX": colIndex = 101; break;
                case "CY": colIndex = 102; break;
                case "CZ": colIndex = 103; break;

                case "DA": colIndex = 104; break;
                case "DB": colIndex = 105; break;
                case "DC": colIndex = 106; break;
                case "DD": colIndex = 107; break;
                case "DE": colIndex = 108; break;
                case "DF": colIndex = 109; break;
                case "DG": colIndex = 110; break;
                case "DH": colIndex = 111; break;
                case "DI": colIndex = 112; break;
                case "DJ": colIndex = 113; break;
                case "DK": colIndex = 114; break;
                case "DL": colIndex = 115; break;
                case "DM": colIndex = 116; break;
                case "DN": colIndex = 117; break;
                case "DO": colIndex = 118; break;
                case "DP": colIndex = 119; break;
                case "DQ": colIndex = 120; break;
                case "DR": colIndex = 121; break;
                case "DS": colIndex = 122; break;
                case "DT": colIndex = 123; break;
                case "DU": colIndex = 124; break;
                case "DV": colIndex = 125; break;
                case "DW": colIndex = 126; break;
                case "DX": colIndex = 127; break;
                case "DY": colIndex = 128; break;
                case "DZ": colIndex = 129; break;

                default:
                    throw new ArgumentException("The '" + stringPartUpper + "' string could not be " +
                        "converted to a Column Index. Supported range is A-DZ (Index 0-130).");
            }
            return colIndex;
        }
        #endregion
    }
}
