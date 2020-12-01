﻿using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;

namespace tmss
{
    [DependsOn(typeof(tmssClientModule), typeof(AbpAutoMapperModule))]
    public class tmssXamarinSharedModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Localization.IsEnabled = false;
            Configuration.BackgroundJobs.IsJobExecutionEnabled = false;
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(tmssXamarinSharedModule).GetAssembly());
        }
    }
}