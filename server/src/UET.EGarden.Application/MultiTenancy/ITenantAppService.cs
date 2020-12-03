using Abp.Application.Services;
using UET.EGarden.MultiTenancy.Dto;

namespace UET.EGarden.MultiTenancy
{
    public interface ITenantAppService : IAsyncCrudAppService<TenantDto, int, PagedTenantResultRequestDto, CreateTenantDto, TenantDto>
    {
    }
}

