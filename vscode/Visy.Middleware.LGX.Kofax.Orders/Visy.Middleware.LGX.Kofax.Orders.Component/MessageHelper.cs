using Microsoft.XLANGs.BaseTypes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Visy.Middleware.LGX.Kofax.Orders.Component
{
    public class MessageHelper
    {
        public static void AddAttachment(XLANGMessage destination, XLANGMessage attachment, string filename)
        {
            try
            {
                int count = destination.Count;
                destination.AddPart(attachment[0], string.Format("Attachment_{0}", count));
                destination[count].SetPartProperty(typeof(MIME.FileName), filename);
            }
            finally
            {
                //decrement reference count
                destination.Dispose();
                attachment.Dispose();
            }
        }

        public static string EscapeFileNameValue(string strFileName)
        {

            if (strFileName == null)
                throw new ArgumentNullException("strFileName");

            strFileName = strFileName.Replace("?", string.Empty);

            if (strFileName.Contains("=UTF-8B"))
            {
                strFileName = strFileName.Replace("=UTF-8B", "").Replace("=", "");
                Regex regex = new Regex(@"^[\w/\:.-]+;base64,");

                strFileName = System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(regex.Replace(strFileName, string.Empty) + new string('=', (4 - strFileName.Length % 4) % 4)));
            }

            strFileName = strFileName.Replace(":", "").Replace(">", "").Replace("\"", "").Replace("/", "")
                .Replace("\\", "").Replace("!", "").Replace("?", "").Replace("*", "").Replace("ISO-8859-1Q", "");



            return strFileName;
        }
    }
}
