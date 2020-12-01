using Abp.AspNetCore.Mvc.ViewComponents;

namespace UET.EGarden.Web.Public.Views
{
    public abstract class EGardenViewComponent : AbpViewComponent
    {
        protected EGardenViewComponent()
        {
            LocalizationSourceName =EGardenConsts.LocalizationSourceName;
        }
    }
}