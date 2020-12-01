using Abp.Zero.Ldap.Authentication;
using Abp.Zero.Ldap.Configuration;
using UET.EGarden.Authorization.Users;
using UET.EGarden.MultiTenancy;

namespace UET.EGarden.Authorization.Ldap
{
    public class AppLdapAuthenticationSource : LdapAuthenticationSource<Tenant, User>
    {
        public AppLdapAuthenticationSource(ILdapSettings settings, IAbpZeroLdapModuleConfig ldapModuleConfig)
            : base(settings, ldapModuleConfig)
        {
        }
    }
}