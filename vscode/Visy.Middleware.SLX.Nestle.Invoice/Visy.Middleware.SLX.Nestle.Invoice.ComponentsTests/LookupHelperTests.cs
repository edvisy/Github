using Microsoft.VisualStudio.TestTools.UnitTesting;
using Visy.Middleware.SLX.Nestle.Invoice.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.SLX.Nestle.Invoice.Components.Tests
{
    [TestClass()]
    public class LookupHelperTests
    {
        [TestMethod()]
        public void GetPONumberTest()
        {
            string poNumber = "4550997252-10";
            string outPO = poNumber;
            if (poNumber.Contains("/")) {
                outPO = poNumber.Split('/')[1];
            }

            if (poNumber.Contains("-"))
            {
                outPO = poNumber.Split('-')[1].Length > poNumber.Split('-')[0].Length ? poNumber.Split('-')[1] : poNumber.Split('-')[0];
            }

           
            Assert.AreEqual(poNumber, outPO);
        }
    }
}