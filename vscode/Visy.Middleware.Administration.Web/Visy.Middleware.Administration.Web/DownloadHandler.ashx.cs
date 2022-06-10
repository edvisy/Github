using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Visy.Middleware.Administration.Web
{
    /// <summary>
    /// Summary description for DownloadHandler
    /// </summary>
    public class DownloadHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            
            context.Response.ClearContent();
            context.Response.Clear();
            context.Response.ContentType = "text/xml";
            context.Response.AddHeader("Content-Disposition",
                               "attachment; filename=" + context.Request.QueryString["filename"] + ";");
            context.Response.WriteFile(@System.Configuration.ConfigurationManager.AppSettings[context.Request.QueryString["path"]] + context.Request.QueryString["filename"]);
            context.Response.Flush();
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}