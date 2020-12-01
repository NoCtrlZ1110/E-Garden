using Abp.Auditing;
using Microsoft.AspNetCore.Mvc;

namespace UET.EGarden.Web.Controllers
{
    public class HomeController : EGardenControllerBase
    {
        [DisableAuditing]
        public IActionResult Index()
        {
            return RedirectToAction("Index", "Ui");
        }
    }
}
