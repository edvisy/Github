using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Visy.Middleware.Web.Startup))]
namespace Visy.Middleware.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
