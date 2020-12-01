using Abp.AutoMapper;
using UET.EasyAccommod.Authentication.External;

namespace UET.EasyAccommod.Models.TokenAuth
{
    [AutoMapFrom(typeof(ExternalLoginProviderInfo))]
    public class ExternalLoginProviderInfoModel
    {
        public string Name { get; set; }

        public string ClientId { get; set; }
    }
}
