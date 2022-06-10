using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Visy.Middleware.SAP.Cadbury.Maps.UnitTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void H1W6UnitTests()
        {
            string param2 = "9";
            string param = "15.2017";
            string strMonth;
            string strYear;
            DateTime date = new DateTime(int.Parse(param2), 1, 1);
            int noDays;
            strMonth = param.Substring(0, param.IndexOf("."));
            strYear = param.Substring(param.IndexOf(".") + 1);
            noDays = (((int.Parse(strMonth)) - 1) * 7);
            if (param2.Equals(strYear))
                date = date.AddDays(noDays);
            else
            {
                date = date.AddYears(1);
                date = date.AddDays(noDays - 1);
            }
            var x = date.ToShortDateString();
            var y = System.DateTime.Now.ToShortDateString();
            Assert.IsNotNull(x);
        }
    }
}
