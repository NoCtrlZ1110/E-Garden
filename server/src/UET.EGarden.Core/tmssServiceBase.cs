using Abp;

namespace UET.EGarden
{
    /// <summary>
    /// This class can be used as a base class for services in this application.
    /// It has some useful objects property-injected and has some basic methods most of services may need to.
    /// It's suitable for non domain nor application service classes.
    /// For domain services inherit <see cref="UET.EGardenDomainServiceBase"/>.
    /// For application services inherit UET.EGardenAppServiceBase.
    /// </summary>
    public abstract class EGardenServiceBase : AbpServiceBase
    {
        protected EGardenServiceBase()
        {
            LocalizationSourceName = EGardenConsts.LocalizationSourceName;
        }
    }
}