using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Quiz.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(  name: "CategoryProducts", url: "category-products", defaults: 
                                                                 new { controller = "Product", action = "Index" } );

            routes.MapRoute(  name: "Home",  url: "home", defaults: 
                                                                new { controller = "Home", action = "Index" } );

            routes.MapRoute( name: "Login", url: "login", defaults: 
                                                               new { controller = "Authentication", action = "Login" });

            routes.MapRoute( name: "Default",url: "{controller}/{action}/{id}", defaults: 
                                                              new { controller = "Authentication", action = "Login", id = UrlParameter.Optional }
            );
        }
    }
}
