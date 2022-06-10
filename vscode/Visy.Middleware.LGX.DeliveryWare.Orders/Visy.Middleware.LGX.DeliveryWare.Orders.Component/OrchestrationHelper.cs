using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text.RegularExpressions;
using Microsoft.XLANGs.BaseTypes;
using System.Xml;

namespace Visy.Middleware.LGX.DeliveryWare.Orders.Component
{
    [Serializable]
    public class OrchestrationHelper
    {
        public static string GetFileName(string file)
        {

            var fi2 = new FileInfo(file);

            return fi2.Name;
        }

        public static string ReplaceString(string strinput, string toreplace, string newstr) {
            return strinput.Replace(toreplace, newstr);
        }

        public static string GetCorrlationGuid(string filename, bool removeChars) {
            Regex strRegs = new Regex(@"{(.*?)}");

            return removeChars ? strRegs.Match(filename).Value.Replace("{", "").Replace("}", "") : strRegs.Match(filename).Value;
        }

        public static string Base64ToXlang(XLANGMessage pdfmessage) {

            byte[] strResults;
            try
            {
                using (Stream stream = pdfmessage[0].RetrieveAs(typeof(Stream)) as Stream)
                {
                    using (var reader = new MemoryStream())
                    {
                        stream.CopyTo(reader);
                        strResults = reader.ToArray();
                    }
                }
            }
            finally
            {
                pdfmessage.Dispose();
            }

            return Convert.ToBase64String(strResults);           
        }

        public static string Base64ToXml(XLANGMessage base64)
        {
            XmlDocument xdoc = base64[0].RetrieveAs(typeof(XmlDocument)) as XmlDocument;
            XmlNamespaceManager nsmgr = new XmlNamespaceManager(xdoc.NameTable);
            nsmgr.AddNamespace("ns0", "http://Visy.Middleware.LGX.DeliveryWare.Orders.Schemas.CorrelationWrapper");
            XmlNode contents = xdoc.SelectSingleNode("ns0:Envelop/Contents", nsmgr);
            var strXml = Encoding.UTF8.GetString(Convert.FromBase64String(contents.InnerText));
            
            return strXml.Replace("﻿<?xml version=\"1.0\" encoding=\"utf-8\"?>", "");
        }

        public static string GetNotificationRecipient(string filename) {
            Regex rx = new Regex(@"(.*?)~");
            var str = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(rx.Match(filename).Groups[1].Value, "LGX.DeliveryWare.Orders.EmailGroup.P1");
            
            if (str == rx.Match(filename).Groups[1].Value)
                str =  Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData((rx.Match(filename).Groups[1].Value).Split('_')[0] + '_', "LGX.DeliveryWare.Orders.EmailGroup.P2");
           
            if (str == (rx.Match(filename).Groups[1].Value).Split('_')[0] + '_')
                return Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData("biztalk_team", "LGX.DeliveryWare.Orders.EmailGroup.P2"); ;
            
            return str;
        }

        public static XLANGMessage GetFile(string biztalkid, XLANGMessage msg, string location) {
            string[] fileEntries = Directory.GetFiles(location, "*" + biztalkid + "*");
            if (fileEntries.Count() > 0)
            {
                
                IStreamFactory sf = new FileStreamFactory(fileEntries[0]);
                msg[0].LoadFrom(sf);

                return msg;
            }
            else { return msg; }

        }
        public static string GetFileName(string biztalkid, string location)
        {
              string[] fileEntries = Directory.GetFiles(location, "*" + biztalkid + "*");
            if (fileEntries.Count() > 0)
            {
                FileInfo fi = new FileInfo(fileEntries[0]);
                return fi.Name;
            }
            else { return "noname.pdf"; }

        }


    }

    public class FileStreamFactory : IStreamFactory
    {
        string _fname;

        public FileStreamFactory(string fname)
        {
            _fname = fname;
        }

        public Stream CreateStream()
        {
            return new FileStream
            (
                _fname,
                FileMode.Open,
                FileAccess.Read,
                FileShare.Read
            );
        }
    }

}

