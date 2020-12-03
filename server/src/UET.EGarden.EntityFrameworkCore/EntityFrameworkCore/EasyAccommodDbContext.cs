using Microsoft.EntityFrameworkCore;
using Abp.Zero.EntityFrameworkCore;
using UET.EGarden.Authorization.Roles;
using UET.EGarden.Authorization.Users;
using UET.EGarden.MultiTenancy;
using UET.EGarden.Note;
using UET.EGarden.Study;

namespace UET.EGarden.EntityFrameworkCore
{
    public class EGardenDbContext : AbpZeroDbContext<Tenant, Role, User, EGardenDbContext>
    {
        /* Define a DbSet for each entity of the application */
        public DbSet<UserNote> UserNotes { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<Unit> Units { get; set; }
        public DbSet<Vocabulary> Vocabularies { get; set; }
        public DbSet<LesonTreeWord> LesonTreeWords { get; set; }

        public EGardenDbContext(DbContextOptions<EGardenDbContext> options)
            : base(options)
        {
        }
    }
}
