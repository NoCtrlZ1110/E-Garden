using System.Threading.Tasks;
using Abp.Application.Services;
using UET.EGarden.Install.Dto;

namespace UET.EGarden.Install
{
    public interface IInstallAppService : IApplicationService
    {
        Task Setup(InstallDto input);

        AppSettingsJsonDto GetAppSettingsJson();

        CheckDatabaseOutput CheckDatabase();
    }
}