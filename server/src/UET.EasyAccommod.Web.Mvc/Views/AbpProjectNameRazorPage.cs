using Abp.AspNetCore.Mvc.Views;
using Abp.Runtime.Session;
using Microsoft.AspNetCore.Mvc.Razor.Internal;

namespace UET.EasyAccommod.Web.Views
{
    public abstract class EasyAccommodRazorPage<TModel> : AbpRazorPage<TModel>
    {
        [RazorInject]
        public IAbpSession AbpSession { get; set; }

        protected EasyAccommodRazorPage()
        {
            LocalizationSourceName = EasyAccommodConsts.LocalizationSourceName;
        }
    }
}
