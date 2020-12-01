﻿using System;
using System.Linq;
using System.Threading.Tasks;
using UET.EGarden.Editions;
using UET.EGarden.MultiTenancy;
using UET.EGarden.MultiTenancy.HostDashboard;
using UET.EGarden.MultiTenancy.HostDashboard.Dto;
using UET.EGarden.MultiTenancy.Payments;
using Shouldly;
using System.Globalization;
using UET.EGarden.EntityFrameworkCore;

namespace UET.EGarden.Tests.HostDashboard
{
    // ReSharper disable once InconsistentNaming
    public class HostDashboardAppService_Tests : AppTestBase
    {
        private readonly IHostDashboardAppService _hostDashboardService;

        public HostDashboardAppService_Tests()
        {
            LoginAsHostAdmin();
            _hostDashboardService = Resolve<IHostDashboardAppService>();
        }

        [MultiTenantFact]
        public async Task Should_Get_Daily_Income_Statistics_Data_For_Missing_Days()
        {
            var now = DateTime.Now;
            var utcNow = DateTime.Now.ToUniversalTime();

            //Arrange
            UsingDbContext(
                context =>
                {
                    var specialEdition = new SubscribableEdition
                    {
                        Name = "Special Edition",
                        DisplayName = "Special",
                        AnnualPrice = 100,
                        MonthlyPrice = 10,
                        TrialDayCount = 30,
                        WaitingDayAfterExpire = 10
                    };

                    context.SubscribableEditions.Add(specialEdition);
                    context.SaveChanges();

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 100,
                        DayCount = 365,
                        EditionId = specialEdition.Id,
                        CreationTime = now.AddDays(-3),
                        TenantId = 1
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 200,
                        DayCount = 365,
                        EditionId = specialEdition.Id,
                        CreationTime = now.AddDays(-3),
                        TenantId = 1
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 200,
                        DayCount = 730,
                        EditionId = specialEdition.Id,
                        CreationTime = now.AddDays(-1),
                        TenantId = 1
                    });

                    context.Tenants.Add(new Tenant("MyTenant", "My Tenant")
                    {
                        SubscriptionEndDateUtc = utcNow.AddDays(1),
                        CreationTime = now.AddMinutes(-1)
                    });
                });

            //Act
            var output = await _hostDashboardService.GetIncomeStatistics(new GetIncomeStatisticsDataInput
            {
                StartDate = now.AddDays(-4),
                EndDate = now,
                IncomeStatisticsDateInterval = ChartDateInterval.Daily
            });

            output.IncomeStatistics.Count.ShouldBe(5);
            output.IncomeStatistics[0].Amount.ShouldBe(0);
            output.IncomeStatistics[1].Amount.ShouldBe(300);
            output.IncomeStatistics[2].Amount.ShouldBe(0);
            output.IncomeStatistics[3].Amount.ShouldBe(200);
            output.IncomeStatistics[4].Amount.ShouldBe(0);
        }

        private void CreatePaidPayment(EGardenDbContext context, SubscriptionPayment subscriptionPayment)
        {
            subscriptionPayment.SetAsPaid();
            context.SubscriptionPayments.Add(subscriptionPayment);
        }

        [MultiTenantFact]
        public async Task Should_Get_Dashboard_Statistics_Data()
        {
            var now = DateTime.Now;
            var utcNow = DateTime.Now.ToUniversalTime();

            //Arrange
            UsingDbContext(
                context =>
                {
                    var specialEdition = new SubscribableEdition
                    {
                        Name = "Special Edition",
                        DisplayName = "Special",
                        AnnualPrice = 100,
                        MonthlyPrice = 10,
                        TrialDayCount = 30,
                        WaitingDayAfterExpire = 10
                    };

                    context.SubscribableEditions.Add(specialEdition);
                    context.SaveChanges();

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 100,
                        DayCount = 365,
                        EditionId = specialEdition.Id,
                        CreationTime = now.AddDays(-2),
                        TenantId = 1
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 200,
                        DayCount = 730,
                        EditionId = specialEdition.Id,
                        CreationTime = now.AddDays(-1),
                        TenantId = 1
                    });

                    context.Tenants.Add(new Tenant("MyTenant", "My Tenant")
                    {
                        SubscriptionEndDateUtc = utcNow.AddDays(1),
                        CreationTime = now.AddMinutes(-1)
                    });
                });

            //Act
            var output = await _hostDashboardService.GetIncomeStatistics(new GetIncomeStatisticsDataInput
            {
                StartDate = now.AddDays(-3),
                EndDate = now,
                IncomeStatisticsDateInterval = ChartDateInterval.Daily
            });

            output.IncomeStatistics.Count.ShouldBe(4);
            output.IncomeStatistics.Sum(x => x.Amount).ShouldBe(300);
        }

        [MultiTenantFact]
        public async Task Should_Get_Edition_Statistics()
        {
            var now = DateTime.Now;
            var utcNow = DateTime.Now.ToUniversalTime();

            //Arrange
            UsingDbContext(
                context =>
                {
                    context.SubscribableEditions.RemoveRange(context.SubscribableEditions);

                    var newSpecialEdition = new SubscribableEdition
                    {
                        DisplayName = "Special Edition"
                    };

                    context.SubscribableEditions.Add(newSpecialEdition);

                    var newPremiumEdition = new SubscribableEdition
                    {
                        DisplayName = "Premium Edition"
                    };

                    context.SubscribableEditions.Add(newPremiumEdition);
                    context.SaveChanges();

                    context.Tenants.Add(new Tenant("SpecialEditionTenant", "Special Tenant")
                    {
                        CreationTime = now.AddDays(-1),
                        SubscriptionEndDateUtc = utcNow.AddDays(1),
                        EditionId = newSpecialEdition.Id
                    });

                    context.Tenants.Add(new Tenant("PremiumEditionTenant", "Premium Tenant")
                    {
                        SubscriptionEndDateUtc = utcNow.AddDays(1),
                        CreationTime = now.AddDays(-1),
                        EditionId = newPremiumEdition.Id
                    });
                });

            //Act
            var output = await _hostDashboardService.GetEditionTenantStatistics(new GetEditionTenantStatisticsInput
            {
                StartDate = now.AddDays(-1),
                EndDate = now
            });


            output.EditionStatistics.Count.ShouldBe(2);
            output.EditionStatistics.Any(e => e.Label == "Special Edition").ShouldBe(true);

            var specialEdition = output.EditionStatistics.FirstOrDefault(e => e.Label == "Special Edition");
            specialEdition.ShouldNotBe(null);
            specialEdition.Value.ShouldBe(1);

            var hasPremiumEdition = output.EditionStatistics.Any(e => e.Label == "Premium Edition");
            hasPremiumEdition.ShouldBe(true);

            var premiumEdition = output.EditionStatistics.FirstOrDefault(e => e.Label == "Premium Edition");
            premiumEdition.ShouldNotBe(null);
            premiumEdition.Value.ShouldBe(1);
        }

        [MultiTenantFact]
        public async Task Should_Get_Income_Statistics_Daily()
        {
            var date1 = new DateTime(2017, 5, 4);
            var date2 = new DateTime(2017, 5, 5);
            var date3 = new DateTime(2017, 5, 6);
            var date4 = new DateTime(2017, 5, 7);

            //Arrange
            UsingDbContext(
                context =>
                {
                    var standardEdition = context.SubscribableEditions.First();
                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 100,
                        EditionId = standardEdition.Id,
                        CreationTime = date1
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 200,
                        EditionId = standardEdition.Id,
                        CreationTime = date2
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 300,
                        EditionId = standardEdition.Id,
                        CreationTime = date3
                    });
                });

            //Act
            var output = await _hostDashboardService.GetIncomeStatistics(new GetIncomeStatisticsDataInput
            {
                StartDate = date1,
                EndDate = date4,
                IncomeStatisticsDateInterval = ChartDateInterval.Daily
            });

            output.IncomeStatistics.Count.ShouldBe(4);

            output.IncomeStatistics[0].Amount.ShouldBe(100);
            output.IncomeStatistics[0].Date.ShouldBe(date1);

            output.IncomeStatistics[1].Amount.ShouldBe(200);
            output.IncomeStatistics[1].Date.ShouldBe(date2);

            output.IncomeStatistics[2].Amount.ShouldBe(300);
            output.IncomeStatistics[2].Date.ShouldBe(date3);

            output.IncomeStatistics[3].Amount.ShouldBe(0);
            output.IncomeStatistics[3].Date.ShouldBe(date4);
        }

        [MultiTenantFact]
        public async Task Should_Get_Income_Statistics_Weekly_NotFirstDayOfWeek()
        {
            var lastMonth = DateTime.Now.AddMonths(-1);
            var firstWeek = GetFirstDayOfWeek(lastMonth).AddDays(1).Date;
            var secondWeek = firstWeek.AddDays(7).Date;
            var thirdWeek = secondWeek.AddDays(7).Date;

            //Arrange
            UsingDbContext(
                context =>
                {
                    var standardEdition = context.SubscribableEditions.First();
                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 100,
                        EditionId = standardEdition.Id,
                        CreationTime = firstWeek
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 200,
                        EditionId = standardEdition.Id,
                        CreationTime = secondWeek
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 300,
                        EditionId = standardEdition.Id,
                        CreationTime = thirdWeek
                    });

                });

            //Act
            var output = await _hostDashboardService.GetIncomeStatistics(new GetIncomeStatisticsDataInput
            {
                StartDate = firstWeek,
                EndDate = thirdWeek,
                IncomeStatisticsDateInterval = ChartDateInterval.Weekly
            });

            output.IncomeStatistics.Count.ShouldBe(3);
            output.IncomeStatistics[0].Amount.ShouldBe(100);
            output.IncomeStatistics[0].Date.ShouldBe(firstWeek);
            output.IncomeStatistics[1].Amount.ShouldBe(200);
            output.IncomeStatistics[1].Date.ShouldBe(secondWeek.AddDays(-1));
            output.IncomeStatistics[2].Amount.ShouldBe(300);
            output.IncomeStatistics[2].Date.ShouldBe(thirdWeek.AddDays(-1));
        }

        [MultiTenantFact]
        public async Task Should_Get_Income_Statistics_Weekly_FirstDayOfWeek()
        {
            var lastMonth = DateTime.Now.AddMonths(-1);
            var firstWeek = GetFirstDayOfWeek(lastMonth).Date;
            var secondWeek = firstWeek.AddDays(7).Date;
            var thirdWeek = secondWeek.AddDays(7).Date;

            //Arrange
            UsingDbContext(
                context =>
                {
                    var standardEdition = context.SubscribableEditions.First();
                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 100,
                        EditionId = standardEdition.Id,
                        CreationTime = firstWeek
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 200,
                        EditionId = standardEdition.Id,
                        CreationTime = secondWeek
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 300,
                        EditionId = standardEdition.Id,
                        CreationTime = thirdWeek
                    });

                });

            //Act
            var output = await _hostDashboardService.GetIncomeStatistics(new GetIncomeStatisticsDataInput
            {
                StartDate = firstWeek,
                EndDate = thirdWeek,
                IncomeStatisticsDateInterval = ChartDateInterval.Weekly
            });

            output.IncomeStatistics.Count.ShouldBe(3);
            output.IncomeStatistics[0].Amount.ShouldBe(100);
            output.IncomeStatistics[0].Date.ShouldBe(firstWeek);
            output.IncomeStatistics[1].Amount.ShouldBe(200);
            output.IncomeStatistics[1].Date.ShouldBe(secondWeek);
            output.IncomeStatistics[2].Amount.ShouldBe(300);
            output.IncomeStatistics[2].Date.ShouldBe(thirdWeek);
        }

        [MultiTenantFact]
        public async Task Should_Get_Income_Statistics_Monthly()
        {
            //Arrange
            UsingDbContext(
                context =>
                {
                    var standardEdition = context.SubscribableEditions.First();
                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 100,
                        EditionId = standardEdition.Id,
                        CreationTime = new DateTime(2017, 5, 4)
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 200,
                        EditionId = standardEdition.Id,
                        CreationTime = new DateTime(2017, 5, 11)
                    });

                    CreatePaidPayment(context, new SubscriptionPayment
                    {
                        Amount = 300,
                        EditionId = standardEdition.Id,
                        CreationTime = new DateTime(2017, 5, 18)
                    });

                });

            //Act
            var output = await _hostDashboardService.GetIncomeStatistics(new GetIncomeStatisticsDataInput
            {
                StartDate = new DateTime(2017, 5, 3),
                EndDate = new DateTime(2017, 5, 20),
                IncomeStatisticsDateInterval = ChartDateInterval.Monthly
            });

            output.IncomeStatistics.Count.ShouldBe(1);
            output.IncomeStatistics[0].Amount.ShouldBe(600);
            output.IncomeStatistics[0].Date.ShouldBe(new DateTime(2017, 5, 3));
        }

        private static DateTime GetFirstDayOfWeek(DateTime date)
        {
            var firstDayOfWeek = CultureInfo.CurrentCulture.DateTimeFormat.FirstDayOfWeek;
            while (date.DayOfWeek != firstDayOfWeek)
            {
                date = date.AddDays(-1);
            }

            return date;
        }
    }
}
