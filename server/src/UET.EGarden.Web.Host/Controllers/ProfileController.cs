using Abp.AspNetCore.Mvc.Authorization;
using UET.EGarden.Storage;

namespace UET.EGarden.Web.Controllers
{
    [AbpMvcAuthorize]
    public class ProfileController : ProfileControllerBase
    {
        public ProfileController(ITempFileCacheManager tempFileCacheManager) :
            base(tempFileCacheManager)
        {
        }
    }
}