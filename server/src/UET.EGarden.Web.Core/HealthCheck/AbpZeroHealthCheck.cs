using Microsoft.Extensions.DependencyInjection;
using UET.EGarden.HealthChecks;

namespace UET.EGarden.Web.HealthCheck
{
    public static class AbpZeroHealthCheck
    {
        public static IHealthChecksBuilder AddAbpZeroHealthCheck(this IServiceCollection services)
        {
            var builder = services.AddHealthChecks();
            builder.AddCheck<EGardenDbContextHealthCheck>("Database Connection");
            builder.AddCheck<EGardenDbContextUsersHealthCheck>("Database Connection with user check");
            builder.AddCheck<CacheHealthCheck>("Cache");

            // add your custom health checks here
            // builder.AddCheck<MyCustomHealthCheck>("my health check");

            return builder;
        }
    }
}
