using Abp.Authorization;
using UET.EGarden.Authorization.Roles;
using UET.EGarden.Authorization.Users;

namespace UET.EGarden.Authorization
{
    public class PermissionChecker : PermissionChecker<Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {
        }
    }
}
