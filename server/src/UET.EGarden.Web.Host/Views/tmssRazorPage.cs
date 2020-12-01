using Abp.AspNetCore.Mvc.Views;

namespace UET.EGarden.Web.Views
{
    public abstract class EGardenRazorPage<TModel> : AbpRazorPage<TModel>
    {
        protected EGardenRazorPage()
        {
            LocalizationSourceName =EGardenConsts.LocalizationSourceName;
        }
    }
}
