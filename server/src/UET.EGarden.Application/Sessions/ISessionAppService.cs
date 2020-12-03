using System.Threading.Tasks;
using Abp.Application.Services;
using UET.EGarden.Sessions.Dto;

namespace UET.EGarden.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
