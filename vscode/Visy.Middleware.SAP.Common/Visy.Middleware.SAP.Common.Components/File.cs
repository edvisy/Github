using System;
using System.Collections.Generic;
using System.Text;

namespace Visy.Middleware.SAP.Common.Components
{
    public class File
    {
        public static int GetParts(string file_name, out string s_route, out string s_prefix, out string s_application_name, out string s_customer, out string s_biztalk_id, out string s_extension)
        {
            /****************************************************************************
            FILENAME PARTS EXPECTED

            [R].[PREFIX].[APPNAME].[CUSTOMER].[BIZTALK_ID].[EXTENSION]

            [R]          = Route Paramter ( Either O or N )  This will determine
                           which port the File is routed through.  This is required
                           because SAP has two file locations to receive files.
            [PREFIX]     = Prefix that SAP will use to route the file after receiving it.
            [APPNAME]    = Name of the Application that sent the file
            [CUSTOMER]   = [PlantCode-PartnerCode] - combination identifying specific customer that sent the file.
            [BIZTALK_ID] = [ContextID]~[x]~[y]  this is the unique identifier for the electronic
                            document received and it is the value that is placed on the EDI_TRACKING
                            control record.
            [EXTENSION]  = Extension of the file.

            NOTE : File that will be routed to SAP will be as follows ( excludes [R] )
                [PREFIX].[APPNAME].[CUSTOMER].[BIZTALK_ID].[EXTENSION]
            *****************************************************************************/
            
            string[] a_parts;
            int i_parts = 0;

            file_name = System.IO.Path.GetFileName(file_name);

            a_parts = file_name.Split('.');
            //expecting 6 parts ( as described above )
            if (a_parts.Length != 6)
            {
                //file name was not as expected.
                i_parts = 0;
                s_route = "";
                s_prefix = "";
                s_application_name = "";
                s_customer = "";
                s_biztalk_id = "";
                s_extension = "";
            }
            else
            {
                s_route = a_parts[0];
                s_prefix = a_parts[1];
                s_application_name = a_parts[2];
                s_customer = a_parts[3];
                s_biztalk_id = a_parts[4];
                s_extension = a_parts[5];
                i_parts = a_parts.Length;
            }
            return i_parts;
        }
    }
}
