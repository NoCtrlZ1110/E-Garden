using Microsoft.AspNetCore.Antiforgery;

namespace UET.EGarden.Web.Controllers
{
    public class AntiForgeryController : EGardenControllerBase
    {
        private readonly IAntiforgery _antiforgery;

        public AntiForgeryController(IAntiforgery antiforgery)
        {
            _antiforgery = antiforgery;
        }

        public void GetToken()
        {
            _antiforgery.SetCookieTokenAndHeader(HttpContext);
        }
    }
}
