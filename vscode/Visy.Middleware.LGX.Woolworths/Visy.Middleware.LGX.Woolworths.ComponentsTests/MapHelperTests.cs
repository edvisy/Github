using Microsoft.VisualStudio.TestTools.UnitTesting;
using Visy.Middleware.LGX.Woolworths.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.LGX.Woolworths.Components.Tests
{
    [TestClass()]
    public class MapHelperTests
    {
        [TestMethod()]
        public void OutputEndOfFileCharacterSUBTest()
        {
            
            Visy.Middleware.LGX.Woolworths.Components.MapHelper m = new MapHelper();
            var s = m.OutputEndOfFileCharacterSUB();
            
        }
    }
}