using UET.EGarden.UiCustomization.Dto;

namespace UET.EGarden.Sessions.Dto
{
    public class GetCurrentLoginInformationsOutput
    {
        public UserLoginInfoDto User { get; set; }

        public TenantLoginInfoDto Tenant { get; set; }

        public ApplicationInfoDto Application { get; set; }

        public UiCustomizationSettingsDto Theme { get; set; }
    }
}