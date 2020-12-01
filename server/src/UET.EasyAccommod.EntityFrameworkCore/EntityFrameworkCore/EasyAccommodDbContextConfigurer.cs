using System.Data.Common;
using Microsoft.EntityFrameworkCore;

namespace UET.EasyAccommod.EntityFrameworkCore
{
    public static class EasyAccommodDbContextConfigurer
    {
        public static void Configure(DbContextOptionsBuilder<EasyAccommodDbContext> builder, string connectionString)
        {
            builder.UseSqlServer(connectionString);
        }

        public static void Configure(DbContextOptionsBuilder<EasyAccommodDbContext> builder, DbConnection connection)
        {
            builder.UseSqlServer(connection);
        }
    }
}
