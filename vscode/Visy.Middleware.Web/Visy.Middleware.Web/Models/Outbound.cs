
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Visy.Middleware.Web.Models
{

    public class Outbound
    {
        public OutboundRec[][] recordsets { get; set; }
        public OutboundRec2[] recordset { get; set; }        
        public object[] rowsAffected { get; set; }           
           
    }

    public class OutboundRec
    {
        public int pk { get; set; }
        public string source { get; set; }
        public string reference_number { get; set; }
        public string company_code { get; set; }
        public string company_name { get; set; }
        public string customer_code { get; set; }
        public string reference_date { get; set; }
        public string source_file_name { get; set; }
        public string message_type { get; set; }
        public DateTime created_date { get; set; }
        public DateTime modified_date { get; set; }
        public string created_by { get; set; }
        public string modified_by { get; set; }
    }

    public class OutboundRec2
    {
       
        public int pk { get; set; }
        public string source { get; set; }
        public string reference_number { get; set; }
        public string company_code { get; set; }
        public string company_name { get; set; }
        public string customer_code { get; set; }
        public string reference_date { get; set; }
        public string source_file_name { get; set; }
        public string message_type { get; set; }
        public DateTime created_date { get; set; }
        public DateTime modified_date { get; set; }
        public string created_by { get; set; }
        public string modified_by { get; set; }           
        public int page_size { get; set; }
    }
}