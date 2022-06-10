
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Visy.Middleware.Web.Models
{
    
    public class InterfaceSettings
    {
        public InterfaceSettingsRec[][] recordsets { get; set; }
        public InterfaceSettingsRec2[] recordset { get; set; }        
        public object[] rowsAffected { get; set; }           
           
    }

    public class InterfaceSettingsRec
    {
        public int lookup_id { get; set; }       
        public string interface_name { get; set; }
        public string key { get; set; }
        public string value { get; set; }      
        public DateTime created_date { get; set; }
        public DateTime modified_date { get; set; }
        public string created_by { get; set; }
        public string modified_by { get; set; }
    }

    public class InterfaceSettingsRec2
    {
        public int lookup_id { get; set; }

        [Display(Name = "Interface Name")]
        [Required(ErrorMessage = "The Interface Name is required")]       
        [StringLength(50, ErrorMessage = "Interface Name be longer than 50 characters.")]
        public string interface_name { get; set; }

        [Required(ErrorMessage = "This is required")]
        [StringLength(50, ErrorMessage = "Cannot be longer than 50 characters.")]       
        public string key { get; set; }

        [Required(ErrorMessage = "This is required")]
        [StringLength(50, ErrorMessage = "Cannot be longer than 50 characters.")]
        public string value { get; set; }

        public DateTime created_date { get; set; }
        public DateTime modified_date { get; set; }
        public string created_by { get; set; }
        public string modified_by { get; set; }
    }
}