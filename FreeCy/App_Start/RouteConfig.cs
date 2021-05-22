using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace FreeCy
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            
            routes.MapRoute(
                name: "JobList",
                url: "Home/ListProduct/",
                defaults: new { controller = "Home", action = "ListProduct" },
                namespaces: new[] { "FreeCy.Controllers" }
            );
            routes.MapRoute(
                name: "Product Detail",
                url: "Detail/ProductDetail/{productID}",
                defaults: new { controller = "Detail", action = "ProductDetail", productID = UrlParameter.Optional }
              
            );
            routes.MapRoute(
                name: "JobDetail",
                url: "Home/Detail/{productID}",
                defaults: new { controller = "Home", action = "Detail", productID = UrlParameter.Optional },
                namespaces: new[] { "FreeCy.Controllers" }
            );
            routes.MapRoute(
                 name: "Login",
                 url: "User/Login/",
                 defaults: new { controller = "User", action = "Login" },
                 namespaces: new[] { "FreeCy.Controllers" }
             );
            routes.MapRoute(
                 name: "Register",
                 url: "User/Register/",
                 defaults: new { controller = "User", action = "Register" },
                 namespaces: new[] { "FreeCy.Controllers" }
             );
            routes.MapRoute(
                name: "ForgotPassword",
                url: "User/ForgotPassword/",
                defaults: new { controller = "User", action = "ForgotPassword" },
                namespaces: new[] { "FreeCy.Controllers" }
            );
            
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "FreeCy.Controllers" }
            );
            //LoginFacebook
        }
    }
}
