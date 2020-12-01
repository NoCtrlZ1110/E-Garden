using System.Threading.Tasks;
using Abp.Webhooks;

namespace UET.EGarden.WebHooks
{
    public interface IWebhookEventAppService
    {
        Task<WebhookEvent> Get(string id);
    }
}
