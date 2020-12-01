using Abp.Modules;
using Abp.Reflection.Extensions;

namespace UET.EGarden
{
    [DependsOn(typeof(EGardenCoreSharedModule))]
    public class EGardenApplicationSharedModule : AbpModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EGardenApplicationSharedModule).GetAssembly());
        }
    }
}