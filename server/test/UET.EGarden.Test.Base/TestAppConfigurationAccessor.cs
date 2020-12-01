using Abp.Dependency;
using Abp.Reflection.Extensions;
using Microsoft.Extensions.Configuration;
using UET.EGarden.Configuration;

namespace UET.EGarden.Test.Base
{
    public class TestAppConfigurationAccessor : IAppConfigurationAccessor, ISingletonDependency
    {
        public IConfigurationRoot Configuration { get; }

        public TestAppConfigurationAccessor()
        {
            Configuration = AppConfigurations.Get(
                typeof(EGardenTestBaseModule).GetAssembly().GetDirectoryPathOrNull()
            );
        }
    }
}
