using Abp.AutoMapper;
using UET.EasyAccommod.Sessions.Dto;

namespace UET.EasyAccommod.Web.Views.Shared.Components.TenantChange
{
    [AutoMapFrom(typeof(GetCurrentLoginInformationsOutput))]
    public class TenantChangeViewModel
    {
        public TenantLoginInfoDto Tenant { get; set; }
    }
}
