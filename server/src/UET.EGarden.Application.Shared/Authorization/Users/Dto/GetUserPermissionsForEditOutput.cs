using System.Collections.Generic;
using UET.EGarden.Authorization.Permissions.Dto;

namespace UET.EGarden.Authorization.Users.Dto
{
    public class GetUserPermissionsForEditOutput
    {
        public List<FlatPermissionDto> Permissions { get; set; }

        public List<string> GrantedPermissionNames { get; set; }
    }
}