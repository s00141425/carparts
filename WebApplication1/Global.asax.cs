using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WebApplication1
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        protected void RegisterRoutes(RouteCollection routes)
        {
            routes.Ignore("{resource}.axd/{*pathInfo}");

            routes.MapPageRoute("Home", "Home", "~/default.aspx");
            routes.MapPageRoute("Login", "Login", "~/Login.aspx");
            routes.MapPageRoute("Register", "Register", "~/Register.aspx");
            routes.MapPageRoute("Category", "Category", "~/Category.aspx");
            routes.MapPageRoute("Details", "Details", "~/Details.aspx");
            routes.MapPageRoute("Basket", "Basket", "~/Basket.aspx");
            routes.MapPageRoute("Payment", "Payment", "~/Payment.aspx");
            routes.MapPageRoute("Location", "Location", "~/Localtion.aspx");
        }
    }
}