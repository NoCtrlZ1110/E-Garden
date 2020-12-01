using Abp.MultiTenancy;
using UET.EasyAccommod.Authorization.Users;

namespace UET.EasyAccommod.MultiTenancy
{
    public class Tenant : AbpTenant<User>
    {
        public Tenant()
        {            
        }

        public Tenant(string tenancyName, string name)
            : base(tenancyName, name)
        {
        }
    }
}
