using Abp.AutoMapper;
using UET.EasyAccommod.Roles.Dto;
using UET.EasyAccommod.Web.Models.Common;

namespace UET.EasyAccommod.Web.Models.Roles
{
    [AutoMapFrom(typeof(GetRoleForEditOutput))]
    public class EditRoleModalViewModel : GetRoleForEditOutput, IPermissionsEditViewModel
    {
        public bool HasPermission(FlatPermissionDto permission)
        {
            return GrantedPermissionNames.Contains(permission.Name);
        }
    }
}
