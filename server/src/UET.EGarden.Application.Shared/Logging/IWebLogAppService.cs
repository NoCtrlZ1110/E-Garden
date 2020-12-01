using Abp.Application.Services;
using UET.EGarden.Dto;
using UET.EGarden.Logging.Dto;

namespace UET.EGarden.Logging
{
    public interface IWebLogAppService : IApplicationService
    {
        GetLatestWebLogsOutput GetLatestWebLogs();

        FileDto DownloadWebLogs();
    }
}
