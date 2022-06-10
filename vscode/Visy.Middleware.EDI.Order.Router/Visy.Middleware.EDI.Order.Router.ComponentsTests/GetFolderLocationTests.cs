﻿using Microsoft.VisualStudio.TestTools.UnitTesting;
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
            string strEmail = "Lyndal Watson <lyndal.watson@visy.com.au>, 	Visy Echuca <vic_h859_v@visy.com.au>, 	\"Tracey Travers (tracey.travers@visy.com.au)\"	 <tracey.travers@visy.com.au>";
            var folderPath = Visy.Middleware.EDI.Order.Router.Components.GetFolderLocation.GetInterfaceFolderPath(strEmail);
            folderPath = folderPath.Substring(0, folderPath.LastIndexOf("_v@"));
            Assert.AreNotEqual(folderPath, string.Empty);
        }
    }
}