﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.VBAM.VisyBoard.Components
{
    public class MappingHelper
    {
        [System.ThreadStaticAttribute]
        private static System.Collections.Generic.Dictionary<string, string> _data = new System.Collections.Generic.Dictionary<string, string>();

        public static System.Collections.Generic.Dictionary<string, string> Data
        {
            get
            {
                if (_data == null)
                {
                    _data = new System.Collections.Generic.Dictionary<string, string>();
                }
                return _data;
            }
            set
            {
                _data = value;
            }
        }


        /// <summary>
        /// Method to retrieve value from dictionary
        /// </summary>
        /// <param name="key">Key</param>
        /// <returns>Previous saved value</returns>
        public static string GetDataValue(string key)
        {
            if (Data.ContainsKey(key))
            {                
                return Data[key];
            }
            else
            {
                return System.String.Empty;
            }
        }

        /// <summary>
        /// Method to store value in dictionary against a key
        /// </summary>
        /// <param name="key">key</param>
        /// <param name="value">value</param>
        public static void SetDataValue(string key, string value)
        {
            if (Data.ContainsKey(key))
            {
                Data[key] = value;
            }
            else
            {
                Data.Add(key, value);
            }
        }

        public static string GetLookupData(string key, string interfaceName) {

            try
            {
                return Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(key, interfaceName);
            }
            catch (Exception ex) {
                return "";
            }
        }
    }
}
