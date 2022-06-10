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
    public class AdminController : Controller
    {
        // GET: OrderTracking

        private string nodeURL = System.Configuration.ConfigurationManager.AppSettings.Get("NodeURL");
        public PartialViewResult OrderTracking(string sortOrder, string currentFilter, string searchString, int? page, int? pageSize)
        {
            int defaSize = (pageSize ?? 15);

            ViewBag.psize = defaSize;

            ViewBag.PageSize = new List<SelectListItem>()
             {
                 new SelectListItem() { Value="10", Text= "10" },
                 new SelectListItem() { Value="15", Text= "15", Selected=true },
                 new SelectListItem() { Value="20", Text= "20" },
                 new SelectListItem() { Value="30", Text= "30" },
                 new SelectListItem() { Value="40", Text= "40" },
                 new SelectListItem() { Value="50", Text= "50" },
                 new SelectListItem() { Value="60", Text= "60" },
             };

            ViewBag.CurrentSort = sortOrder;
            ViewBag.POSortParm = sortOrder == "po_asc" ? "po_desc" : "po_asc";
            ViewBag.CustomerCodeSortParm = sortOrder == "code_asc" ? "code_desc" : "code_asc";
            ViewBag.CustomerNameSortParm = sortOrder == "name_asc" ? "name_desc" : "name_asc";
            ViewBag.DateSortParm = sortOrder == "date_asc" ? "date_desc" : "date_asc";
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

            OrderTracking ot = null;
            OrderTracking resultOT = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(nodeURL);
                //HTTP GET
                var responseTask = client.GetAsync("ordertracking");
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<OrderTracking>();
                    readTask.Wait();

                    ot = readTask.Result;

                    resultOT = new OrderTracking();

                    switch (sortOrder)
                    {
                        case "po_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.po_number).Cast<Recordset1>().ToArray();
                            break;
                        case "po_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.po_number).Cast<Recordset1>().ToArray();
                            break;
                        case "code_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.customer_code).Cast<Recordset1>().ToArray();
                            break;
                        case "code_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.customer_code).Cast<Recordset1>().ToArray();
                            break;
                        case "name_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.customer_name).Cast<Recordset1>().ToArray();
                            break;
                        case "name_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.customer_name).Cast<Recordset1>().ToArray();
                            break;
                        case "date_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.created_date).Cast<Recordset1>().ToArray();
                            break;
                        case "date_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.created_date).Cast<Recordset1>().ToArray();
                            break;
                        default:
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.created_date).Cast<Recordset1>().ToArray();
                            break;
                    }

                }
                else
                {

                    resultOT.recordset = null;

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            if (!String.IsNullOrEmpty(searchString))
            {
                resultOT.recordset = resultOT.recordset.Where(s => s.po_number.ToUpper().Contains(searchString.ToUpper())
                            || s.customer_name.ToUpper().Contains(searchString.ToUpper())
                            || s.customer_code.ToUpper().Contains(searchString.ToUpper())
                            || s.order_sp.ToString().ToUpper().Contains(searchString.ToUpper())
                            ).Cast<Recordset1>().ToArray();
            }

            int pageNumber = (page ?? 1);

            PagedList.IPagedList<Recordset1> finalResult = resultOT.recordset.Cast<Recordset1>().ToArray().ToPagedList(pageNumber, defaSize);
            return PartialView(finalResult);
        }

        public PartialViewResult Outbound(string sortOrder, string currentFilter, string searchString, int? page, int? pageSize)
        {

            int defaSize = (pageSize ?? 15);

            ViewBag.psize = defaSize;

            ViewBag.PageSize = new List<SelectListItem>()
             {
                 new SelectListItem() { Value="10", Text= "10" },
                 new SelectListItem() { Value="15", Text= "15", Selected=true },
                 new SelectListItem() { Value="20", Text= "20" },
                 new SelectListItem() { Value="30", Text= "30" },
                 new SelectListItem() { Value="40", Text= "40" },
                 new SelectListItem() { Value="50", Text= "50" },
                 new SelectListItem() { Value="60", Text= "60" },
             };

            ViewBag.CurrentSort = sortOrder;
            ViewBag.RefSortParm = sortOrder == "ref_asc" ? "ref_desc" : "ref_asc";
            ViewBag.CustomerCodeSortParm = sortOrder == "code_asc" ? "code_desc" : "code_asc";
            ViewBag.CustomerNameSortParm = sortOrder == "name_asc" ? "name_desc" : "name_asc";
            ViewBag.DateSortParm = sortOrder == "date_asc" ? "date_desc" : "date_asc";
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

            Outbound ot = null;
            Outbound resultOT = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(nodeURL);
                //HTTP GET
                var responseTask = client.GetAsync("outbound");
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<Outbound>();
                    readTask.Wait();

                    ot = readTask.Result;

                    resultOT = new Outbound();

                    switch (sortOrder)
                    {
                        case "ref_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.reference_number).Cast<OutboundRec2>().ToArray();
                            break;
                        case "po_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.reference_number).Cast<OutboundRec2>().ToArray();
                            break;
                        case "code_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.customer_code).Cast<OutboundRec2>().ToArray();
                            break;
                        case "code_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.customer_code).Cast<OutboundRec2>().ToArray();
                            break;
                        case "name_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.company_name).Cast<OutboundRec2>().ToArray();
                            break;
                        case "name_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.company_name).Cast<OutboundRec2>().ToArray();
                            break;
                        case "date_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.reference_date).Cast<OutboundRec2>().ToArray();
                            break;
                        case "date_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.reference_date).Cast<OutboundRec2>().ToArray();
                            break;
                        default:
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.created_date).Cast<OutboundRec2>().ToArray();
                            break;
                    }

                }
                else
                {

                    resultOT.recordset = null;

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            if (!String.IsNullOrEmpty(searchString))
            {
                resultOT.recordset = resultOT.recordset.Where(s => s.reference_number.ToUpper().Contains(searchString.ToUpper())
                            || s.company_name.ToUpper().Contains(searchString.ToUpper())
                            || s.company_code.ToUpper().Contains(searchString.ToUpper())
                            || s.customer_code.ToString().ToUpper().Contains(searchString.ToUpper())
                            || s.source.ToString().ToUpper().Contains(searchString.ToUpper())
                            || s.message_type.ToString().ToUpper().Contains(searchString.ToUpper())
                            ).Cast<OutboundRec2>().ToArray();
            }


            int pageNumber = (page ?? 1);

            PagedList.IPagedList<OutboundRec2> finalResult = resultOT.recordset.Cast<OutboundRec2>().ToArray().ToPagedList(pageNumber, defaSize);
            return PartialView(finalResult);
        }
        public PartialViewResult Inbound(string sortOrder, string currentFilter, string searchString, int? page, int? pageSize)
        {

            int defaSize = (pageSize ?? 15);

            ViewBag.psize = defaSize;

            ViewBag.PageSize = new List<SelectListItem>()
             {
                 new SelectListItem() { Value="10", Text= "10" },
                 new SelectListItem() { Value="15", Text= "15", Selected=true },
                 new SelectListItem() { Value="20", Text= "20" },
                 new SelectListItem() { Value="30", Text= "30" },
                 new SelectListItem() { Value="40", Text= "40" },
                 new SelectListItem() { Value="50", Text= "50" },
                 new SelectListItem() { Value="60", Text= "60" },
             };

            ViewBag.CurrentSort = sortOrder;
            ViewBag.RefSortParm = sortOrder == "ref_asc" ? "ref_desc" : "ref_asc";
            ViewBag.CustomerCodeSortParm = sortOrder == "code_asc" ? "code_desc" : "code_asc";
            ViewBag.CustomerNameSortParm = sortOrder == "name_asc" ? "name_desc" : "name_asc";
            ViewBag.DateSortParm = sortOrder == "date_asc" ? "date_desc" : "date_asc";
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

            Inbound ot = null;
            Inbound resultOT = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(nodeURL);
                //HTTP GET
                var responseTask = client.GetAsync("inbound");
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<Inbound>();
                    readTask.Wait();

                    ot = readTask.Result;

                    resultOT = new Inbound();

                    switch (sortOrder)
                    {
                        case "ref_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.reference_number).Cast<InboundRec2>().ToArray();
                            break;
                        case "po_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.reference_number).Cast<InboundRec2>().ToArray();
                            break;
                        case "code_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.customer_code).Cast<InboundRec2>().ToArray();
                            break;
                        case "code_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.customer_code).Cast<InboundRec2>().ToArray();
                            break;
                        case "name_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.company_name).Cast<InboundRec2>().ToArray();
                            break;
                        case "name_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.company_name).Cast<InboundRec2>().ToArray();
                            break;
                        case "date_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.reference_date).Cast<InboundRec2>().ToArray();
                            break;
                        case "date_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.reference_date).Cast<InboundRec2>().ToArray();
                            break;
                        default:
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.created_date).Cast<InboundRec2>().ToArray();
                            break;
                    }

                }
                else
                {

                    resultOT.recordset = null;

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            if (!String.IsNullOrEmpty(searchString))
            {
                resultOT.recordset = resultOT.recordset.Where(s => s.reference_number.ToUpper().Contains(searchString.ToUpper())
                            || s.company_name.ToUpper().Contains(searchString.ToUpper())
                            || s.company_code.ToUpper().Contains(searchString.ToUpper())
                            || s.customer_code.ToString().ToUpper().Contains(searchString.ToUpper())
                            || s.source.ToString().ToUpper().Contains(searchString.ToUpper())
                            || s.message_type.ToString().ToUpper().Contains(searchString.ToUpper())
                            ).Cast<InboundRec2>().ToArray();
            }


            int pageNumber = (page ?? 1);

            PagedList.IPagedList<InboundRec2> finalResult = resultOT.recordset.Cast<InboundRec2>().ToArray().ToPagedList(pageNumber, defaSize);
            return PartialView(finalResult);
        }

        public PartialViewResult PDFOrderSettings(string sortOrder, string currentFilter, string searchString, int? page, int? pageSize)
        {

            int defaSize = (pageSize ?? 15);

            ViewBag.psize = defaSize;

            ViewBag.PageSize = new List<SelectListItem>()
             {
                 new SelectListItem() { Value="10", Text= "10" },
                 new SelectListItem() { Value="15", Text= "15", Selected=true },
                 new SelectListItem() { Value="20", Text= "20" },
                 new SelectListItem() { Value="30", Text= "30" },
                 new SelectListItem() { Value="40", Text= "40" },
                 new SelectListItem() { Value="50", Text= "50" },
                 new SelectListItem() { Value="60", Text= "60" },
             };

            ViewBag.CurrentSort = sortOrder;
            ViewBag.RefSortParm = sortOrder == "ref_asc" ? "ref_desc" : "ref_asc";
            ViewBag.CustomerCodeSortParm = sortOrder == "code_asc" ? "code_desc" : "code_asc";
            ViewBag.CustomerNameSortParm = sortOrder == "name_asc" ? "name_desc" : "name_asc";
            ViewBag.DateSortParm = sortOrder == "date_asc" ? "date_desc" : "date_asc";
            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.CurrentFilter = searchString;

            PDFOrderSettings ot = null;
            PDFOrderSettings resultOT = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(nodeURL);
                //HTTP GET
                var responseTask = client.GetAsync("interface/pdfsettings");
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<PDFOrderSettings>();
                    readTask.Wait();

                    ot = readTask.Result;

                    resultOT = new PDFOrderSettings();

                    switch (sortOrder)
                    {
                        case "ref_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.from_email).Cast<PDFOrderSettingsRec2>().ToArray();
                            break;
                        case "code_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.customer_code).Cast<PDFOrderSettingsRec2>().ToArray();
                            break;
                        case "code_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.customer_code).Cast<PDFOrderSettingsRec2>().ToArray();
                            break;
                        case "name_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.customer_name).Cast<PDFOrderSettingsRec2>().ToArray();
                            break;
                        case "name_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.customer_name).Cast<PDFOrderSettingsRec2>().ToArray();
                            break;
                        case "date_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.created_date).Cast<PDFOrderSettingsRec2>().ToArray();
                            break;
                        case "date_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.created_date).Cast<PDFOrderSettingsRec2>().ToArray();
                            break;
                        default:
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.modified_date).Cast<PDFOrderSettingsRec2>().ToArray();
                            break;
                    }

                }
                else
                {

                    resultOT.recordset = null;

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            if (!String.IsNullOrEmpty(searchString))
            {
                resultOT.recordset = resultOT.recordset.Where(s => s.from_email.ToUpper().Contains(searchString.ToUpper())
                            || s.customer_name.ToUpper().Contains(searchString.ToUpper())
                            || s.customer_code.ToString().ToUpper().Contains(searchString.ToUpper())
                            || s.customer_ean.ToString().ToUpper().Contains(searchString.ToUpper())
                            ).Cast<PDFOrderSettingsRec2>().ToArray();
            }


            int pageNumber = (page ?? 1);

            PagedList.IPagedList<PDFOrderSettingsRec2> finalResult = resultOT.recordset.Cast<PDFOrderSettingsRec2>().ToArray().ToPagedList(pageNumber, defaSize);
            return PartialView("_PDFOrderSettings", finalResult);
        }
        public ActionResult Download(string name)
        {
            try
            {
                return File(new System.IO.FileStream(System.Configuration.ConfigurationManager.AppSettings.Get("ArchiveFolder") + "LGX.Common\\Archive\\" + name, System.IO.FileMode.Open), "content-dispostion", name);
            }
            catch (Exception ex)
            {
                Response.Write("File not found");
                return null;
            }
        }
        public ActionResult ViewRecord(int id)
        {
            PDFOrderSettingsRec2 rec = GetRecById(id);
            return PartialView("_PDFOrderSettingsData", rec);
        }

        public ActionResult NewRecord()
        {
            PDFOrderSettingsRec2 rec = new PDFOrderSettingsRec2();
            return PartialView("_PDFOrderAddSettingsData", rec);
        }

        public JsonResult AddRecord(PDFOrderSettingsRec2 rec)
        {
            if (ModelState.IsValid)
            {
                rec.modified_by = Request.LogonUserIdentity.Name;
                rec.created_by = Request.LogonUserIdentity.Name;
                var json = new JavaScriptSerializer().Serialize(rec);
                var post = this.Post(nodeURL + "interface/pdfsettings/create", json, "text/json", "POST");
            }
            return Json("");
        }

        public JsonResult UpdateRecord(PDFOrderSettingsRec2 rec)
        {
            rec.modified_by = Request.LogonUserIdentity.Name;
            if (ModelState.IsValid)
            {            
                var json = new JavaScriptSerializer().Serialize(rec);
                var post = this.Post(nodeURL + "interface/pdfsettings/update", json, "text/json", "POST");               
            }
            return Json("");
            
        }

        public JsonResult DeleteRecord(int id)
        {
            var post = this.Post(nodeURL + "interface/pdfsettings/delete/" + id.ToString(), "", "text/plain", "POST");

            return Json("");
        }


        private PDFOrderSettingsRec2 GetRecById(int id)
        {
            PDFOrderSettings rec = new PDFOrderSettings();

            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(nodeURL);
                //HTTP GET
                var responseTask = client.GetAsync("interface/pdfsettings/getbyid/"+id.ToString());
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<PDFOrderSettings>();
                    readTask.Wait();

                    rec = readTask.Result;
                    if (rec.recordsets.Count() > 0)
                        return rec.recordset.Single();
                    
                }
            }
            return null;
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