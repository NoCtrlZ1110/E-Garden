using Abp.AspNetZeroCore;
using Abp.Events.Bus;
using Abp.Modules;
using Abp.Reflection.Extensions;
using Castle.MicroKernel.Registration;
using Microsoft.Extensions.Configuration;
using UET.EGarden.Configuration;
using UET.EGarden.EntityFrameworkCore;
using UET.EGarden.Migrator.DependencyInjection;

namespace UET.EGarden.Migrator
{
    [DependsOn(typeof(EGardenEntityFrameworkCoreModule))]
    public class EGardenMigratorModule : AbpModule
    {
        private readonly IConfigurationRoot _appConfiguration;

        public EGardenMigratorModule(EGardenEntityFrameworkCoreModule abpZeroTemplateEntityFrameworkCoreModule)
        {
            abpZeroTemplateEntityFrameworkCoreModule.SkipDbSeed = true;

            _appConfiguration = AppConfigurations.Get(
                typeof(EGardenMigratorModule).GetAssembly().GetDirectoryPathOrNull(), addUserSecrets: true
            );
        }

        public override void PreInitialize()
        {
            Configuration.DefaultNameOrConnectionString = _appConfiguration.GetConnectionString(
               EGardenConsts.ConnectionStringName
                );
            Configuration.Modules.AspNetZero().LicenseCode = _appConfiguration["AbpZeroLicenseCode"];

            Configuration.BackgroundJobs.IsJobExecutionEnabled = false;
            Configuration.ReplaceService(typeof(IEventBus), () =>
            {
                IocManager.IocContainer.Register(
                    Component.For<IEventBus>().Instance(NullEventBus.Instance)
                );
            });
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EGardenMigratorModule).GetAssembly());
            ServiceCollectionRegistrar.Register(IocManager);
        }
    }
}