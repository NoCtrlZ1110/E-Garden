using System.Threading.Tasks;
using Abp.Application.Services;
using Abp.Application.Services.Dto;
using UET.EGarden.Authorization.Users.Dto;

namespace UET.EGarden.Authorization.Users
{
    public interface IUserLoginAppService : IApplicationService
    {
        Task<ListResultDto<UserLoginAttemptDto>> GetRecentUserLoginAttempts();
    }
}
