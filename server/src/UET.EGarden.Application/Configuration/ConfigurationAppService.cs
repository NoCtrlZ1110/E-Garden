using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Runtime.Session;
using UET.EGarden.Configuration.Dto;

namespace UET.EGarden.Configuration
{
    [AbpAuthorize]
    public class ConfigurationAppService : EGardenAppServiceBase, IConfigurationAppService
    {
        public async Task ChangeUiTheme(ChangeUiThemeInput input)
        {
            await SettingManager.ChangeSettingForUserAsync(AbpSession.ToUserIdentifier(), AppSettingNames.UiTheme, input.Theme);
        }
    }
}
