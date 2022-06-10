using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace Visy.Middleware.RPA.EMailHandler.Components
{
    public class Helper
    {
        private const string INBOX_INTERFACE_NAME = "RPA.EmailHandler.InboxName";
        private const string LOOKUP_KEY = "LookUpKey";
        public static string GetCustomerEmail(string email) {
            string[] separateEmails;

            if (email.Contains(',')) 
                separateEmails = email.Split(',');
            else 
                separateEmails = email.Split(';');

            string emailList1 = string.Empty;

            foreach (string separateEmail in separateEmails)
            {
                if (separateEmail != string.Empty)
                {
                    int startIndex = separateEmail.IndexOf("<") + 1;
                    int endIndex = separateEmail.LastIndexOf(">");
                    if (startIndex != 0 && endIndex != 0)
                    {
                        string emailList = separateEmail.Substring(startIndex, endIndex - startIndex);

                        emailList1 = emailList + "," + emailList1;
                    }
                }
            }
          
            return emailList1;
        }

        public static string EscapeXMLValue(string xmlString)
        {

            if (xmlString == null)
                throw new ArgumentNullException("xmlString");
            return System.Net.WebUtility.HtmlEncode(xmlString);

                //return xmlString.Replace("'", "&apos;").Replace("\"", "&quot;").Replace(">", "&gt;").Replace("<", "&lt;").Replace("&", "&amp;");
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

            char tab = '\u0009';
            strFileName = strFileName.Replace(tab.ToString(), "");

            strFileName = Regex.Replace(strFileName.Trim(), "[^A-Za-z0-9_. ]+", "");

            return strFileName;
        }

        public static string GetMessageId(string str)
        {
            var match = Regex.Match(str, @"Message-ID: <(.*)>");
            if (match.Success)
            {
                System.Diagnostics.EventLog.WriteEntry("BizTalkApp", "RPA.EmailHandler: Message-Id" + match.Groups[1].Value);
                return match.Groups[1].Value;
            }

            return "";
        }

        
    }
}
