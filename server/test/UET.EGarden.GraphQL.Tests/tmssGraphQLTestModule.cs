using Abp.Modules;
using Abp.Reflection.Extensions;
using Castle.Windsor.MsDependencyInjection;
using Microsoft.Extensions.DependencyInjection;
using UET.EGarden.Configure;
using UET.EGarden.Startup;
using UET.EGarden.Test.Base;

namespace UET.EGarden.GraphQL.Tests
{
    [DependsOn(
        typeof(EGardenGraphQLModule),
        typeof(EGardenTestBaseModule))]
    public class EGardenGraphQLTestModule : AbpModule
    {
        public override void PreInitialize()
        {
            IServiceCollection services = new ServiceCollection();
            
            services.AddAndConfigureGraphQL();

            WindsorRegistrationHelper.CreateServiceProvider(IocManager.IocContainer, services);
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EGardenGraphQLTestModule).GetAssembly());
        }
    }
}