using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Abp.Modules;
using Abp.Reflection.Extensions;
using UET.EGarden.Configuration;

namespace UET.EGarden.Web.Host.Startup
{
    [DependsOn(
       typeof(EGardenWebCoreModule))]
    public class EGardenWebHostModule: AbpModule
    {
        private readonly IWebHostEnvironment _env;
        private readonly IConfigurationRoot _appConfiguration;

        public EGardenWebHostModule(IWebHostEnvironment env)
        {
            _env = env;
            _appConfiguration = env.GetAppConfiguration();
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EGardenWebHostModule).GetAssembly());
        }
    }
}
