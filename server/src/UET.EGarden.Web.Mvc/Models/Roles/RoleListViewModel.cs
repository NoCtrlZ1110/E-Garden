using System.Collections.Generic;
using UET.EGarden.Roles.Dto;

namespace UET.EGarden.Web.Models.Roles
{
    public class RoleListViewModel
    {
        public IReadOnlyList<PermissionDto> Permissions { get; set; }
    }
}
