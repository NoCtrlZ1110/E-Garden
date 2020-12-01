using Abp.AspNetCore.Mvc.Controllers;
using Abp.IdentityFramework;
using Microsoft.AspNetCore.Identity;

namespace UET.EasyAccommod.Controllers
{
    public abstract class EasyAccommodControllerBase: AbpController
    {
        protected EasyAccommodControllerBase()
        {
            LocalizationSourceName = EasyAccommodConsts.LocalizationSourceName;
        }

        protected void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }
    }
}
