using System.Threading.Tasks;
using UET.EGarden.Authorization.Users;

namespace UET.EGarden.WebHooks
{
    public interface IAppWebhookPublisher
    {
        Task PublishTestWebhook();
    }
}
