using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using UET.EGarden.MultiTenancy.HostDashboard.Dto;

namespace UET.EGarden.MultiTenancy.HostDashboard
{
    public interface IIncomeStatisticsService
    {
        Task<List<IncomeStastistic>> GetIncomeStatisticsData(DateTime startDate, DateTime endDate,
            ChartDateInterval dateInterval);
    }
}