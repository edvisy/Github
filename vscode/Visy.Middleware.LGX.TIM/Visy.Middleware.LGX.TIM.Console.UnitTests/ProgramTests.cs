using Microsoft.VisualStudio.TestTools.UnitTesting;
using Visy.Middleware.LGX.TIM.Console;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.LGX.TIM.Console.Tests
{
    [TestClass()]
    public class ProgramTests
    {
        [TestMethod()]
        public void MainTest()
        {
            string[] args = null;
            Program.Main(args);
            Assert.Fail();
        }
    }
}