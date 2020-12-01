using Abp.Events.Bus;

namespace UET.EGarden.MultiTenancy
{
    public class RecurringPaymentsEnabledEventData : EventData
    {
        public int TenantId { get; set; }
    }
}