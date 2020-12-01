using System.Collections.Generic;

namespace UET.EasyAccommod.Authentication.External
{
    public interface IExternalAuthConfiguration
    {
        List<ExternalLoginProviderInfo> Providers { get; }
    }
}
