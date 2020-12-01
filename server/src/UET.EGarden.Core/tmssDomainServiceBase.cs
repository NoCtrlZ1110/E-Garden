using Abp.Domain.Services;

namespace UET.EGarden
{
    public abstract class EGardenDomainServiceBase : DomainService
    {
        /* Add your common members for all your domain services. */

        protected EGardenDomainServiceBase()
        {
            LocalizationSourceName = EGardenConsts.LocalizationSourceName;
        }
    }
}
