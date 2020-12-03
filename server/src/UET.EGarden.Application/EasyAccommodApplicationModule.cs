using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;
using UET.EGarden.Authorization;

namespace UET.EGarden
{
    [DependsOn(
        typeof(EGardenCoreModule), 
        typeof(AbpAutoMapperModule))]
    public class EGardenApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Authorization.Providers.Add<EGardenAuthorizationProvider>();
            Configuration.Modules.AbpAutoMapper().Configurators.Add(CustomDtoMapper.CreateMappings);
        }

        public override void Initialize()
        {
            var thisAssembly = typeof(EGardenApplicationModule).GetAssembly();

            IocManager.RegisterAssemblyByConvention(thisAssembly);

            Configuration.Modules.AbpAutoMapper().Configurators.Add(
                // Scan the assembly for classes which inherit from AutoMapper.Profile
                cfg => cfg.AddMaps(thisAssembly)
            );
        }
    }
}
