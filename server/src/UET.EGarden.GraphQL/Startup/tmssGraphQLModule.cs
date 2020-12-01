using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;

namespace UET.EGarden.Startup
{
    [DependsOn(typeof(EGardenCoreModule))]
    public class EGardenGraphQLModule : AbpModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EGardenGraphQLModule).GetAssembly());
        }

        public override void PreInitialize()
        {
            base.PreInitialize();

            //Adding custom AutoMapper configuration
            Configuration.Modules.AbpAutoMapper().Configurators.Add(CustomDtoMapper.CreateMappings);
        }
    }
}