using System;
using System.Collections.Generic;
using System.Text;

namespace Visy.Middleware.Components.Utilities
{
    public class ContextManager
    {
        public static string GetContextID(string biztalk_id)
        {
            /*
             * FORMAT OF biztalk_id IS
             *  [ContextID]~[x]~[y]              
             */
            string[] aBiztalkIDParts;
            string context_id = "";
            aBiztalkIDParts = biztalk_id.Split('~');
            if (aBiztalkIDParts.Length == 3) //3 parts expected separated by ~ character
            {
                //[0]=context_id
                //[1]=x
                //[2]=y

                //SET ReceiveFileName to [ContextID]~[x]
                context_id = aBiztalkIDParts[0];               

            }

            return (context_id);
              
        }
    }
}
