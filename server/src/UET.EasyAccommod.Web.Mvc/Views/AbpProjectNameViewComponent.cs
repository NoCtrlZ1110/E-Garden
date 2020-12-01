using Abp.AspNetCore.Mvc.ViewComponents;

namespace UET.EasyAccommod.Web.Views
{
    public abstract class EasyAccommodViewComponent : AbpViewComponent
    {
        protected EasyAccommodViewComponent()
        {
            LocalizationSourceName = EasyAccommodConsts.LocalizationSourceName;
        }
    }
}
