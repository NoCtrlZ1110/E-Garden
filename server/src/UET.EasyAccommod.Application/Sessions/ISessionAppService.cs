using System.Threading.Tasks;
using Abp.Application.Services;
using UET.EasyAccommod.Sessions.Dto;

namespace UET.EasyAccommod.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
