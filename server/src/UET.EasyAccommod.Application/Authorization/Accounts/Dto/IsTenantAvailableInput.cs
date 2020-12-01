using System.ComponentModel.DataAnnotations;
using Abp.MultiTenancy;

namespace UET.EasyAccommod.Authorization.Accounts.Dto
{
    public class IsTenantAvailableInput
    {
        [Required]
        [StringLength(AbpTenantBase.MaxTenancyNameLength)]
        public string TenancyName { get; set; }
    }
}
