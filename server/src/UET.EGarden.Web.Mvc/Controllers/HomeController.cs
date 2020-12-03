using Microsoft.AspNetCore.Mvc;
using Abp.AspNetCore.Mvc.Authorization;
using UET.EGarden.Controllers;

namespace UET.EGarden.Web.Controllers
{
    [AbpMvcAuthorize]
    public class HomeController : EGardenControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
