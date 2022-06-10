using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Visy.Middleware.SAP.ServiceMax.Components
{
    public class MapHelper
    {
        public static string GetUOMDescriptionFromShortCode(string strShortCode)
        {
            try
            {
                var ret =  Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(strShortCode, "SAP.ServiceMax.ShortCode");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetUOMDescriptionFromShortCode failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetCountryNameFromCode(string strCity)
        {
            try
            {
                var ret = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(strCity, "SAP.ServiceMax.CountryName");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetCountryNameFromCode failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetRegionNameFromCode(string strCity, string strRegion)
        {
            try
            {
                var ret = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(strCity.Trim()+"-"+strRegion.Trim(), "SAP.ServiceMax.Region");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetRegionNameFromCode failed because {0}", ex.Message), ex.InnerException);
            }
        }

         public static string GetPriceBook2Id()
        {
            try
            {
                var ret = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData("PriceBookId", "SAP.ServiceMax");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;

            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetPriceBook2Id failed because {0}", ex.Message), ex.InnerException);
            }
        }

         public static string ConvertStatusToStatusText(string strStatus)
         {
             string strStatusText = string.Empty;
             switch (strStatus)
             {
                 case "1": strStatusText = "P.R created";
                     break;
                 case "2": strStatusText = "P.O created";
                     break;
                 case "3": strStatusText = "G.R partial Qty";
                     break;
                 case "4": strStatusText = "G.R Full Qty";
                     break;
                 default: break;
             }
             return strStatusText;
         }
        public static string GetShortCodeFromUOMDescription(string strDesc)
        {
            try
            {
                var ret = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData("<font face=\"Calibri\" size=\"2\">" + strDesc.Trim() + "</font>", "SAP.ServiceMax.ToSAP.UOM");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetShortCodeFromUOMDescription failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetDateTime()
        {
            try
            {
                string DateTime = System.DateTime.Now.ToString("yyyyMMddhhmmssff");


                return DateTime;



            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetDateTime failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetCodeFromCountryName(string strCity)
        {
            try
            {
                var ret = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(strCity.Trim(), "SAP.ServiceMax.ToSAP.Country");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetCodeFromCountryName failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetRegionDescriptionFromCode(string strRegion)
        {
            try
            {
                var ret = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(strRegion.Trim(), "SAP.ServiceMax.ToSAP.Region");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("MapHelper.GetRegionDescriptionFromCode failed because {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetSNDPOR()
        {
            string GetSNDPOR = string.Empty;

            try
            {
                var ret = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData("SNDPOR", "SAP.ServiceMax.ToSAP");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;
            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Cound not load GetSNDPOR setting from SSo Config ,Error : {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetRCVPOR()
        {
            string GetRCVPOR = string.Empty;

            try
            {
                var ret = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData("RCVPOR", "SAP.ServiceMax.ToSAP");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;

            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Cound not load GetRCVPOR setting from SSo Config ,Error : {0}", ex.Message), ex.InnerException);
            }
        }

        public static string GetRCVPRN()
        {         

            try
            {
                var ret = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData("RCVPRN", "SAP.ServiceMax.ToSAP");
                return !string.IsNullOrEmpty(ret) ? ret : string.Empty;

            }
            catch (Exception ex)
            {
                throw new Exception(String.Format("Cound not load GetRCVPRN setting from SSo Config ,Error : {0}", ex.Message), ex.InnerException);
            }
        }




        private static string _archKey = System.String.Empty;

        public static string _ArchKey
        {
            get
            {
                return _archKey;
            }

            set
            {
                _archKey = value;
            }
        }


    

}
}
