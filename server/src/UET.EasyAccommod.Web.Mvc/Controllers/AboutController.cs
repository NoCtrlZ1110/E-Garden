using Microsoft.AspNetCore.Mvc;
using Abp.AspNetCore.Mvc.Authorization;
using UET.EasyAccommod.Controllers;

namespace UET.EasyAccommod.Web.Controllers
{
    [AbpMvcAuthorize]
    public class AboutController : EasyAccommodControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
	}
}
