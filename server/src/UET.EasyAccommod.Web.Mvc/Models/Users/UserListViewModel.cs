using System.Collections.Generic;
using UET.EasyAccommod.Roles.Dto;

namespace UET.EasyAccommod.Web.Models.Users
{
    public class UserListViewModel
    {
        public IReadOnlyList<RoleDto> Roles { get; set; }
    }
}
