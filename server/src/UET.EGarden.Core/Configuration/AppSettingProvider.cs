﻿using System.Collections.Generic;
using System.Linq;
using Abp.Configuration;
using Abp.Net.Mail;
using Abp.Zero.Configuration;
using Microsoft.Extensions.Configuration;
using UET.EGarden.DashboardCustomization;
using Newtonsoft.Json;

namespace UET.EGarden.Configuration
{
    /// <summary>
    /// Defines settings for the application.
    /// See <see cref="AppSettings"/> for setting names.
    /// </summary>
    public class AppSettingProvider : SettingProvider
    {
        private readonly IConfigurationRoot _appConfiguration;

        public AppSettingProvider(IAppConfigurationAccessor configurationAccessor)
        {
            _appConfiguration = configurationAccessor.Configuration;
        }

        public override IEnumerable<SettingDefinition> GetSettingDefinitions(SettingDefinitionProviderContext context)
        {
            // Disable TwoFactorLogin by default (can be enabled by UI)
            context.Manager.GetSettingDefinition(AbpZeroSettingNames.UserManagement.TwoFactorLogin.IsEnabled).DefaultValue = false.ToString().ToLowerInvariant();

            // Change scope of Email settings
            ChangeEmailSettingScopes(context);

            return GetHostSettings().Union(GetTenantSettings()).Union(GetSharedSettings())
                // theme settings
                .Union(GetDefaultThemeSettings())
                .Union(GetTheme2Settings())
                .Union(GetTheme3Settings())
                .Union(GetTheme4Settings())
                .Union(GetTheme5Settings())
                .Union(GetTheme6Settings())
                .Union(GetTheme7Settings())
                .Union(GetTheme8Settings())
                .Union(GetTheme9Settings())
                .Union(GetTheme10Settings())
                .Union(GetTheme11Settings())
                .Union(GetTheme12Settings())
                .Union(GetDashboardSettings());
        }

        private void ChangeEmailSettingScopes(SettingDefinitionProviderContext context)
        {
            if (!EGardenConsts.AllowTenantsToChangeEmailSettings)
            {
                context.Manager.GetSettingDefinition(EmailSettingNames.Smtp.Host).Scopes = SettingScopes.Application;
                context.Manager.GetSettingDefinition(EmailSettingNames.Smtp.Port).Scopes = SettingScopes.Application;
                context.Manager.GetSettingDefinition(EmailSettingNames.Smtp.UserName).Scopes = SettingScopes.Application;
                context.Manager.GetSettingDefinition(EmailSettingNames.Smtp.Password).Scopes = SettingScopes.Application;
                context.Manager.GetSettingDefinition(EmailSettingNames.Smtp.Domain).Scopes = SettingScopes.Application;
                context.Manager.GetSettingDefinition(EmailSettingNames.Smtp.EnableSsl).Scopes = SettingScopes.Application;
                context.Manager.GetSettingDefinition(EmailSettingNames.Smtp.UseDefaultCredentials).Scopes = SettingScopes.Application;
                context.Manager.GetSettingDefinition(EmailSettingNames.DefaultFromAddress).Scopes = SettingScopes.Application;
                context.Manager.GetSettingDefinition(EmailSettingNames.DefaultFromDisplayName).Scopes = SettingScopes.Application;
            }
        }

        private IEnumerable<SettingDefinition> GetHostSettings()
        {
            return new[] {
                new SettingDefinition(AppSettings.TenantManagement.AllowSelfRegistration, GetFromAppSettings(AppSettings.TenantManagement.AllowSelfRegistration, "true"), isVisibleToClients: true),
                new SettingDefinition(AppSettings.TenantManagement.IsNewRegisteredTenantActiveByDefault, GetFromAppSettings(AppSettings.TenantManagement.IsNewRegisteredTenantActiveByDefault, "false")),
                new SettingDefinition(AppSettings.TenantManagement.UseCaptchaOnRegistration, GetFromAppSettings(AppSettings.TenantManagement.UseCaptchaOnRegistration, "true"), isVisibleToClients: true),
                new SettingDefinition(AppSettings.TenantManagement.DefaultEdition, GetFromAppSettings(AppSettings.TenantManagement.DefaultEdition, "")),
                new SettingDefinition(AppSettings.UserManagement.SmsVerificationEnabled, GetFromAppSettings(AppSettings.UserManagement.SmsVerificationEnabled, "false"), isVisibleToClients: true),
                new SettingDefinition(AppSettings.TenantManagement.SubscriptionExpireNotifyDayCount, GetFromAppSettings(AppSettings.TenantManagement.SubscriptionExpireNotifyDayCount, "7"), isVisibleToClients: true),
                new SettingDefinition(AppSettings.HostManagement.BillingLegalName, GetFromAppSettings(AppSettings.HostManagement.BillingLegalName, "")),
                new SettingDefinition(AppSettings.HostManagement.BillingAddress, GetFromAppSettings(AppSettings.HostManagement.BillingAddress, "")),
                new SettingDefinition(AppSettings.Recaptcha.SiteKey, GetFromSettings("Recaptcha:SiteKey"), isVisibleToClients: true),
                new SettingDefinition(AppSettings.UiManagement.Theme, GetFromAppSettings(AppSettings.UiManagement.Theme, "default"), isVisibleToClients: true, scopes: SettingScopes.All),
            };
        }

        private IEnumerable<SettingDefinition> GetTenantSettings()
        {
            return new[]
            {
                new SettingDefinition(AppSettings.UserManagement.AllowSelfRegistration, GetFromAppSettings(AppSettings.UserManagement.AllowSelfRegistration, "true"), scopes: SettingScopes.Tenant, isVisibleToClients: true),
                new SettingDefinition(AppSettings.UserManagement.IsNewRegisteredUserActiveByDefault, GetFromAppSettings(AppSettings.UserManagement.IsNewRegisteredUserActiveByDefault, "false"), scopes: SettingScopes.Tenant),
                new SettingDefinition(AppSettings.UserManagement.UseCaptchaOnRegistration, GetFromAppSettings(AppSettings.UserManagement.UseCaptchaOnRegistration, "true"), scopes: SettingScopes.Tenant, isVisibleToClients: true),
                new SettingDefinition(AppSettings.TenantManagement.BillingLegalName, GetFromAppSettings(AppSettings.TenantManagement.BillingLegalName, ""), scopes: SettingScopes.Tenant),
                new SettingDefinition(AppSettings.TenantManagement.BillingAddress, GetFromAppSettings(AppSettings.TenantManagement.BillingAddress, ""), scopes: SettingScopes.Tenant),
                new SettingDefinition(AppSettings.TenantManagement.BillingTaxVatNo, GetFromAppSettings(AppSettings.TenantManagement.BillingTaxVatNo, ""), scopes: SettingScopes.Tenant),
                new SettingDefinition(AppSettings.Email.UseHostDefaultEmailSettings, GetFromAppSettings(AppSettings.Email.UseHostDefaultEmailSettings, EGardenConsts.MultiTenancyEnabled? "true":"false"), scopes: SettingScopes.Tenant)
            };
        }

        private IEnumerable<SettingDefinition> GetSharedSettings()
        {
            return new[]
            {
                new SettingDefinition(AppSettings.UserManagement.TwoFactorLogin.IsGoogleAuthenticatorEnabled, GetFromAppSettings(AppSettings.UserManagement.TwoFactorLogin.IsGoogleAuthenticatorEnabled, "false"), scopes: SettingScopes.Application | SettingScopes.Tenant, isVisibleToClients: true),
                new SettingDefinition(AppSettings.UserManagement.IsCookieConsentEnabled, GetFromAppSettings(AppSettings.UserManagement.IsCookieConsentEnabled, "false"), scopes: SettingScopes.Application | SettingScopes.Tenant, isVisibleToClients: true),
                new SettingDefinition(AppSettings.UserManagement.IsQuickThemeSelectEnabled, GetFromAppSettings(AppSettings.UserManagement.IsQuickThemeSelectEnabled, "false"), scopes: SettingScopes.Application | SettingScopes.Tenant, isVisibleToClients: true),
                new SettingDefinition(AppSettings.UserManagement.UseCaptchaOnLogin, GetFromAppSettings(AppSettings.UserManagement.UseCaptchaOnLogin, "false"), scopes: SettingScopes.Application | SettingScopes.Tenant, isVisibleToClients: true),
                new SettingDefinition(AppSettings.UserManagement.SessionTimeOut.IsEnabled, GetFromAppSettings(AppSettings.UserManagement.SessionTimeOut.IsEnabled, "false"), isVisibleToClients: true, scopes: SettingScopes.Application | SettingScopes.Tenant),
                new SettingDefinition(AppSettings.UserManagement.SessionTimeOut.TimeOutSecond, GetFromAppSettings(AppSettings.UserManagement.SessionTimeOut.TimeOutSecond, "30"), isVisibleToClients: true, scopes: SettingScopes.Application | SettingScopes.Tenant),
                new SettingDefinition(AppSettings.UserManagement.SessionTimeOut.ShowTimeOutNotificationSecond, GetFromAppSettings(AppSettings.UserManagement.SessionTimeOut.ShowTimeOutNotificationSecond, "30"), isVisibleToClients: true, scopes: SettingScopes.Application | SettingScopes.Tenant),
                new SettingDefinition(AppSettings.UserManagement.SessionTimeOut.ShowLockScreenWhenTimedOut, GetFromAppSettings(AppSettings.UserManagement.SessionTimeOut.ShowLockScreenWhenTimedOut, "false"), isVisibleToClients: true, scopes: SettingScopes.Application | SettingScopes.Tenant),
                new SettingDefinition(AppSettings.UserManagement.AllowOneConcurrentLoginPerUser, GetFromAppSettings(AppSettings.UserManagement.AllowOneConcurrentLoginPerUser, "false"), isVisibleToClients: true, scopes: SettingScopes.Application | SettingScopes.Tenant)
            };
        }

        private string GetFromAppSettings(string name, string defaultValue = null)
        {
            return GetFromSettings("App:" + name, defaultValue);
        }

        private string GetFromSettings(string name, string defaultValue = null)
        {
            return _appConfiguration[name] ?? defaultValue;
        }

        private IEnumerable<SettingDefinition> GetDefaultThemeSettings()
        {
            var themeName = "default";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Header.DesktopFixedHeader, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.Skin, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Header.Skin, "light"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Fixed, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Fixed, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Style, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Style, "solid"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LeftAside.AsideSkin, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.LeftAside.AsideSkin, "light"), isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LeftAside.FixedAside, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.LeftAside.FixedAside, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LeftAside.AllowAsideMinimizing, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.LeftAside.AllowAsideMinimizing, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LeftAside.DefaultMinimizedAside, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.LeftAside.DefaultMinimizedAside, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LeftAside.SubmenuToggle, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.LeftAside.SubmenuToggle, "false"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Footer.FixedFooter, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Footer.FixedFooter, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetTheme2Settings()
        {
            var themeName = "theme2";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LayoutType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.LayoutType, "fixed"), isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MinimizeType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MinimizeType, "topbar"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MenuArrows, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MenuArrows, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetTheme3Settings()
        {
            var themeName = "theme3";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Fixed, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Fixed, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Style, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Style, "solid"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Footer.FixedFooter, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Footer.FixedFooter, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetTheme4Settings()
        {
            var themeName = "theme4";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LayoutType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.LayoutType, "fixed"), isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MinimizeType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MinimizeType, "menu"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MenuArrows, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MenuArrows, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
          };
        }

        private IEnumerable<SettingDefinition> GetTheme5Settings()
        {
            var themeName = "theme5";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LayoutType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.LayoutType, "fixed"), isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MinimizeType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MinimizeType, "menu"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MenuArrows, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MenuArrows, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Footer.FixedFooter, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Footer.FixedFooter, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
          };
        }

        private IEnumerable<SettingDefinition> GetTheme6Settings()
        {
            var themeName = "theme6";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Fixed, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Fixed, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Style, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Style, "solid"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Footer.FixedFooter, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Footer.FixedFooter, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetTheme7Settings()
        {
            var themeName = "theme7";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Fixed, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Fixed, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Style, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Style, "solid"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Footer.FixedFooter, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Footer.FixedFooter, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetTheme8Settings()
        {
            var themeName = "theme8";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LayoutType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.LayoutType, "fluid"), isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetTheme9Settings()
        {
            var themeName = "theme9";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LayoutType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.LayoutType, "fixed"), isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "true"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetTheme10Settings()
        {
            var themeName = "theme10";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LayoutType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.LayoutType, "fixed"), isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetTheme11Settings()
        {
            var themeName = "theme11";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LayoutType, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.LayoutType, "fluid"), isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LeftAside.FixedAside, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.LeftAside.FixedAside, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetTheme12Settings()
        {
            var themeName = "theme12";

            return new[]
            {
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.DesktopFixedHeader, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Header.DesktopFixedHeader, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Header.MobileFixedHeader, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Header.MobileFixedHeader, "false"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Fixed, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Fixed, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SubHeader.Style, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SubHeader.Style, "solid"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LeftAside.FixedAside, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.LeftAside.FixedAside, "true"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.LeftAside.SubmenuToggle, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.LeftAside.SubmenuToggle, "false"),isVisibleToClients: true, scopes: SettingScopes.All),

                new SettingDefinition(themeName + "." + AppSettings.UiManagement.Footer.FixedFooter, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.Footer.FixedFooter, "false"),isVisibleToClients: true, scopes: SettingScopes.All),
                new SettingDefinition(themeName + "." + AppSettings.UiManagement.SearchActive, GetFromAppSettings(themeName + "." +AppSettings.UiManagement.SearchActive, "false"),isVisibleToClients: true, scopes: SettingScopes.All)
            };
        }

        private IEnumerable<SettingDefinition> GetDashboardSettings()
        {
            var mvcDefaultSettings = GetDefaultMvcDashboardViews();
            var mvcDefaultSettingsJson = JsonConvert.SerializeObject(mvcDefaultSettings);

            var angularDefaultSettings = GetDefaultAngularDashboardViews();
            var angularDefaultSettingsJson = JsonConvert.SerializeObject(angularDefaultSettings);

            return new[]
            {
                new SettingDefinition(AppSettings.DashboardCustomization.Configuration +"."+ EGardenDashboardCustomizationConsts.Applications.Mvc, mvcDefaultSettingsJson, scopes: SettingScopes.User, isVisibleToClients: true),
                new SettingDefinition(AppSettings.DashboardCustomization.Configuration +"."+ EGardenDashboardCustomizationConsts.Applications.Angular, angularDefaultSettingsJson, scopes: SettingScopes.User, isVisibleToClients: true)
            };
        }

        public List<Dashboard> GetDefaultMvcDashboardViews()
        {
            //It is the default dashboard view which your user will see if they don't do any customization.
            return new List<Dashboard>
            {
                new Dashboard
                {
                    DashboardName = EGardenDashboardCustomizationConsts.DashboardNames.DefaultTenantDashboard,
                    Pages = new List<Page>
                    {
                        new Page
                        {
                            Name = EGardenDashboardCustomizationConsts.DefaultPageName,
                            Widgets = new List<Widget>
                            {
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.GeneralStats, // General Stats
                                    Height = 9,
                                    Width = 6,
                                    PositionX = 0,
                                    PositionY = 19
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.ProfitShare, // Profit Share
                                    Height = 13,
                                    Width = 6,
                                    PositionX = 0,
                                    PositionY = 28
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.MemberActivity, // Memeber Activity
                                    Height = 13,
                                    Width = 6,
                                    PositionX = 6,
                                    PositionY = 28
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.RegionalStats, // Regional Stats
                                    Height = 14,
                                    Width = 6,
                                    PositionX = 6,
                                    PositionY = 5
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.DailySales, // Daily Sales
                                    Height = 9,
                                    Width = 6,
                                    PositionX = 6,
                                    PositionY = 19
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.TopStats, // Top Stats
                                    Height = 5,
                                    Width = 12,
                                    PositionX = 0,
                                    PositionY = 0
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.SalesSummary, // Sales Summary
                                    Height = 14,
                                    Width = 6,
                                    PositionX = 0,
                                    PositionY = 5
                                }
                            }
                        }
                    }
                },
                new Dashboard
                {
                    DashboardName = EGardenDashboardCustomizationConsts.DashboardNames.DefaultHostDashboard,
                    Pages = new List<Page>
                    {
                        new Page
                        {
                            Name = EGardenDashboardCustomizationConsts.DefaultPageName,
                            Widgets = new List<Widget>
                            {
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Host.TopStats, // Top Stats
                                    Height = 6,
                                    Width = 12,
                                    PositionX = 0,
                                    PositionY = 0
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Host.IncomeStatistics, // Income Statistics
                                    Height = 11,
                                    Width = 7,
                                    PositionX = 0,
                                    PositionY = 6
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Host.RecentTenants, // Recent tenants
                                    Height = 10,
                                    Width = 5,
                                    PositionX = 7,
                                    PositionY = 17
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Host.SubscriptionExpiringTenants, // Subscription expiring tenants
                                    Height = 10,
                                    Width = 7,
                                    PositionX = 0,
                                    PositionY = 17
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Host.EditionStatistics, // Edition statistics
                                    Height = 11,
                                    Width = 5,
                                    PositionX = 7,
                                    PositionY = 6
                                }
                            }
                        }
                    }
                }
            };
        }

        public List<Dashboard> GetDefaultAngularDashboardViews()
        {
            //It is the default dashboard view which your user will see if they don't do any customization.
            return new List<Dashboard>
            {
                new Dashboard
                {
                    DashboardName = EGardenDashboardCustomizationConsts.DashboardNames.DefaultTenantDashboard,
                    Pages = new List<Page>
                    {
                        new Page
                        {
                            Name =  EGardenDashboardCustomizationConsts.DefaultPageName,
                            Widgets = new List<Widget>
                            {
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.TopStats, // Top Stats
                                    Height = 4,
                                    Width = 12,
                                    PositionX = 0,
                                    PositionY = 0
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.SalesSummary, // Sales Summary
                                    Height = 12,
                                    Width = 6,
                                    PositionX = 0,
                                    PositionY = 4
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.RegionalStats, // Regional Stats
                                    Height = 12,
                                    Width = 6,
                                    PositionX = 6,
                                    PositionY = 4
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.GeneralStats, // General Stats
                                    Height = 8,
                                    Width = 6,
                                    PositionX = 0,
                                    PositionY = 16
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.DailySales, // Daily Sales
                                    Height = 8,
                                    Width = 6,
                                    PositionX = 6,
                                    PositionY = 16
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.ProfitShare, // Profit Share
                                    Height = 11,
                                    Width = 6,
                                    PositionX = 0,
                                    PositionY = 24
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Tenant.MemberActivity, // Member Activity
                                    Height = 11,
                                    Width = 6,
                                    PositionX = 6,
                                    PositionY = 24
                                }
                            }
                        }
                    }
                },
                new Dashboard
                {
                    DashboardName = EGardenDashboardCustomizationConsts.DashboardNames.DefaultHostDashboard,
                    Pages = new List<Page>
                    {
                        new Page
                        {
                            Name =  EGardenDashboardCustomizationConsts.DefaultPageName,
                            Widgets = new List<Widget>
                            {
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Host.TopStats, // Top Stats
                                    Height = 4,
                                    Width = 12,
                                    PositionX = 0,
                                    PositionY = 0
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Host.IncomeStatistics, // Income Statistics
                                    Height = 8,
                                    Width = 7,
                                    PositionX = 0,
                                    PositionY = 4
                                },
                                new Widget
                                {
                                    WidgetId =
                                        EGardenDashboardCustomizationConsts.Widgets.Host.RecentTenants, // Recent tenants
                                    Height = 9,
                                    Width = 5,
                                    PositionX = 7,
                                    PositionY = 12
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Host.SubscriptionExpiringTenants, // Subscription expiring tenants
                                    Height = 9,
                                    Width = 7,
                                    PositionX = 0,
                                    PositionY = 12
                                },
                                new Widget
                                {
                                    WidgetId = EGardenDashboardCustomizationConsts.Widgets.Host.EditionStatistics, // Edition statistics
                                    Height = 8,
                                    Width = 5,
                                    PositionX = 7,
                                    PositionY = 4
                                }
                            }
                        }
                    }
                }
            };
        }
    }
}
