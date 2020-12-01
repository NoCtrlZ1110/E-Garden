using Abp.Modules;
using Abp.Reflection.Extensions;

namespace tmss
{
    [DependsOn(typeof(tmssXamarinSharedModule))]
    public class tmssXamarinAndroidModule : AbpModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(tmssXamarinAndroidModule).GetAssembly());
        }
    }
}