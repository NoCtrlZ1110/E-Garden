using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Abp.Modules;
using Abp.Reflection.Extensions;
using UET.EasyAccommod.Configuration;

namespace UET.EasyAccommod.Web.Host.Startup
{
    [DependsOn(
       typeof(EasyAccommodWebCoreModule))]
    public class EasyAccommodWebHostModule: AbpModule
    {
        private readonly IWebHostEnvironment _env;
        private readonly IConfigurationRoot _appConfiguration;

        public EasyAccommodWebHostModule(IWebHostEnvironment env)
        {
            _env = env;
            _appConfiguration = env.GetAppConfiguration();
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EasyAccommodWebHostModule).GetAssembly());
        }
    }
}
