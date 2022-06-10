using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Xml.Linq;
using System.Xml;
using System.Linq;

namespace Visy.Middleware.LGX.CUB.UnitTest
{
    [TestClass]
    public class CUBExcelDasmTest
    {
        [TestMethod]
        public void BuildXmlTest()
        {
            string fileToLoad = @"..\..\{FE9A088E-2A4F-4C3E-AAE5-BD150A9B4EFA}.xml";
            //string fileToLoad = @"..\..\{B993C515-C0DD-42E8-AF58-50B773E243BC}.xml";

            XNamespace rs = "http://Visy.Middleware.LGX.CUB.Schemas.CUBForeCastXML_New";
            var xdoc = XDocument.Load(fileToLoad);
        

            var weeks = from b in xdoc.Descendants(rs + "Details")
                        group b by (string)b.Element(rs + "FieldG") into g
                        select new
                        {                          
                            WeekName = (string)g.Elements(rs + "FieldG").First()
                        } 
                        into selection
                        orderby selection.WeekName
                        select selection;


            var materials = from b in xdoc.Descendants(rs + "Details")
                        group b by new {
                            FieldA = (string)b.Element(rs + "FieldA"),
                            FieldD = (string)b.Element(rs + "FieldD")
                        } into g
                        select new
                        {
                            MaterialNo = (string)g.Elements(rs + "FieldA").First(),
                            MaterialName = g.Elements(rs + "FieldB").Count() > 0 ? (string)g.Elements(rs + "FieldB").First(): string.Empty,
                            UOM = (string)g.Elements(rs + "FieldC").First(),
                            Plant = (string)g.Elements(rs + "FieldD").First(),
                            PlantName = g.Elements(rs + "FieldE").Count() > 0 ? (string)g.Elements(rs + "FieldE").First() : string.Empty,
                        };


            XNamespace outns = "http://Visy.Middleware.LGX.CUB.Schemas.CUBForeCastXML";
            XElement outForecastXML = new XElement(outns + "CUBForeCastXML");

            XElement headerXML = new XElement(outns + "Header");
            char ch1 = 'F';
            headerXML.Add(new XElement(outns + "FieldA", "Material No"));
            headerXML.Add(new XElement(outns + "FieldB", "Material Name"));
            headerXML.Add(new XElement(outns + "FieldC", "UOM"));
            headerXML.Add(new XElement(outns + "FieldD", "PlantCode"));
            headerXML.Add(new XElement(outns + "FieldE", "Plant"));
            foreach (var week in weeks)
            {
                headerXML.Add(new XElement(outns + "Field" + ch1.ToString(), week.WeekName.Substring(4, 2) + "." + week.WeekName.Substring(0, 4)));
                ch1 = (char)((int)ch1 + 1);
            }
            headerXML.Add(new XElement(outns + "FieldT", "Total"));
            outForecastXML.Add(headerXML);
            foreach (var material in materials) {
                XElement detailsXML = new XElement(outns + "Details");
                detailsXML.Add(new XElement(outns + "FieldA", material.MaterialNo));
                detailsXML.Add(new XElement(outns + "FieldB", material.MaterialName));
                detailsXML.Add(new XElement(outns + "FieldC", material.UOM));
                detailsXML.Add(new XElement(outns + "FieldD", material.Plant));
                detailsXML.Add(new XElement(outns + "FieldE", material.PlantName));
                char ch = 'F';
                int ctr = 1;
                double totalMrp = 0.0;
                foreach (var week in weeks)
                {
                    var forecasts = from b in xdoc.Descendants(rs + "Details")
                                    where (b.Element(rs + "FieldA").Value == material.MaterialNo && b.Element(rs + "FieldG").Value == week.WeekName && b.Element(rs + "FieldD").Value == material.Plant)
                                    select new
                                    {
                                        MRP = (string)b.Elements(rs + "FieldF").Single()

                                    };
                    detailsXML.Add(new XElement(outns + "Field" + ch.ToString(), forecasts.First().MRP));
                    ch = (char)((int)ch + ctr);
                    totalMrp = totalMrp + Convert.ToDouble(forecasts.First().MRP.ToString());
                }
                detailsXML.Add(new XElement(outns + "FieldT", totalMrp.ToString()));
                outForecastXML.Add(detailsXML);
            }

            Assert.IsTrue(true);
        }
    }
}
