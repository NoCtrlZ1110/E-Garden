using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Abp.Modules;
using Abp.Reflection.Extensions;
using UET.EasyAccommod.Configuration;

namespace UET.EasyAccommod.Web.Startup
{
    [DependsOn(typeof(EasyAccommodWebCoreModule))]
    public class EasyAccommodWebMvcModule : AbpModule
    {
        private readonly IWebHostEnvironment _env;
        private readonly IConfigurationRoot _appConfiguration;

        public EasyAccommodWebMvcModule(IWebHostEnvironment env)
        {
            _env = env;
            _appConfiguration = env.GetAppConfiguration();
        }

        public override void PreInitialize()
        {
            Configuration.Navigation.Providers.Add<EasyAccommodNavigationProvider>();
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EasyAccommodWebMvcModule).GetAssembly());
        }
    }
}
