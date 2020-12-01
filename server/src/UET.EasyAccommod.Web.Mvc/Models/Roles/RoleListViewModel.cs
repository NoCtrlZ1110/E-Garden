using System.Collections.Generic;
using UET.EasyAccommod.Roles.Dto;

namespace UET.EasyAccommod.Web.Models.Roles
{
    public class RoleListViewModel
    {
        public IReadOnlyList<PermissionDto> Permissions { get; set; }
    }
}
