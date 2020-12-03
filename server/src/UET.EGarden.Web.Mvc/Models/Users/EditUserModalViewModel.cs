using System.Collections.Generic;
using System.Linq;
using UET.EGarden.Roles.Dto;
using UET.EGarden.Users.Dto;

namespace UET.EGarden.Web.Models.Users
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
