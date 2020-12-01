using System.Threading.Tasks;
using Abp.Application.Services;
using UET.EGarden.Editions.Dto;
using UET.EGarden.MultiTenancy.Dto;

namespace UET.EGarden.MultiTenancy
{
    public interface ITenantRegistrationAppService: IApplicationService
    {
        Task<RegisterTenantOutput> RegisterTenant(RegisterTenantInput input);

        Task<EditionsSelectOutput> GetEditionsForSelect();

        Task<EditionSelectDto> GetEdition(int editionId);
    }
}