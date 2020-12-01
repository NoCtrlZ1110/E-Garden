using Abp.AspNetCore.Mvc.Authorization;
using UET.EGarden.Authorization;
using UET.EGarden.Storage;
using Abp.BackgroundJobs;

namespace UET.EGarden.Web.Controllers
{
    [AbpMvcAuthorize(AppPermissions.Pages_Administration_Users)]
    public class UsersController : UsersControllerBase
    {
        public UsersController(IBinaryObjectManager binaryObjectManager, IBackgroundJobManager backgroundJobManager)
            : base(binaryObjectManager, backgroundJobManager)
        {
        }
    }
}