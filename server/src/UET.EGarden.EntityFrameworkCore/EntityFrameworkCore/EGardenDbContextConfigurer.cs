using System.Data.Common;
using Microsoft.EntityFrameworkCore;

namespace UET.EGarden.EntityFrameworkCore
{
    public static class EGardenDbContextConfigurer
    {
        public static void Configure(DbContextOptionsBuilder<EGardenDbContext> builder, string connectionString)
        {
            builder.UseSqlServer(connectionString);
        }

        public static void Configure(DbContextOptionsBuilder<EGardenDbContext> builder, DbConnection connection)
        {
            builder.UseSqlServer(connection);
        }
    }
}
