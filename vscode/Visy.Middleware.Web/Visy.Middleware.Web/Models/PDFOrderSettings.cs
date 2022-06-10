
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Visy.Middleware.Web.Models
{

    public class PDFOrderSettings
    {
        public PDFOrderSettingsRec[][] recordsets { get; set; }
        public PDFOrderSettingsRec2[] recordset { get; set; }        
        public object[] rowsAffected { get; set; }           
           
    }

    public class PDFOrderSettingsRec
    {
        public int pk { get; set; }       
        public string from_email { get; set; }

        public string customer_code { get; set; }
        public string customer_name { get; set; }
        public string unit_price_factor { get; set; }
        public string customer_ean { get; set; }
        public string destination_system { get; set; }     
        public DateTime created_date { get; set; }
        public DateTime modified_date { get; set; }
        public string created_by { get; set; }
        public string modified_by { get; set; }
    }

    public class PDFOrderSettingsRec2
    {

        public int pk { get; set; }

        [Display(Name = "Email address")]
        [Required(ErrorMessage = "The email address is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        [StringLength(50, ErrorMessage = "Email cannot be longer than 50 characters.")]
        public string from_email { get; set; }

        [Required(ErrorMessage = "The Customer Code is required")]
        [StringLength(50, ErrorMessage = "Customer Code cannot be longer than 50 characters.")]       
        public string customer_code { get; set; }

        [Required(ErrorMessage = "The Customer Name is required")]
        [StringLength(50, ErrorMessage = "Customer Name cannot be longer than 50 characters.")]
        public string customer_name { get; set; }

        [Required(ErrorMessage = "The Unit Price Factor is required")]
        [StringLength(50, ErrorMessage = "Unit Price Factor cannot be longer than 50 digits.")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "Unit Price Factor must be numeric")]
        public string unit_price_factor { get; set; }

        [Required(ErrorMessage = "The Customer EAN is required")]
        [StringLength(50, ErrorMessage = "Customer EAN cannot be longer than 50 characters.")]
        public string customer_ean { get; set; }
        public string destination_system { get; set; }
        public DateTime created_date { get; set; }
        public DateTime modified_date { get; set; }
        public string created_by { get; set; }
        public string modified_by { get; set; }
    }
}