using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.Components.MappingHelper
{
    public class InterfaceLookupHelper
    {
        public static string GetValueFromDelimitedList(string str, string separator, int index)
        {
            return str.Split(Convert.ToChar(separator))[index];
        }

        public static string ReplaceString(string str, string charToReplace, string newChar) {
            return str.Replace(charToReplace, newChar);
        }
    }
}
