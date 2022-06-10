using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Visy.Middleware.Web.Controllers
{
    public class ServiceMaxController : Controller
    {
        // GET: ServiceMax
        public ViewResult ServiceMax(string sortOrder, string currentFilter, string searchString, int? page, int? pageSize)
        {
            return View();
        }
    }
}