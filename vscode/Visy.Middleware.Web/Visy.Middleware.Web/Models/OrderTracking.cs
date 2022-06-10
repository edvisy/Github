using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Visy.Middleware.Web.Models
{

    public class OrderTracking
    {
        public Recordset[][] recordsets { get; set; }
        public Recordset1[] recordset { get; set; }
        public Output output { get; set; }
        public object[] rowsAffected { get; set; }
    }

    public class Output
    {
    }

    public class Recordset
    {
        public int pk { get; set; }
        public string po_number { get; set; }
        public string biztalk_id { get; set; }
        public string customer_code { get; set; }
        public string customer_name { get; set; }
        public string archive_file_name { get; set; }
        public int order_sp { get; set; }
        public string reject_message { get; set; }
        public DateTime created_date { get; set; }
        public DateTime modified_date { get; set; }
        public string created_by { get; set; }
        public string modified_by { get; set; }
    }

    public class Recordset1
    {
        public int pk { get; set; }
        public string po_number { get; set; }
        public string biztalk_id { get; set; }
        public string customer_code { get; set; }
        public string customer_name { get; set; }
        public string archive_file_name { get; set; }
        public int order_sp { get; set; }
        public string reject_message { get; set; }
        public DateTime created_date { get; set; }
        public DateTime modified_date { get; set; }
        public string created_by { get; set; }
        public string modified_by { get; set; }
    }

}