using Microsoft.Extensions.Configuration;
using Castle.MicroKernel.Registration;
using Abp.Events.Bus;
using Abp.Modules;
using Abp.Reflection.Extensions;
using UET.EGarden.Configuration;
using UET.EGarden.EntityFrameworkCore;
using UET.EGarden.Migrator.DependencyInjection;

namespace UET.EGarden.Migrator
{
    [DependsOn(typeof(EGardenEntityFrameworkModule))]
    public class EGardenMigratorModule : AbpModule
    {
        private readonly IConfigurationRoot _appConfiguration;

        public EGardenMigratorModule(EGardenEntityFrameworkModule EGardenEntityFrameworkModule)
        {
            EGardenEntityFrameworkModule.SkipDbSeed = true;

            _appConfiguration = AppConfigurations.Get(
                typeof(EGardenMigratorModule).GetAssembly().GetDirectoryPathOrNull()
            );
        }

        public override void PreInitialize()
        {
            Configuration.DefaultNameOrConnectionString = _appConfiguration.GetConnectionString(
                EGardenConsts.ConnectionStringName
            );

            Configuration.BackgroundJobs.IsJobExecutionEnabled = false;
            Configuration.ReplaceService(
                typeof(IEventBus), 
                () => IocManager.IocContainer.Register(
                    Component.For<IEventBus>().Instance(NullEventBus.Instance)
                )
            );
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(EGardenMigratorModule).GetAssembly());
            ServiceCollectionRegistrar.Register(IocManager);
        }
    }
}
