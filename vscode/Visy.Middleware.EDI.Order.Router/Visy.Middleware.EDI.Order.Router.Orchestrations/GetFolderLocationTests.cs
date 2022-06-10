using Microsoft.VisualStudio.TestTools.UnitTesting;
using Visy.Middleware.EDI.Order.Router.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.EDI.Order.Router.Components.Tests
{
    [TestClass()]
    public class GetFolderLocationTests
    {
        [TestMethod()]
        public void GetInterfaceFolderPathTest()
        {
            var folderPath = Visy.Middleware.EDI.Order.Router.Components.GetFolderLocation.GetInterfaceFolderPath("pdf test <coke_orders_v@visy.com.au>,");
            folderPath = folderPath.Substring(0, folderPath.LastIndexOf("_v@"));
            Assert.AreNotEqual(folderPath, string.Empty);
        }
    }
}