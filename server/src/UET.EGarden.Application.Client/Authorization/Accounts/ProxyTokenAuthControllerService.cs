using System.Threading.Tasks;

namespace tmss.Authorization.Accounts
{
    public class ProxyTokenAuthControllerService : ProxyControllerBase
    {
        public async Task SendTwoFactorAuthCode(long userId, string provider)
        {
            await ApiClient
                .PostAsync("api/" + GetEndpoint(nameof(SendTwoFactorAuthCode)), new { UserId = userId, Provider = provider });
        }
    }
}
