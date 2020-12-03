using System.Threading.Tasks;
using Abp.Application.Services;
using UET.EGarden.Authorization.Accounts.Dto;

namespace UET.EGarden.Authorization.Accounts
{
    public interface IAccountAppService : IApplicationService
    {
        Task<IsTenantAvailableOutput> IsTenantAvailable(IsTenantAvailableInput input);

        Task<RegisterOutput> Register(RegisterInput input);
    }
}
