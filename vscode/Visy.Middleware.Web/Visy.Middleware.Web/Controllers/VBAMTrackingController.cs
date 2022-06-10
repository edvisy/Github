using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;
using Visy.Middleware.Web.Models;
using PagedList;

namespace Visy.Middleware.Web.Controllers
{
    public class VBAMTrackingController : Controller
    {
        // GET: OrderTracking
        
        private string nodeURL = System.Configuration.ConfigurationManager.AppSettings.Get("NodeURL");
       
        public PartialViewResult VBAMTracking(string sortOrder, string currentFilter, string searchString, int? page, int? pageSize)
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

            VBAMTracking ot = null;
            VBAMTracking resultOT = null;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(nodeURL);
                //HTTP GET
                var responseTask = client.GetAsync("vbam/tracking");
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<VBAMTracking>();
                    readTask.Wait();

                    ot = readTask.Result;

                    resultOT = new VBAMTracking();

                    switch (sortOrder)
                    {
                        case "ref_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.reference_number).Cast<VBAMTrackingRec2>().ToArray();
                            break;
                        case "po_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.reference_number).Cast<VBAMTrackingRec2>().ToArray();
                            break;
                        case "code_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.customer_code).Cast<VBAMTrackingRec2>().ToArray();
                            break;
                        case "code_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.customer_code).Cast<VBAMTrackingRec2>().ToArray();
                            break;
                        case "name_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.company_name).Cast<VBAMTrackingRec2>().ToArray();
                            break;
                        case "name_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.company_name).Cast<VBAMTrackingRec2>().ToArray();
                            break;
                        case "date_asc":
                            resultOT.recordset = ot.recordset.OrderBy(s => s.reference_date).Cast<VBAMTrackingRec2>().ToArray();
                            break;
                        case "date_desc":
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.reference_date).Cast<VBAMTrackingRec2>().ToArray();
                            break;
                        default:
                            resultOT.recordset = ot.recordset.OrderByDescending(s => s.created_date).Cast<VBAMTrackingRec2>().ToArray();
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
                            ).Cast<VBAMTrackingRec2>().ToArray();
            }

          
            int pageNumber = (page ?? 1);

            PagedList.IPagedList<VBAMTrackingRec2> finalResult = resultOT.recordset.Cast<VBAMTrackingRec2>().ToArray().ToPagedList(pageNumber, defaSize);
            return PartialView(finalResult);
        }
    }
}