using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace Visy.Middleware.SAP.MTData.Components
{
    public class Helper
    {
        /// <summary>
        /// Return a new Guid value
        /// </summary>
        /// <returns></returns>
        public static string NewGuid()
        {
            return FormatGuid(Guid.NewGuid().ToString());
        }


        /// <summary>
        /// Returns a Guid string formatted correctly for SAP
        /// </summary>
        /// <param name="guidString"></param>
        /// <returns></returns>
        public static string FormatGuid(string guidString)
        {
            Guid guid = new Guid(guidString);

            return guid.ToString("D").ToUpper();
        }


        /// <summary>
        /// Static helper function for converting a Date/Time string into an arbitrarily formatted string value
        /// </summary>
        /// <param name="inputDateTime"></param>
        /// <param name="outputFormat"></param>
        /// <returns>A string representation of the <paramref name="inputDateTime"/> formatted using standard .Net formatting rules</returns>
        public static string FormatDateTime(string inputDateTime, string outputFormat)
        {
            string retVal = string.Empty;
            DateTime parsedDateTime = DateTime.MinValue;

            bool success = DateTime.TryParse(inputDateTime, out parsedDateTime);

            if (success)
            {
                retVal = FormatDateTime(parsedDateTime, outputFormat);
            }

            return retVal;
        }

        public static string FormatDateTime(DateTime inputDateTime, string outputFormat)
        {
            return inputDateTime.ToString(outputFormat);
        }


        public static DateTime? ParseDateTimeString(string inputDateTimeString, string inputFormat)
        {
            DateTime? retVal = null;

            DateTime temp = DateTime.MinValue;

            bool success = DateTime.TryParseExact(inputDateTimeString, inputFormat, null, DateTimeStyles.None, out temp);

            if (success)
            {
                retVal = temp;
            }

            return retVal;
        }


        public static string ConvertDateTime(string inputDateTime, string inputFormat, string outputFormat)
        {
            string retVal = string.Empty;
            DateTime? parsedDate = ParseDateTimeString(inputDateTime, inputFormat);

            if (parsedDate != null)
            {
                retVal = FormatDateTime(parsedDate.Value, outputFormat);
            }

            return retVal;
        }

        /// <summary>
        /// Return the current Date and/or Time, formatted according to the parameter.
        /// </summary>
        /// <param name="outputFormat"></param>
        /// <returns></returns>
        public static string CurrentDateTime(string outputFormat)
        {
            string inputFormat = "yyyy-MMM-ddTHH:mm:ss";
            string now = DateTime.Now.ToString(inputFormat);

            return ConvertDateTime(now, inputFormat, outputFormat);

        }
    }
}
