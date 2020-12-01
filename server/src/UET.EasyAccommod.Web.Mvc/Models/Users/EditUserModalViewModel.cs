using System.Collections.Generic;
using System.Linq;
using UET.EasyAccommod.Roles.Dto;
using UET.EasyAccommod.Users.Dto;

namespace UET.EasyAccommod.Web.Models.Users
{
    public class EditUserModalViewModel
    {
        public UserDto User { get; set; }

        public IReadOnlyList<RoleDto> Roles { get; set; }

        public bool UserIsInRole(RoleDto role)
        {
            return User.RoleNames != null && User.RoleNames.Any(r => r == role.NormalizedName);
        }
    }
}
