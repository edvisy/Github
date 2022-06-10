using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.IO;
using Visy.Middleware.LGX.Amazon.Components;

namespace Visy.Middleware.LGX.MappingHelper.Tests.Tests
{
    [TestClass()]
    public class RawHtmlParserTests
    {
        private const string FILEPATH = "purchase_order_vic1.html";
        [TestMethod()]
        public void getPONumberTests() {
           
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id=header][1]/table[@id=order_lines]/tr/td[1]/text()", readText);
            Assert.AreEqual(data, "HA-02455745");
        }

        [TestMethod()]
        public void getDeliveryAddressTests()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][1]/table[@id='order_lines'][2]/tr/td[1]/div[1]/text()", readText);
            Assert.AreEqual(data, "23 Centenary Ave");
        }

        [TestMethod()]
        public void getPODateTests()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][3]/table[@id='order_lines']/tr/td[1]/text()", readText);
            Assert.AreEqual(data, "2019/08/29");
        }

        [TestMethod()]
        public void getDeliveryTermTests()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            readText = System.Net.WebUtility.HtmlEncode(readText);
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][3]/table[@id='order_lines']/tr/td[3]/text()", readText);
            Assert.AreEqual(data, "60 NET");
        }

        [TestMethod()]
        public void getFirstLineNumberTest()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var index = 1;
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][7]/table[@id='order_lines']/tr[{0}]/td[1]/text()", readText, index);
            Assert.AreEqual(data, "1");
        }

        [TestMethod()]
        public void getFirstMaterialTest()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var index = 1;
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][7]/table[@id='order_lines']/tr[{0}]/td[2]/text()", readText, index);
            Assert.AreEqual(data.Trim(), "COR30025-BOX&24X16X12.5&BRANDED&PC&RSC&44ECT&B78");
        }

        [TestMethod()]
        public void getFirstDeliveryDateTest()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            readText = System.Net.WebUtility.HtmlEncode(readText);
            var index = 1;
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][7]/table[@id='order_lines']/tr[{0}]/td[3]/text()", readText, index);
            Assert.AreEqual(data, "2019-09-02");
        }
        [TestMethod()]
        public void getFirstQuantityTest()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var index = 1;
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][7]/table[@id='order_lines']/tr[{0}]/td[4]/text()", readText, index);
            Assert.AreEqual(data, "750.0");
        }
        [TestMethod()]
        public void getFirstUOMTest()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var index = 1;
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][7]/table[@id='order_lines']/tr[{0}]/td[5]/text()", readText, index);
            Assert.AreEqual(data, "EACH");
        }

        [TestMethod()]
        public void getFirstUnitPriceTest()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var index = 1;
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][7]/table[@id='order_lines']/tr[{0}]/td[6]/span/text()", readText, index);
            Assert.AreEqual(data, "1.5710");
        }

        [TestMethod()]
        public void getFirstUnitTotalTest()
        {
            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var index = 1;
            var data = RawHtmlParser.GetNodeValueByxPath("//body/div[@id='header'][7]/table[@id='order_lines']/tr[{0}]/td[7]/span/text()", readText, index);
            Assert.AreEqual(data, "1,178.25");
        }

        [TestMethod()]
        public void BuildStringXmlTest() {
            var ch = (object)'A';
            int intVar = (char)ch;

            var i = (object)65;           
            var chVar = (char)i;

            var obj2 = (object)intVar;
            var objInt = obj2;            

            string readText = File.ReadAllText(FILEPATH);
            readText = RawHtmlParser.CleanHtml(readText);
            var data = XlangMessageHelper.BuildXmlString(readText);
            Assert.AreEqual("true", "true");
        }
    }
}