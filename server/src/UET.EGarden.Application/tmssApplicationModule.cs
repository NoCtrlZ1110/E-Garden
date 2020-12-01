using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;
using UET.EGarden.Authorization;

namespace UET.EGarden
{
    /// <summary>
    /// Application layer module of the application.
    /// </summary>
    [DependsOn(
        typeof(EGardenApplicationSharedModule),
        typeof(EGardenCoreModule)
        )]
    public class EGardenApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            //Adding authorization providers
            Configuration.Authorization.Providers.Add<AppAuthorizationProvider>();

            //Adding custom AutoMapper configuration
            Configuration.Modules.AbpAutoMapper().Configurators.Add(CustomDtoMapper.CreateMappings);
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EGardenApplicationModule).GetAssembly());
        }
    }
}