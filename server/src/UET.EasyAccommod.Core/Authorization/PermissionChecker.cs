using Abp.Authorization;
using UET.EasyAccommod.Authorization.Roles;
using UET.EasyAccommod.Authorization.Users;

namespace UET.EasyAccommod.Authorization
{
    public class PermissionChecker : PermissionChecker<Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {
        }
    }
}
