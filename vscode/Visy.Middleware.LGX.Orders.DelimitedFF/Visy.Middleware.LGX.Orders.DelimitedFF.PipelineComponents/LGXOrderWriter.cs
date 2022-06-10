using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Visy.Middleware.LGX.Orders.DelimitedFF.PipelineComponents
{
    public class LGXOrderWriter
    {
        public enum FileDefLocations
        {
            DefinitionName,
            ColumnDelimeter,
            RowDelimeter,
            NumberOfHeaderRows,
            NumberOfOrderRows,
            EAN,
            ACK,
            PONumber,
            PODate,
            PODateFormat,
            POTime,
            POTimeFormat,
            ProductCode,
            ItemName,
            UnitPrice,
            Quantity,
            DeliveryDate,
            DeliveryDateFormat,
            WarehouseCode,
            UOM,
            CustomerName,
            CustomerAddress,
            ContactName,
            ContactNumber
        }

        public static string WriteOrder(List<DelimitedRow> rows, string[] csvFileDefinition)
        {

            StringBuilder LGXOrder = new StringBuilder();

            int NumberHeaderRows = int.Parse(csvFileDefinition[(int)FileDefLocations.NumberOfHeaderRows]);
            int NumberOrderRows = int.Parse(csvFileDefinition[(int)FileDefLocations.NumberOfOrderRows]);

            LocationInfo EAN = new LocationInfo(csvFileDefinition[(int)FileDefLocations.EAN].Trim(), rows, NumberHeaderRows, NumberOrderRows);
            LocationInfo AcknowledgeDocument = new LocationInfo(csvFileDefinition[(int)FileDefLocations.ACK].Trim(), rows, NumberHeaderRows, NumberOrderRows);

            LocationInfo PONumber = new LocationInfo(csvFileDefinition[(int)FileDefLocations.PONumber].Trim(), rows, NumberHeaderRows, NumberOrderRows);

            LocationInfo PODate = new LocationInfo(csvFileDefinition[(int)FileDefLocations.PODate].Trim(), rows, NumberHeaderRows, NumberOrderRows);
            string PODateFormat = csvFileDefinition[(int)FileDefLocations.PODateFormat].Trim();
            LocationInfo POTime = new LocationInfo(csvFileDefinition[(int)FileDefLocations.POTime].Trim(), rows, NumberHeaderRows, NumberOrderRows);
            string POTimeFormat = csvFileDefinition[(int)FileDefLocations.POTimeFormat].Trim();

            LocationInfo WarehouseCode = new LocationInfo(csvFileDefinition[(int)FileDefLocations.WarehouseCode].Trim(), rows, NumberHeaderRows, NumberOrderRows);

            LocationInfo CustomerName = new LocationInfo(csvFileDefinition[(int)FileDefLocations.CustomerName].Trim(), rows, NumberHeaderRows, NumberOrderRows);
            LocationInfo CustomerAddress = new LocationInfo(csvFileDefinition[(int)FileDefLocations.CustomerAddress].Trim(), rows, NumberHeaderRows, NumberOrderRows);
            LocationInfo ContactName = new LocationInfo(csvFileDefinition[(int)FileDefLocations.ContactName].Trim(), rows, NumberHeaderRows, NumberOrderRows);
            LocationInfo ContactNumber = new LocationInfo(csvFileDefinition[(int)FileDefLocations.ContactNumber].Trim(), rows, NumberHeaderRows, NumberOrderRows);

            string BizTalkID = Guid.NewGuid().ToString();

            if (PODate.RowType == 'D')
                PODate.Value = Helper.FormatDateTime(DateTime.Now, "yyyyMMdd");
            else
                PODate.Value = Helper.ConvertDateTime(PODate.Value, PODateFormat, "yyyyMMdd");

            if (POTime.RowType == 'D')
                POTime.Value = Helper.FormatDateTime(DateTime.Now, "HH:mm:ss");
            else
                PODate.Value = Helper.ConvertDateTime(PODate.Value, PODateFormat, "HH:mm:ss");

            // Add LGX.Order Outer Start Tag
            LGXOrder.AppendLine(@"<ns0:ORDER xmlns:ns0=""http://Visy.Middleware.Common.Schemas.LGX.ORDER"">");

            // Add LGX.Order Header
            LGXOrder.AppendLine(String.Format(@"<ns0:Header 
    order_type=""N""
    application_code=""EDI""
    customer_ean=""{0}""
    purchase_order_number=""{1}""
    purchase_order_date=""{2}""
    purchase_order_time=""{3}""
", EAN.Value, PONumber.Value, PODate.Value, POTime.Value));

            if (CustomerName.RowType != 'N')
                LGXOrder.AppendLine(String.Format(@"customer_name=""{0}""", CustomerName.Value));

            if (CustomerAddress.RowType != 'N')
                LGXOrder.AppendLine(String.Format(@"customer_address=""{0}""", CustomerAddress.Value));

            if (ContactName.RowType != 'N')
                LGXOrder.AppendLine(String.Format(@"contact_name=""{0}""", ContactName.Value));

            if (ContactNumber.RowType != 'N')
                LGXOrder.AppendLine(String.Format(@"contact_number=""{0}""", ContactNumber.Value));

            LGXOrder.AppendLine(String.Format(@"
    biztalk_id=""{0}""
    acknowledge_document=""{1}""
/>", BizTalkID, AcknowledgeDocument.Value));



            // Add LGX.Order Details

            LocationInfo ProductCode = new LocationInfo(csvFileDefinition[(int)FileDefLocations.ProductCode].Trim(), rows, NumberHeaderRows, NumberOrderRows);
            LocationInfo Quantity = new LocationInfo(csvFileDefinition[(int)FileDefLocations.Quantity].Trim(), rows, NumberHeaderRows, NumberOrderRows);
            LocationInfo Price = new LocationInfo(csvFileDefinition[(int)FileDefLocations.UnitPrice].Trim(), rows, NumberHeaderRows, NumberOrderRows);
            LocationInfo DeliveryDate = new LocationInfo(csvFileDefinition[(int)FileDefLocations.DeliveryDate].Trim(), rows, NumberHeaderRows, NumberOrderRows);

            LocationInfo UOM = new LocationInfo(csvFileDefinition[(int)FileDefLocations.UOM].Trim(), rows, NumberHeaderRows, NumberOrderRows);

            string DeliveryDateFormat = csvFileDefinition[(int)FileDefLocations.DeliveryDateFormat].Trim();

            decimal TotalOrderQuantity = 0;

            for (int i = NumberHeaderRows; i < rows.Count; i++)
            {
                try
                {

                    if (ProductCode.RowType != 'L')
                        ProductCode.Value = rows[i][ProductCode.ColumnPosition];

                    if (Price.RowType != 'L')
                        Price.Value = rows[i][Price.ColumnPosition];

                    if (DeliveryDate.RowType == 'D')
                        DeliveryDate.Value = Helper.FormatDateTime(DateTime.Now, "yyyyMMdd");
                    else if (DeliveryDate.RowType != 'L' && DeliveryDate.RowType != 'H')
                        DeliveryDate.Value = Helper.ConvertDateTime(rows[i][DeliveryDate.ColumnPosition], DeliveryDateFormat, "yyyyMMdd");

                    if (UOM.RowType != 'L')
                        UOM.Value = rows[i][UOM.ColumnPosition];

                    if (Quantity.RowType != 'L')
                    {
                        Quantity.Value = rows[i][Quantity.ColumnPosition];

                        if (UOM.Value == "TH")
                        {
                            decimal quantity = decimal.Parse(Quantity.Value);

                            quantity = Math.Round((quantity / 1000), 3);

                            Quantity.Value = quantity.ToString();
                        }
                    }

                    LGXOrder.AppendLine(String.Format(@"<ns0:Detail
    line_indicator=""N""
    line_number=""{0}""
    product_code=""{1}""
    quantity=""{2}""
    unit_of_measure=""{3}""
", ((i * NumberOrderRows) + 1 - NumberHeaderRows).ToString(), ProductCode.Value, Quantity.Value, UOM.Value));

                    if (Price.RowType != 'N')
                        LGXOrder.AppendLine(String.Format(@"price_excluding_tax=""{0}""", Price.Value));

                    LGXOrder.AppendLine(String.Format(@"
    delivery_date=""{0}""
    delivery_time=""0000""
    warehouse_code=""{1}""
", DeliveryDate.Value, WarehouseCode.Value));

                    LGXOrder.AppendLine("/>");

                    TotalOrderQuantity = TotalOrderQuantity + (decimal.Parse(Quantity.Value) * 1000);

                }
                catch
                {
                }
            }

            // Add LGX.Order Summary
            LGXOrder.AppendLine(String.Format(@"<ns0:Summary
    total_order_quantity=""{0}""
/>", Decimal.ToInt32(TotalOrderQuantity).ToString()));

            // Add LGX.Order Outer End Tag
            LGXOrder.AppendLine(@"</ns0:ORDER>");

            return LGXOrder.ToString();
        }

        public static string[] GetFileDefinition(string delimFileDefinition)
        {
            string[] fileDefinition;

            //StreamReader fileDefinition = new StreamReader(@"D:\Projects\Temp\GenericCSVTester\TestData\SharePointOrderDefinition.txt");

            //fileDefinition = fileDefinition.ReadLine().Split('~');

            fileDefinition = delimFileDefinition.Split('~');

            return fileDefinition;
        }

        struct LocationInfo
        {
            public char RowType;
            public int RowPosition;
            public int ColumnPosition;
            public string Value;

            public LocationInfo(string Location, List<DelimitedRow> rows, int NumberHeaderRows, int NumberOrderRows)
            {
                RowType = Char.Parse(Location.Substring(0, 1));

                if (RowType == 'L')
                {
                    Value = Location.Substring(1).Trim();
                    RowPosition = 0;
                    ColumnPosition = 0;
                }
                else if (RowType == 'H')
                {
                    RowPosition = int.Parse(Location.Substring(1, Location.IndexOf('P') - 1).Trim()) - 1;
                    ColumnPosition = int.Parse(Location.Substring(Location.IndexOf('P') + 1).Trim()) - 1;
                    Value = rows[RowPosition][ColumnPosition];
                }
                else if (RowType == 'O')
                {
                    RowPosition = int.Parse(Location.Substring(1, Location.IndexOf('P') - 1).Trim()) - 1;
                    ColumnPosition = int.Parse(Location.Substring(Location.IndexOf('P') + 1).Trim()) - 1;
                    Value = rows[(RowPosition * NumberOrderRows) + NumberHeaderRows][ColumnPosition];
                }
                else
                {
                    Value = "default";
                    RowPosition = 0;
                    ColumnPosition = 0;
                }
            }
        }
    }
}
