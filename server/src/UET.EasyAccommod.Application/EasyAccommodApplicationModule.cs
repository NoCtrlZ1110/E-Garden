using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;
using UET.EasyAccommod.Authorization;

namespace UET.EasyAccommod
{
    [DependsOn(
        typeof(EasyAccommodCoreModule), 
        typeof(AbpAutoMapperModule))]
    public class EasyAccommodApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Authorization.Providers.Add<EasyAccommodAuthorizationProvider>();
            Configuration.Modules.AbpAutoMapper().Configurators.Add(CustomDtoMapper.CreateMappings);
        }

        public override void Initialize()
        {
            var thisAssembly = typeof(EasyAccommodApplicationModule).GetAssembly();

            IocManager.RegisterAssemblyByConvention(thisAssembly);

            Configuration.Modules.AbpAutoMapper().Configurators.Add(
                // Scan the assembly for classes which inherit from AutoMapper.Profile
                cfg => cfg.AddMaps(thisAssembly)
            );
        }
    }
}
