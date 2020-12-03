using Abp.AspNetCore.Mvc.Views;
using Abp.Runtime.Session;
using Microsoft.AspNetCore.Mvc.Razor.Internal;

namespace UET.EGarden.Web.Views
{
    public abstract class EGardenRazorPage<TModel> : AbpRazorPage<TModel>
    {
        [RazorInject]
        public IAbpSession AbpSession { get; set; }

        protected EGardenRazorPage()
        {
            LocalizationSourceName = EGardenConsts.LocalizationSourceName;
        }
    }
}
