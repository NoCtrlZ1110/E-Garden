using UET.EGarden;
using UET.EGarden.Editions.Dto;

namespace UET.EGarden.MultiTenancy.Payments.Dto
{
    public class PaymentInfoDto
    {
        public EditionSelectDto Edition { get; set; }

        public decimal AdditionalPrice { get; set; }

        public bool IsLessThanMinimumUpgradePaymentAmount()
        {
            return AdditionalPrice < EGardenConsts.MinimumUpgradePaymentAmount;
        }
    }
}
