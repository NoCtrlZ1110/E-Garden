﻿using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Configuration;
using Abp.Dependency;
using Abp.Runtime.Session;
using UET.EGarden.Authorization;
using UET.EGarden.Configuration.Dto;
using UET.EGarden.UiCustomization;

namespace UET.EGarden.Configuration
{
    [AbpAuthorize]
    public class UiCustomizationSettingsAppService : EGardenAppServiceBase, IUiCustomizationSettingsAppService
    {
        private readonly SettingManager _settingManager;
        private readonly IIocResolver _iocResolver;
        private readonly IUiThemeCustomizerFactory _uiThemeCustomizerFactory;

        public UiCustomizationSettingsAppService(
            SettingManager settingManager,
            IIocResolver iocResolver,
            IUiThemeCustomizerFactory uiThemeCustomizerFactory
        )
        {
            _settingManager = settingManager;
            _iocResolver = iocResolver;
            _uiThemeCustomizerFactory = uiThemeCustomizerFactory;
        }

        public async Task<List<ThemeSettingsDto>> GetUiManagementSettings()
        {
            var settings = new List<ThemeSettingsDto>();
            var themeCustomizers = _iocResolver.ResolveAll<IUiCustomizer>();

            foreach (var themeUiCustomizer in themeCustomizers)
            {
                var themeSettings = await themeUiCustomizer.GetUiSettings();
                settings.Add(themeSettings.BaseSettings);
            }

            return settings;
        }

        public async Task ChangeThemeWithDefaultValues(string themeName)
        {
            var settings = (await GetUiManagementSettings()).FirstOrDefault(s => s.Theme == themeName);

            var hasUiCustomizationPagePermission = await PermissionChecker.IsGrantedAsync(AppPermissions.Pages_Administration_UiCustomization);

            if (hasUiCustomizationPagePermission)
            {
                await UpdateDefaultUiManagementSettings(settings);
            }
            else
            {
                await UpdateUiManagementSettings(settings);
            }
        }

        public async Task UpdateUiManagementSettings(ThemeSettingsDto settings)
        {
            var themeCustomizer = _uiThemeCustomizerFactory.GetUiCustomizer(settings.Theme);
            await themeCustomizer.UpdateUserUiManagementSettingsAsync(AbpSession.ToUserIdentifier(), settings);
        }

        public async Task UpdateDefaultUiManagementSettings(ThemeSettingsDto settings)
        {
            var themeCustomizer = _uiThemeCustomizerFactory.GetUiCustomizer(settings.Theme);

            if (AbpSession.TenantId.HasValue)
            {
                await themeCustomizer.UpdateTenantUiManagementSettingsAsync(AbpSession.TenantId.Value, settings);
            }
            else
            {
                await themeCustomizer.UpdateApplicationUiManagementSettingsAsync(settings);
            }
        }

        public async Task UseSystemDefaultSettings()
        {
            if (AbpSession.TenantId.HasValue)
            {
                var theme = await _settingManager.GetSettingValueForTenantAsync(AppSettings.UiManagement.Theme, AbpSession.TenantId.Value);
                var themeCustomizer = _uiThemeCustomizerFactory.GetUiCustomizer(theme);
                var settings = await themeCustomizer.GetTenantUiCustomizationSettings(AbpSession.TenantId.Value);
                await themeCustomizer.UpdateUserUiManagementSettingsAsync(AbpSession.ToUserIdentifier(), settings);
            }
            else
            {
                var theme = await _settingManager.GetSettingValueForApplicationAsync(AppSettings.UiManagement.Theme);
                var themeCustomizer = _uiThemeCustomizerFactory.GetUiCustomizer(theme);
                var settings = await themeCustomizer.GetHostUiManagementSettings();
                await themeCustomizer.UpdateUserUiManagementSettingsAsync(AbpSession.ToUserIdentifier(), settings);
            }
        }
    }
}