using Abp.Application.Services;
using Abp.Application.Services.Dto;
using UET.EGarden.Authorization.Permissions.Dto;

namespace UET.EGarden.Authorization.Permissions
{
    public interface IPermissionAppService : IApplicationService
    {
        ListResultDto<FlatPermissionWithLevelDto> GetAllPermissions();
    }
}
