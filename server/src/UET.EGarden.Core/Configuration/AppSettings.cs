namespace UET.EGarden.Configuration
{
    /// <summary>
    /// Defines string constants for setting names in the application.
    /// See <see cref="AppSettingProvider"/> for setting definitions.
    /// </summary>
    public static class AppSettings
    {
        public static class HostManagement
        {
            public const string BillingLegalName = "App.HostManagement.BillingLegalName";
            public const string BillingAddress = "App.HostManagement.BillingAddress";
        }

        public static class DashboardCustomization {
            public const string Configuration = "App.DashboardCustomization.Configuration";
        }

        public static class UiManagement
        {
            public const string LayoutType = "App.UiManagement.LayoutType";
            public const string FixedBody = "App.UiManagement.Layout.FixedBody";
            public const string MobileFixedBody = "App.UiManagement.Layout.MobileFixedBody";

            public const string Theme = "App.UiManagement.Theme";

            public const string SearchActive = "App.UiManagement.MenuSearch";

            public static class Header
            {
                public const string DesktopFixedHeader = "App.UiManagement.Header.DesktopFixedHeader";
                public const string MobileFixedHeader = "App.UiManagement.Header.MobileFixedHeader";
                public const string Skin = "App.UiManagement.Header.Skin";
                public const string MinimizeType = "App.UiManagement.Header.MinimizeType";
                public const string MenuArrows = "App.UiManagement.Header.MenuArrows";
            }

            public static class SubHeader
            {
                public const string Fixed = "App.UiManagement.SubHeader.Fixed";
                public const string Style = "App.UiManagement.SubHeader.Style";
            }

            public static class LeftAside
            {
                public const string Position = "App.UiManagement.Left.Position";
                public const string AsideSkin = "App.UiManagement.Left.AsideSkin";
                public const string FixedAside = "App.UiManagement.Left.FixedAside";
                public const string AllowAsideMinimizing = "App.UiManagement.Left.AllowAsideMinimizing";
                public const string DefaultMinimizedAside = "App.UiManagement.Left.DefaultMinimizedAside";
                public const string SubmenuToggle = "App.UiManagement.Left.SubmenuToggle";
            }

            public static class Footer
            {
                public const string FixedFooter = "App.UiManagement.Footer.FixedFooter";
            }
        }

        public static class TenantManagement
        {
            public const string AllowSelfRegistration = "App.TenantManagement.AllowSelfRegistration";
            public const string IsNewRegisteredTenantActiveByDefault = "App.TenantManagement.IsNewRegisteredTenantActiveByDefault";
            public const string UseCaptchaOnRegistration = "App.TenantManagement.UseCaptchaOnRegistration";
            public const string DefaultEdition = "App.TenantManagement.DefaultEdition";
            public const string SubscriptionExpireNotifyDayCount = "App.TenantManagement.SubscriptionExpireNotifyDayCount";
            public const string BillingLegalName = "App.TenantManagement.BillingLegalName";
            public const string BillingAddress = "App.TenantManagement.BillingAddress";
            public const string BillingTaxVatNo = "App.TenantManagement.BillingTaxVatNo";
        }

        public static class UserManagement
        {
            public static class TwoFactorLogin
            {
                public const string IsGoogleAuthenticatorEnabled = "App.UserManagement.TwoFactorLogin.IsGoogleAuthenticatorEnabled";
            }

            public static class SessionTimeOut
            {
                public const string IsEnabled = "App.UserManagement.SessionTimeOut.IsEnabled";
                public const string TimeOutSecond = "App.UserManagement.SessionTimeOut.TimeOutSecond";
                public const string ShowTimeOutNotificationSecond = "App.UserManagement.SessionTimeOut.ShowTimeOutNotificationSecond";
                public const string ShowLockScreenWhenTimedOut = "App.UserManagement.SessionTimeOut.ShowLockScreenWhenTimedOut";
            }

            public const string AllowSelfRegistration = "App.UserManagement.AllowSelfRegistration";
            public const string IsNewRegisteredUserActiveByDefault = "App.UserManagement.IsNewRegisteredUserActiveByDefault";
            public const string UseCaptchaOnRegistration = "App.UserManagement.UseCaptchaOnRegistration";
            public const string UseCaptchaOnLogin = "App.UserManagement.UseCaptchaOnLogin";
            public const string SmsVerificationEnabled = "App.UserManagement.SmsVerificationEnabled";
            public const string IsCookieConsentEnabled = "App.UserManagement.IsCookieConsentEnabled";
            public const string IsQuickThemeSelectEnabled = "App.UserManagement.IsQuickThemeSelectEnabled";
            public const string AllowOneConcurrentLoginPerUser = "App.UserManagement.AllowOneConcurrentLoginPerUser";
        }

        public static class Email
        {
            public const string UseHostDefaultEmailSettings = "App.Email.UseHostDefaultEmailSettings";
        }

        public static class Recaptcha
        {
            public const string SiteKey = "Recaptcha.SiteKey";
        }
    }
}