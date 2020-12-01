using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using UET.EGarden.EntityFrameworkCore;

namespace UET.EGarden.HealthChecks
{
    public class EGardenDbContextHealthCheck : IHealthCheck
    {
        private readonly DatabaseCheckHelper _checkHelper;

        public EGardenDbContextHealthCheck(DatabaseCheckHelper checkHelper)
        {
            _checkHelper = checkHelper;
        }

        public Task<HealthCheckResult> CheckHealthAsync(HealthCheckContext context, CancellationToken cancellationToken = new CancellationToken())
        {
            if (_checkHelper.Exist("db"))
            {
                return Task.FromResult(HealthCheckResult.Healthy("EGardenDbContext connected to database."));
            }

            return Task.FromResult(HealthCheckResult.Unhealthy("EGardenDbContext could not connect to database"));
        }
    }
}
