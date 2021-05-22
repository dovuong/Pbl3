using System.Web.Mvc;

namespace FreeCy.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Admin_404",
                "Admin/LoginAreas/Login/",
                new { action = "Login", controller = "Login", id = UrlParameter.Optional }
            );
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index",controller="Home" ,id = UrlParameter.Optional }
            );
        }
    }
}