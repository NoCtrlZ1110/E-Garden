using Microsoft.Extensions.Configuration;
using Castle.MicroKernel.Registration;
using Abp.Events.Bus;
using Abp.Modules;
using Abp.Reflection.Extensions;
using UET.EasyAccommod.Configuration;
using UET.EasyAccommod.EntityFrameworkCore;
using UET.EasyAccommod.Migrator.DependencyInjection;

namespace UET.EasyAccommod.Migrator
{
    [DependsOn(typeof(EasyAccommodEntityFrameworkModule))]
    public class EasyAccommodMigratorModule : AbpModule
    {
        private readonly IConfigurationRoot _appConfiguration;

        public EasyAccommodMigratorModule(EasyAccommodEntityFrameworkModule EasyAccommodEntityFrameworkModule)
        {
            EasyAccommodEntityFrameworkModule.SkipDbSeed = true;

            _appConfiguration = AppConfigurations.Get(
                typeof(EasyAccommodMigratorModule).GetAssembly().GetDirectoryPathOrNull()
            );
        }

        public override void PreInitialize()
        {
            Configuration.DefaultNameOrConnectionString = _appConfiguration.GetConnectionString(
                EasyAccommodConsts.ConnectionStringName
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
            IocManager.RegisterAssemblyByConvention(typeof(EasyAccommodMigratorModule).GetAssembly());
            ServiceCollectionRegistrar.Register(IocManager);
        }
    }
}
