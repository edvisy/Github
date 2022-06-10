using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.XLANGs.BaseTypes;

namespace Visy.Middleware.LGX.Common.Components
{
   
    public class Validation
    {

        public static string ValidateMessage(XLANGMessage xlang) {

            string strValidationMessage = string.Empty;

            ORDER objOrder = (ORDER)xlang[0].RetrieveAs(typeof(ORDER));
            foreach (Detail d in objOrder.Detail) {
                strValidationMessage += string.IsNullOrEmpty(d.warehouse_code) ? "Missing WHC </br>" : string.Empty;
                strValidationMessage += !IsLgxDateValid(d.delivery_date, "yyyyMMdd") ? " " +
                        "<p>Line Number " + d.line_number + " with product code: <b>" + d.product_code + "</b> " +
                        "contains Invalid DeliveryDate : <font color=\"red\">" + d.delivery_date + "</font></p>" : string.Empty;
            }
            return strValidationMessage;
        }

        private static bool IsLgxDateValid(string delivery_date, string dateFormat) {
            try
            {
                System.DateTime.ParseExact(delivery_date, dateFormat, System.Globalization.CultureInfo.InvariantCulture);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
