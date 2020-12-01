using Abp.Modules;
using Abp.Reflection.Extensions;

namespace tmss
{
    [DependsOn(typeof(tmssXamarinSharedModule))]
    public class tmssXamarinIosModule : AbpModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(tmssXamarinIosModule).GetAssembly());
        }
    }
}