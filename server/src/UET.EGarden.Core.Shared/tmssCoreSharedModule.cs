using Abp.Modules;
using Abp.Reflection.Extensions;

namespace UET.EGarden
{
    public class EGardenCoreSharedModule : AbpModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EGardenCoreSharedModule).GetAssembly());
        }
    }
}