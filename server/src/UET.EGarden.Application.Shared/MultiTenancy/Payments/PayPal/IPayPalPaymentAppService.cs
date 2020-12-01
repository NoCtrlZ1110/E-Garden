using System.Threading.Tasks;
using Abp.Application.Services;
using UET.EGarden.MultiTenancy.Payments.PayPal.Dto;

namespace UET.EGarden.MultiTenancy.Payments.PayPal
{
    public interface IPayPalPaymentAppService : IApplicationService
    {
        Task ConfirmPayment(long paymentId, string paypalOrderId);

        PayPalConfigurationDto GetConfiguration();
    }
}
