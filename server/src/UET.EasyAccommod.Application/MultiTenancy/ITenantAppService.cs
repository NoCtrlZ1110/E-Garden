using Abp.Application.Services;
using UET.EasyAccommod.MultiTenancy.Dto;

namespace UET.EasyAccommod.MultiTenancy
{
    public interface ITenantAppService : IAsyncCrudAppService<TenantDto, int, PagedTenantResultRequestDto, CreateTenantDto, TenantDto>
    {
    }
}

