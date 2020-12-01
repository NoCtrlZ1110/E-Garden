using Abp.Auditing;
using UET.EGarden.Configuration.Dto;

namespace UET.EGarden.Configuration.Tenants.Dto
{
    public class TenantEmailSettingsEditDto : EmailSettingsEditDto
    {
        public bool UseHostDefaultEmailSettings { get; set; }
    }
}