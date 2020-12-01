using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using UET.EasyAccommod.Configuration;
using UET.EasyAccommod.Web;

namespace UET.EasyAccommod.EntityFrameworkCore
{
    /* This class is needed to run "dotnet ef ..." commands from command line on development. Not used anywhere else */
    public class EasyAccommodDbContextFactory : IDesignTimeDbContextFactory<EasyAccommodDbContext>
    {
        public EasyAccommodDbContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<EasyAccommodDbContext>();
            var configuration = AppConfigurations.Get(WebContentDirectoryFinder.CalculateContentRootFolder());

            EasyAccommodDbContextConfigurer.Configure(builder, configuration.GetConnectionString(EasyAccommodConsts.ConnectionStringName));

            return new EasyAccommodDbContext(builder.Options);
        }
    }
}
