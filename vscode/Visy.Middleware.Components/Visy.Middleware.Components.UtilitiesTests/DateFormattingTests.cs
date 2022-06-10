using Microsoft.VisualStudio.TestTools.UnitTesting;
using Visy.Middleware.Components.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.Components.Utilities.Tests
{
    [TestClass()]
    public class DateFormattingTests
    {
        [TestMethod()]
        public void FormateDateNewTest()
        {
            string d = DateTime.Now.ToString("MM-dd-yyyy Hmmss");
            var s = Visy.Middleware.Components.Utilities.DateFormatting.FormateDateNew(d, "yyyMMdd", "MM-dd-yyyy Hmmss");

            Assert.IsNotNull(s);
        }


        [TestMethod()]
        public void FormateDateNewLGX_Bega()
        {
            var s = Visy.Middleware.Components.Utilities.DateFormatting.FormateDateNew("22/09/17", "yyyyMMdd", "dd/MM/yy");

            Assert.IsNotNull(s);
        }

        [TestMethod()]
        public void FormateDateNewLGX_FoxConn()
        {
            var s = Visy.Middleware.Components.Utilities.DateFormatting.FormateDateNew("20170925", "yyMMdd", "yyyyMMdd");

            Assert.IsNotNull(s);
        }

        [TestMethod()]
        public void FormateDateNewLGX_ExcelOrder()
        {
            var s = Visy.Middleware.Components.Utilities.DateFormatting.FormateDateNew("09/01/2017", "yyMMdd", "M/d/yyyy");

            Assert.IsNotNull(s);
        }

    }
}