using Microsoft.Extensions.Configuration;

namespace UET.EGarden.Configuration
{
    public interface IAppConfigurationAccessor
    {
        IConfigurationRoot Configuration { get; }
    }
}
