using Microsoft.VisualStudio.TestTools.UnitTesting;
using Visy.Middleware.LGX.PDF.Orders.Component;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.LGX.PDF.Orders.Component
{
    [TestClass()]
    public class GetCodeSQLTests
    {
        [TestMethod()]
        public void getCustomerCodeTest()
        {
            var s = GetCodeSQL.getCustomerCode("\"'qld_h714_v@visy.com.au'\" <'qld_h714_v@visy.com.au'>");
            var t = s;
        }
    }
}