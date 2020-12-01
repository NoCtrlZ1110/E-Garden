using Abp.Modules;
using Abp.Reflection.Extensions;

namespace tmss
{
    public class tmssClientModule : AbpModule
    {
        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(tmssClientModule).GetAssembly());
        }
    }
}
