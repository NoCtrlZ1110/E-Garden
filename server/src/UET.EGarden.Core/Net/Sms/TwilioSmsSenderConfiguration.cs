using Abp.Dependency;
using Abp.Extensions;
using Microsoft.Extensions.Configuration;
using UET.EGarden.Configuration;

namespace UET.EGarden.Net.Sms
{
    public class TwilioSmsSenderConfiguration : ITransientDependency
    {
        private readonly IConfigurationRoot _appConfiguration;

        public string AccountSid => _appConfiguration["Twilio:AccountSid"];

        public string AuthToken => _appConfiguration["Twilio:AuthToken"];

        public string SenderNumber => _appConfiguration["Twilio:SenderNumber"];

        public TwilioSmsSenderConfiguration(IAppConfigurationAccessor configurationAccessor)
        {
            _appConfiguration = configurationAccessor.Configuration;
        }
    }
}
