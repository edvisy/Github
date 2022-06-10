using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;
using Visy.Middleware.Web.Models;
using PagedList;
using System.Web.Script.Serialization;
using System.Web.Http;
using System.Net;
using System.Text;
using System.IO;

namespace Visy.Middleware.Web.Controllers
{
    public class InterfaceSettingsController : Controller
    {
        // GET: OrderTracking

        private string nodeURL = System.Configuration.ConfigurationManager.AppSettings.Get("NodeURL");
        public PartialViewResult InterfaceSettings(string interfaceName)
        {
            InterfaceSettings displayItems = null;
            InterfaceSettings records = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(nodeURL);
                //HTTP GET
                var responseTask = client.GetAsync("interface/interfacesettings");
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<InterfaceSettings>();
                    readTask.Wait();

                    records = readTask.Result;
                    var interfaces = records.recordset.Select(x => x.interface_name).Distinct();
                    if (!string.IsNullOrEmpty(interfaceName))
                        ViewBag.InterfaceNames = new SelectList(interfaces, interfaceName);
                    else { 
                        ViewBag.InterfaceNames = new SelectList(interfaces);                      
                        interfaceName = ((SelectList)ViewBag.InterfaceNames).First().Text;
                    }
                    displayItems = new InterfaceSettings();
                  
                    
                    displayItems.recordset = records.recordset.Where(x => x.interface_name.Equals(interfaceName)).Cast<InterfaceSettingsRec2>().ToArray();
                }

                return PartialView("InterfaceSettings", displayItems);
            }
        }
        public ActionResult ViewRecord(int id, string key, string value, string interfacename)
        {
            InterfaceSettingsRec2 rec = new InterfaceSettingsRec2();
            rec.key = key;
            rec.value = value;
            rec.lookup_id = id;
            rec.interface_name = interfacename;
            return PartialView("InterfaceSettingsData", rec);
        }

        public ActionResult NewRecord()
        {
            InterfaceSettingsRec2 rec = new InterfaceSettingsRec2();
            
            return PartialView("InterfaceSettingsNew", rec);
        }

        public JsonResult AddRecord(InterfaceSettingsRec2 rec)
        {
            if (ModelState.IsValid)
            {
                rec.modified_by = Request.LogonUserIdentity.Name;
                rec.created_by = Request.LogonUserIdentity.Name;
                var json = new JavaScriptSerializer().Serialize(rec);
                var post = this.Post(nodeURL + "interface/interfacesettings/create", json, "text/json", "POST");
            }
          
            return Json("");
        }

        public JsonResult UpdateRecord(InterfaceSettingsRec2 rec)
        {
            rec.modified_by = Request.LogonUserIdentity.Name;
            if (ModelState.IsValid)
            {
                var json = new JavaScriptSerializer().Serialize(rec);
                var post = this.Post(nodeURL + "interface/interfacesettings/update", json, "text/json", "POST");
            }
            return Json("");

        }

        public JsonResult DeleteRecord(int id)
        {
            if (ModelState.IsValid)
            {
                var post = this.Post(nodeURL + "interface/interfacesettings/delete/" + id.ToString(), "", "text/plain", "POST");               
            }
            return Json("");
        }
      

        public string Post(string uri, string data, string contentType, string method = "POST")
        {
            byte[] dataBytes = Encoding.UTF8.GetBytes(data);

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(uri);
            //request.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;
            request.ContentLength = dataBytes.Length;
            request.ContentType = contentType;
            request.Method = method;

            using (Stream requestBody = request.GetRequestStream())
            {
                requestBody.Write(dataBytes, 0, dataBytes.Length);
            }

            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            using (Stream stream = response.GetResponseStream())
            using (StreamReader reader = new StreamReader(stream))
            {
                return reader.ReadToEnd();
            }
        }

    }
}