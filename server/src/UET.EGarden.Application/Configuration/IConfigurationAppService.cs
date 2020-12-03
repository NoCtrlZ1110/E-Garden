using System.Threading.Tasks;
using UET.EGarden.Configuration.Dto;

namespace UET.EGarden.Configuration
{
    public interface IConfigurationAppService
    {
        Task ChangeUiTheme(ChangeUiThemeInput input);
    }
}
