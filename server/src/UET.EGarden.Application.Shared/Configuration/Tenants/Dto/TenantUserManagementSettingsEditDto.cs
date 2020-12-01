using UET.EGarden.Configuration.Host.Dto;

namespace UET.EGarden.Configuration.Tenants.Dto
{
    public class TenantUserManagementSettingsEditDto
    {
        public bool AllowSelfRegistration { get; set; }
        
        public bool IsNewRegisteredUserActiveByDefault { get; set; }

        public bool IsEmailConfirmationRequiredForLogin { get; set; }
        
        public bool UseCaptchaOnRegistration { get; set; }

        public bool UseCaptchaOnLogin { get; set; }
        
        public bool IsCookieConsentEnabled { get; set; }

        public bool IsQuickThemeSelectEnabled { get; set; }

        public SessionTimeOutSettingsEditDto SessionTimeOutSettings { get; set; }
    }
}