using System.Threading.Tasks;
using UET.EasyAccommod.Configuration.Dto;

namespace UET.EasyAccommod.Configuration
{
    public interface IConfigurationAppService
    {
        Task ChangeUiTheme(ChangeUiThemeInput input);
    }
}
