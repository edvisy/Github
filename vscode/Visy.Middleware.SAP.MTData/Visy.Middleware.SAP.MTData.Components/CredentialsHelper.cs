using System;
using System.Collections.Generic;
using System.Text;

namespace Visy.Middleware.SAP.MTData.Components
{
    public class CredentialsHelper
    {
        public static string EncodePassword(string password)
        {
            return System.Convert.ToBase64String(Encoding.Unicode.GetBytes(password));
        }


    }
}
