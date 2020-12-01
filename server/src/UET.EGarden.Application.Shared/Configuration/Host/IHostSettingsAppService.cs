using System.Threading.Tasks;
using Abp.Application.Services;
using UET.EGarden.Configuration.Host.Dto;

namespace UET.EGarden.Configuration.Host
{
    public interface IHostSettingsAppService : IApplicationService
    {
        Task<HostSettingsEditDto> GetAllSettings();

        Task UpdateAllSettings(HostSettingsEditDto input);

        Task SendTestEmail(SendTestEmailInput input);
    }
}
