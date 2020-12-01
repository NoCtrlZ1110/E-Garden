﻿using System.Threading.Tasks;
using Abp.Dependency;
using UET.EGarden.Identity;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace UET.EGarden.Net.Sms
{
    public class TwilioSmsSender : ISmsSender, ITransientDependency
    {
        private TwilioSmsSenderConfiguration _twilioSmsSenderConfiguration;
        
        public TwilioSmsSender(TwilioSmsSenderConfiguration twilioSmsSenderConfiguration)
        {
            _twilioSmsSenderConfiguration = twilioSmsSenderConfiguration;
        }

        public async Task SendAsync(string number, string message)
        {
            TwilioClient.Init(_twilioSmsSenderConfiguration.AccountSid, _twilioSmsSenderConfiguration.AuthToken);

            MessageResource resource = await MessageResource.CreateAsync(
                body: message,
                @from: new Twilio.Types.PhoneNumber(_twilioSmsSenderConfiguration.SenderNumber),
                to: new Twilio.Types.PhoneNumber(number)
            );
        }
    }
}
