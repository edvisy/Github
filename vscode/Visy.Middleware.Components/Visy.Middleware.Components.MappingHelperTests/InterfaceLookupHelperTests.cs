using Microsoft.VisualStudio.TestTools.UnitTesting;
using Visy.Middleware.Components.MappingHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.Components.MappingHelper.Tests
{
    [TestClass()]
    public class InterfaceLookupHelperTests
    {
        [TestMethod()]
        public void GetValueFromDelimitedListTest()
        {

            string str = Visy.Middleware.Components.MappingHelper.InterfaceLookupHelper.GetValueFromDelimitedList("|", "|", 1);
            Assert.Fail();
        }
    }
}