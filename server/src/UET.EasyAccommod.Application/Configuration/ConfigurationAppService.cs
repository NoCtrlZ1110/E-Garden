using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Runtime.Session;
using UET.EasyAccommod.Configuration.Dto;

namespace UET.EasyAccommod.Configuration
{
    [AbpAuthorize]
    public class ConfigurationAppService : EasyAccommodAppServiceBase, IConfigurationAppService
    {
        public async Task ChangeUiTheme(ChangeUiThemeInput input)
        {
            await SettingManager.ChangeSettingForUserAsync(AbpSession.ToUserIdentifier(), AppSettingNames.UiTheme, input.Theme);
        }
    }
}
