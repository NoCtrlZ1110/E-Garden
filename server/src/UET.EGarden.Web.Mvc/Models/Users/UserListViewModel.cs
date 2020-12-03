using System.Collections.Generic;
using UET.EGarden.Roles.Dto;

namespace UET.EGarden.Web.Models.Users
{
    public class UserListViewModel
    {
        public IReadOnlyList<RoleDto> Roles { get; set; }
    }
}
