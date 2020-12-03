using Abp.AspNetCore.Mvc.Controllers;
using Abp.IdentityFramework;
using Microsoft.AspNetCore.Identity;

namespace UET.EGarden.Controllers
{
    public abstract class EGardenControllerBase: AbpController
    {
        protected EGardenControllerBase()
        {
            LocalizationSourceName = EGardenConsts.LocalizationSourceName;
        }

        protected void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }
    }
}
