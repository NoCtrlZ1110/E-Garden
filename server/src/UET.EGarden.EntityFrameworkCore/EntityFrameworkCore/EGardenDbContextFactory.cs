using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using UET.EGarden.Configuration;
using UET.EGarden.Web;

namespace UET.EGarden.EntityFrameworkCore
{
    /* This class is needed to run "dotnet ef ..." commands from command line on development. Not used anywhere else */
    public class EGardenDbContextFactory : IDesignTimeDbContextFactory<EGardenDbContext>
    {
        public EGardenDbContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<EGardenDbContext>();
            var configuration = AppConfigurations.Get(WebContentDirectoryFinder.CalculateContentRootFolder());

            EGardenDbContextConfigurer.Configure(builder, configuration.GetConnectionString(EGardenConsts.ConnectionStringName));

            return new EGardenDbContext(builder.Options);
        }
    }
}
