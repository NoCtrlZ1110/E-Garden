using System.Threading.Tasks;
using Abp.Application.Services;

namespace UET.EGarden.MultiTenancy
{
    public interface ISubscriptionAppService : IApplicationService
    {
        Task DisableRecurringPayments();

        Task EnableRecurringPayments();
    }
}
