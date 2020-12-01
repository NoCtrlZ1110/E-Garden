using System.Threading.Tasks;
using Abp.Application.Services;
using UET.EGarden.Configuration.Tenants.Dto;

namespace UET.EGarden.Configuration.Tenants
{
    public interface ITenantSettingsAppService : IApplicationService
    {
        Task<TenantSettingsEditDto> GetAllSettings();

        Task UpdateAllSettings(TenantSettingsEditDto input);

        Task ClearLogo();

        Task ClearCustomCss();
    }
}
