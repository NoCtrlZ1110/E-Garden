﻿namespace UET.EGarden.MultiTenancy.Payments.Dto
{
    public class CancelPaymentDto
    {
        public string PaymentId { get; set; }

        public SubscriptionPaymentGatewayType Gateway { get; set; }
    }
}