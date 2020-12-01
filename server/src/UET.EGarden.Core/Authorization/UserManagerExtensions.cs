using System.Threading.Tasks;
using Abp.Authorization.Users;
using UET.EGarden.Authorization.Users;

namespace UET.EGarden.Authorization
{
    public static class UserManagerExtensions
    {
        public static async Task<User> GetAdminAsync(this UserManager userManager)
        {
            return await userManager.FindByNameAsync(AbpUserBase.AdminUserName);
        }
    }
}
