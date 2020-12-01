using System.Threading.Tasks;
using Abp.Application.Services;
using UET.EGarden.MultiTenancy.Payments.Dto;
using UET.EGarden.MultiTenancy.Payments.Stripe.Dto;

namespace UET.EGarden.MultiTenancy.Payments.Stripe
{
    public interface IStripePaymentAppService : IApplicationService
    {
        Task ConfirmPayment(StripeConfirmPaymentInput input);

        StripeConfigurationDto GetConfiguration();

        Task<SubscriptionPaymentDto> GetPaymentAsync(StripeGetPaymentInput input);

        Task<string> CreatePaymentSession(StripeCreatePaymentSessionInput input);
    }
}