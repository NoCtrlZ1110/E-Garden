using System.Threading.Tasks;
using Abp;
using Abp.Configuration;
using UET.EGarden.Configuration;
using UET.EGarden.Configuration.Dto;
using UET.EGarden.UiCustomization;
using UET.EGarden.UiCustomization.Dto;

namespace UET.EGarden.Web.UiCustomization.Metronic
{
    public class Theme12UiCustomizer : UiThemeCustomizerBase, IUiCustomizer
    {
        public Theme12UiCustomizer(ISettingManager settingManager)
            : base(settingManager, AppConsts.Theme12)
        {
        }

        public async Task<UiCustomizationSettingsDto> GetUiSettings()
        {
            var settings = new UiCustomizationSettingsDto
            {
                BaseSettings = new ThemeSettingsDto
                {
                    Header = new ThemeHeaderSettingsDto
                    {
                        DesktopFixedHeader = await GetSettingValueAsync<bool>(AppSettings.UiManagement.Header.DesktopFixedHeader),
                        MobileFixedHeader = await GetSettingValueAsync<bool>(AppSettings.UiManagement.Header.MobileFixedHeader)
                    },
                    SubHeader = new ThemeSubHeaderSettingsDto
                    {
                        FixedSubHeader = await GetSettingValueAsync<bool>(AppSettings.UiManagement.SubHeader.Fixed),
                        SubheaderStyle = await GetSettingValueAsync(AppSettings.UiManagement.SubHeader.Style),
                    },
                    Menu = new ThemeMenuSettingsDto
                    {
                        FixedAside = await GetSettingValueAsync<bool>(AppSettings.UiManagement.LeftAside.FixedAside),
                        SubmenuToggle = await GetSettingValueAsync(AppSettings.UiManagement.LeftAside.SubmenuToggle),
                        SearchActive = await GetSettingValueAsync<bool>(AppSettings.UiManagement.SearchActive)
                    },
                    Footer = new ThemeFooterSettingsDto
                    {
                        FixedFooter = await GetSettingValueAsync<bool>(AppSettings.UiManagement.Footer.FixedFooter)
                    }
                }
            };

            settings.BaseSettings.Theme = ThemeName;

            settings.BaseSettings.Layout.LayoutType = "fluid";

            settings.BaseSettings.Menu.Position = "left";
            settings.BaseSettings.Menu.AsideSkin = "dark";

            settings.BaseSettings.Header.HeaderSkin = "dark";

            settings.IsLeftMenuUsed = true;
            settings.IsTopMenuUsed = false;
            settings.IsTabMenuUsed = false;

            return settings;
        }

        public async Task UpdateUserUiManagementSettingsAsync(UserIdentifier user, ThemeSettingsDto settings)
        {
            await SettingManager.ChangeSettingForUserAsync(user, AppSettings.UiManagement.Theme, ThemeName);

            await ChangeSettingForUserAsync(user, AppSettings.UiManagement.Header.DesktopFixedHeader, settings.Header.DesktopFixedHeader.ToString());
            await ChangeSettingForUserAsync(user, AppSettings.UiManagement.Header.MobileFixedHeader, settings.Header.MobileFixedHeader.ToString());
            await ChangeSettingForUserAsync(user, AppSettings.UiManagement.SubHeader.Fixed, settings.SubHeader.FixedSubHeader.ToString());
            await ChangeSettingForUserAsync(user, AppSettings.UiManagement.SubHeader.Style, settings.SubHeader.SubheaderStyle);
            await ChangeSettingForUserAsync(user, AppSettings.UiManagement.LeftAside.FixedAside, settings.Menu.FixedAside.ToString());
            await ChangeSettingForUserAsync(user, AppSettings.UiManagement.LeftAside.SubmenuToggle, settings.Menu.SubmenuToggle);
            await ChangeSettingForUserAsync(user, AppSettings.UiManagement.Footer.FixedFooter, settings.Footer.FixedFooter.ToString());
            await ChangeSettingForUserAsync(user, AppSettings.UiManagement.SearchActive, settings.Menu.SearchActive.ToString());
        }

        public async Task UpdateTenantUiManagementSettingsAsync(int tenantId, ThemeSettingsDto settings)
        {
            await SettingManager.ChangeSettingForTenantAsync(tenantId, AppSettings.UiManagement.Theme, ThemeName);

            await ChangeSettingForTenantAsync(tenantId, AppSettings.UiManagement.Header.DesktopFixedHeader, settings.Header.DesktopFixedHeader.ToString());
            await ChangeSettingForTenantAsync(tenantId, AppSettings.UiManagement.Header.MobileFixedHeader, settings.Header.MobileFixedHeader.ToString());
            await ChangeSettingForTenantAsync(tenantId, AppSettings.UiManagement.SubHeader.Fixed, settings.SubHeader.FixedSubHeader.ToString());
            await ChangeSettingForTenantAsync(tenantId, AppSettings.UiManagement.SubHeader.Style, settings.SubHeader.SubheaderStyle);
            await ChangeSettingForTenantAsync(tenantId, AppSettings.UiManagement.LeftAside.FixedAside, settings.Menu.FixedAside.ToString());
            await ChangeSettingForTenantAsync(tenantId, AppSettings.UiManagement.LeftAside.SubmenuToggle, settings.Menu.SubmenuToggle);
            await ChangeSettingForTenantAsync(tenantId, AppSettings.UiManagement.Footer.FixedFooter, settings.Footer.FixedFooter.ToString());
            await ChangeSettingForTenantAsync(tenantId, AppSettings.UiManagement.SearchActive, settings.Menu.SearchActive.ToString());
        }

        public async Task UpdateApplicationUiManagementSettingsAsync(ThemeSettingsDto settings)
        {
            await SettingManager.ChangeSettingForApplicationAsync(AppSettings.UiManagement.Theme, ThemeName);

            await ChangeSettingForApplicationAsync(AppSettings.UiManagement.Header.DesktopFixedHeader, settings.Header.DesktopFixedHeader.ToString());
            await ChangeSettingForApplicationAsync(AppSettings.UiManagement.Header.MobileFixedHeader, settings.Header.MobileFixedHeader.ToString());
            await ChangeSettingForApplicationAsync(AppSettings.UiManagement.SubHeader.Fixed, settings.SubHeader.FixedSubHeader.ToString());
            await ChangeSettingForApplicationAsync(AppSettings.UiManagement.SubHeader.Style, settings.SubHeader.SubheaderStyle);
            await ChangeSettingForApplicationAsync(AppSettings.UiManagement.LeftAside.FixedAside, settings.Menu.FixedAside.ToString());
            await ChangeSettingForApplicationAsync(AppSettings.UiManagement.LeftAside.SubmenuToggle, settings.Menu.SubmenuToggle);
            await ChangeSettingForApplicationAsync(AppSettings.UiManagement.Footer.FixedFooter, settings.Footer.FixedFooter.ToString());
            await ChangeSettingForApplicationAsync(AppSettings.UiManagement.SearchActive, settings.Menu.SearchActive.ToString());
        }

        public async Task<ThemeSettingsDto> GetHostUiManagementSettings()
        {
            var theme = await SettingManager.GetSettingValueForApplicationAsync(AppSettings.UiManagement.Theme);

            return new ThemeSettingsDto
            {
                Theme = theme,
                Header = new ThemeHeaderSettingsDto
                {
                    DesktopFixedHeader = await GetSettingValueForApplicationAsync<bool>(AppSettings.UiManagement.Header.DesktopFixedHeader),
                    MobileFixedHeader = await GetSettingValueForApplicationAsync<bool>(AppSettings.UiManagement.Header.MobileFixedHeader)
                },
                SubHeader = new ThemeSubHeaderSettingsDto
                {
                    FixedSubHeader = await GetSettingValueForApplicationAsync<bool>(AppSettings.UiManagement.SubHeader.Fixed),
                    SubheaderStyle = await GetSettingValueForApplicationAsync(AppSettings.UiManagement.SubHeader.Style),
                },
                Menu = new ThemeMenuSettingsDto
                {
                    FixedAside = await GetSettingValueForApplicationAsync<bool>(AppSettings.UiManagement.LeftAside.FixedAside),
                    SubmenuToggle = await GetSettingValueForApplicationAsync(AppSettings.UiManagement.LeftAside.SubmenuToggle),
                    SearchActive = await GetSettingValueForApplicationAsync<bool>(AppSettings.UiManagement.SearchActive)
                },
                Footer = new ThemeFooterSettingsDto
                {
                    FixedFooter = await GetSettingValueForApplicationAsync<bool>(AppSettings.UiManagement.Footer.FixedFooter)
                }
            };
        }

        public async Task<ThemeSettingsDto> GetTenantUiCustomizationSettings(int tenantId)
        {
            var theme = await SettingManager.GetSettingValueForTenantAsync(AppSettings.UiManagement.Theme, tenantId);

            return new ThemeSettingsDto
            {
                Theme = theme,
                Header = new ThemeHeaderSettingsDto
                {
                    DesktopFixedHeader = await GetSettingValueForTenantAsync<bool>(AppSettings.UiManagement.Header.DesktopFixedHeader, tenantId),
                    MobileFixedHeader = await GetSettingValueForTenantAsync<bool>(AppSettings.UiManagement.Header.MobileFixedHeader, tenantId)
                },
                SubHeader = new ThemeSubHeaderSettingsDto
                {
                    FixedSubHeader = await GetSettingValueForTenantAsync<bool>(AppSettings.UiManagement.SubHeader.Fixed, tenantId),
                    SubheaderStyle = await GetSettingValueForTenantAsync(AppSettings.UiManagement.SubHeader.Style, tenantId),
                },
                Menu = new ThemeMenuSettingsDto
                {
                    FixedAside = await GetSettingValueForTenantAsync<bool>(AppSettings.UiManagement.LeftAside.FixedAside, tenantId),
                    SubmenuToggle = await GetSettingValueForTenantAsync(AppSettings.UiManagement.LeftAside.SubmenuToggle, tenantId),
                    SearchActive =  await GetSettingValueForTenantAsync<bool>(AppSettings.UiManagement.SearchActive, tenantId),
                },
                Footer = new ThemeFooterSettingsDto
                {
                    FixedFooter = await GetSettingValueForTenantAsync<bool>(AppSettings.UiManagement.Footer.FixedFooter, tenantId)
                }
            };
        }
    }
}